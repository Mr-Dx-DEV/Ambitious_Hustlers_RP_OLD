-- Creating Blips

CreateThread(function()
    for k, v in pairs(Locations) do
        if v.blips then
            local blip = AddBlipForCoord(v.coords)
            SetBlipSprite(blip, Blips.blip_sprite)
            SetBlipScale(blip, Blips.blip_scale)
            
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            if Blips.unique_blips then
                AddTextComponentString(v.name)
                SetBlipColour(blip, v.blip_color)
            else
                AddTextComponentString(Blips.generic_blip_label)
                SetBlipColour(blip, Blips.generic_blip_color)
            end
            EndTextCommandSetBlipName(blip)
        end
    end
end)
