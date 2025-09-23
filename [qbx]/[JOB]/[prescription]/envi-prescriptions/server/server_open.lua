Config.Webhook = '' -- Discord webhook for logging

RegisterNetEvent('envi-prescriptions:giveVehicleKeys', function(netID)
    local src = source
    Wait(2000)
    local vehicle = NetworkGetEntityFromNetworkId(netID)
    if GetResourceState('qbx_vehiclekeys') == 'started' then
        exports.qbx_vehiclekeys:GiveKeys(src, vehicle)
    end
    -- add your vehicle keys Server trigger here
end)

function SendDiscordLog(title, message)
    local embed = {
        {
            ['title'] = title,
            ['description'] = message,
            ['type'] = 'rich',
            ['color'] = 16711680,
        }
    }
    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }),
        { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('envi-prescriptions:giveMedication', function(source, medicationToGive, playerName, dobirth, dosage)
    local player = Framework.GetPlayer(source)
    local name = player.Firstname .. ' ' .. player.Lastname or player.Name
    local dob = player.DateOfBirth
    local prescriptionId = math.random(100000, 999999)
    local total = nil
    local effects = nil
    local sideEffects = nil
    local anim = nil
    for _, medication in pairs(Config.Medications) do
        if medication.item == medicationToGive then
            total = medication.total
            effects = medication.effects
            sideEffects = medication.sideEffects
            anim = medication.anim
            break
        end
    end
    local info = {}
    info.prescription = string.format(Config.Lang['metadata_prescription'], prescriptionId) -- PRESCRIPTION ID
    info.name = string.format(Config.Lang['metadata_patient_name'], name)                   -- PATIENT NAME
    info.dob = string.format(Config.Lang['metadata_patient_dob'], dob)                      -- PATIENT DOB
    info.type = ' - ' .. name
    info.total =
        dosage                                             --or total                                        -- REMAINING DOSES
    info.dosage = Config.Lang['metadata_take4timesperday'] -- DOSAGE INFO  (ONE BEFORE BOTTOM)
    info.warning = Config.Lang['metadata_warning']         -- WARNING INFO (BOTTOM)
    info.effects = effects
    info.sideEffects = sideEffects
    info.anim = anim
    if info.effects then
        Framework.AddItem(source, medicationToGive, 1, info)
    else
        Framework.AddItem(source, medicationToGive, dosage, info)
    end
    local logTitle = Config.Lang['prescription_collected']
    local logMessage = string.format(Config.Lang['player_medication_batchid_patientdob'], name, medicationToGive,
        prescriptionId, dob)
    SendDiscordLog(logTitle, logMessage)
end)

Framework.CreateCallback('envi-prescriptions:checkMedication', function(source, cb)
    local player = Framework.GetPlayer(source)
    local playerName = player.Firstname .. ' ' .. player.Lastname or player.Name
    local dobirth = player.DateOfBirth
    local medicationToGive = nil
    local dosage = nil
    local insuranceInfo = nil
    local finalCost = 0
    local costBeforeInsurance = Config.MedicationCost
    for _, medication in pairs(Config.Medications) do
        local script = Config.PrescriptionItem
        local src = source
        local playerItems = Framework.GetItem(src, script)
        local playerName = player.Firstname .. ' ' .. player.Lastname or player.Name

        for _, item in ipairs(playerItems) do
            if item.metadata and item.metadata.type == ' - ' .. playerName then
                medicationToGive = item.metadata.meds
                dosage = item?.metadata?.doses or 1

                if Config.PayForMedication then
                    local medicationCost = Config.MedicationCost
                    local doseCost = Config.Medications[medicationToGive]?.costPerDose or 0
                    finalCost = medicationCost + (doseCost * dosage)
                    costBeforeInsurance = finalCost
                    
                    if Config.InsuranceSystem.Enabled then
                        local citizenid = player.Identifier
                        local result = Database.query(
                            'SELECT plan FROM medical_insurance WHERE citizenid = ? AND active = 1', { citizenid })
                        local insurancePlan = Config.InsuranceSystem.DefaultPlan
                        if result and #result > 0 then
                            insurancePlan = result[1].plan
                        end
                        local planData = Config.InsurancePlans[insurancePlan] or Config.InsurancePlans.none
                        local finalMedicationCost = finalCost
                        local appliedDiscount = 0
                        local downpaymentAmount = 0
                        local claimRejected = false
                        insuranceInfo = {
                            baseCost = medicationCost,
                            finalCost = finalMedicationCost,
                            appliedDiscount = appliedDiscount,
                            downpaymentAmount = downpaymentAmount,
                            claimRejected = claimRejected,
                            insurancePlan = insurancePlan,
                            isCovered = false,
                            planName = planData.name,
                            discount = planData.discount,
                            downpayment = planData.downpayment,
                            fee = planData.fee,
                            benefits = planData.benefits,
                            coveredMedications = planData.eligibleMedications
                        }

                        if insurancePlan ~= 'none' then
                            -- Check if medication is covered by insurance
                            local isCovered = false
                            if planData.eligibleMedications[1] == "all" then
                                isCovered = true
                                insuranceInfo.isCovered = true
                            else
                                for _, coveredMed in ipairs(planData.eligibleMedications) do
                                    if coveredMed == medicationToGive then
                                        isCovered = true
                                        insuranceInfo.isCovered = true
                                        break
                                    end
                                end
                            end

                            if isCovered then
                                local rejectionChance = Config.InsuranceSystem.RejectionChance[medicationToGive] or 0
                                claimRejected = (math.random(1, 100) <= rejectionChance)
                                insuranceInfo.claimRejected = claimRejected
                                if not claimRejected then
                                    appliedDiscount = math.floor((medicationCost * planData.discount) / 100)
                                    downpaymentAmount = planData.downpayment
                                    insuranceInfo.appliedDiscount = appliedDiscount
                                    insuranceInfo.downpaymentAmount = downpaymentAmount

                                    finalCost = finalMedicationCost - appliedDiscount + downpaymentAmount
                                    insuranceInfo.finalCost = finalCost
                                    finalCost = math.max(finalCost, 0)
                                    insuranceInfo.finalCost = finalCost

                                    Database.query(
                                        'INSERT INTO medical_insurance_claims (citizenid, medication, cost, covered_amount, status, name) VALUES (?, ?, ?, ?, ?, ?)',
                                        { citizenid, medicationToGive, finalMedicationCost, appliedDiscount, 'processed',
                                            playerName })
                                    CleanupOldClaims(citizenid)
                                    Notify(source,
                                        string.format(Config.Lang['insurance_claim_accepted'], planData.name,
                                            planData.discount), 10000)

                                    if downpaymentAmount > 0 then
                                        Notify(source,
                                            string.format(Config.Lang['medication_downpayment'], downpaymentAmount),
                                            10000)
                                    end
                                else
                                    finalCost = finalMedicationCost
                                    insuranceInfo.finalCost = finalCost
                                    Database.query(
                                        'INSERT INTO medical_insurance_claims (citizenid, medication, cost, covered_amount, status, name) VALUES (?, ?, ?, 0, ?, ?)',
                                        { citizenid, medicationToGive, finalMedicationCost, 'rejected', playerName })
                                    CleanupOldClaims(citizenid)
                                    Notify(source, Config.Lang['insurance_claim_rejected'], 10000)
                                end
                            else
                                finalCost = finalMedicationCost
                                insuranceInfo.finalCost = finalCost
                                Notify(source, Config.Lang['insurance_not_covered'], 'error', 10000)
                            end
                        end
                    else
                        -- Create dummy insurance info with default values when insurance system is disabled
                        insuranceInfo = {
                            baseCost = medicationCost,
                            finalCost = finalCost,
                            appliedDiscount = 0,
                            downpaymentAmount = 0,
                            claimRejected = false,
                            insurancePlan = 'none',
                            isCovered = false,
                            planName = Config.InsurancePlans.none.name,
                            discount = 0,
                            downpayment = 0,
                            fee = 0,
                            benefits = {},
                            coveredMedications = {}
                        }
                    end
                else
                    break
                end
            end
        end

        if medicationToGive then
            break
        end
    end
    cb(medicationToGive, insuranceInfo, dosage, costBeforeInsurance)
end)

Framework.CreateCallback('envi-prescriptions:getMyMeds',
    function(source, cb, medicationToGive, dosage, cost, hadInsurance, coveredAmount, pharmacyId)
        local player = Framework.GetPlayer(source)
        local playerName = player.Firstname .. ' ' .. player.Lastname or player.Name
        local dobirth = player.DateOfBirth
        local noMoney = false
        local src = source
        local removedMoney = false
        local removedItem = false
        local script = Config.PrescriptionItem
        local canPaySociety = true
        if Config.SuppliesSystem.Enabled and pharmacyId then
            canPaySociety = exports['envi-prescriptions']:reducePharmacySupplies(pharmacyId)
        end

        if cost and cost > 0 then
            if player.GetMoney(Config.PaymentType) >= cost then
                removedMoney = player.RemoveMoney(Config.PaymentType, cost)
                removedItem = Framework.RemoveItem(src, script, 1)
                if canPaySociety and Config.PayForMedication then
                    local societyAmount = math.floor(cost * 0.7) -- 70% of cost goes to society
                    if societyAmount > 0 then
                        Framework.SocietyAddMoney(Config.PharmacySociety, 'job', societyAmount)
                    end
                end
            else
                noMoney = true
            end
        else
            removedItem = Framework.RemoveItem(src, script, 1)
            removedMoney = true
        end
        if medicationToGive and removedMoney and removedItem and not noMoney then
            SetTimeout(21000, function()
                TriggerEvent('envi-prescriptions:giveMedication', source, medicationToGive, playerName, dobirth, dosage)
            end)
            cb(true)
        else
            cb(false)
        end
    end)

RegisterNetEvent('envi-prescriptions:writePrescription', function(medication, prescriptionId, dob, itemLabel, name, docGrade, doctor, expiry, doses, closestPlayer)
    local src = source
    local xPlayer = Framework.GetPlayer(src)
    local expiryTime = os.time() + 172800
    local expiryDate = os.date('%Y-%m-%d %H:%M:%S', expiryTime)
    local info = {}
    info.prescription = string.format(Config.Lang['metadata_prescription'], prescriptionId)  -- PRESCRIPTION ID
    info.name = string.format(Config.Lang['metadata_patient_name'], name)                    -- PATIENT NAME
    info.dob = string.format(Config.Lang['metadata_patient_dob'], dob)                       -- PATIENT DOB
    info.itemLabel = string.format(Config.Lang['metadata_prescribed_medication'], itemLabel) -- MEDICATION ITEM LABEL
    info.signed = string.format(Config.Lang['metadata_signed_by'], doctor, docGrade)         -- DOCTOR GRADE & NAME
    info.expiry = string.format(Config.Lang['metadata_expires'], expiry)                     -- EXPIRY DATE
    info.meds = medication
    info.type = ' - ' .. name
    info.doses = doses -- DOSES
    info.doctor = doctor or ''
    Framework.AddItem(src, Config.PrescriptionItem, 1, info)
    local target = Config.TestMode and source or (closestPlayer or source)
    local patientIdentifier = "unknown"
    local targetPlayer = Framework.GetPlayer(target)
    if targetPlayer then
        patientIdentifier = targetPlayer.Identifier
    end
    local doctorIdentifier = xPlayer.Identifier

    Database.query(
        'INSERT INTO prescription_records (prescription_id, doctor_identifier, doctor_name, doctor_grade, patient_identifier, patient_name, patient_dob, medication, medication_label, doses, expiry_date, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)',
        {
            prescriptionId,
            doctorIdentifier,
            doctor,
            docGrade,
            patientIdentifier,
            name,
            dob,
            medication,
            itemLabel,
            doses,
            expiryDate
        }
    )
    CleanupOldPrescriptionRecords(doctorIdentifier)
    local logTitle = Config.Lang['prescription_written_hook']
    local logMessage = string.format(Config.Lang['doctor_medication_information_expirydate'], xPlayer.Name,
        medication,
        json.encode(info), expiryDate)
    print('Discord Log:')
    print('Title:', logTitle)
    print('Message:', logMessage)
    SendDiscordLog(logTitle, logMessage)
end)

local registered = {}

CreateThread(function()
    for _, medication in pairs(Config.Medications) do
        if medication.effects then
            if not registered[medication.item] then
                Framework.CreateUseableItem(medication.item, function(source, item, data)
                    if not data?.metadata?.effects then
                        data.metadata = {
                            effects = medication.effects,
                            anim = medication.anim,
                            sideEffects = medication.sideEffects,
                            total = math.random(1, medication.total)
                        }
                        Framework.SetItemMetadata(source, data.slot, data.metadata)
                        TriggerClientEvent('envi-prescriptions:drugEffects', source, data.metadata.effects,
                            data.metadata.anim, data.metadata.sideEffects)

                        if data.metadata.total and data.metadata.total > 0 then
                            data.metadata.total = data.metadata.total - 1
                            if data.metadata.total <= 0 then
                                Notify(source, Config.Lang['ran_out_of'] .. ' ' .. data.label, 'error')
                                Framework.RemoveItem(source, item, 1)
                            else
                                Notify(source,
                                    Config.Lang['you_took'] ..
                                    ' ' .. data.label .. ' - ' .. Config.Lang['amount_remaining'] .. data.metadata.total,
                                    'error')
                                Framework.SetItemMetadata(source, data.slot, data.metadata)
                            end
                        end
                        return
                    end

                    TriggerClientEvent('envi-prescriptions:drugEffects', source, data.metadata.effects,
                        data.metadata.anim, data.metadata.sideEffects)

                    if data.metadata.total and data.metadata.total > 0 then
                        data.metadata.total = data.metadata.total - 1
                        if data.metadata.total <= 0 then
                            Notify(source, Config.Lang['ran_out_of'] .. ' ' .. data.label, 'error')
                            Framework.RemoveItem(source, item, 1)
                        else
                            Notify(source,
                                Config.Lang['you_took'] ..
                                ' ' .. data.label .. ' - ' .. Config.Lang['amount_remaining'] .. data.metadata.total,
                                'error')
                            Framework.SetItemMetadata(source, data.slot, data.metadata)
                        end
                    end
                    registered[medication.item] = true
                end)
            end
        end
    end
end)

Framework.CreateCallback('envi-prescriptions:getPlayerInfo', function(source, cb, closestPlayerServerId)
    local xPlayer = Framework.GetPlayer(closestPlayerServerId)
    if xPlayer then
        cb({
            name = xPlayer.Firstname .. ' ' .. xPlayer.Lastname or xPlayer.Name,
            dob = xPlayer.DateOfBirth
        })
    else
        cb(nil)
    end
end)