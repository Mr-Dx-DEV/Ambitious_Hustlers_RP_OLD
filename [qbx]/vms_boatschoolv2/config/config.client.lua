Config.BeforeOpeningMenu = function()
    -- Here you can add anything you want to do or check before opening the exam menu

    if IsEntityDead(PlayerPedId()) then
        return false -- Here the menu will not start if the player is dead
    end

    return true -- If none of the above options happen, the menu will be allowed to open
end

Config.OnVehicleSpawn = function(vehicle, plate)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
    SetVehicleEngineOn(vehicle, false, false, true)
    FreezeEntityPosition(vehicle, true)
    SetVehicleCustomPrimaryColour(vehicle, 255, 255, 255)
    SetVehicleCustomSecondaryColour(vehicle, 15, 15, 15)
    
    ToggleVehicleMod(vehicle, 18, true)
    SetVehicleEnginePowerMultiplier(vehicle, 15.0) -- to make the vehicle a little faster
    
    if GetResourceState('qs-vehiclekeys') ~= 'missing' then
        exports['qs-vehiclekeys']:GiveKeys(plate, vehicle)
    end
    if GetResourceState('wasabi_carlock') ~= 'missing' then
        exports['wasabi_carlock']:GiveKey(plate)
    end
    if GetResourceState('qb-vehiclekeys') ~= 'missing' then
        TriggerEvent("vehiclekeys:client:SetOwner", plate)
    end
end

Config.OnVehicleDelete = function(vehicle, plate)
    if GetResourceState('qs-vehiclekeys') ~= 'missing' then
        exports['qs-vehiclekeys']:RemoveKeys(plate, vehicle)
    end
    if GetResourceState('wasabi_carlock') ~= 'missing' then
        exports['wasabi_carlock']:RemoveKey(plate)
    end
    if GetResourceState('qb-vehiclekeys') ~= 'missing' then
        TriggerEvent("qb-vehiclekeys:client:RemoveKeys", plate)
    end
    
    DeleteVehicle(vehicle)
    
end

requestAnim = function(animDict, animName, duration, flag)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(0)
	end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, -8.0, duration, flag, 0, false, false, false)
end