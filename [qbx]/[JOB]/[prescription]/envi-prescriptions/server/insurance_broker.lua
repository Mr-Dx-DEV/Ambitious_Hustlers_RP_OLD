if GetCurrentResourceName() ~= 'envi-prescriptions' then
    return
end

CreateThread(function()
    Database.query([[
        CREATE TABLE IF NOT EXISTS med_insurance_commissions (
            id INT AUTO_INCREMENT PRIMARY KEY,
            broker_id VARCHAR(50) DEFAULT NULL,
            broker_name VARCHAR(50) DEFAULT NULL,
            customer_id VARCHAR(50) DEFAULT NULL,
            customer_name VARCHAR(50) DEFAULT NULL,
            plan_id VARCHAR(50) DEFAULT NULL,
            plan_name VARCHAR(50) DEFAULT NULL,
            plan_fee INT DEFAULT 0,
            commission INT DEFAULT 0,
            sale_date DATETIME DEFAULT CURRENT_TIMESTAMP
        )
    ]])
    print('Initialized med_insurance_commissions database')

    Database.query([[
        CREATE TABLE IF NOT EXISTS med_insurance_bans (
            id INT AUTO_INCREMENT PRIMARY KEY,
            citizenid VARCHAR(50) DEFAULT NULL,
            name VARCHAR(50) DEFAULT NULL,
            reason TEXT,
            banned_by VARCHAR(50) DEFAULT NULL,
            banned_by_name VARCHAR(50) DEFAULT NULL,
            ban_date DATETIME DEFAULT CURRENT_TIMESTAMP,
            active TINYINT(1) DEFAULT 1
        )
    ]])
    print('Initialized med_insurance_bans database')
end)

local pendingInsuranceOffers = {}

function RecordBrokerCommission(brokerId, brokerName, customerId, customerName, planId, planName, planFee, commission)
    Database.query([[
        INSERT INTO med_insurance_commissions
            (broker_id, broker_name, customer_id, customer_name, plan_id, plan_name, plan_fee, commission)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ]], { brokerId, brokerName, customerId, customerName, planId, planName, planFee, commission })
end

Framework.CreateCallback('envi-prescriptions:getBrokerCommissionHistory', function(source, cb)
    local broker = Framework.GetPlayer(source)
    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.MinimumGrade then
        cb({})
        return
    end

    local brokerId = broker.Identifier
    local commissions = Database.query([[
        SELECT
            customer_name, plan_id, plan_name, plan_fee, commission,
            DATE_FORMAT(sale_date, "%Y-%m-%d %H:%i") as formatted_date
        FROM
            med_insurance_commissions
        WHERE
            broker_id = ?
        ORDER BY
            sale_date DESC
        LIMIT 20
    ]], { brokerId })

    local formattedCommissions = {}
    if commissions and type(commissions) == 'table' then
        for _, record in ipairs(commissions) do
            table.insert(formattedCommissions, {
                customerName = record.customer_name,
                planName = record.plan_name,
                planFee = record.plan_fee,
                commission = record.commission,
                date = record.formatted_date
            })
        end
    end

    cb(formattedCommissions)
end)

Framework.CreateCallback('envi-prescriptions:getBrokerCustomerInsurance', function(source, cb, targetId)
    local employee = Framework.GetPlayer(source)
    local patient = Framework.GetPlayer(targetId)

    if not employee or not patient then
        cb(nil)
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb(nil)
        return
    end

    if employee.Job.Name ~= Config.InsuranceJob.JobName or employee.Job.Grade.Level < Config.InsuranceJob.MinimumGrade then
        cb(nil)
        return
    end

    local citizenid = patient.Identifier
    local customerName = patient.Firstname .. ' ' .. patient.Lastname
    local result = Database.query('SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1', { citizenid })
    local insurancePlan = Config.InsuranceSystem.DefaultPlan

    if result and #result > 0 then
        insurancePlan = result[1].plan
    end

    local planData = Config.InsurancePlans[insurancePlan] or Config.InsurancePlans.none
    local insuranceData = {
        plan = insurancePlan,
        planName = planData.name,
        discount = planData.discount,
        downpayment = planData.downpayment,
        fee = planData.fee,
        benefits = planData.benefits,
        eligibleMedications = planData.eligibleMedications,
        cancelationFee = planData.cancelationFee
    }

    cb(insuranceData, customerName)
end)

Framework.CreateCallback('envi-prescriptions:getBrokerInsuranceClaimHistory', function(source, cb, targetId)
    local broker = Framework.GetPlayer(source)
    local customer = Framework.GetPlayer(targetId)

    if not broker or not customer then
        cb(false)
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb(false)
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.MinimumGrade then
        cb(false)
        return
    end

    local customerName = customer.Firstname .. ' ' .. customer.Lastname
    local citizenid = customer.Identifier

    local claims = Database.query(
        'SELECT id, medication, cost, covered_amount, status, DATE_FORMAT(claim_date, "%Y-%m-%d %H:%i") as formatted_date FROM medical_insurance_claims WHERE citizenid = ? ORDER BY claim_date DESC LIMIT 10',
        { citizenid })

    local formattedClaims = {}
    if claims and type(claims) == 'table' then
        for _, claim in ipairs(claims) do
            table.insert(formattedClaims, {
                id = claim.id,
                medication = claim.medication,
                cost = claim.cost,
                covered_amount = claim.covered_amount,
                status = claim.status,
                formatted_date = claim.formatted_date or "Unknown Date"
            })
        end
    end

    cb(formattedClaims, customerName)
end)

RegisterNetEvent('envi-prescriptions:offerInsurancePlan', function(targetId, planId, planName, fee)
    local src = source
    local broker = Framework.GetPlayer(src)
    local customer = Framework.GetPlayer(targetId)

    if not broker or not customer then return end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        Notify(src, Config.Lang['insurance_broker_system_disabled'], 'error')
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.MinimumGrade then
        Notify(src, Config.Lang['not_authorized_to_sell_insurance'], 'error')
        return
    end

    local citizenid = customer.Identifier
    local isBanned = IsPlayerBannedFromInsurance(citizenid)

    if isBanned then
        local banReason = Database.query([[
            SELECT reason FROM med_insurance_bans WHERE citizenid = ? AND active = 1 LIMIT 1
        ]], { citizenid })

        local reason = "Unknown reason"
        if banReason and #banReason > 0 and banReason[1].reason then
            reason = banReason[1].reason
        end

        Notify(src, Config.Lang['customer_banned_from_insurance']:format(reason), 'error')
        return
    end

    local brokerName = broker.Firstname .. ' ' .. broker.Lastname
    pendingInsuranceOffers[targetId] = {
        brokerId = src,
        brokerName = brokerName,
        planId = planId,
        planName = planName,
        fee = fee
    }

    TriggerClientEvent('envi-prescriptions:notifyInsuranceOffer', targetId, src, brokerName, planId, planName, fee)
end)

RegisterNetEvent('envi-prescriptions:acceptInsuranceOffer', function(brokerId, planId)
    local src = source
    local customer = Framework.GetPlayer(src)
    local broker = Framework.GetPlayer(brokerId)

    if not customer then return end

    if not broker then
        Notify(src, Config.Lang['insurance_broker_no_longer_available'], 'error')
        pendingInsuranceOffers[src] = nil
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        Notify(src, Config.Lang['insurance_broker_system_disabled'], 'error')
        pendingInsuranceOffers[src] = nil
        return
    end

    local citizenid = customer.Identifier
    if IsPlayerBannedFromInsurance(citizenid) then
        Notify(src, Config.Lang['banned_from_purchasing_insurance'], 'error')
        Notify(brokerId, Config.Lang['customer_banned_from_accessing_insurance'], 'error')
        pendingInsuranceOffers[src] = nil
        return
    end

    if not pendingInsuranceOffers[src] or pendingInsuranceOffers[src].brokerId ~= brokerId then
        Notify(src, Config.Lang['no_valid_insurance_offer'], 'error')
        return
    end

    local offerData = pendingInsuranceOffers[src]
    local planData = Config.InsurancePlans[planId]

    if not planData then
        Notify(src, Config.Lang['invalid_insurance_plan'], 'error')
        return
    end

    if customer.GetMoney('bank') < planData.fee then
        Notify(src, Config.Lang['insurance_purchase_failed'], 'error')
        Notify(brokerId, Config.Lang['customer_insufficient_funds'], 'error')
        return
    end

    local customerName = customer.Firstname .. ' ' .. customer.Lastname
    local citizenid = customer.Identifier

    customer.RemoveMoney('bank', planData.fee)

    local commission = math.floor((planData.fee * Config.InsuranceJob.Commission) / 100)
    broker.AddMoney('bank', commission)

    RecordBrokerCommission(broker.Identifier, broker.Firstname .. ' ' .. broker.Lastname,
        citizenid, customerName,
        planId, planData.name,
        planData.fee, commission)

    local nextPayment = os.time() + (Config.InsuranceSystem.PaymentCycle * 86400)
    local nextPaymentFormatted = os.date('%Y-%m-%d %H:%M:%S', nextPayment)

    local currentPlan = Database.query('SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1',
        { citizenid })

    if currentPlan and #currentPlan > 0 then
        Database.query(
            'UPDATE medical_insurance SET plan = ?, name = ?, start_date = CURRENT_TIMESTAMP, next_payment = ?, active = 1 WHERE citizenid = ? AND active = 1',
            { planId, customerName, nextPaymentFormatted, citizenid })
    else
        Database.query(
            'INSERT INTO medical_insurance (citizenid, plan, name, next_payment, active) VALUES (?, ?, ?, ?, 1)',
            { citizenid, planId, customerName, nextPaymentFormatted })
    end

    RecordPaymentHistory(citizenid, planId, planData.fee, 'Purchase through broker: ' .. offerData.brokerName)

    Notify(src, string.format(Config.Lang['insurance_purchase_through_broker'], planData.name, offerData.brokerName))
    TriggerClientEvent('envi-prescriptions:insuranceSaleSuccessful', brokerId, planData.name, customerName, commission)

    pendingInsuranceOffers[src] = nil
end)

RegisterNetEvent('envi-prescriptions:rejectInsuranceOffer', function(brokerId)
    local src = source

    if not pendingInsuranceOffers[src] or pendingInsuranceOffers[src].brokerId ~= brokerId then
        return
    end

    TriggerClientEvent('envi-prescriptions:insuranceOfferRejected', brokerId)

    pendingInsuranceOffers[src] = nil
end)

AddEventHandler('playerDropped', function()
    local src = source

    pendingInsuranceOffers[src] = nil

    for customerId, offerData in pairs(pendingInsuranceOffers) do
        if offerData.brokerId == src then
            pendingInsuranceOffers[customerId] = nil
        end
    end
end)

exports('SellInsuranceThroughBroker', function(brokerId, customerId, planId)
    local broker = Framework.GetPlayer(brokerId)
    local customer = Framework.GetPlayer(customerId)

    if not broker or not customer then return false end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        return false
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.MinimumGrade then
        return false
    end

    local citizenid = customer.Identifier

    if IsPlayerBannedFromInsurance(citizenid) then
        return false
    end

    local planData = Config.InsurancePlans[planId]
    if not planData then return false end

    if customer.GetMoney('bank') < planData.fee then
        return false
    end

    local customerName = customer.Firstname .. ' ' .. customer.Lastname
    local citizenid = customer.Identifier

    customer.RemoveMoney('bank', planData.fee)

    local commission = math.floor((planData.fee * Config.InsuranceJob.Commission) / 100)
    broker.AddMoney('bank', commission)

    local brokerName = broker.Firstname .. ' ' .. broker.Lastname
    RecordBrokerCommission(broker.Identifier, brokerName, citizenid, customerName, planId, planData.name, planData.fee,
        commission)

    local nextPayment = os.time() + (Config.InsuranceSystem.PaymentCycle * 86400)
    local nextPaymentFormatted = os.date('%Y-%m-%d %H:%M:%S', nextPayment)

    local currentPlan = Database.query('SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1',
        { citizenid })

    if currentPlan and #currentPlan > 0 then
        Database.query(
            'UPDATE medical_insurance SET plan = ?, name = ?, start_date = CURRENT_TIMESTAMP, next_payment = ?, active = 1 WHERE citizenid = ? AND active = 1',
            { planId, customerName, nextPaymentFormatted, citizenid })
    else
        Database.query(
            'INSERT INTO medical_insurance (citizenid, plan, name, next_payment, active) VALUES (?, ?, ?, ?, 1)',
            { citizenid, planId, customerName, nextPaymentFormatted })
    end

    RecordPaymentHistory(citizenid, planId, planData.fee, 'Purchase through broker: ' .. brokerName)

    return true
end)

Framework.CreateCallback('envi-prescriptions:getBossAllInsuranceClaims', function(source, cb)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({})
        return
    end

    local claims = Database.query([[
        SELECT
            c.id, c.citizenid, c.name as customerName, c.medication, c.cost,
            c.covered_amount, c.status, DATE_FORMAT(c.claim_date, "%Y-%m-%d %H:%i") as formatted_date
        FROM
            medical_insurance_claims c
        ORDER BY
            c.claim_date DESC
        LIMIT 50
    ]])

    local formattedClaims = {}
    if claims and type(claims) == 'table' then
        for _, claim in ipairs(claims) do
            table.insert(formattedClaims, {
                id = claim.id,
                citizenid = claim.citizenid,
                customerName = claim.customerName,
                medication = claim.medication,
                cost = claim.cost,
                covered_amount = claim.covered_amount,
                status = claim.status,
                formatted_date = claim.formatted_date or "Unknown Date"
            })
        end
    end

    cb(formattedClaims)
end)

Framework.CreateCallback('envi-prescriptions:searchInsuranceCustomers', function(source, cb, searchTerm)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({})
        return
    end

    local customers = Database.query([[
        SELECT
            i.citizenid, i.name, i.plan,
            COALESCE(b.active, 0) as banned,
            b.reason as banReason
        FROM
            medical_insurance i
        LEFT JOIN
            med_insurance_bans b ON i.citizenid = b.citizenid AND b.active = 1
        WHERE
            i.citizenid LIKE ? OR i.name LIKE ?
        GROUP BY
            i.citizenid
        ORDER BY
            i.name
        LIMIT 20
    ]], { '%' .. searchTerm .. '%', '%' .. searchTerm .. '%' })

    local formattedCustomers = {}
    if customers and type(customers) == 'table' then
        for _, customer in ipairs(customers) do
            local planData = Config.InsurancePlans[customer.plan] or Config.InsurancePlans.none

            table.insert(formattedCustomers, {
                citizenid = customer.citizenid,
                name = customer.name,
                plan = customer.plan,
                planName = planData.name,
                banned = customer.banned == 1,
                banReason = customer.banReason
            })
        end
    end

    cb(formattedCustomers)
end)

Framework.CreateCallback('envi-prescriptions:getBossCustomerClaims', function(source, cb, citizenid)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({})
        return
    end

    local claims = Database.query([[
        SELECT
            id, medication, cost, covered_amount, status,
            DATE_FORMAT(claim_date, "%Y-%m-%d %H:%i") as formatted_date
        FROM
            medical_insurance_claims
        WHERE
            citizenid = ?
        ORDER BY
            claim_date DESC
        LIMIT 30
    ]], { citizenid })

    local formattedClaims = {}
    if claims and type(claims) == 'table' then
        for _, claim in ipairs(claims) do
            table.insert(formattedClaims, {
                id = claim.id,
                medication = claim.medication,
                cost = claim.cost,
                covered_amount = claim.covered_amount,
                status = claim.status,
                formatted_date = claim.formatted_date or "Unknown Date"
            })
        end
    end

    cb(formattedClaims)
end)

Framework.CreateCallback('envi-prescriptions:getBossAllInsuranceClaimsPaginated', function(source, cb, page)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({}, 1, 1)
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({}, 1, 1)
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({}, 1, 1)
        return
    end

    local pageSize = 15
    local offset = (page - 1) * pageSize

    local totalCount = Database.query([[
        SELECT COUNT(*) as count FROM medical_insurance_claims
    ]])[1].count

    local totalPages = math.ceil(totalCount / pageSize)
    if totalPages < 1 then totalPages = 1 end
    if page > totalPages then page = totalPages end

    local claims = Database.query([[
        SELECT
            c.id, c.citizenid, c.name as customerName, c.medication, c.cost,
            c.covered_amount, c.status, DATE_FORMAT(c.claim_date, "%Y-%m-%d %H:%i") as formatted_date
        FROM
            medical_insurance_claims c
        ORDER BY
            c.claim_date DESC
        LIMIT ?, ?
    ]], { offset, pageSize })

    local formattedClaims = {}
    if claims and type(claims) == 'table' then
        for _, claim in ipairs(claims) do
            table.insert(formattedClaims, {
                id = claim.id,
                citizenid = claim.citizenid,
                customerName = claim.customerName,
                medication = claim.medication,
                cost = claim.cost,
                covered_amount = claim.covered_amount,
                status = claim.status,
                formatted_date = claim.formatted_date or "Unknown Date"
            })
        end
    end

    cb(formattedClaims, totalPages, page)
end)

Framework.CreateCallback('envi-prescriptions:searchClaimsByCustomer', function(source, cb, searchTerm)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({})
        return
    end

    local claims = Database.query([[
        SELECT
            c.id, c.citizenid, c.name as customerName, c.medication, c.cost,
            c.covered_amount, c.status, DATE_FORMAT(c.claim_date, "%Y-%m-%d %H:%i") as formatted_date
        FROM
            medical_insurance_claims c
        WHERE
            c.name LIKE ?
        ORDER BY
            c.claim_date DESC
        LIMIT 50
    ]], { '%' .. searchTerm .. '%' })

    local formattedClaims = {}
    if claims and type(claims) == 'table' then
        for _, claim in ipairs(claims) do
            table.insert(formattedClaims, {
                id = claim.id,
                citizenid = claim.citizenid,
                customerName = claim.customerName,
                medication = claim.medication,
                cost = claim.cost,
                covered_amount = claim.covered_amount,
                status = claim.status,
                formatted_date = claim.formatted_date or "Unknown Date"
            })
        end
    end

    cb(formattedClaims)
end)

Framework.CreateCallback('envi-prescriptions:searchClaimsByMedication', function(source, cb, medication)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({})
        return
    end

    local claims = Database.query([[
        SELECT
            c.id, c.citizenid, c.name as customerName, c.medication, c.cost,
            c.covered_amount, c.status, DATE_FORMAT(c.claim_date, "%Y-%m-%d %H:%i") as formatted_date
        FROM
            medical_insurance_claims c
        WHERE
            c.medication = ?
        ORDER BY
            c.claim_date DESC
        LIMIT 50
    ]], { medication })

    local formattedClaims = {}
    if claims and type(claims) == 'table' then
        for _, claim in ipairs(claims) do
            table.insert(formattedClaims, {
                id = claim.id,
                citizenid = claim.citizenid,
                customerName = claim.customerName,
                medication = claim.medication,
                cost = claim.cost,
                covered_amount = claim.covered_amount,
                status = claim.status,
                formatted_date = claim.formatted_date or "Unknown Date"
            })
        end
    end

    cb(formattedClaims)
end)

Framework.CreateCallback('envi-prescriptions:searchClaimsByDateRange', function(source, cb, startDate, endDate)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({})
        return
    end

    local formattedStartDate = startDate .. ' 00:00:00'
    local formattedEndDate = endDate .. ' 23:59:59'

    local claims = Database.query([[
        SELECT
            c.id, c.citizenid, c.name as customerName, c.medication, c.cost,
            c.covered_amount, c.status, DATE_FORMAT(c.claim_date, "%Y-%m-%d %H:%i") as formatted_date
        FROM
            medical_insurance_claims c
        WHERE
            c.claim_date BETWEEN ? AND ?
        ORDER BY
            c.claim_date DESC
        LIMIT 50
    ]], { formattedStartDate, formattedEndDate })

    local formattedClaims = {}
    if claims and type(claims) == 'table' then
        for _, claim in ipairs(claims) do
            table.insert(formattedClaims, {
                id = claim.id,
                citizenid = claim.citizenid,
                customerName = claim.customerName,
                medication = claim.medication,
                cost = claim.cost,
                covered_amount = claim.covered_amount,
                status = claim.status,
                formatted_date = claim.formatted_date or "Unknown Date"
            })
        end
    end

    cb(formattedClaims)
end)

Framework.CreateCallback('envi-prescriptions:getRejectedClaims', function(source, cb)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({})
        return
    end

    local claims = Database.query([[
        SELECT
            c.id, c.citizenid, c.name as customerName, c.medication, c.cost,
            c.covered_amount, c.status, DATE_FORMAT(c.claim_date, "%Y-%m-%d %H:%i") as formatted_date
        FROM
            medical_insurance_claims c
        WHERE
            c.status = 'rejected'
        ORDER BY
            c.claim_date DESC
        LIMIT 50
    ]])

    local formattedClaims = {}
    if claims and type(claims) == 'table' then
        for _, claim in ipairs(claims) do
            table.insert(formattedClaims, {
                id = claim.id,
                citizenid = claim.citizenid,
                customerName = claim.customerName,
                medication = claim.medication,
                cost = claim.cost,
                covered_amount = claim.covered_amount,
                status = claim.status,
                formatted_date = claim.formatted_date or "Unknown Date"
            })
        end
    end

    cb(formattedClaims)
end)

function IsPlayerBannedFromInsurance(citizenid)
    local isBanned = Database.query([[
        SELECT id FROM med_insurance_bans WHERE citizenid = ? AND active = 1 LIMIT 1
    ]], { citizenid })

    return isBanned and #isBanned > 0
end

exports('IsPlayerBannedFromInsurance', IsPlayerBannedFromInsurance)

Framework.CreateCallback('envi-prescriptions:getTopPerformingBrokers', function(source, cb, timePeriod)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({})
        return
    end

    timePeriod = timePeriod or 'all'

    local dateFilter = ""
    if timePeriod == 'today' then
        dateFilter = "WHERE DATE(sale_date) = CURDATE()"
    elseif timePeriod == 'week' then
        dateFilter = "WHERE sale_date >= DATE_SUB(NOW(), INTERVAL 7 DAY)"
    elseif timePeriod == 'month' then
        dateFilter = "WHERE sale_date >= DATE_SUB(NOW(), INTERVAL 30 DAY)"
    end

    local brokers = Database.query([[
        SELECT
            broker_id,
            broker_name,
            COUNT(*) as total_sales,
            SUM(commission) as total_commission,
            MAX(commission) as highest_commission,
            SUM(plan_fee) as total_premiums,
            DATE_FORMAT(MAX(sale_date), "%Y-%m-%d %H:%i") as last_sale
        FROM
            med_insurance_commissions
        ]] .. dateFilter .. [[
        GROUP BY
            broker_id, broker_name
        ORDER BY
            total_commission DESC
        LIMIT 20
    ]])

    cb(brokers or {})
end)

Framework.CreateCallback('envi-prescriptions:getRecentBans', function(source, cb)
    local broker = Framework.GetPlayer(source)

    if not broker then
        cb({})
        return
    end

    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then
        cb({})
        return
    end

    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then
        cb({})
        return
    end

    local bans = Database.query([[
        SELECT
            b.id, b.citizenid, COALESCE(i.name, b.name, 'Unknown') as name, b.reason, b.banned_by_name as bannedBy,
            DATE_FORMAT(b.ban_date, "%Y-%m-%d %H:%i") as formatted_date
        FROM
            med_insurance_bans b
        LEFT JOIN
            medical_insurance i ON b.citizenid = i.citizenid
        WHERE
            b.active = 1
        ORDER BY
            b.ban_date DESC
        LIMIT 50
    ]])

    cb(bans or {})
end)

RegisterNetEvent('envi-prescriptions:toggleCustomerInsuranceBan', function(citizenid, name, reason, action)
    local src = source
    local broker = Framework.GetPlayer(src)
    if not broker then return end
    if not Config.InsuranceJob or not Config.InsuranceJob.Enabled then return end
    if broker.Job.Name ~= Config.InsuranceJob.JobName or broker.Job.Grade.Level < Config.InsuranceJob.BossGrade then return end
    local brokerName = broker.Firstname .. ' ' .. broker.Lastname

    if action == "ban" then
        if not reason or reason == "" then
            reason = "No reason provided"
        end

        local existingBan = Database.query([[
            SELECT id FROM med_insurance_bans WHERE citizenid = ? AND active = 1
        ]], { citizenid })

        if existingBan and #existingBan > 0 then
            Database.query([[
                UPDATE med_insurance_bans
                SET reason = ?, banned_by = ?, banned_by_name = ?, ban_date = CURRENT_TIMESTAMP, active = 1
                WHERE citizenid = ? AND active = 1
            ]], { reason, broker.Identifier, brokerName, citizenid })
        else
            Database.query([[
                INSERT INTO med_insurance_bans
                    (citizenid, name, reason, banned_by, banned_by_name, active)
                VALUES (?, ?, ?, ?, ?, 1)
            ]], { citizenid, name, reason, broker.Identifier, brokerName })
        end

        Database.query([[
            UPDATE medical_insurance
            SET active = 0, inactive_since = CURRENT_TIMESTAMP
            WHERE citizenid = ? AND active = 1
        ]], { citizenid })

        local player = Framework.GetPlayerByIdentifier(citizenid)
        if player then
            Notify(player.source, Config.Lang['customer_insurance_terminated']:format(brokerName, reason), 'error')
        end

        Notify(src, Config.Lang['customer_banned_from_insurance'], 'success')
    else
        Database.query([[
            UPDATE med_insurance_bans SET active = 0 WHERE citizenid = ? AND active = 1
        ]], { citizenid })

        local player = Framework.GetPlayerByIdentifier(citizenid)
        if player then
            Notify(player.source, Config.Lang['customer_insurance_ban_lifted']:format(brokerName), 'success')
        end

        Notify(src, Config.Lang['customer_unbanned_from_insurance'], 'success')
    end
end)

function SetupDatabaseCleanup()
    CreateThread(function()
        while true do
            Wait(3600000) -- Check every hour
            CleanupDatabases()
        end
    end)
end

function CleanupDatabases()
    local currentTime = os.time()
    local claimsDays = Config.DatabaseCleanup and Config.DatabaseCleanup.Claims or 90     -- Default 90 days
    CleanupInsuranceClaims(claimsDays)
    local bansDays = Config.DatabaseCleanup and Config.DatabaseCleanup.InactiveBans or 14 -- Default 14 days
    CleanupInactiveBans(bansDays)
end

function CleanupInsuranceClaims(days)
    Database.query([[
        DELETE FROM medical_insurance_claims
        WHERE claim_date < DATE_SUB(NOW(), INTERVAL ? DAY)
    ]], { days })
end

function CleanupInactiveBans(days)
    Database.query([[
        DELETE FROM med_insurance_bans
        WHERE active = 0 AND updated_at < DATE_SUB(NOW(), INTERVAL ? DAY)
    ]], { days })
end

CreateThread(function()
    Wait(10000)
    SetupDatabaseTables()
    SetupDatabaseCleanup()
end)

function SetupDatabaseTables()
    local result = Database.query("SHOW COLUMNS FROM med_insurance_bans LIKE 'updated_at'")
    if not result or #result == 0 then
        Database.query("ALTER TABLE med_insurance_bans ADD COLUMN updated_at DATETIME DEFAULT CURRENT_TIMESTAMP")
    end
end
