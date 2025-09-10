function MaxModVehicle(vehicle)
    SetVehicleModKit(vehicle, 0)
    SetVehicleMod(vehicle, 11, 3, false)--engine
    SetVehicleMod(vehicle, 12, 2, false)--brakes
    SetVehicleMod(vehicle, 13, 2, false)--transmission
    SetVehicleMod(vehicle, 15, 2, false)--suspension
    SetVehicleMod(vehicle, 16, 4, false)--armor
    ToggleVehicleMod(vehicle,  18, true)--turbo
    SetVehicleFixed(vehicle)
end

function SpawnCar(carName, maxMods, seatVehicle)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local forwardCoords = GetEntityForwardVector(PlayerPedId()) * 5.0
    if IsModelInCdimage(carName) then
        if not HasModelLoaded(carName) then 
            RequestModel(carName)
            while not HasModelLoaded(carName) do
                Wait(0)
            end
        end
        local vehicle = CreateVehicle(carName, playerCoords.x + forwardCoords.x, playerCoords.y + forwardCoords.y, playerCoords.z + forwardCoords.z, playerCoords.w, true, false)
        SetEntityHeading(vehicle, GetEntityHeading(PlayerPedId()))
        NetworkFadeInEntity(vehicle, true, true)
        SetVehicleOnGroundProperly(vehicle)
        SetEntityAsMissionEntity(vehicle, true, true)
        local netid = NetworkGetNetworkIdFromEntity(vehicle)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetNetworkIdCanMigrate(netid, true)
        GiveKeys(vehicle, GetVehicleNumberPlateText(vehicle))
        TriggerServerEvent("snipe-menu:server:sendLogs", "triggered", "Spawned a " .. carName)
        if maxMods then
            Wait(100)
            MaxModVehicle(vehicle)
        end
        if seatVehicle then
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            TriggerEvent("snipe-menu:client:forceCloseAdminMenu")
        end
    else
        print("Invalid model name")
    end
end

RegisterNetEvent("snipe-menu:client:FixVehicle", function()
    if hasAdminPerms then
        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle then
            SetVehicleFixed(vehicle)
            SetVehicleDirtLevel(vehicle, 0.0)
            SetVehicleUndriveable(vehicle, false)
            SetVehicleEngineOn(vehicle, true, true)
            -- if you have any other events that fix vehicles/status add them below this line.
        else
            ShowNotification("You are not in a vehicle", "error")
        end
    else
        TriggerServerEvent("snipe-menu:server:sendLogs", "exploit", Config.Locales["fix_vehicle_exploit_event"])
    end
end)

RegisterNetEvent("snipe-menu:client:changePlate", function(newPlate)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleNumberPlateText(vehicle, newPlate)
    GiveKeys(vehicle, newPlate)
end)