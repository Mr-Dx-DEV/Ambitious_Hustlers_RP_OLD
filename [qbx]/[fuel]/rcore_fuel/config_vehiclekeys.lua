-- everything here is client sided!

--- @param vehicleEntity number
--- @param vehicleHash number
--- @param vehicleModelName string
--- @param vehiclePlate string ( non trimmed )
Config.GiveVehicleKeys = function(vehicleEntity, vehicleHash, vehicleModelName, vehiclePlate)
    if IsResourceOnServer("tgiann-hotwire") then
        exports["tgiann-hotwire"]:GiveKeyPlate(Trim(vehiclePlate), true)
        return
    end

    if IsResourceOnServer("qb-vehiclekeys") then
        TriggerEvent("qb-vehiclekeys:client:AddKeys", Trim(vehiclePlate))
        return
    end

    if IsResourceOnServer("rcore_garage") then
        TriggerServerEvent("rcore_garage:GivePlayerKey", Trim(vehiclePlate))
        return
    end

    if IsResourceOnServer("fivecode_carkeys") then
        exports.fivecode_carkeys:GiveKey(vehicleEntity, false, true)
        return
    end

    if IsResourceOnServer("cd_garage") then
        TriggerEvent('cd_garage:AddKeys', exports["cd_garage"]:GetPlate(vehicleEntity))
        return
    end

    if IsResourceOnServer("qs-vehiclekeys") then
        exports['qs-vehiclekeys']:GiveKeys(Trim(vehiclePlate), vehicleModelName)
        return
    end

    if IsResourceOnServer("xd_locksystem") then
        exports['xd_locksystem']:SetVehicleKey(Trim(vehiclePlate))
        return
    end
end

--- @param vehicleEntity number
--- @param vehicleHash number
--- @param vehicleModelName string
--- @param vehiclePlate string ( non trimmed )
Config.RemoveVehicleKeys = function(vehicleEntity, vehicleHash, vehicleModelName, vehiclePlate)
    if IsResourceOnServer("tgiann-hotwire") then
        -- I couldnt find anything for removing key
        return
    end

    if IsResourceOnServer("qb-vehiclekeys") then
        TriggerEvent("qb-vehiclekeys:client:RemoveKeys", Trim(vehiclePlate))
        return
    end

    if IsResourceOnServer("rcore_garage") then
        TriggerServerEvent("rcore_garage:RemovePlayerKey", Trim(vehiclePlate))
        return
    end

    if IsResourceOnServer("fivecode_carkeys") then
        exports.fivecode_carkeys:GiveKey(vehicleEntity, false, false)
        return
    end

    if IsResourceOnServer("cd_garage") then
        -- I cannot find anything in docs about removing keys for cd_garage so I will leave it for now like this.
        return
    end

    if IsResourceOnServer("qs-vehiclekeys") then
        exports['qs-vehiclekeys']:RemoveKeys(Trim(vehiclePlate), vehicleModelName)
        return
    end

    if IsResourceOnServer("xd_locksystem") then
        exports['xd_locksystem']:SetVehicleKey(Trim(vehiclePlate), true)
        return
    end
end

--- @param value string
function Trim(value)
    return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
end