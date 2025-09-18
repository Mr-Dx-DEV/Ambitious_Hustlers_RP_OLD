RegisterNetEvent("rcore_fuel:setFuelPrice", function(identifier, price, fuelType)
    local source = source
    local modal = GetCompanyModal(identifier)
    local playerPos = GetEntityCoords(GetPlayerPed(source))

    if not (price >= 0 and price <= 2147483647) then
        print("Player", source, "Is trying to exploit the fuel price by setting it to nosense value: ", price)
        return
    end

    if modal.DoesExists() then
        if modal.IsSourceOwner(source) then
            local maximumPrice = Config.LockedFuelPrice[fuelType]
            if maximumPrice then
                if maximumPrice < price then
                    TriggerClientEvent("rcore_fuel:showHelpNotification", source, _U("maximum_fuel_price", CommaValue(maximumPrice)), false, false, 10000)
                    return
                end
            end

            modal.SetPriceOfFuelType(fuelType, math.floor(price))
            modal.Save()
            UpdateConfigForClient(-1, identifier)

            for k, v in pairs(GetPlayers()) do
                k = type(v) == "string" and tonumber(v) or v
                if #(playerPos - GetEntityCoords(GetPlayerPed(k))) < 50 then
                    TriggerClientEvent("rcore_fuel:forceRefreshScaleform", k)
                end
            end
        end
    end
end)