CreateThread(function()
    if not Config.MaximumOwnedCompanyPerPlayer then
        Config.MaximumOwnedCompanyPerPlayer = 99999
    end

    -- not gonna bother coding the check for -1 everywhere lmao
    if Config.MaximumOwnedCompanyPerPlayer == -1 then
        Config.MaximumOwnedCompanyPerPlayer = 99999
    end


    for identifier, shopData in pairs(Config.ShopList) do
        for index, pumpData in pairs(shopData.pumpPosition) do
            pumpData.source = {}
            pumpData.occupied = {}
        end
    end

    for k, v in pairs(Config.FuelTypeUnitsMeasurementsUnits[Config.MeasurementUnits]) do
        if Locales then
            if type(Locales) == "table" then
                if Locales[Config.Locale] then
                    Locales[Config.Locale][k] = v
                end
            end
        end

        DefaultLocales[k] = v
    end
end, "Adding additional things for tables needed")