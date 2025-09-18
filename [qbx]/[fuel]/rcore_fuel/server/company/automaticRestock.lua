function RestockAllFuelStations()
    for k, v in pairs(Config.ShopList) do
        local modal = GetCompanyModal(k)
        if modal.IsBuyingCompanyEnabled() and modal.IsOwned() then
            local isSocietyPaying = false
            local moneyToPay = 0
            for fuelType, maxCapacity in pairs(v.maxCapacity) do
                if modal.IsTankerOutOfGas(fuelType) then
                    isSocietyPaying = true
                    modal.SetCurrentFuelCapacity(fuelType, maxCapacity)
                    moneyToPay = moneyToPay + (Config.CompanyGasPrices[fuelType].current * maxCapacity)
                end
            end

            if isSocietyPaying then
                local societyMoney = modal.GetCompanyStockMoney()
                if modal.IsSocietyEnabled() then
                    societyMoney = GetMoneyFromSociety(v.Job)
                end

                if societyMoney > 0 then
                    moneyToPay = moneyToPay + (moneyToPay * Config.AutomaticRestockTax)
                    if modal.IsSocietyEnabled() then
                        RemoveMoneyFromSociety(moneyToPay, v.SocietyName or v.Job)
                    end
                    modal.RemoveCompanyStockMoney(moneyToPay)
                else
                    modal.SetOwnerIdentifier("none")
                    modal.SetForSale(true)
                    modal.SetCompanyPrice(v.defaultPrice)
                    modal.SetForEmployeeOnlyStatus(false)
                    modal.SetOpenStatus(true)

                    for fuelType, maxCapacity in pairs(v.maxCapacity) do
                        modal.SetCurrentFuelCapacity(fuelType, maxCapacity)
                    end

                    for fuelType, price in pairs(v.defaultGasPrices) do
                        modal.SetPriceOfFuelType(fuelType, price)
                    end

                    societyMoney = societyMoney * -1
                    GiveMoneyToSociety(societyMoney + 1, v.SocietyName or v.Job)
                    modal.SetCompanyStockMoney(1)
                end

                modal.Save()
            end
        else
            for fuelType, maxCapacity in pairs(v.maxCapacity) do
                modal.SetCurrentFuelCapacity(fuelType, maxCapacity)
            end
            modal.Save()
        end
    end

    UpdateConfigForClient(-1)
end

RegisterCommand("forcerestockfuel", function(source)
    if source == 0 then
        RestockAllFuelStations()
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

-- everyday midnight
AddHourEvent(0, function()
    RestockAllFuelStations()
end)