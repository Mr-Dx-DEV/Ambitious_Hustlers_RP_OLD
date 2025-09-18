registerCallback("rcore_fuel:buyCompany", function(source, cb, type, companyIdentifier)
    local shopData = Config.ShopList[companyIdentifier]
    if shopData then

        local player = SharedObject.GetPlayerFromId(source)
        if PayWithType(type, source, shopData.price) then
            local company = GetCompanyModal(companyIdentifier)
            local compIdentifier = company.GetOwnerIdentifier()

            if compIdentifier ~= "none" then
                GivePlayerMoney("bank", shopData.price, IsPlayerWithIdentifierOnline(compIdentifier) and GetPlayerSourceByIdentifier(compIdentifier) or compIdentifier)
            end
            MySQL.Sync.execute("UPDATE `rcore_fuelshop` SET owner_identifier = @owner_identifier  WHERE shop_identifier = @shop_identifier", {
                ["@owner_identifier"] = player.identifier,
                ["@shop_identifier"] = companyIdentifier,
            })

            company.SetForSale(false)
            company.SetOwnerIdentifier(player.identifier)

            company.Save()

            UpdateConfigForClient(-1, companyIdentifier)
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)