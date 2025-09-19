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

DrawText3D = function(coords, text, size)
    local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)
    local camCoords = GetFinalRenderedCamCoord()
    local distance = #(vector - camCoords)
    if not size then
        size = 1
    end
    local scale = (size / distance) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scale = scale * fov
    SetTextScale(0.0 * scale, 0.55 * scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(vector.xyz, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

requestAnim = function(animDict, animName, duration, flag)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Citizen.Wait(0)
	end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 8.0, -8.0, duration, flag, 0, false, false, false)
end