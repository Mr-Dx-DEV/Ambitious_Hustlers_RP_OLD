--==========================================================
-- Duct Tape Repair
--==========================================================
local repairing = false

-- DuctTape

RegisterNetEvent(getScript()..":quickrepair", function()
    local Ped       = PlayerPedId()
    local vehicle   = nil
    local coords    = GetEntityCoords(Ped)
    local repaireng = true
    local repairbody= true

    if repairing then return end

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
    end

    if DoesEntityExist(vehicle) then
        local plate = Helper.getTrimmedPlate(vehicle)
        if Helper.isCarParked(plate) then
            triggerNotify(nil, "Vehicle is hard parked", "error")
            return
        end

        local damageTable = {
            engine = GetVehicleEngineHealth(vehicle),
            body   = GetVehicleBodyHealth(vehicle),
        }

        -- Decide if engine/body can be repaired
        if damageTable.engine >= Config.DuctTape.MaxDuctEngine then
            repaireng = false
        else
            repaireng = true
        end

        if Config.DuctTape.DuctTapeBody and damageTable.body >= Config.DuctTape.MaxDuctBody then
            repairbody = false
        else
            repairbody = true
        end

        -- Repair if either engine or body can be fixed
        if repaireng or repairbody then
            lookEnt(vehicle)
            SetVehicleDoorOpen(vehicle, 4, false, false)
            repairing = true

            if progressBar({
                label = locale("repairActions", "applyingDuctTape"),
                time  = math.random(10000, 12000),
                cancel= true,
                anim  = "fixing_a_ped",
                dict  = "mini@repair",
                flag  = 16,
                icon  = "ducttape",
            }) then
                Wait(1000)
                Helper.removePropHoldCoolDown()

                -- Simple vs. advanced duct tape logic
                if Config.DuctTape.DuctSimpleMode then
                    SetVehicleEngineHealth(vehicle, Config.DuctTape.MaxDuctEngine)
                    SetVehicleBodyHealth(vehicle, Config.DuctTape.MaxDuctBody)
                else
                    -- Engine fix
                    if damageTable.engine <= 50.0 and damageTable.engine <= 200 then
                        SetVehicleEngineHealth(vehicle, 300.0)
                    else
                        SetVehicleEngineHealth(vehicle, damageTable.engine + Config.DuctTape.DuctAmountEngine)
                        if GetVehicleEngineHealth(vehicle) > Config.DuctTape.MaxDuctEngine then
                            SetVehicleEngineHealth(vehicle, Config.DuctTape.MaxDuctEngine)
                        end
                    end
                    -- Body fix
                    if Config.DuctTape.DuctTapeBody then
                        if damageTable.body <= 50.0 and damageTable.body <= 200 then
                            SetVehicleBodyHealth(vehicle, 300.0)
                        else
                            SetVehicleBodyHealth(vehicle, damageTable.body + Config.DuctTape.DuctAmountBody)
                            if GetVehicleBodyHealth(vehicle) > Config.DuctTape.MaxDuctBody then
                                SetVehicleBodyHealth(vehicle, Config.DuctTape.MaxDuctBody)
                            end
                        end
                    end
                end

                -- Remove duct tape if configured
                if Config.DuctTape.RemoveDuctTape then
                    removeItem("ducttape", 1)
                end
            end
            Helper.addCarToUpdateLoop(vehicle)

            repairing = false
            SetVehicleDoorShut(vehicle, 4, false, false)
            Helper.removePropHoldCoolDown()

        else
            triggerNotify(nil, locale("repairActions", "ductTapeLimit"), "error")
        end
    else
        triggerNotify(nil, locale("repairActions", "noVehicleNearby"), "error")
    end
end)

-- Wheel Repair

RegisterNetEvent(getScript()..":client:wheelRepair", function()
    local Ped      = PlayerPedId()
    local vehicle = nil
    local item = Items["sparetire"]

    if Helper.isInCar() and not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then
        triggerNotify(nil, locale("repairActions", "noVehicleNearby"), "error")
        return
    else
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end

    if DoesEntityExist(vehicle) then
        local plate = Helper.getTrimmedPlate(vehicle)
        if Helper.isCarParked(plate) then
            triggerNotify(nil, "Vehicle is hard parked", "error")
            return
        end

        local above = isVehicleLift(vehicle)
        --if not above and not Helper.lookAtWheel(vehicle) then return end

        local wheels = {
            { bone = "wheel_lf", index = 0 },
            { bone = "wheel_rf", index = 1 },
            { bone = "wheel_lr", index = 4 },
            { bone = "wheel_rr", index = 5 },

            --{ bone = "wheel_lm1", index = 4 },
            --{ bone = "wheel_rm1", index = 5 },
            --{ bone = "wheel_lm2", index = 6 },
            --{ bone = "wheel_rm2", index = 7 },
            --{ bone = "wheel_lm3", index = 45 },
            --{ bone = "wheel_rm3", index = 47 },
        }

        local pedCoords = GetEntityCoords(Ped)
        local nearestWheel = nil
        local minDistance = math.huge

        for _, wheel in ipairs(wheels) do
            local boneIndex = GetEntityBoneIndexByName(vehicle, wheel.bone)
            if boneIndex ~= -1 then
                local boneCoords = GetWorldPositionOfEntityBone(vehicle, boneIndex)
                local dist = #(pedCoords - boneCoords)
                if dist < minDistance and dist < 2.0 then
                    minDistance = dist
                    nearestWheel = wheel
                    nearestWheel.coords = boneCoords
                end
            end
        end
        jsonPrint(nearestWheel)
        lookEnt(nearestWheel.coords)
        if nearestWheel then
            -- check if installed/uninstalled already
            local damaged = IsVehicleTyreBurst(vehicle, nearestWheel.index, true)

            drawLine(nearestWheel.coords, nearestWheel.coords + vec3(0, 0, 10.0), vec4(255,0,0,1))

            if not damaged then
                triggerNotify(nil, "Wheel doesn't need fixing", "error")
                return
            end

        else
            triggerNotify(nil, "This wheel can't be fixed", "error")
            return
        end
        local cam = not above and createTempCam(GetOffsetFromEntityInWorldCoords(Ped, 1.0, -2.0, 1.0), nearestWheel.coords)

        local emote = {
            anim = above and "idle_b" or "machinic_loop_mechandplayer",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            flag = above and 1 or 8
        }

        SetVehicleEngineOn(vehicle, false, false, true)
        Helper.propHoldCoolDown("screwdriver")
        Wait(10)

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
        if not Config.SkillChecks.wheelRepair or skillCheck() then

            local getOffSet = GetVehicleWheelXOffset(vehicle, nearestWheel.index)
            -- Installing
            repairing = true
            local installTime = math.random(12000, 18000)
            CreateThread(function()
                Wait(installTime/3)
                if repairing == false then return end
                SetVehicleWheelXOffset(vehicle, nearestWheel.index, 200)
                Wait(installTime/3)
                if repairing == false then return end
                Helper.propHoldCoolDown("tyre")
                Wait(10)
                playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
                Wait(installTime/3)
                if repairing == false then return end
            end)
            if progressBar({
                label = locale("repairActions", "actionRepairing")..": "..item.label,
                time  = installTime,
                cancel= true,
                cam   = cam
            }) then

                SetVehicleWheelHealth(vehicle, nearestWheel.index, 1000.0)
                SetVehicleTyreFixed(vehicle, nearestWheel.index)
                for _, wheel in ipairs(wheels) do
                    if wheel.index ~= nearestWheel.index then
                        if IsVehicleTyreBurst(vehicle, wheel.index, true) then
                            SetVehicleTyreBurst(vehicle, wheel.index, true, 0.0)
                        end
                    end
                end
                -- For kuz's script
                TriggerEvent("kq_wheeldamage:fixWheel", nearestWheel.index) -- pretty sure this should do it

                Helper.addCarToUpdateLoop(vehicle)
                removeItem("sparetire", 1)

                triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                repairing = false
            else
                triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                repairing = false
            end
            SetVehicleWheelXOffset(vehicle, nearestWheel.index, getOffSet)

        end
        Helper.removePropHoldCoolDown()
    end
end)

-- Repair Kit Stuff

RegisterNetEvent(getScript()..":vehFailure:RepairVehicle", function(data)
    jsonPrint(data)
    local item, full = data.client.item, data.client.full
    local vehicle = nil
    local Ped = PlayerPedId()

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end

    if Helper.isVehicleLocked(vehicle) then return end

    if #(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine"))) >= 2.0 then
        triggerNotify(nil, locale("common", "nearEngineWarning"), "error")
        return
    end

    local engHealth = GetVehicleEngineHealth(vehicle)
    local bodHealth = GetVehicleBodyHealth(vehicle)

    if engHealth >= 990.0 and bodHealth >= 990.0 then
        triggerNotify(nil, locale("common", "cannotInstall", "error"))
        return
    end

    SetVehicleDoorOpen(vehicle, 4, false, false)
    local above = isVehicleLift(vehicle)
    local cam = not above and createTempCam(Ped, vehicle)

    if progressBar({
        label = locale("repairActions", "actionRepairing"),
        time = 10000,
        cancel = true,
        dict = "mini@repair",
        anim = "fixing_a_player",
        flag = 1,
        icon = item,
        cam = cam
    }) then
        if full then
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehiclePetrolTankHealth(vehicle, 1000.0)
            SetVehicleDeformationFixed(vehicle)
            SetVehicleFixed(vehicle)
            if isStarted("qs-advancedgarages") then
                exports["qs-advancedgarages"]:RepairNearestVehicle()
            end
        else
            if engHealth + 100.0 > 1000.0 then
                SetVehicleEngineHealth(vehicle, 1000.0)
            else
                SetVehicleEngineHealth(vehicle, GetVehicleEngineHealth(vehicle) + 100.0)
            end
            if bodHealth + 100.0 > 1000.0 then
                SetVehicleBodyHealth(vehicle, 1000.0)
            else
                SetVehicleBodyHealth(vehicle, GetVehicleBodyHealth(vehicle) + 100.0)
            end
        end
        Helper.addCarToUpdateLoop(vehicle)
        --SetVehicleUndriveable(vehicle, false)
        removeItem(item, 1)
    end
    ClearPedTasks(PlayerPedId())
    SetVehicleDoorShut(vehicle, 4, false)
end)

-- Custom /fix command

if Config.vehFailure.fixCommand then
	RegisterNetEvent(getScript()..":client:fixEverything", function()
        local vehicle = nil
        local Ped = PlayerPedId()
		if not IsPedInAnyVehicle(Ped, false) then
			vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
            pushVehicle(vehicle)
            lookEnt(vehicle)
		else
			vehicle = GetVehiclePedIsIn(Ped, false)
            pushVehicle(vehicle)
		end
		SetVehicleUndriveable(vehicle, false)
		WashDecalsFromVehicle(vehicle, 1.0)
		SetVehicleEngineHealth(vehicle, 1000.0)
		SetVehicleBodyHealth(vehicle, 1000.0)
		SetVehiclePetrolTankHealth(vehicle, 1000.0)
		SetVehicleDirtLevel(vehicle, 0.0)
		SetVehicleDeformationFixed(vehicle)
		SetVehicleFixed(vehicle)
		if isStarted("qs-advancedgarages") then
            exports["qs-advancedgarages"]:RepairNearestVehicle()
        end
		for i = 0, 5 do
            SetVehicleTyreFixed(vehicle, i)
        end
		for i = 0, 7 do
            FixVehicleWindow(vehicle, i)
        end
		SetVehicleFuelLevel(vehicle, 100.0)
		TriggerServerEvent(getScript()..":server:fixEverything", Helper.getTrimmedPlate(vehicle), ensureNetToVeh(vehicle))
		Helper.saveStatus(vehicle)
		pushVehicle(vehicle)
        Helper.addCarToUpdateLoop(vehicle)
	end)
end