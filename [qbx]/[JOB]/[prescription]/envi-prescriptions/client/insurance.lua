-- Insurance System [NEW FOR 3.0] --

if GetCurrentResourceName() ~= 'envi-prescriptions' then
    return
end

RegisterNetEvent('envi-prescriptions:openInsuranceMenu', function()
    local isInsuranceBroker = false
    if Config.InsuranceJob then
        isInsuranceBroker = (Framework.Player.Job.Name == Config.InsuranceJob.JobName and Framework.Player.Job.Grade.Level >= Config.InsuranceJob.MinimumGrade)
    end

    if isInsuranceBroker then
        TriggerEvent('envi-prescriptions:openInsuranceBrokerMenu')
        return
    end

    if Config.InsuranceJob and Config.InsuranceJob.SelfServiceEnabled == false and not isInsuranceBroker then
        Notify(Config.Lang['insurance_requires_broker'], 'info')
        return
    end

    Framework.TriggerCallback('envi-prescriptions:checkInsuranceBan', function(isBanned, reason)
        if isBanned then
            Notify(Config.Lang['insurance_banned'] .. reason, 'error')
            return
        end

        Framework.TriggerCallback('envi-prescriptions:getPlayerInsurance', function(insuranceData)
            if not insuranceData then
                Notify(Config.Lang['unable_to_retrieve_insurance'], 'error')
                return
            end

            OpenInsuranceMainMenu(insuranceData)
        end)
    end)
end)

function OpenClaimHistoryMenu()
    Framework.TriggerCallback('envi-prescriptions:getInsuranceClaimHistory', function(claims)
        local claimOptions = {}

        if claims and #claims > 0 then
            for _, claim in ipairs(claims) do
                local statusColor = Config.Lang['status_approved']
                if claim.status == 'rejected' then
                    statusColor = Config.Lang['status_rejected']
                elseif claim.status == 'pending' then
                    statusColor = Config.Lang['status_pending']
                end

                local medicationLabel = claim.medication
                if Config.Medications[claim.medication] then
                    medicationLabel = Config.Medications[claim.medication].label
                end

                table.insert(claimOptions, {
                    title = statusColor .. ' ' .. medicationLabel,
                    description = Config.Lang['claim_date'] .. ': ' .. (claim.formatted_date or "Unknown Date"),
                    metadata = {
                        [Config.Lang['original_cost']] = '$' .. claim.cost,
                        [Config.Lang['covered_amount']] = '$' .. claim.covered_amount,
                        [Config.Lang['you_paid']] = '$' .. (claim.cost - claim.covered_amount),
                        [Config.Lang['claim_status']] = claim.status:gsub("^%l", string.upper)
                    },
                    disabled = true
                })
            end
        else
            table.insert(claimOptions, {
                title = Config.Lang['no_claims_found'],
                description = Config.Lang['no_claims_description'],
                disabled = true
            })
        end

        lib.registerContext({
            id = 'medical_insurance_claims',
            title = Config.Lang['insurance_claim_history'],
            menu = 'insurance_menu',
            options = claimOptions
        })

        lib.showContext('medical_insurance_claims')
    end)
end

function OpenInsuranceMainMenu(insuranceData)
    local options = {}

    if insuranceData.plan ~= 'none' then
        -- Customer already has insurance
        table.insert(options, {
            title = string.format(Config.Lang['current_plan'], insuranceData.planName),
            description = string.format(Config.Lang['monthly_premium'], insuranceData.fee),
            metadata = {
                [Config.Lang['discount']] = insuranceData.discount .. '%',
                [Config.Lang['down_payment']] = '$' .. insuranceData.downpayment,
            },
            disabled = true
        })

        if insuranceData.benefits and #insuranceData.benefits > 0 then
            local benefitsList = {
                title = Config.Lang['plan_benefits_title'],
                description = Config.Lang['plan_benefits_description'],
                arrow = true,
                metadata = {}
            }

            for i, benefit in ipairs(insuranceData.benefits) do
                benefitsList.metadata[Config.Lang['benefits_list'] .. ' ' .. i] = benefit
            end

            table.insert(options, benefitsList)
        end

        table.insert(options, {
            title = Config.Lang['cancel_plan'],
            description = Config.Lang['cancel_plan_description'],
            onSelect = function()
                local alert = lib.alertDialog({
                    header = Config.Lang['cancel_insurance_header'],
                    content = string.format(Config.Lang['cancel_insurance_content'], insuranceData.planName,
                        insuranceData.cancelationFee),
                    centered = true,
                    cancel = true
                })

                if alert == 'confirm' then
                    TriggerServerEvent('envi-prescriptions:cancelInsurance', insuranceData.plan)
                    Wait(500)
                    TriggerEvent('envi-prescriptions:openInsuranceMenu')
                end
            end
        })
    else
        -- No insurance
        table.insert(options, {
            title = Config.Lang['no_insurance'],
            description = Config.Lang['no_insurance_description'],
            disabled = true
        })

        table.insert(options, {
            title = Config.Lang['available_plans'],
            disabled = true
        })

        for planId, plan in pairs(Config.InsurancePlans) do
            if planId ~= 'none' then
                local planOption = {
                    title = Config.Lang['plan_icon'] .. ' ' .. plan.name,
                    description = Config.Lang['plan_description'],
                    metadata = {
                        [string.format(Config.Lang['monthly_premium'], plan.fee)] = '',
                        [Config.Lang['medication_discount']] = plan.discount .. '%',
                        [Config.Lang['down_payment_fee']] = '$' .. plan.downpayment,
                    },
                    onSelect = function()
                        local benefitsMenu = {
                            {
                                title = string.format(Config.Lang['plan_benefits'], plan.name),
                                description = string.format(Config.Lang['monthly_premium'], plan.fee),
                                disabled = true
                            }
                        }

                        for i, benefit in ipairs(plan.benefits) do
                            table.insert(benefitsMenu, {
                                title = Config.Lang['benefit_bullet_point'] .. benefit,
                                disabled = true
                            })
                        end

                        local coveredMeds = Config.Lang['none_available']
                        if plan.eligibleMedications[1] == 'all' then
                            coveredMeds = Config.Lang['all_medications']
                        elseif #plan.eligibleMedications > 0 then
                            local medicationNames = {}
                            for _, medication in ipairs(plan.eligibleMedications) do
                                local medicationName = Config.Medications[medication].label
                                table.insert(medicationNames, medicationName)
                            end
                            coveredMeds = table.concat(medicationNames, ', ')
                        end

                        table.insert(benefitsMenu, {
                            title = Config.Lang['covered_medications'],
                            description = coveredMeds,
                            disabled = true
                        })

                        table.insert(benefitsMenu, {
                            title = Config.Lang['purchase_plan'],
                            description = string.format(Config.Lang['purchase_plan_description'], plan.name),
                            onSelect = function()
                                local alert = lib.alertDialog({
                                    header = Config.Lang['confirm_purchase_header'],
                                    content = string.format(Config.Lang['confirm_purchase_content'], plan.name, plan.fee, Config.InsuranceSystem.PaymentCycle),
                                    centered = true,
                                    cancel = true
                                })

                                if alert == 'confirm' then
                                    TriggerServerEvent('envi-prescriptions:purchaseInsurance', planId)
                                end
                            end
                        })

                        lib.registerContext({
                            id = 'insurance_plan_details',
                            title = Config.Lang['insurance_plan_details'],
                            menu = 'insurance_main_menu',
                            options = benefitsMenu
                        })

                        lib.showContext('insurance_plan_details')
                    end
                }

                table.insert(options, planOption)
            end
        end
    end

    table.insert(options, {
        title = Config.Lang['view_claim_history'],
        description = Config.Lang['view_claim_history_description'],
        arrow = true,
        onSelect = function()
            OpenClaimHistoryMenu()
        end
    })

    lib.registerContext({
        id = 'insurance_main_menu',
        title = Config.Lang['insurance_menu_title'],
        options = options
    })

    lib.showContext('insurance_main_menu')
end

Framework.OnPlayerLoaded = function()
    Wait(10000)
    TriggerServerEvent('envi-prescriptions:processPlayerInsurancePayment')
end

RegisterNetEvent('envi-prescriptions:openInsuranceBrokerMenu', function()
    OpenBrokerMenu()
end)

-- Client Exports
exports('HasMedicalInsurance', function()
    local insuranceData = Framework.TriggerCallback.Await('envi-prescriptions:getPlayerInsurance')
    return insuranceData and insuranceData.plan ~= 'none'
end)

exports('GetInsuranceDetails', function()
    local insuranceData = Framework.TriggerCallback.Await('envi-prescriptions:getPlayerInsurance')
    return insuranceData
end)

exports('OpenInsuranceMenu', function()
    TriggerEvent('envi-prescriptions:openInsuranceMenu')
end)

exports('GetClaimHistory', function()
    local claims = Framework.TriggerCallback.Await('envi-prescriptions:getInsuranceClaimHistory')
    return claims
end)
