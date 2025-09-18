LoadedAllShopData = false

MySQL.ready(function()
    MySQL.Sync.execute([[
        CREATE TABLE IF NOT EXISTS `rcore_fuelshop` (
            `id` INT(11) NOT NULL AUTO_INCREMENT ,
            `shop_identifier` TEXT NOT NULL ,
            `owner_identifier` TEXT NOT NULL ,
            `data` TEXT NOT NULL ,
        PRIMARY KEY (`id`))
    ]], {})

    local convert_shop_owner = {}
    for k, v in pairs(MySQL.Sync.fetchAll("SELECT * FROM `rcore_fuelshop`", { })) do
        local identifier = v.shop_identifier
        convert_shop_owner[identifier] = v
    end

    for k, v in pairs(Config.ShopList) do
        local gasPricesData = deepCopy(v.gasPrices)
        v.gasPrices = {}
        for fuelType, price in pairs(gasPricesData) do
            v.gasPrices[fuelType] = math.floor(price)
        end

        v.defaultPrice = v.price
        v.defaultGasPrices = deepCopy(v.gasPrices)

        local data = convert_shop_owner[k]
        local company = GetCompanyModal(k)
        if convert_shop_owner[k] then
            local shopData = json.decode(data.data)
            shopData.owner_identifier = data.owner_identifier
            company.Load(shopData)
            if not company.IsBuyingCompanyEnabled() then
                local fuelPriceDifferences = false
                local fuelList = company.GetAllFuelTypes()
                for k, fuelType in pairs(fuelList) do
                    if shopData[tostring(fuelType)] ~= v.gasPrices[fuelType] then
                        fuelPriceDifferences = true
                    end
                end

                if fuelPriceDifferences then
                    company.Save("force")
                end
            end
        else
            company.Save(true)
        end
    end

    LoadedAllShopData = true
    UpdateConfigForClient(-1)
end)