--========================================
-- Manual Repair Menu Event
--========================================
ManualRepairBench = {}

ManualRepairBench.Menu = function(data)
    local Ped = PlayerPedId()

    -- Make sure player is outside vehicle
    if not Helper.isOutCar() then
        return
    end

    -- Optional duty check
    if Config.ManualRepairs.requireDutyCheck then
        if triggerCallback(getScript()..":callback:mechCheck") then
            triggerNotify(nil, locale("common", "dutyMessage"), "error")
            return
        end
    end

    local vehicle = GetVehiclePedIsIn(Ped, false)
    if GetPedInVehicleSeat(vehicle, -1) ~= Ped then
        return
    end
    local plate = Helper.getTrimmedPlate(vehicle)

    -- Calculate engine/body health in 1-100 range
    local engHealth = (GetVehicleEngineHealth(vehicle) / 10)
    if GetVehicleEngineHealth(vehicle) > 1000 then engHealth = 100 end
    if GetVehicleEngineHealth(vehicle) < 0    then engHealth = 1   end

    local bodHealth = (GetVehicleBodyHealth(vehicle) / 10)
    if GetVehicleEngineHealth(vehicle) > 1000 then bodHealth = 100 end
    if GetVehicleEngineHealth(vehicle) < 0    then bodHealth = 1   end

    -- Decide total "health" used to reduce cost
    local health = 0
    if Config.ManualRepairs.repairEngine then
        health = math.ceil(engHealth / 2) + math.ceil(bodHealth / 2)
    else
        health = math.ceil(bodHealth)
    end

    -- Calculate repair cost
    local cost = 0
    if Config.ManualRepairs.ManualRepairBased then
        -- Determine vehicle price from searchCar
        local info = searchCar(vehicle)
        local percent = (Config.ManualRepairs.ManualRepairPercent / 100)

        debugPrint("^5Debug^7: ^2Vehicle^7: '^6"..
                   GetEntityModel(vehicle).."^7' (^6"..
                   info.name.."^7) (^6"..info.price.."^7)")

        cost = math.ceil(
            (info.price * percent)
            - math.ceil((health / 100) * (info.price * percent))
        )
    else
        if Config.ManualRepairs.ManualRepairCostBased then
            cost = Config.ManualRepairs.ManualRepairCost
        else
            cost = Config.ManualRepairs.ManualRepairCost - math.ceil((health / 100) * Config.ManualRepairs.ManualRepairCost)
        end
    end

    local cash = getPlayer().cash

    -- Build header text for the menu
    local headertxt = "Class: "..searchCar(vehicle).class
       ..br..(isOx() and br or "")
       ..locale("checkDetails", "plateLabel")..": ".." ["..plate.."]"
       ..br..(isOx() and br or "")
       ..Helper.getMilageString(plate)

    -- Create the menu items
    local RepairMenu = {}
    local seticon = "fas fa-wrench"
    local greyed = false
    local check  = "✅"

    -- If cost = 0 and engine/body are at 100%, grey out
    if cost == 0 and not (engHealth < 100 or bodHealth < 100) then
        greyed = true
        check  = ""
    end

    -- If player can't afford, grey out
    if cash < cost then
        seticon = "fas fa-wallet"
        greyed  = true
        check   = "❌"
    end

    -- Actual "Repair" menu option
    RepairMenu[#RepairMenu+1] = {
        isMenuHeader = greyed,
        icon         = seticon,
        header       = locale("policeMenu", "repairOption").." - $"..cost.." "..check,
        onSelect     = function()
            ManualRepairBench.Repair({
                cost    = cost,
                society = data.society
            })
        end,
    }

    -- Engine health display
    RepairMenu[#RepairMenu+1] = {
        isMenuHeader = true,
        header       = locale("checkDetails", "engineLabel")..": "..math.ceil(GetVehicleEngineHealth(vehicle) / 10).."%",
        progress     = GetVehicleEngineHealth(vehicle) / 10,
    }

    -- Body health display
    RepairMenu[#RepairMenu+1] = {
        isMenuHeader = true,
        header       = locale("repairActions", "bodyLabel")..": "..math.ceil(GetVehicleBodyHealth(vehicle) / 10).."%",
        progress     = GetVehicleBodyHealth(vehicle) / 10,
    }

    -- Debug option to forcibly damage the vehicle
    if debugMode then
        RepairMenu[#RepairMenu+1] = {
            header   = "Test",
            txt      = "Vehicle Death Simulator",
            onSelect = function()
                EmergencyBench.DebugDamage()
            end,
        }
    end

    -- Open the menu with the items
    openMenu(RepairMenu, {
        header    = searchCar(vehicle).name,
        headertxt = headertxt,
        canClose  = true,
        onExit    = function() end,
    })
end

--========================================
-- Manual Repair Logic
--========================================
local repairing = false

ManualRepairBench.Repair = function(data)
    if repairing then return end
    repairing = true

    local Ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(Ped, false)
    pushVehicle(vehicle)

    local currentFuel = GetVehicleFuelLevel(vehicle)
    local plate = Helper.getTrimmedPlate(vehicle)

    local currentHealth = {
        engHealth  = GetVehicleEngineHealth(vehicle),
        bodyHealth = GetVehicleBodyHealth(vehicle)
    }

    -- Create multiple cameras to show different angles during repairs
    local cam  = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",
                  GetOffsetFromEntityInWorldCoords(vehicle, -1.8, 3.5, 2.0), 0.0, 0.0, 0.0, 60.00, false, 0)
    PointCamAtEntity(cam, vehicle)

    local cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",
                  GetOffsetFromEntityInWorldCoords(vehicle,  3.5, 0.0, 0.5), 0.0, 0.0, 0.0, 60.00, false, 0)
    PointCamAtEntity(cam2, vehicle)

    local cam3 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",
                  GetOffsetFromEntityInWorldCoords(vehicle,  2.6, 0.0, 3.0), 0.0, 0.0, 0.0, 60.00, false, 0)
    PointCamAtEntity(cam3, vehicle)

    local cam4 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",
                  GetOffsetFromEntityInWorldCoords(vehicle,  1.8, -3.5, 2.5), 0.0, 0.0, 0.0, 60.00, false, 0)
    PointCamAtEntity(cam4, vehicle)

    FreezeEntityPosition(vehicle, true)

    -- If we want the "animate" style repair process
    if Config.ManualRepairs.repairAnimate then
        startTempCam(cam)

        -- Engine repair first
        if Config.ManualRepairs.repairEngine then
            TriggerServerEvent(getScript()..":chargeCash", data.cost, data.society)
            triggerNotify(nil, locale("policeMenu", "repairingEngine"))

            Wait(10000) -- 10s wait
            SetVehicleEngineHealth(vehicle, 1000.0)

            -- Optionally fix extra damages (e.g., advanced components)
            if Config.Repairs.ExtraDamages == true and Config.ManualRepairs.repairExtras then
                TriggerServerEvent(getScript()..":server:fixAllPart", VehToNet(vehicle))
            end
        end

        local waitDuration = 1500

        -- Switch camera to second
        SetCamActiveWithInterp(cam2, cam, 800, 0, 0)
        triggerNotify(nil, locale("manualRepairs", "replaceTyres"))

        -- Check all tires, fix if burst
        for _, tyreIndex in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
            if IsVehicleTyreBurst(vehicle, tyreIndex, false) == 1
               or IsVehicleTyreBurst(vehicle, tyreIndex, true) == 1
            then
                SetVehicleTyreFixed(vehicle, tyreIndex)
                Wait(waitDuration)
            end
        end

        -- Switch camera to third
        SetCamActiveWithInterp(cam3, cam2, 800, 0, 0)

        -- Check windows, fix if broken
        if not AreAllVehicleWindowsIntact(vehicle) then
            triggerNotify(nil, locale("manualRepairs", "removeWindows"))
            for i = 0, 5 do
                if not IsVehicleWindowIntact(vehicle, i) then
                    RemoveVehicleWindow(vehicle, i)
                    Wait(waitDuration / 2)
                end
            end
        end

        -- Switch camera to fourth
        SetCamActiveWithInterp(cam4, cam3, 800, 0, 0)
        triggerNotify(nil, locale("policeMenu", "repairingBody"))

        Wait(waitDuration * 2)
        SetVehicleBodyHealth(vehicle, 1000.0)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleFixed(vehicle)

        if isStarted("qs-advancedgarages") then
            exports["qs-advancedgarages"]:RepairNearestVehicle()
        end

        -- Refresh menu and finalize
        ManualRepairBench.Menu({ society = data.society })
        Helper.addCarToUpdateLoop(vehicle)
        triggerNotify(nil, locale("policeMenu", "repairComplete"), "success")

        CreateThread(function()
            Wait(1000)
            stopTempCam()
        end)

    else
        -- Alternate "progress bar" style repair
        local repairTime = math.random(60000, 65000) -- 60s - 65s

        if progressBar({
            label = locale("repairActions", "actionRepairing"),
            time  = repairTime,
            cancel= true,
            cam   = cam
        }) then

            -- Perform final fix
            SetVehicleDeformationFixed(vehicle)
            SetVehicleFixed(vehicle)

            if Config.ManualRepairs.repairEngine then
                SetVehicleEngineHealth(vehicle, 1000.0)
            else
                SetVehicleEngineHealth(vehicle, currentHealth.engHealth)
            end

            SetVehicleBodyHealth(vehicle, 1000.0)

            if Config.Repairs.ExtraDamages == true and Config.ManualRepairs.repairExtras then
                TriggerServerEvent(getScript()..":server:fixAllPart", VehToNet(vehicle))
            end

            if isStarted("qs-advancedgarages") then
                exports["qs-advancedgarages"]:RepairNearestVehicle()
            end

            -- Charge and refresh
            TriggerServerEvent(getScript()..":chargeCash", data.cost, data.society)
            ManualRepairBench.Menu({ society = data.society })
            Helper.addCarToUpdateLoop(vehicle)

            triggerNotify(nil, locale("policeMenu", "repairComplete"), "success")
        end
    end

    -- Unfreeze, restore fuel, done
    FreezeEntityPosition(vehicle, false)
    SetVehicleFuelLevel(vehicle, currentFuel)
    repairing = false

    sendLog("Repair Bench used ($"..data.cost..") ["..plate.."]")
end