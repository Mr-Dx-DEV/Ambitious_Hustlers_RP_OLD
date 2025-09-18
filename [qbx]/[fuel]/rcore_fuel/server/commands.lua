function CommandSetGasPrice(companyName, gasType, newPrice)
    local modal = GetCompanyModal(companyName)
    if modal.DoesExists() then
        if newPrice then
            -- the function doesnt exists to check if fuel type exists
            -- this will do for now
            if modal.GetPriceOfFuelType(gasType) then
                modal.SetPriceOfFuelType(gasType, newPrice)
                modal.Save()
                print("New price has been set!")
            else
                print("this gasType", gasType, "doesnt exists!")
            end
        else
            print("Error! The price is not number!")
        end
    else
        print("This company:", args[1], "doesnt exists!")
    end
end

RegisterCommand("SetAllGasPrice", function(source, args)
    if source == 0 then
        if args[1] ~= nil and args[2] ~= nil then
            for k, v in pairs(Config.ShopList) do
                CommandSetGasPrice(k, tonumber(args[1]), tonumber(args[2]))
            end

            print("SetAllGasPrice command is finished")
            UpdateConfigForClient(-1)
        else
            print("Use command: SetAllGasPrice [GasType (number)] [Price]")
            print("Example: SetAllGasPrice 1 55")
            Dump(FuelType)
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

RegisterCommand("SetGasPrice", function(source, args)
    if source == 0 then
        if args[1] ~= nil and args[2] ~= nil and args[3] ~= nil then
            local companyName = args[1]
            CommandSetGasPrice(companyName, tonumber(args[2]), tonumber(args[3]))
            UpdateConfigForClient(-1, companyName)
        else
            print("Use command: SetGasPrice [Company name] [GasType (number)] [Price]")
            print("Example: SetGasPrice fuel_pump24 1 55")
            Dump(FuelType)
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

function CommandSetFuelStationPrice(companyName, newPrice)
    local modal = GetCompanyModal(companyName)
    if modal.DoesExists() then
        if newPrice then
            modal.SetCompanyPrice(newPrice)
            modal.Save()
            print("New price has been set!")
        else
            print("Error! The price is not number!")
        end
    else
        print("This company:", companyName, "doesnt exists!")
    end
end

RegisterCommand("SetFuelStationPrice", function(source, args)
    if source == 0 then
        if args[1] ~= nil and args[2] ~= nil then
            local companyName = args[1]
            CommandSetFuelStationPrice(companyName, tonumber(args[2]))
            UpdateConfigForClient(-1, companyName)
        else
            print("Use command: SetFuelStationPrice [Company name] [Price]")
            print("Example: SetFuelStationPrice fuel_pump24 620420")
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

RegisterCommand("SetAllFuelStationPrice", function(source, args)
    if source == 0 then
        if args[1] ~= nil then
            local newPrice = tonumber(args[1])
            if newPrice then
                for k, v in pairs(Config.ShopList) do
                    CommandSetFuelStationPrice(k, newPrice)
                end
            end

            print("Finished setting!")
            UpdateConfigForClient(-1)
        else
            print("Use command: SetAllFuelStationPrice [Price]")
            print("Example: SetAllFuelStationPrice 620420")
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

RegisterCommand("RandomizeFuelPrice", function(source, args)
    if source == 0 then
        if args[1] ~= nil and args[2] then
            local min = tonumber(args[1])
            local max = tonumber(args[2])
            if min and max then
                for k, v in pairs(Config.ShopList) do
                    local modal = GetCompanyModal(k)
                    if modal.DoesExists() and modal.IsForSale() then
                        for _, fuelType in pairs(modal.GetAllFuelTypes()) do
                            modal.SetPriceOfFuelType(fuelType, math.ceil(Random(min, max)))
                        end
                    end
                end
                print("This command will randomize the fuel until the next restart only, when that happens it will be back to the prices in config.lua!")
                print("All fuel prices has been randomized!")
                UpdateConfigForClient(-1)
            else
                print("Use command: RandomizeFuelPrice minNumber maxNumber")
                print("The arguments must be a number only")
                print("Example: RandomizeFuelPrice 50 100")
            end
        else
            print("Use command: RandomizeFuelPrice minNumber maxNumber")
            print("Example: RandomizeFuelPrice 50 100")
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

function CommandRefillStation(companyName)
    local modal = GetCompanyModal(companyName)
    if modal.DoesExists() then
        for _, fuelType in pairs(modal.GetAllFuelTypes()) do
            modal.SetCurrentFuelCapacity(fuelType, modal.GetMaximumFuelCapacity(fuelType))
        end

        modal.Save()
        modal.RefreshData()
        print("Company stock has been refilled: ", companyName)
    else
        print("This company:", companyName, "doesnt exists!")
    end
end

RegisterCommand("RefillStation", function(source, args)
    if source == 0 then
        if args[1] ~= nil then
            local companyName = args[1]
            CommandRefillStation(companyName)
            UpdateConfigForClient(-1, companyName)
        else
            print("Use command: RefillStation [Company name]")
            print("Example: RefillStation fuel_pump24")
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

RegisterCommand("RefillAllStation", function(source)
    if source == 0 then
        print("Starting refilling all stations fuel")
        for k, v in pairs(Config.ShopList) do
            CommandRefillStation(k)
        end

        print("Done with refilling!")
        UpdateConfigForClient(-1)
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)

RegisterCommand("EvictGasStationOwner", function(source, args)
    if source == 0 then
        if args[1] ~= nil then
            local companyName = args[1]
            local modal = GetCompanyModal(companyName)
            if modal.DoesExists() then
                modal.SetOwnerIdentifier("none")
                modal.SetForSale(true)
                modal.SetCompanyPrice(999999)
                modal.SetForEmployeeOnlyStatus(false)
                modal.SetOpenStatus(true)

                modal.Save()
                modal.RefreshData()
                print("The company ", companyName, "owner was evicted + set on sale")
            else
                print("This company:", companyName, "doesnt exists!")
            end
        else
            print("Use command: EvictGasStationOwner [Company name]")
            print("Example: EvictGasStationOwner fuel_pump24")
        end
    else
        print("This command works only in server console, it wont work in game!")
        TriggerClientEvent("rcore_fuel:showHelpNotification", source, "This command works only in server console, it wont work in game!", false, false, 10000)
    end
end)