if not Config.AccessTool.enabled then return end

local function GiveKeys(vehicle, plate)
    if Config.AccessTool.Keys == "qb" then
        TriggerEvent("vehiclekeys:client:SetOwner", plate) -- change it to your own logic
    elseif Config.AccessTool.Keys == "cd" then
        TriggerEvent('cd_garage:AddKeys', plate)

    elseif Config.AccessTool.Keys == "mk" then
        exports["mk_vehiclekeys"]:AddKey(vehicle)
    else
        print("Snipe-Evidence: You have selected other key system. Configure the event/export properly")
    end
end

lib.callback.register("snipe-evidence:client:useAccessTool", function()
    local vehicles = lib.getNearbyVehicles(GetEntityCoords(cache.ped), 5.0, true)
    if #vehicles > 0 then

        local p = promise.new()
        DoProgress(function(result)
            p:resolve(result)
        end, Config.Progress["access_vehicle"])
        local progressComplete = Citizen.Await(p)
        if not progressComplete then return false end
        local vehicle = vehicles[1].vehicle
        local plate = GetVehicleNumberPlateText(vehicle)
        plate = string.gsub(plate, "^%s*(.-)%s*$", "%1") -- trim whitespace
        SetVehicleDoorsLocked(vehicle, 1)
        SetVehicleLights(vehicle, 2)
        Wait(250)
        SetVehicleLights(vehicle, 1)
        Wait(200)
        SetVehicleLights(vehicle, 0)
        Wait(300)
        SetVehicleDoorsLockedForAllPlayers(vehicle, false)
        GiveKeys(vehicle, plate)
        return true
    else
        return false
    end
end)