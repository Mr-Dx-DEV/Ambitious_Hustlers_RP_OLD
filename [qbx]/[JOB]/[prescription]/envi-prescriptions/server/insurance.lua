CreateThread(function()
    Database.query([[
        CREATE TABLE IF NOT EXISTS medical_insurance (
            id INT AUTO_INCREMENT PRIMARY KEY,
            citizenid VARCHAR(50) DEFAULT NULL,
            name VARCHAR(50) DEFAULT NULL,
            plan VARCHAR(50) DEFAULT 'none',
            start_date DATETIME DEFAULT CURRENT_TIMESTAMP,
            next_payment DATETIME DEFAULT NULL,
            active TINYINT(1) DEFAULT 1,
            inactive_since DATETIME DEFAULT NULL,
            payment_history TEXT DEFAULT '[]'
        )
    ]])
    print('Initialized medical_insurance database')

    Database.query([[
        CREATE TABLE IF NOT EXISTS medical_insurance_claims (
            id INT AUTO_INCREMENT PRIMARY KEY,
            citizenid VARCHAR(50) DEFAULT NULL,
            name VARCHAR(50) DEFAULT NULL,
            medication VARCHAR(50) DEFAULT NULL,
            cost INT DEFAULT 0,
            covered_amount INT DEFAULT 0,
            claim_date DATETIME DEFAULT CURRENT_TIMESTAMP,
            status VARCHAR(20) DEFAULT 'processed'
        )
    ]])
    print('Initialized medical_insurance_claims database')

    Database.query([[
        CREATE TABLE IF NOT EXISTS pharmacy_bans (
            pharmacyID INT,
            identifier VARCHAR(60),
            name VARCHAR(50) DEFAULT NULL,
            ban_reason TEXT,
            ban_time DATETIME,
            ban_expiration DATETIME,
            ban_history TEXT DEFAULT '[]',
            ban_active BOOLEAN DEFAULT 1,
            PRIMARY KEY (pharmacyID, identifier)
        )
    ]])
    print('Initialized pharmacy_bans database')
end)

CreateThread(function()
    SetTimeout(10000, function()
        local daysOld = Config.InsuranceSystem.MaxDatabaseClaimsDaysOld
        Database.query([[
            DELETE FROM medical_insurance_claims
            WHERE claim_date < DATE_SUB(NOW(), INTERVAL ? DAY)
        ]], { daysOld })

        local daysOld = Config.InsuranceSystem.MaxDatabaseInactiveDays
        Database.query([[
            DELETE FROM medical_insurance
            WHERE active = 0
        ]], { daysOld })
    end)
end)

-- Insurance System

Framework.CreateCallback('envi-prescriptions:getPlayerInsurance', function(source, cb)
    local player = Framework.GetPlayer(source)
    if not player then
        cb(nil)
        return
    end
    local citizenid = player.Identifier
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

    cb(insuranceData)
end)

RegisterNetEvent('envi-prescriptions:purchaseInsurance', function(planId)
    local src = source
    local player = Framework.GetPlayer(src)
    if not player then return end
    local citizenid = player.Identifier
    local planData = Config.InsurancePlans[planId]
    local name = player.Firstname .. ' ' .. player.Lastname
    local isBanned = exports['envi-prescriptions']:IsPlayerBannedFromInsurance(citizenid)
    if isBanned then
        Notify(src, 'You are banned from purchasing insurance', 'error')
        return
    end
    if not planData then
        Notify(src, 'Invalid insurance plan', 'error')
        return
    end
    local currentPlan = Database.query('SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1',
        { citizenid })
    if currentPlan and #currentPlan > 0 and currentPlan[1].plan == planId then
        Notify(src, string.format(Config.Lang['insurance_already_subscribed'], planData.name), 'error')
        return
    end
    if player.GetMoney('bank') < planData.fee then
        Notify(src, Config.Lang['insurance_purchase_failed'], 'error')
        return
    end
    player.RemoveMoney('bank', planData.fee)
    local nextPayment = os.time() + (Config.InsuranceSystem.PaymentCycle * 86400) -- days to seconds
    local nextPaymentFormatted = os.date('%Y-%m-%d %H:%M:%S', nextPayment)
    if currentPlan and #currentPlan > 0 then
        Database.query(
            'UPDATE medical_insurance SET plan = ?, name = ?, start_date = CURRENT_TIMESTAMP, next_payment = ?, active = 1 WHERE citizenid = ? AND active = 1',
            { planId, name, nextPaymentFormatted, citizenid })
    else
        Database.query(
            'INSERT INTO medical_insurance (citizenid, plan, name, next_payment, active) VALUES (?, ?, ?, ?, 1)',
            { citizenid, planId, name, nextPaymentFormatted })
    end

    RecordPaymentHistory(citizenid, planId, planData.fee, 'Initial subscription')
    Notify(src, string.format(Config.Lang['insurance_purchase_success'], planData.name))
end)

RegisterNetEvent('envi-prescriptions:cancelInsurance', function(planId)
    local src = source
    local player = Framework.GetPlayer(src)
    if not player then return end
    local citizenid = player.Identifier
    local planData = Config.InsurancePlans[planId]
    if not planData then
        Notify(src, 'Invalid insurance plan', 'error')
        return
    end
    if player.GetMoney('bank') < planData.cancelationFee then
        Notify(src, string.format(Config.Lang['insurance_cancelation_failed'], planData.name), 'error')
        return
    end
    player.RemoveMoney('bank', planData.cancelationFee)
    local result = Database.query(
        'UPDATE medical_insurance SET active = 0, inactive_since = CURRENT_TIMESTAMP WHERE citizenid = ? AND active = 1',
        { citizenid })
    if result and result.affectedRows and result.affectedRows > 0 then
        Notify(src, Config.Lang['insurance_cancelled'])
    else
        Notify(src, 'You do not have an active insurance plan', 'error')
    end
end)

Framework.CreateCallback('envi-prescriptions:getInsuranceClaimHistory', function(source, cb)
    local player = Framework.GetPlayer(source)
    if not player then
        cb({})
        return
    end
    local citizenid = player.Identifier
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

    cb(formattedClaims)
end)

function CleanupOldClaims(citizenid)
    local limit = Config.InsuranceSystem.MaxDatabaseClaimsHistory
    local count = Database.query('SELECT COUNT(*) as count FROM medical_insurance_claims WHERE citizenid = ?',
        { citizenid })[1].count
    if count > limit then
        Database.query([[
            DELETE FROM medical_insurance_claims
            WHERE citizenid = ?
            AND id NOT IN (
                SELECT id FROM (
                    SELECT id
                    FROM medical_insurance_claims
                    WHERE citizenid = ?
                    ORDER BY claim_date DESC
                    LIMIT ?
                ) latest
            )
        ]], { citizenid, citizenid, limit })
    end
end

Framework.CreateCallback('envi-prescriptions:getMedicationPricing', function(source, cb, medicationToGive, dosage)
    local player = Framework.GetPlayer(source)
    local citizenid = player.Identifier
    local result = Database.query('SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1', { citizenid })
    local insurancePlan = Config.InsuranceSystem.DefaultPlan
    if result and #result > 0 then
        insurancePlan = result[1].plan
    end

    local planData = Config.InsurancePlans[insurancePlan] or Config.InsurancePlans.none
    local medicationCost = Config.MedicationCost
    local doseCost = Config.Medications[medicationToGive]?.costPerDose or 0
    local finalMedicationCost = medicationCost + (doseCost * dosage)
    local appliedDiscount = 0
    local downpaymentAmount = 0
    local claimRejected = false
    local isCovered = false

    if insurancePlan ~= 'none' then
        if planData.eligibleMedications[1] == "all" then
            isCovered = true
        else
            for _, coveredMed in ipairs(planData.eligibleMedications) do
                if coveredMed == medicationToGive then
                    isCovered = true
                    break
                end
            end
        end

        if isCovered then
            local rejectionChance = Config.InsuranceSystem.RejectionChance[medicationToGive] or 0
            claimRejected = (math.random(1, 100) <= rejectionChance)
            if not claimRejected then
                appliedDiscount = math.floor((medicationCost * planData.discount) / 100)
                downpaymentAmount = planData.downpayment
            end
        end
    end

    local finalCost = finalMedicationCost - appliedDiscount + downpaymentAmount
    finalCost = math.max(finalCost, 0)


    cb({
        medicationCost = finalMedicationCost,
        insurancePlan = insurancePlan,
        planName = planData.name,
        isCovered = isCovered,
        claimRejected = claimRejected,
        appliedDiscount = appliedDiscount,
        downpaymentAmount = downpaymentAmount,
        finalCost = finalCost
    })
end)

function RecordPaymentHistory(citizenid, planId, amount, notes)
    local result = Database.query('SELECT payment_history FROM medical_insurance WHERE citizenid = ?', { citizenid })
    local paymentHistory = {}

    if result and #result > 0 and result[1].payment_history then
        paymentHistory = json.decode(result[1].payment_history) or {}
    end

    table.insert(paymentHistory, {
        date = os.date('%Y-%m-%d %H:%M:%S'),
        plan = planId,
        amount = amount,
        notes = notes
    })

    if #paymentHistory > 10 then
        local tempHistory = {}
        for i = #paymentHistory - 9, #paymentHistory do
            table.insert(tempHistory, paymentHistory[i])
        end
        paymentHistory = tempHistory
    end

    Database.query('UPDATE medical_insurance SET payment_history = ? WHERE citizenid = ?',
        { json.encode(paymentHistory), citizenid })
end

RegisterNetEvent('envi-prescriptions:processPlayerInsurancePayment', function()
    local src = source
    local player = Framework.GetPlayer(src)
    if player then
        ProcessPlayerInsurancePayment(player)
    end
end)

function ProcessPlayerInsurancePayment(player)
    local citizenid = player.Identifier
    local result = Database.query([[
        SELECT id, plan, next_payment
        FROM medical_insurance
        WHERE citizenid = ? AND active = 1 AND next_payment <= CURRENT_TIMESTAMP
        ORDER BY next_payment ASC LIMIT 1
    ]], { citizenid })

    if not result or #result == 0 then
        return false -- No payment due
    end
    local insuranceId = result[1].id
    local planId = result[1].plan
    local planData = Config.InsurancePlans[planId]
    if not planData then
        Database.query('UPDATE medical_insurance SET active = 0, inactive_since = CURRENT_TIMESTAMP WHERE id = ?',
            { insuranceId })
        return false
    end
    if player.GetMoney('bank') >= planData.fee then
        local removedMoney = player.RemoveMoney('bank', planData.fee)
        local nextPayment = os.time() + (Config.InsuranceSystem.PaymentCycle * 86400)
        local nextPaymentFormatted = os.date('%Y-%m-%d %H:%M:%S', nextPayment)
        if Config.InsuranceMoneySociety and removedMoney then
            Framework.SocietyAddMoney(Config.InsuranceMoneySociety, 'job', planData.fee)
        end
        Database.query('UPDATE medical_insurance SET next_payment = ?, inactive_since = NULL WHERE id = ?',
            { nextPaymentFormatted, insuranceId })

        RecordPaymentHistory(citizenid, planId, planData.fee, 'Regular payment')
        Notify(player.source, string.format(Config.Lang['insurance_payment_successful'], planData.fee, planData.name))
        return true
    else
        Database.query('UPDATE medical_insurance SET active = 0, inactive_since = CURRENT_TIMESTAMP WHERE id = ?',
            { insuranceId })
        RecordPaymentHistory(citizenid, planId, planData.fee, 'Payment failed - insufficient funds')
        Notify(player.source, string.format(Config.Lang['insurance_payment_failed'], planData.name))
        return false
    end
end

Framework.CreateCallback('envi-prescriptions:checkInsuranceBan', function(source, cb)
    local player = Framework.GetPlayer(source)
    if not player then
        cb(false)
        return
    end

    local citizenid = player.Identifier
    local result = Database.query([[
        SELECT reason FROM med_insurance_bans
        WHERE citizenid = ? AND active = 1
        LIMIT 1
    ]], { citizenid })

    if result and #result > 0 then
        cb(true, result[1].reason or "No reason provided")
    else
        cb(false)
    end
end)

-- Server Exports
exports('HasMedicalInsurance', function(source)
    local player = Framework.GetPlayer(source)
    if not player then return false end

    local citizenid = player.Identifier
    local result = Database.query('SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1', { citizenid })

    return result and #result > 0 and result[1].plan ~= 'none'
end)

exports('GetPlayerInsurance', function(source)
    local player = Framework.GetPlayer(source)
    if not player then return nil end

    local citizenid = player.Identifier
    local result = Database.query('SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1', { citizenid })
    local insurancePlan = Config.InsuranceSystem.DefaultPlan

    if result and #result > 0 then
        insurancePlan = result[1].plan
    end

    local planData = Config.InsurancePlans[insurancePlan] or Config.InsurancePlans.none
    return {
        plan = insurancePlan,
        planName = planData.name,
        discount = planData.discount,
        downpayment = planData.downpayment,
        fee = planData.fee,
        benefits = planData.benefits,
        eligibleMedications = planData.eligibleMedications,
        cancelationFee = planData.cancelationFee
    }
end)

exports('GetInsuranceClaimHistory', function(source)
    local player = Framework.GetPlayer(source)
    if not player then return {} end

    local citizenid = player.Identifier
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

    return formattedClaims
end)

exports('PurchaseInsurance', function(source, planId)
    local player = Framework.GetPlayer(source)
    if not player then return false end

    local citizenid = player.Identifier
    local planData = Config.InsurancePlans[planId]
    local name = player.Firstname .. ' ' .. player.Lastname

    if not planData then
        return false
    end

    local currentPlan = Database.query('SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1',
        { citizenid })

    if currentPlan and #currentPlan > 0 and currentPlan[1].plan == planId then
        return false
    end

    if player.GetMoney('bank') < planData.fee then
        return false
    end

    player.RemoveMoney('bank', planData.fee)
    local nextPayment = os.time() + (Config.InsuranceSystem.PaymentCycle * 86400)
    local nextPaymentFormatted = os.date('%Y-%m-%d %H:%M:%S', nextPayment)

    if currentPlan and #currentPlan > 0 then
        Database.query(
            'UPDATE medical_insurance SET plan = ?, name = ?, start_date = CURRENT_TIMESTAMP, next_payment = ?, active = 1 WHERE citizenid = ? AND active = 1',
            { planId, name, nextPaymentFormatted, citizenid })
    else
        Database.query(
            'INSERT INTO medical_insurance (citizenid, plan, name, next_payment, active) VALUES (?, ?, ?, ?, 1)',
            { citizenid, planId, name, nextPaymentFormatted })
    end

    RecordPaymentHistory(citizenid, planId, planData.fee, 'Initial subscription')
    return true
end)

exports('CancelInsurance', function(source)
    local player = Framework.GetPlayer(source)
    if not player then return false end

    local citizenid = player.Identifier
    local result = Database.query('SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1', { citizenid })

    if not result or #result == 0 then
        return false
    end

    local planId = result[1].plan
    local planData = Config.InsurancePlans[planId]

    if not planData then
        return false
    end

    if player.GetMoney('bank') < planData.cancelationFee then
        return false
    end

    player.RemoveMoney('bank', planData.cancelationFee)
    local updateResult = Database.query(
        'UPDATE medical_insurance SET active = 0, inactive_since = CURRENT_TIMESTAMP WHERE citizenid = ? AND active = 1',
        { citizenid })

    return updateResult and updateResult.affectedRows and updateResult.affectedRows > 0
end)