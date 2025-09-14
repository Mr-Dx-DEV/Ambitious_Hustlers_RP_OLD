--===================================================================
-- Quick Repair (Emergency)
--===================================================================

EmergencyBench.Repair = function()
    local Ped     = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(Ped, false)
    pushVehicle(vehicle)

    local cam = createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 3.0, 0.0, 1.0), GetEntityCoords(vehicle))
    startTempCam(cam)

    local wait        = 1000
    local currentFuel = GetVehicleFuelLevel(vehicle)

    FreezeEntityPosition(vehicle, true)
    triggerNotify(nil, locale("manualRepairs", "replaceTyres"))

    -- Fix all tires
    for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
        if IsVehicleTyreBurst(vehicle, v, false) == 1 or IsVehicleTyreBurst(vehicle, v, true) == 1 then
            SetVehicleTyreFixed(vehicle, v)
            Wait(wait)
        end
    end
    SetVehicleOnGroundProperly(vehicle)

    triggerNotify(nil, locale("manualRepairs", "repairDoors"))
    for i = 0, 5 do
        if not IsVehicleDoorDamaged(vehicle, i) then
            SetVehicleDoorBroken(vehicle, i, true)
            Wait(wait)
        end
    end

    triggerNotify(nil, locale("policeMenu", "repairingEngine"))
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehicleBodyHealth(vehicle, 1000.0)
    Wait(2000)

    triggerNotify(nil, locale("policeMenu", "repairingBody"))
    if Config.Repairs.ExtraDamages == true then
        TriggerServerEvent(getScript()..":server:fixAllPart", VehToNet(vehicle))
    end

    SetVehicleDeformationFixed(vehicle)
    SetVehicleFixed(vehicle)

    if isStarted("qs-advancedgarages") then
        exports["qs-advancedgarages"]:RepairNearestVehicle()
    end

    Wait(2000)
    triggerNotify(nil, locale("policeMenu", "cleaningVehicle"))

    local cleaning = true
    while cleaning do
        if GetVehicleDirtLevel(vehicle) >= 1.0 then
            SetVehicleDirtLevel(vehicle, GetVehicleDirtLevel(vehicle) - 0.8)
        elseif GetVehicleDirtLevel(vehicle) <= 1.0 then
            SetVehicleDirtLevel(vehicle, 0.0)
            cleaning = false
        end
        Wait(300)
    end

    triggerNotify(nil, locale("policeMenu", "repairComplete"), "success")
    FreezeEntityPosition(vehicle, false)
    SetVehicleFuelLevel(vehicle, currentFuel)
    Helper.addCarToUpdateLoop(vehicle)
    stopTempCam()
    EmergencyBench.Menu()
end