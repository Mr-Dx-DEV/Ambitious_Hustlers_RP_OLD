local keysToLoad = {
    "for_sale", "price", "open", "owner_identifier",
    "gasPrices", "capacity", "fuel_only_employee",
    "companyMoney", "isMissionRunning",
}

local function getShopData(shopData)
    local result = {}
    for _, keyName in pairs(keysToLoad) do
        result[keyName] = shopData[keyName]
    end
    return result
end

function UpdateConfigForClient(source, identifier)
    if LoadedAllShopData then
        local updatedDataForClient = {}

        if identifier then
            local shopData = Config.ShopList[identifier]
            updatedDataForClient[identifier] = getShopData(shopData)
        else
            for shopIdentifier, shopData in pairs(Config.ShopList) do
                updatedDataForClient[shopIdentifier] = getShopData(shopData)
            end
        end

        TriggerClientEvent("rcore_fuel:updateConfig", source, updatedDataForClient)
    end
end

RegisterNetEvent("rcore_fuel:requestConfigChanges", function()
    local source = source
    UpdateConfigForClient(source)
end)

RegisterNetEvent("rcore_fuel:requestPlayerIdentifier", function()
    local source = source
    local player = SharedObject.GetPlayerFromId(source)
    if player then
        TriggerClientEvent("rcore_fuel:requestPlayerIdentifier", source, player.identifier)
    end
end)

RegisterCommand("fuelversion", function(source, args, raw)
    print("===============rcore_fuel===============")
    print(string.format("^7version: ^3%s", GetResourceMetadata(GetCurrentResourceName(), "version")))
    print(" ")
    print(string.format("^Debug: ^3%s", Config.Debug))
    print("===============rcore_fuel===============")
end)