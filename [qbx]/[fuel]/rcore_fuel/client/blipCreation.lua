function RefreshBlips()
    for k, v in pairs(Config.ShopList) do
        if v.enableBlip then
            RemoveBlip(v.blipEntityID)
            local blipName = v.blipName
            local colorBlip = 0

            if v.EnableBuyingCompany then
                if v.owner_identifier == GetPlayerIdentifier() then
                    colorBlip = 9
                    blipName = _U("your_company_blip")
                end

                if v.for_sale == true and v.EnableBuyingCompany == true then
                    colorBlip = 2
                    blipName = _U("for_sale_company_blip")
                end
            end

            v.blipEntityID = createBlip(blipName, v.blipSprite, v.blipPosition, {
                type = 4,
                scale = v.blipScale or 1.0,
                color = colorBlip,
                shortRange = true,
            })
        end
    end
end

CreateThread(function()
    RefreshBlips()
end, "creating blips on minimap")
