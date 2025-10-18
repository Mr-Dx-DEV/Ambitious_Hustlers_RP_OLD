function DrawBlipsOnMapForEvidences(evidences)
    for k, v in pairs(evidences) do
        if v.typeId == "blood" then
            local blip = AddBlipForCoord(v.info.coords.x, v.info.coords.y, v.info.coords.z)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 1)
            SetBlipScale(blip, 0.5)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Blood Evidence")
            EndTextCommandSetBlipName(blip)
            v.blip = blip
        elseif v.typeId == "casing" then
            local blip = AddBlipForCoord(v.info.coords.x, v.info.coords.y, v.info.coords.z)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 1)
            SetBlipScale(blip, 0.5)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Casing Evidence")
            EndTextCommandSetBlipName(blip)
            v.blip = blip
        elseif v.typeId == "projectile" then
            local blip = AddBlipForCoord(v.info.raycastcoords.x, v.info.raycastcoords.y, v.info.raycastcoords.z)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 1)
            SetBlipScale(blip, 0.5)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Projectile Evidence")
            EndTextCommandSetBlipName(blip)
            v.blip = blip
        elseif v.typeId == "vehiclefragment" then
            local blip = AddBlipForCoord(v.info.coords.x, v.info.coords.y, v.info.coords.z)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 1)
            SetBlipScale(blip, 0.5)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Vehicle Fragment Evidence")
            EndTextCommandSetBlipName(blip)
            v.blip = blip
        elseif v.typeId == "fingerprintevidence" then
            local blip = AddBlipForCoord(v.info.coords.x, v.info.coords.y, v.info.coords.z)
            SetBlipSprite(blip, 1)
            SetBlipColour(blip, 1)
            SetBlipScale(blip, 0.5)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Fingerprint Evidence")
            EndTextCommandSetBlipName(blip)
            v.blip = blip
        end
    end
end

function AddBlipForVehicleOnCrimeScene(vehicle)
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 1)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 0.5)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Vehicle On Scene")
    EndTextCommandSetBlipName(blip)
    return blip
end
