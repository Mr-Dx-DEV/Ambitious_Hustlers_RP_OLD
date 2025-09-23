if GetCurrentResourceName() ~= 'envi-prescriptions' then
    return
end

local activeCustomer = nil
local activeCustomerSource = nil
local activeSaleData = nil


function OpenBrokerMenu()
    if not CanAccessBrokerMenu() then return end
    local options = {}
    table.insert(options, {
        title = Config.Lang['request_insurance_title'],
        description = Config.Lang['request_insurance_desc'],
        icon = 'user-plus',
        onSelect = function()
            RequestCustomerForInsurance()
        end
    })

    table.insert(options, {
        title = Config.Lang['view_commission_title'],
        description = Config.Lang['view_commission_desc'],
        icon = 'money-bill-wave',
        onSelect = function()
            ViewCommissionHistory()
        end
    })

    if Framework.Player.Job.Name == Config.InsuranceJob.JobName and Framework.Player.Job.Grade.Level >= Config.InsuranceJob.BossGrade then
        table.insert(options, {
            title = Config.Lang['view_all_claims_title'],
            description = Config.Lang['view_all_claims_desc'],
            icon = 'clipboard-list',
            onSelect = function()
                ViewAllClaimsPaginated(1)
            end
        })
        table.insert(options, {
            title = Config.Lang['search_claims_customer_title'],
            description = Config.Lang['search_claims_customer_desc'],
            icon = 'search',
            onSelect = function()
                SearchClaimsByCustomer()
            end
        })
        table.insert(options, {
            title = Config.Lang['search_claims_medication_title'],
            description = Config.Lang['search_claims_medication_desc'],
            icon = 'pills',
            onSelect = function()
                SearchClaimsByMedication()
            end
        })
        table.insert(options, {
            title = Config.Lang['manage_customer_access_title'],
            description = Config.Lang['manage_customer_access_desc'],
            icon = 'user-lock',
            onSelect = function()
                ManageCustomerInsuranceAccess()
            end
        })
        table.insert(options, {
            title = Config.Lang['view_recent_bans_title'],
            description = Config.Lang['view_recent_bans_desc'],
            icon = 'user-slash',
            onSelect = function()
                ViewRecentBans()
            end
        })
        table.insert(options, {
            title = Config.Lang['view_top_performers_title'],
            description = Config.Lang['view_top_performers_desc'],
            icon = 'crown',
            onSelect = function()
                ViewTopPerformers()
            end
        })
    end

    lib.registerContext({
        id = 'insurance_broker_menu',
        title = Config.Lang['insurance_broker_menu_title'],
        options = options
    })

    lib.showContext('insurance_broker_menu')
end

function RequestCustomerForInsurance()
    local coords = GetEntityCoords(cache.ped)
    local closestPlayer

    if Config.TestMode then
        closestPlayer = PlayerId()
    else
        closestPlayer = lib.getClosestPlayer(coords, 3.0, false)
    end

    if not closestPlayer then
        Notify(Config.Lang['no_customers_nearby'], 'error')
        return
    end

    local closestPlayerId = GetPlayerServerId(closestPlayer)
    activeCustomer = closestPlayer
    activeCustomerSource = closestPlayerId
    Framework.TriggerCallback('envi-prescriptions:getBrokerCustomerInsurance', function(insuranceData, customerName)
        if not insuranceData then
            print("[BROKER] Failed to get customer insurance data")
            Notify(Config.Lang['unable_retrieve_insurance_info'], 'error')
            return
        end
        DisplayCustomerInsuranceInfo(insuranceData, customerName)
    end, closestPlayerId)
end

function DisplayCustomerInsuranceInfo(insuranceData, customerName)
    if not insuranceData then
        Notify(Config.Lang['unable_retrieve_insurance_customer'], 'error')
        return
    end

    local options = {
        {
            title = Config.Lang['customer_insurance_info'] .. ': ' .. customerName,
            description = Config.Lang['current_patient_plan'] .. ': ' .. insuranceData.planName,
            icon = 'id-card',
            disabled = true
        }
    }

    if insuranceData.plan ~= 'none' then
        table.insert(options, {
            title = Config.Lang['current_patient_insurance'],
            description = insuranceData.planName,
            metadata = {
                [Config.Lang['monthly_premium']] = '$' .. insuranceData.fee,
                [Config.Lang['discount']] = insuranceData.discount .. '%',
                [Config.Lang['down_payment']] = '$' .. insuranceData.downpayment
            },
            disabled = true
        })
    end

    table.insert(options, {
        title = Config.Lang['select_plan_to_sell'],
        description = Config.Lang['choose_plan_offer'],
        icon = 'clipboard-list',
        disabled = true
    })

    for planId, plan in pairs(Config.InsurancePlans) do
        if planId ~= 'none' and planId ~= insuranceData.plan then
            local commission = math.floor((plan.fee * Config.InsuranceJob.Commission) / 100)

            table.insert(options, {
                title = plan.name .. ' - $' .. plan.fee,
                description = plan.description,
                metadata = {
                    [Config.Lang['discount']] = plan.discount .. '%',
                    [Config.Lang['down_payment']] = '$' .. plan.downpayment,
                    [Config.Lang['commission']] = '$' .. commission
                },
                onSelect = function()
                    OfferInsurancePlan(planId, plan, customerName, commission)
                end
            })
        end
    end

    lib.registerContext({
        id = 'customer_insurance_info',
        title = 'Insurance Plans',
        menu = 'insurance_broker_menu',
        options = options
    })

    lib.showContext('customer_insurance_info')
end

function OfferInsurancePlan(planId, planData, customerName, commission)
    activeSaleData = {
        planId = planId,
        planName = planData.name,
        fee = planData.fee,
        commission = commission,
        customerName = customerName
    }
    TriggerServerEvent('envi-prescriptions:offerInsurancePlan', activeCustomerSource, planId, planData.name, planData
    .fee)
    Notify(string.format(Config.Lang['insurance_offer_sent'], planData.name), 'info')
end

function RequestCustomerForClaimHistory()
    local coords = GetEntityCoords(cache.ped)
    local closestPlayer

    if Config.TestMode then
        closestPlayer = PlayerId()
    else
        closestPlayer = lib.getClosestPlayer(coords, 3.0, false)
    end

    if not closestPlayer then
        Notify(Config.Lang['no_customers_nearby'], 'error')
        return
    end

    local closestPlayerId = GetPlayerServerId(closestPlayer)
    activeCustomer = closestPlayer
    activeCustomerSource = closestPlayerId

    Framework.TriggerCallback('envi-prescriptions:getBrokerInsuranceClaimHistory', function(claimHistory, customerName)
        if not claimHistory then
            Notify(Config.Lang['customer_no_insurance'], 'error')
            return
        end

        DisplayCustomerClaimHistory(claimHistory, customerName)
    end, closestPlayerId)
end

function DisplayCustomerClaimHistory(claims, customerName)
    local options = {
        {
            title = Config.Lang['customer_claim_history'] .. ': ' .. customerName,
            description = 'Review this customer\'s insurance claim history',
            icon = 'file-medical',
            disabled = true
        }
    }

    if #claims == 0 then
        table.insert(options, {
            title = Config.Lang['no_claims_found'],
            description = Config.Lang['no_claims_description'],
            icon = 'times-circle',
            disabled = true
        })
    else
        for _, claim in ipairs(claims) do
            local statusColor = '🟢'
            if claim.status == 'rejected' then
                statusColor = '🔴'
            elseif claim.status == 'pending' then
                statusColor = '🟡'
            end

            local medicationLabel = claim.medication
            if Config.Medications[claim.medication] then
                medicationLabel = Config.Medications[claim.medication].label
            end

            table.insert(options, {
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
    end

    lib.registerContext({
        id = 'customer_claim_history_menu',
        title = 'Customer Insurance Claims',
        menu = 'insurance_broker_menu',
        options = options
    })

    lib.showContext('customer_claim_history_menu')
end

function ViewCommissionHistory()
    Framework.TriggerCallback('envi-prescriptions:getBrokerCommissionHistory', function(history)
        local options = {
            {
                title = '💰 Commission History',
                description = 'Your insurance sales earnings',
                icon = 'money-bill-wave',
                disabled = true
            }
        }

        if #history == 0 then
            table.insert(options, {
                title = 'No Commission History',
                description = 'You haven\'t earned any commissions yet',
                icon = 'times-circle',
                disabled = true
            })
        else
            for _, record in ipairs(history) do
                table.insert(options, {
                    title = record.planName .. ' - $' .. record.commission,
                    description = 'Date: ' .. record.date,
                    metadata = {
                        ['Customer'] = record.customerName,
                        ['Plan'] = record.planName,
                        ['Premium'] = '$' .. record.planFee,
                        ['Commission'] = '$' .. record.commission
                    },
                    disabled = true
                })
            end
        end

        lib.registerContext({
            id = 'broker_commission_history',
            title = 'Commission History',
            menu = 'insurance_broker_menu',
            options = options
        })

        lib.showContext('broker_commission_history')
    end)
end

RegisterNetEvent('envi-prescriptions:notifyInsuranceOffer', function(brokerSource, brokerName, planId, planName, fee)
    local planData = Config.InsurancePlans[planId]
    if not planData then return end

    local benefitsList = ""
    if planData.benefits and #planData.benefits > 0 then
        for _, benefit in ipairs(planData.benefits) do
            benefitsList = benefitsList .. Config.Lang['benefit_bullet_point'] .. benefit .. "\n"
        end
    else
        benefitsList = Config.Lang['benefit_bullet_point'] .. "No additional benefits"
    end

    local medicationsList = ""
    if planData.eligibleMedications and #planData.eligibleMedications > 0 then
        for _, medication in ipairs(planData.eligibleMedications) do
            local medLabel = Config.Medications[medication] and Config.Medications[medication].label or medication
            medicationsList = medicationsList .. Config.Lang['benefit_bullet_point'] .. medLabel .. "\n"
        end
    else
        medicationsList = Config.Lang['benefit_bullet_point'] .. "None specified"
    end

    local content = string.format(
        Config.Lang['insurance_offer_detailed'],
        brokerName,
        planName,
        fee,
        planData.discount,
        planData.downpayment,
        benefitsList,
        medicationsList
    )

    local alert = lib.alertDialog({
        header = Config.Lang['insurance_offer_header'],
        content = content,
        centered = true,
        size = 'lg',
        cancel = true
    })

    if alert == 'confirm' then
        TriggerServerEvent('envi-prescriptions:acceptInsuranceOffer', brokerSource, planId)
    else
        TriggerServerEvent('envi-prescriptions:rejectInsuranceOffer', brokerSource)
        Notify(Config.Lang['insurance_offer_declined'], 'info')
    end
end)

RegisterNetEvent('envi-prescriptions:insuranceSaleSuccessful', function(planName, customerName, commission)
    Notify(string.format(Config.Lang['insurance_sold_success'], planName, customerName, commission), 'success')
    activeSaleData = nil
end)

RegisterNetEvent('envi-prescriptions:insuranceOfferRejected', function()
    Notify(Config.Lang['insurance_offer_rejected'], 'error')
    activeSaleData = nil
end)

function ViewAllInsuranceClaims()
    local options = {
        {
            title = '📊 Insurance Claims Management',
            description = 'Review and search customer insurance claims',
            icon = 'file-medical-alt',
            disabled = true
        },
        {
            title = '👁️ View All Claims',
            description = 'See the most recent insurance claims',
            icon = 'list',
            onSelect = function()
                ViewInsuranceClaimsList(1)
            end
        },
        {
            title = '🔍 Search Claims by Customer',
            description = 'Find claims for a specific customer',
            icon = 'user-search',
            onSelect = function()
                SearchClaimsByCustomer()
            end
        },
        {
            title = '💊 Search Claims by Medication',
            description = 'Find claims for a specific medication',
            icon = 'pills',
            onSelect = function()
                SearchClaimsByMedication()
            end
        },
        {
            title = '📅 Search Claims by Date Range',
            description = 'Find claims within a specific date period',
            icon = 'calendar-alt',
            onSelect = function()
                SearchClaimsByDateRange()
            end
        },
        {
            title = '⚠️ View Rejected Claims',
            description = 'See claims that were rejected by insurance',
            icon = 'exclamation-triangle',
            onSelect = function()
                ViewRejectedClaims()
            end
        }
    }

    lib.registerContext({
        id = 'all_claims_management_menu',
        title = 'Insurance Claims Management',
        menu = 'insurance_broker_menu',
        options = options
    })

    lib.showContext('all_claims_management_menu')
end

function ViewInsuranceClaimsList(page)
    Framework.TriggerCallback('envi-prescriptions:getBossAllInsuranceClaimsPaginated',
        function(claims, totalPages, currentPage)
            local options = {
                {
                    title = string.format('Claims Page %d of %d', currentPage, totalPages),
                    description = string.format('Showing %d results', #claims),
                    icon = 'file-medical-alt',
                    disabled = true
                }
            }

            if #claims == 0 then
                table.insert(options, {
                    title = 'No Claims Found',
                    description = 'There are no insurance claims in the system',
                    icon = 'times-circle',
                    disabled = true
                })
            else
                for _, claim in ipairs(claims) do
                    local statusColor = '🟢'
                    if claim.status == 'rejected' then
                        statusColor = '🔴'
                    elseif claim.status == 'pending' then
                        statusColor = '🟡'
                    end

                    local medicationLabel = claim.medication
                    if Config.Medications[claim.medication] then
                        medicationLabel = Config.Medications[claim.medication].label
                    end

                    table.insert(options, {
                        title = statusColor .. ' ' .. claim.customerName,
                        description = 'Medication: ' ..
                            medicationLabel .. ' | Date: ' .. (claim.formatted_date or "Unknown"),
                        metadata = {
                            ['Original Cost'] = '$' .. claim.cost,
                            ['Covered Amount'] = '$' .. claim.covered_amount,
                            ['Customer Paid'] = '$' .. (claim.cost - claim.covered_amount),
                            ['Status'] = claim.status:gsub("^%l", string.upper)
                        },
                        onSelect = function()
                            ViewClaimDetails(claim)
                        end
                    })
                end
            end

            if totalPages > 1 then
                local navigationOptions = {
                    title = '📄 Page Navigation',
                    description = string.format('Page %d of %d', currentPage, totalPages),
                    icon = 'arrows-alt-h',
                    disabled = true
                }
                table.insert(options, navigationOptions)

                if currentPage > 1 then
                    table.insert(options, {
                        title = '◀️ Previous Page',
                        description = string.format('Go to page %d', currentPage - 1),
                        icon = 'arrow-left',
                        onSelect = function()
                            ViewInsuranceClaimsList(currentPage - 1)
                        end
                    })
                end

                if currentPage < totalPages then
                    table.insert(options, {
                        title = '▶️ Next Page',
                        description = string.format('Go to page %d', currentPage + 1),
                        icon = 'arrow-right',
                        onSelect = function()
                            ViewInsuranceClaimsList(currentPage + 1)
                        end
                    })
                end

                table.insert(options, {
                    title = '↗️ Jump to Page',
                    description = 'Go to a specific page number',
                    icon = 'random',
                    onSelect = function()
                        local input = lib.inputDialog('Jump to Page', {
                            { type = 'number', label = 'Page Number', description = string.format('Enter a page number (1-%d)', totalPages), required = true, min = 1, max = totalPages }
                        })

                        if input and input[1] then
                            local pageNumber = tonumber(input[1])
                            if pageNumber >= 1 and pageNumber <= totalPages then
                                ViewInsuranceClaimsList(pageNumber)
                            else
                                Notify('Invalid page number', 'error')
                            end
                        end
                    end
                })
            end

            lib.registerContext({
                id = 'all_claims_list_menu',
                title = 'All Insurance Claims',
                menu = 'all_claims_management_menu',
                options = options
            })

            lib.showContext('all_claims_list_menu')
        end, page)
end

function ViewClaimDetails(claim)
    local options = {
        {
            title = 'Claim Details',
            description = 'Claim ID: ' .. claim.id,
            icon = 'file-invoice-dollar',
            disabled = true
        },
        {
            title = 'Customer Information',
            description = claim.customerName,
            icon = 'user',
            metadata = {
                ['Customer ID'] = claim.citizenid
            },
            disabled = true
        },
        {
            title = 'Medication Details',
            description = claim.medication,
            icon = 'pills',
            metadata = {
                ['Status'] = claim.status:gsub("^%l", string.upper)
            },
            disabled = true
        },
        {
            title = 'Financial Information',
            description = 'Transaction details',
            icon = 'money-bill-wave',
            metadata = {
                ['Original Cost'] = '$' .. claim.cost,
                ['Covered Amount'] = '$' .. claim.covered_amount,
                ['Customer Paid'] = '$' .. (claim.cost - claim.covered_amount),
                ['Coverage Percentage'] = math.floor((claim.covered_amount / claim.cost) * 100) .. '%'
            },
            disabled = true
        },
        {
            title = 'Date Information',
            description = 'Claim date: ' .. (claim.formatted_date or "Unknown Date"),
            icon = 'calendar-alt',
            disabled = true
        }
    }

    table.insert(options, {
        title = '🔍 Actions',
        description = 'Additional actions for this claim',
        icon = 'cogs',
        disabled = true
    })

    table.insert(options, {
        title = '👤 View Customer\'s Claims',
        description = 'See all claims for ' .. claim.customerName,
        icon = 'user-shield',
        onSelect = function()
            ViewCustomerClaimHistory(claim.citizenid, claim.customerName)
        end
    })

    table.insert(options, {
        title = '💊 View Medication Claims',
        description = 'See all claims for this medication type',
        icon = 'prescription-bottle-medical',
        onSelect = function()
            ViewMedicationClaimHistory(claim.medication)
        end
    })

    table.insert(options, {
        title = '🚫 Ban Customer from Insurance',
        description = 'Prevent this customer from accessing insurance',
        icon = 'user-slash',
        onSelect = function()
            BanCustomerFromClaimView(claim.citizenid, claim.customerName)
        end
    })

    lib.registerContext({
        id = 'claim_details_menu',
        title = 'Claim Details',
        menu = 'all_claims_list_menu',
        options = options
    })

    lib.showContext('claim_details_menu')
end

function SearchClaimsByCustomer()
    local input = lib.inputDialog('Search Customer Claims', {
        { type = 'input', label = 'Customer Name', description = 'Enter full or partial customer name', required = true }
    })

    if input and input[1] and input[1] ~= '' then
        local searchTerm = input[1]

        Framework.TriggerCallback('envi-prescriptions:searchClaimsByCustomer', function(claims)
            DisplaySearchResults(claims, 'Claims for Customer: ' .. searchTerm)
        end, searchTerm)
    end
end

function SearchClaimsByMedication()
    local medicationOptions = {}

    for medicationId, medicationData in pairs(Config.Medications) do
        table.insert(medicationOptions, {
            value = medicationId,
            label = medicationData.label
        })
    end

    local input = lib.inputDialog('Search Claims by Medication', {
        { type = 'select', label = 'Medication', options = medicationOptions, required = true }
    })

    if input and input[1] and input[1] ~= '' then
        local medicationId = input[1]
        local medicationLabel = Config.Medications[medicationId] and Config.Medications[medicationId].label or
            medicationId

        Framework.TriggerCallback('envi-prescriptions:searchClaimsByMedication', function(claims)
            DisplaySearchResults(claims, 'Claims for Medication: ' .. medicationLabel)
        end, medicationId)
    end
end

function SearchClaimsByDateRange()
    local input = lib.inputDialog('Search Claims by Date Range', {
        { type = 'date', label = 'Start Date', required = true },
        { type = 'date', label = 'End Date',   required = true }
    })

    if input and input[1] and input[2] then
        local startDate = input[1]
        local endDate = input[2]

        Framework.TriggerCallback('envi-prescriptions:searchClaimsByDateRange', function(claims)
            DisplaySearchResults(claims, 'Claims from ' .. startDate .. ' to ' .. endDate)
        end, startDate, endDate)
    end
end

function ViewRejectedClaims()
    Framework.TriggerCallback('envi-prescriptions:getRejectedClaims', function(claims)
        DisplaySearchResults(claims, 'Rejected Insurance Claims')
    end)
end

function DisplaySearchResults(claims, title)
    local options = {
        {
            title = title,
            description = 'Found ' .. #claims .. ' results',
            icon = 'search',
            disabled = true
        }
    }

    if #claims == 0 then
        table.insert(options, {
            title = 'No Claims Found',
            description = 'No claims match your search criteria',
            icon = 'times-circle',
            disabled = true
        })
    else
        for _, claim in ipairs(claims) do
            local statusColor = '🟢'
            if claim.status == 'rejected' then
                statusColor = '🔴'
            elseif claim.status == 'pending' then
                statusColor = '🟡'
            end

            local medicationLabel = claim.medication
            if Config.Medications[claim.medication] then
                medicationLabel = Config.Medications[claim.medication].label
            end

            table.insert(options, {
                title = statusColor .. ' ' .. claim.customerName,
                description = 'Medication: ' .. medicationLabel .. ' | Date: ' .. (claim.formatted_date or "Unknown"),
                metadata = {
                    ['Original Cost'] = '$' .. claim.cost,
                    ['Covered Amount'] = '$' .. claim.covered_amount,
                    ['Customer Paid'] = '$' .. (claim.cost - claim.covered_amount),
                    ['Status'] = claim.status:gsub("^%l", string.upper)
                },
                onSelect = function()
                    ViewClaimDetails(claim)
                end
            })
        end
    end

    lib.registerContext({
        id = 'claims_search_results',
        title = 'Search Results',
        menu = 'all_claims_management_menu',
        options = options
    })

    lib.showContext('claims_search_results')
end

function ViewCustomerClaimHistory(citizenid, customerName)
    Framework.TriggerCallback('envi-prescriptions:getBossCustomerClaims', function(claims)
        DisplaySearchResults(claims, 'Claims for ' .. customerName)
    end, citizenid)
end

function ViewMedicationClaimHistory(medication)
    local medicationLabel = Config.Medications[medication] and Config.Medications[medication].label or medication

    Framework.TriggerCallback('envi-prescriptions:searchClaimsByMedication', function(claims)
        DisplaySearchResults(claims, 'Claims for ' .. medicationLabel)
    end, medication)
end

function BanCustomerFromClaimView(citizenid, customerName)
    local input = lib.inputDialog('Ban Customer from Insurance', {
        { type = 'input', label = 'Reason for ban', placeholder = 'Enter reason...', required = true }
    })

    if input and input[1] then
        TriggerServerEvent('envi-prescriptions:toggleCustomerInsuranceBan', citizenid, customerName, input[1], 'ban')
        Notify('Customer has been banned from insurance services', 'success')
        Wait(500)

        -- Return to claim details or search view
        Framework.TriggerCallback('envi-prescriptions:getBossCustomerClaims', function(claims)
            DisplaySearchResults(claims, 'Claims for ' .. customerName)
        end, citizenid)
    end
end

function ManageCustomerInsuranceAccess()
    local input = lib.inputDialog('Search Customer', {
        {
            type = 'input',
            label = 'Customer ID or Name',
            placeholder = 'Enter citizen ID or name...',
            required = true
        }
    })

    if not input or not input[1] then return end

    local searchTerm = input[1]

    SearchCustomers(searchTerm, function(customers, searchTerm)
        DisplayCustomerSearchResults(customers, searchTerm)
    end)
end

function ManageCustomerInsuranceAccessOptions(customer)
    local options = {
        {
            title = '👤 ' .. customer.name,
            description = 'Customer ID: ' .. customer.citizenid,
            icon = 'user',
            disabled = true
        }
    }

    if customer.banned then
        table.insert(options, {
            title = '✅ Unban Customer',
            description = 'Allow customer to access insurance services',
            icon = 'user-check',
            onSelect = function()
                TriggerServerEvent('envi-prescriptions:toggleCustomerInsuranceBan', customer.citizenid, customer.name, '',
                    'unban')
                Notify('Customer insurance access has been restored', 'success')
                Wait(500)
                ManageCustomerInsuranceAccess() -- Return to customer list
            end
        })
    else
        table.insert(options, {
            title = '🚫 Ban Customer',
            description = 'Prevent customer from accessing insurance services',
            icon = 'user-slash',
            onSelect = function()
                local input = lib.inputDialog('Ban Customer from Insurance', {
                    {
                        type = 'input',
                        label = 'Reason for ban',
                        placeholder = 'Enter reason...',
                        required = true
                    }
                })

                if input and input[1] then
                    TriggerServerEvent('envi-prescriptions:toggleCustomerInsuranceBan', customer.citizenid, customer
                        .name, input[1], 'ban')
                    Notify('Customer has been banned from insurance services', 'success')
                    Wait(500)
                    ManageCustomerInsuranceAccess() -- Return to customer list
                end
            end
        })
    end

    table.insert(options, {
        title = '📋 View Customer Claims',
        description = 'Review this customer\'s insurance claim history',
        icon = 'clipboard-list',
        onSelect = function()
            ViewSpecificCustomerClaims(customer.citizenid, customer.name)
        end
    })

    lib.registerContext({
        id = 'insurance_customer_options',
        title = 'Customer Insurance Management',
        menu = 'insurance_customer_search_results',
        options = options
    })

    lib.showContext('insurance_customer_options')
end

function ViewSpecificCustomerClaims(citizenid, customerName)
    if not citizenid or not customerName then
        Notify(Config.Lang['invalid_customer_info'] or 'Invalid customer information', 'error')
        return
    end

    Framework.TriggerCallback('envi-prescriptions:getBossCustomerClaims', function(claims)
        if not claims then
            Notify(Config.Lang['failed_to_get_claims'] or 'Failed to retrieve customer claims', 'error')
            return
        end

        local options = {
            {
                title = '📋 Claims for ' .. customerName,
                description = 'Customer ID: ' .. citizenid,
                icon = 'file-medical',
                disabled = true
            }
        }

        if #claims == 0 then
            table.insert(options, {
                title = 'No Claims Found',
                description = 'This customer has no insurance claims',
                icon = 'times-circle',
                disabled = true
            })
        else
            for _, claim in ipairs(claims) do
                local statusColor = '🟢'
                if claim.status == 'rejected' then
                    statusColor = '🔴'
                elseif claim.status == 'pending' then
                    statusColor = '🟡'
                end

                local medicationLabel = claim.medication
                if Config.Medications[claim.medication] then
                    medicationLabel = Config.Medications[claim.medication].label
                end

                table.insert(options, {
                    title = statusColor .. ' ' .. medicationLabel,
                    description = 'Date: ' .. (claim.formatted_date or "Unknown Date"),
                    metadata = {
                        ['Original Cost'] = '$' .. claim.cost,
                        ['Covered Amount'] = '$' .. claim.covered_amount,
                        ['Customer Paid'] = '$' .. (claim.cost - claim.covered_amount),
                        ['Status'] = claim.status:gsub("^%l", string.upper)
                    },
                    onSelect = function()
                        UpdateClaimStatus(claim.id, claim.status, customerName)
                    end
                })
            end
        end

        lib.registerContext({
            id = 'specific_customer_claims',
            title = 'Customer Claims',
            menu = 'insurance_customer_options',
            options = options
        })

        lib.showContext('specific_customer_claims')
    end, citizenid)
end

function SearchCustomers(searchTerm, callbackHandler)
    if not searchTerm or searchTerm == '' then
        Notify(Config.Lang['invalid_search_term'] or 'Please enter a valid search term', 'error')
        return
    end

    Framework.TriggerCallback('envi-prescriptions:searchInsuranceCustomers', function(customers)
        if not customers then
            Notify(Config.Lang['search_failed'] or 'Search failed to return results', 'error')
            return
        end

        callbackHandler(customers, searchTerm)
    end, searchTerm)
end

function DisplayCustomerSearchResults(customers, searchTerm)
    if not customers then
        customers = {}
    end

    local options = {
        {
            title = '🔍 Customer Search Results',
            description = 'Search term: ' .. searchTerm,
            icon = 'search',
            disabled = true
        }
    }

    if #customers == 0 then
        table.insert(options, {
            title = 'No Customers Found',
            description = 'Try a different search term',
            icon = 'times-circle',
            disabled = true
        })

        -- Add a back button to search again
        table.insert(options, {
            title = '🔄 Search Again',
            description = 'Try another search term',
            icon = 'search',
            onSelect = function()
                ManageCustomerInsuranceAccess()
            end
        })
    else
        for _, customer in ipairs(customers) do
            local statusIcon = '🟢'
            if customer.banned then
                statusIcon = '🔴'
            end

            table.insert(options, {
                title = statusIcon .. ' ' .. customer.name,
                description = 'Customer ID: ' .. customer.citizenid,
                metadata = {
                    ['Current Plan'] = customer.planName or 'None',
                    ['Status'] = customer.banned and 'Banned' or 'Active',
                    ['Ban Reason'] = customer.banReason or 'N/A'
                },
                onSelect = function()
                    ManageCustomerInsuranceAccessOptions(customer)
                end
            })
        end
    end

    lib.registerContext({
        id = 'insurance_customer_search_results',
        title = 'Customer Search Results',
        menu = 'insurance_broker_menu',
        options = options
    })

    lib.showContext('insurance_customer_search_results')
end

function ViewRecentBans()
    Framework.TriggerCallback('envi-prescriptions:getRecentBans', function(bans)
        if not bans then
            Notify(Config.Lang['search_failed'] or 'Failed to retrieve ban information', 'error')
            return
        end

        local options = {
            {
                title = '🚫 Recent Insurance Bans',
                description = 'List of recently banned customers',
                icon = 'user-slash',
                disabled = true
            }
        }

        if #bans == 0 then
            table.insert(options, {
                title = 'No Recent Bans',
                description = 'No customers have been banned recently',
                icon = 'times-circle',
                disabled = true
            })
        else
            for _, ban in ipairs(bans) do
                table.insert(options, {
                    title = '🔴 ' .. ban.name,
                    description = 'Customer ID: ' .. ban.citizenid,
                    metadata = {
                        ['Customer ID'] = ban.citizenid,
                        ['Reason'] = ban.reason or 'No reason provided',
                        ['Banned By'] = ban.bannedBy or 'Unknown'
                    },
                    onSelect = function()
                        ManageCustomerBan(ban)
                    end
                })
            end
        end

        lib.registerContext({
            id = 'recent_med_insurance_bans',
            title = 'Recent Insurance Bans',
            menu = 'insurance_broker_menu',
            options = options
        })

        lib.showContext('recent_med_insurance_bans')
    end)
end

function CanAccessBrokerMenu()
    if Framework.Player.Job.Name ~= Config.InsuranceJob.JobName or Framework.Player.Job.Grade.Level < Config.InsuranceJob.MinimumGrade then
        Notify(Config.Lang['insufficient_permissions'] or 'You are not authorized to access the insurance broker menu',
            'error')
        return false
    end

    return true
end

exports('OpenInsuranceBrokerMenu', OpenBrokerMenu)

if Config.TestMode then
    RegisterCommand('testbroker', function()
        OpenBrokerMenu()
    end, false)
end

function ManageCustomerBan(ban)
    local options = {
        {
            title = '🚫 Ban Information',
            description = ban.name .. ' (ID: ' .. ban.citizenid .. ')',
            icon = 'user-slash',
            disabled = true
        },
        {
            title = '❓ Ban Reason',
            description = ban.reason or 'No reason provided',
            icon = 'info-circle',
            disabled = true
        },
        {
            title = '👤 Banned By',
            description = ban.bannedBy or 'Unknown',
            icon = 'user-shield',
            disabled = true
        },
        {
            title = '✅ Unban Customer',
            description = 'Allow customer to access insurance services',
            icon = 'user-check',
            onSelect = function()
                TriggerServerEvent('envi-prescriptions:toggleCustomerInsuranceBan', ban.citizenid, ban.name, '', 'unban')
                Notify('Customer insurance access has been restored', 'success')
                Wait(500)
                ViewRecentBans()
            end
        },
        {
            title = '📋 View Customer Claims',
            description = 'Review this customer\'s insurance claim history',
            icon = 'clipboard-list',
            onSelect = function()
                ViewSpecificCustomerClaims(ban.citizenid, ban.name)
            end
        }
    }

    lib.registerContext({
        id = 'banned_customer_management',
        title = 'Banned Customer Management',
        menu = 'recent_med_insurance_bans',
        options = options
    })

    lib.showContext('banned_customer_management')
end

function ViewAllClaimsPaginated(page)
    Framework.TriggerCallback('envi-prescriptions:getBossAllInsuranceClaimsPaginated',
        function(claims, totalPages, currentPage)
            local options = {
                {
                    title = '📋 All Insurance Claims',
                    description = 'Page ' .. currentPage .. ' of ' .. totalPages,
                    icon = 'clipboard-list',
                    disabled = true
                }
            }

            if #claims == 0 then
                table.insert(options, {
                    title = 'No Claims Found',
                    description = 'There are no insurance claims on record',
                    icon = 'times-circle',
                    disabled = true
                })
            else
                for _, claim in ipairs(claims) do
                    local statusColor = '🟢'
                    if claim.status == 'rejected' then
                        statusColor = '🔴'
                    elseif claim.status == 'pending' then
                        statusColor = '🟡'
                    end

                    local medicationLabel = claim.medication
                    if Config.Medications[claim.medication] then
                        medicationLabel = Config.Medications[claim.medication].label
                    end

                    table.insert(options, {
                        title = statusColor .. ' ' .. claim.customerName,
                        description = 'Medication: ' ..
                            medicationLabel .. ' | Date: ' .. (claim.formatted_date or "Unknown"),
                        metadata = {
                            ['Original Cost'] = '$' .. claim.cost,
                            ['Covered Amount'] = '$' .. claim.covered_amount,
                            ['Customer Paid'] = '$' .. (claim.cost - claim.covered_amount),
                            ['Status'] = claim.status:gsub("^%l", string.upper)
                        },
                        onSelect = function()
                            ViewClaimDetails(claim)
                        end
                    })
                end
            end

            table.insert(options, {
                title = '📄 Page Navigation',
                description = 'Navigate between pages of claims',
                icon = 'file-medical-alt',
                disabled = true
            })

            if currentPage > 1 then
                table.insert(options, {
                    title = '⬅️ Previous Page',
                    description = 'Go to page ' .. (currentPage - 1),
                    icon = 'arrow-left',
                    onSelect = function()
                        ViewAllClaimsPaginated(currentPage - 1)
                    end
                })
            end

            if currentPage < totalPages then
                table.insert(options, {
                    title = '➡️ Next Page',
                    description = 'Go to page ' .. (currentPage + 1),
                    icon = 'arrow-right',
                    onSelect = function()
                        ViewAllClaimsPaginated(currentPage + 1)
                    end
                })
            end

            if totalPages > 2 then
                table.insert(options, {
                    title = '🔢 Jump to Page',
                    description = 'Go to a specific page',
                    icon = 'exchange-alt',
                    onSelect = function()
                        local input = lib.inputDialog('Jump to Page', {
                            { type = 'number', label = 'Page Number', description = 'Enter a page number (1-' .. totalPages .. ')', required = true, min = 1, max = totalPages }
                        })

                        if input and input[1] and tonumber(input[1]) then
                            local pageNumber = math.floor(tonumber(input[1]))
                            if pageNumber >= 1 and pageNumber <= totalPages then
                                ViewAllClaimsPaginated(pageNumber)
                            else
                                Notify('Invalid page number', 'error')
                            end
                        end
                    end
                })
            end

            lib.registerContext({
                id = 'all_claims_list_menu',
                title = 'All Insurance Claims',
                menu = 'insurance_broker_menu',
                options = options
            })

            lib.showContext('all_claims_list_menu')
        end, page)
end

function ViewTopPerformers()
    local options = {
        {
            title = '🏆 View Top Performing Brokers',
            description = 'Track broker performance based on commission',
            icon = 'trophy',
            disabled = true
        },
        {
            title = '📆 All Time',
            description = 'View top performers across all time',
            icon = 'calendar',
            onSelect = function()
                GetTopPerformersByPeriod('all')
            end
        },
        {
            title = '📅 Today',
            description = 'View top performers for today only',
            icon = 'calendar-day',
            onSelect = function()
                GetTopPerformersByPeriod('today')
            end
        },
        {
            title = '📅 This Week',
            description = 'View top performers for the past 7 days',
            icon = 'calendar-week',
            onSelect = function()
                GetTopPerformersByPeriod('week')
            end
        },
        {
            title = '📅 This Month',
            description = 'View top performers for the past 30 days',
            icon = 'calendar-alt',
            onSelect = function()
                GetTopPerformersByPeriod('month')
            end
        }
    }

    lib.registerContext({
        id = 'top_performers_period_menu',
        title = 'Top Performing Brokers',
        menu = 'insurance_broker_menu',
        options = options
    })

    lib.showContext('top_performers_period_menu')
end

function GetTopPerformersByPeriod(timePeriod)
    Framework.TriggerCallback('envi-prescriptions:getTopPerformingBrokers', function(brokers)
        if not brokers then
            Notify('Failed to retrieve top performer information', 'error')
            return
        end

        local periodText = "All Time"
        if timePeriod == 'today' then
            periodText = "Today"
        elseif timePeriod == 'week' then
            periodText = "This Week"
        elseif timePeriod == 'month' then
            periodText = "This Month"
        end

        local options = {
            {
                title = '🏆 Top Performers: ' .. periodText,
                description = 'Rankings based on commission earnings',
                icon = 'trophy',
                disabled = true
            }
        }

        if #brokers == 0 then
            table.insert(options, {
                title = 'No Sales Data Found',
                description = 'No broker sales data for this period',
                icon = 'times-circle',
                disabled = true
            })
        else
            local rank = 1

            for _, broker in ipairs(brokers) do
                local rankEmoji = '🔹'
                if rank == 1 then
                    rankEmoji = '🥇'
                elseif rank == 2 then
                    rankEmoji = '🥈'
                elseif rank == 3 then
                    rankEmoji = '🥉'
                end

                table.insert(options, {
                    title = rankEmoji .. ' ' .. broker.broker_name,
                    description = string.format('Total Commission: $%s', broker.total_commission),
                    metadata = {
                        ['Total Sales'] = broker.total_sales,
                        ['Total Commission'] = '$' .. broker.total_commission,
                        ['Highest Commission'] = '$' .. broker.highest_commission,
                        ['Total Premiums'] = '$' .. broker.total_premiums,
                        ['Last Sale'] = broker.last_sale or 'Unknown'
                    },
                    disabled = true
                })

                rank = rank + 1
            end
        end

        table.insert(options, {
            title = '⬅️ Change Time Period',
            description = 'Select a different time period to view',
            icon = 'arrow-left',
            onSelect = function()
                ViewTopPerformers()
            end
        })

        lib.registerContext({
            id = 'top_performers_results',
            title = 'Top Performers: ' .. periodText,
            menu = 'top_performers_period_menu',
            options = options
        })

        lib.showContext('top_performers_results')
    end, timePeriod)
end
