local randomized = false

function Random(min, max)
    return min + math.random() * (max - min)
end

function RandomizeCompanyPriceFuel(skipEvent)
    randomized = true
    for k, v in pairs(Config.CompanyGasPrices) do
        v.current = Random(v.min, v.max)
    end

    if not skipEvent then
        TriggerClientEvent("rcore_fuel:syncCompanyGasPrice", -1, Config.CompanyGasPrices)
    end
end

CreateThread(function()
    RandomizeCompanyPriceFuel()
    while true do
        Wait(1000 * 60 * 60)
        RandomizeCompanyPriceFuel()
    end
end)

RegisterNetEvent("rcore_fuel:fetchCompanyGasPrice", function()
    if not randomized then
        RandomizeCompanyPriceFuel(true)
    end
    TriggerClientEvent("rcore_fuel:syncCompanyGasPrice", source, Config.CompanyGasPrices)
end)

RegisterNetEvent("rcore_fuel:payForFuel", function(type)
    local source = source
    local playerModal = SharedObject.GetPlayerFromId(source)
    local shopIdentifier = cachedShopIdentifier[source]

    local shopData = Config.ShopList[shopIdentifier]
    if playerCachedCost[source] then
        local cost = math.floor(playerCachedCost[source])
        if type == "cash" then
            playerModal.removeMoney(cost)
        end

        if type == "bank" then
            playerModal.removeAccountMoney("bank", cost)
        end

        if shopData.EnableSociety then
            if Config.EnableTax then
                GiveMoneyToSociety(cost * (1.0 - Config.TaxPercentage), shopData.SocietyName or shopData.Job)
            else
                GiveMoneyToSociety(cost, shopData.SocietyName or shopData.Job)
            end
        end

        local shopModal = GetCompanyModal(shopIdentifier)
        if shopModal then
            if Config.EnableTax then
                shopModal.AddCompanyStockMoney(cost * (1.0 - Config.TaxPercentage), shopData.Job)
            else
                shopModal.AddCompanyStockMoney(cost, shopData.Job)
            end
            shopModal.Save()
        end

        if Config.EnableTax then
            GiveMoneyToSociety(cost * Config.TaxPercentage, Config.TaxSociety)
        end

        WipeFuelingPlayerVariables(source)
    end
end)