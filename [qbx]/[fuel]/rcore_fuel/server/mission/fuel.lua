PlayerCurrentlyInMission = {}
CompanyInMissions = {}

RegisterNetEvent("rcore_fuel:OwnerSelectedForRefuel", function(id, name, companyIdentifier, fuelToTank, fuelType, moneyType)
    local source = source
    local modal = GetCompanyModal(companyIdentifier)
    if modal.DoesExists() then
        local moneyCost = Config.CompanyGasPrices[fuelType].current * fuelToTank
        local compData = Config.ShopList[companyIdentifier]
        local society = ((compData.SocietyName or compData.Job) or "none")
        if modal.IsSourceOwner(source) then
            if not CanPlayerPayWithMoneyType(moneyType, source, moneyCost, society, companyIdentifier) then
                TriggerClientEvent("rcore_fuel:showHelpNotification", source, _U("lacking_funds", CommaValue(moneyCost)), false, false, 10000)
                return
            end

            TriggerClientEvent("rcore_fuel:showFuelRequest", id, GetPlayerCharacterName(source), companyIdentifier)

            PlayerCurrentlyInMission[id] = {
                companyIdentifier = companyIdentifier,
                society = society,
                fuelToTank = fuelToTank,
                fuelType = fuelType,
                moneyCost = moneyCost,
                moneyType = moneyType,
                initSource = source,
                targetSource = id,
            }
        end
    end
end)

function RefundCompanyMoney(source)
    local data = PlayerCurrentlyInMission[source]
    if data then
        local modal = GetCompanyModal(data.companyIdentifier)
        if modal.DoesExists() then
            local compData = Config.ShopList[data.companyIdentifier]
            local society = ((compData.SocietyName or compData.Job) or "none")

            if modal.IsSocietyEnabled() then
                GiveMoneyToSociety(data.moneyCost, society)
            else
                modal.AddCompanyStockMoney(data.moneyCost)
            end

            if data.fuelCompleted then
                modal.RemoveAmountForFuelCapacity(data.fuelType, data.fuelToTank)
            end

            TriggerClientEvent("rcore_fuel:ShowNotification", data.initSource, _U("money_refunded", CommaValue(RoundDecimalPlace(data.moneyCost, 2))))
        end

        WipeDataForMissionSource(source)

        Config.ShopList[data.companyIdentifier].isMissionRunning = false
        UpdateConfigForClient(data.initSource, data.companyIdentifier)

        CompanyInMissions[data.companyIdentifier] = nil
        PlayerCurrentlyInMission[source] = nil
    end
end

function PlayerFinishedMissionResetVariables(source)
    local data = PlayerCurrentlyInMission[source]
    if data then
        WipeDataForMissionSource(source)

        Config.ShopList[data.companyIdentifier].isMissionRunning = false
        UpdateConfigForClient(data.initSource, data.companyIdentifier)

        CompanyInMissions[data.companyIdentifier] = nil
        PlayerCurrentlyInMission[source] = nil
    end
end

RegisterNetEvent("rcore_fuel:forceCancerMission", function(shopIdentifier)
    local modal = GetCompanyModal(shopIdentifier)
    if modal.DoesExists() then
        if modal.IsSourceOwner(source) then
            local data = CompanyInMissions[shopIdentifier]
            if data then
                RefundCompanyMoney(data.targetSource)
                TriggerClientEvent("rcore_fuel:cancelMissionForPlayer", data.targetSource)
            end
        end
    end
end)

RegisterNetEvent("rcore_fuel:playerCancelMission", function()
    local source = source
    RefundCompanyMoney(source)
end)

RegisterNetEvent("rcore_fuel:missionEndedForPlayer", function()
    local source = source
    PlayerFinishedMissionResetVariables(source)
end)

RegisterNetEvent("rcore_fuel:startFinalTankerSound", function(status, identifier)
    local source = source
    if PlayerCurrentlyInMission[source] then
        TriggerClientEvent("rcore_fuel:startFinalTankerSound", -1, status, identifier, PlayerCurrentlyInMission[source])
    end
end)

RegisterNetEvent("rcore_fuel:playerRefusedMission", function(companyIdentifier)
    local source = source
    local data = PlayerCurrentlyInMission[source]
    if data then
        CompanyInMissions[data.companyIdentifier] = nil
        PlayerCurrentlyInMission[source] = nil
    end
end)

RegisterNetEvent("rcore_fuel:acceptedRefuelMission", function(companyIdentifier)
    local source = source
    local data = PlayerCurrentlyInMission[source]
    if data then
        if not PayWithType(data.moneyType, data.initSource, data.moneyCost, data.society, companyIdentifier) then
            PlayerCurrentlyInMission[source] = nil
            return
        end

        CompanyInMissions[data.companyIdentifier] = {
            targetSource = data.targetSource,
        }

        Config.ShopList[companyIdentifier].isMissionRunning = true
        UpdateConfigForClient(data.initSource, data.companyIdentifier)
        TriggerClientEvent("rcore_fuel:startFuelMission", source, companyIdentifier)
    end
end)

RegisterNetEvent("rcore_fuel:BuyFuelStock", function(shopIdentifier, fuelType, liters, cashType)
    local source = source
    local company = GetCompanyModal(shopIdentifier)

    if company.DoesExists() then
        local moneyCost = Config.CompanyGasPrices[fuelType].current * liters
        local compData = Config.ShopList[shopIdentifier]
        local society = ((compData.SocietyName or compData.Job) or "none")
        if not PayWithType(cashType, source, moneyCost, society, shopIdentifier) then
            TriggerClientEvent("rcore_fuel:showHelpNotification", source, _U("lacking_funds", CommaValue(moneyCost)), false, false, 10000)
            return
        end
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, _U("fuel_bought_company"), false, false, 10000)
        company.AddAmountForFuelCapacity(fuelType, liters)
        company.Save()
        UpdateConfigForClient(-1, shopIdentifier)
    end
end)

RegisterNetEvent("rcore_fuel:finishTheMission", function()
    local source = source
    if PlayerCurrentlyInMission[source] then
        local data = PlayerCurrentlyInMission[source]
        local company = GetCompanyModal(data.companyIdentifier)

        if company.DoesExists() then
            PlayerCurrentlyInMission[source].fuelCompleted = true
            company.AddAmountForFuelCapacity(data.fuelType, data.fuelToTank)
            company.Save()
            UpdateConfigForClient(-1, data.companyIdentifier)
        end
    end
end)

