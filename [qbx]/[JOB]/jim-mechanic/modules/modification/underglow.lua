--==========================================================
-- Underglow
--==========================================================
Modify.applyUnderglow = function(data)
    local canEffect = true
    local Ped       = PlayerPedId()
    local item      = Items["underglow"]
    local remove    = (data.client.remove == true)
    local vehicle   = nil
    if data.client.remove == nil then
        print("You need to update your ox_inv items")
        return
    end

    if not Helper.enforceSectionRestricton("perform") then return end
	if not Helper.haveCorrectItemJob() then return end
	if not Helper.canWorkHere() then return end
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
        if Helper.isVehicleLocked(vehicle) then return end
        if not Helper.enforceVehicleOwned(plate) then return end
        if not Helper.enforceClassRestriction(searchCar(vehicle).class) then return end
        lookEnt(vehicle)

        ExtraDamageComponents.getVehicleStatus(vehicle)

        -- Check for status
        if remove and VehicleStatus[plate]["underglow"] ~= 1 then
            return
        end

        if not remove and VehicleStatus[plate]["underglow"] == 1 then
            triggerNotify(nil, item.label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end

        -- Setup
        local vehClass = searchCar(vehicle).class
        for _, c in pairs({"Vans", "Cycles", "Boats", "Helicopters", "Commercial", "Trains"}) do
            if vehClass == c then
                canEffect = false
            end
        end
        if not canEffect then return end

        local above = isVehicleLift(vehicle)
        local cam = not above and createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 4.0, 0.0, 0.5), GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 0.0, 0.0))

        local emote = {
            anim = above and "idle_b" or "fixing_a_ped",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
            flag = above and 1 or 16
        }

        Helper.propHoldCoolDown("screwdriver")
        Wait(10)

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
        if not Config.SkillChecks.underglow or skillCheck() then

            if not remove then
                -- Installing
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item.label,
                    time  = math.random(5000, 7000),
                    cancel= true,
                    icon  = "underglow",
                    cam   = cam
                }) then
                    if VehicleStatus[plate]["underglow"] == 1 then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "underglow",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to install ^3underglow ^1but it was already on the vehicle^7"
                        )
                        return
                    end

                    ExtraDamageComponents.setVehicleStatus(vehicle, "underglow", 1)

                    local isRunning = GetIsVehicleEngineRunning(vehicle)

                    if not isRunning then
                        SetVehicleEngineOn(vehicle, true, true, true)
                    end
                    for i = 0, 4 do
                        SetVehicleNeonLightEnabled(vehicle, i, true)
                        Wait(100)
                    end
                    Wait(500)
                    if not isRunning then
                        SetVehicleEngineOn(vehicle, false, false, true)
                    end
                    for i = 0, 4 do
                        SetVehicleNeonLightEnabled(vehicle, i, false)
                        Wait(0)
                    end

                    sendLog(item.label.."(underglow) - installed ["..plate.."]")
                    Helper.addCarToUpdateLoop(vehicle)
                    removeItem("underglow", 1)
                    triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                else
                    triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                end
            else
                -- Removing
                if progressBar({
                    label = locale("common", "actionRemoving")..": "..item.label,
                    time  = math.random(5000,7000),
                    cancel= true,
                    icon  = "underglow",
                    cam   = cam,
                }) then
                    if VehicleStatus[plate].underglow == 0 then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "underglow",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3underglow ^1but it wasn't on the vehicle^7"
                        )
                        return
                    end

                    ExtraDamageComponents.setVehicleStatus(vehicle, "underglow", 0)
                    SetVehicleNeonLightsColour(vehicle, 255, 255, 255)

                    for i = 0, 4 do
                        SetVehicleNeonLightEnabled(vehicle, i, false)
                        Wait(0)
                    end

                    sendLog(item.label.."(underglow) - removed ["..plate.."]")
                    Helper.addCarToUpdateLoop(vehicle)
                    currentToken = triggerCallback(AuthEvent)
                    addItem("underglow", 1)
                    triggerNotify(nil, item.label.." "..locale("common", "removedMsg"), "success")
                else
                    triggerNotify(nil, item.label.." "..locale("common", "removalFailed"), "error")
                end
            end
        end
    end
    Helper.removePropHoldCoolDown()
end

RegisterNetEvent(getScript()..":client:applyUnderglow", function(data)
    Modify.applyUnderglow(data)
end)

--==========================================================
-- Apply Neon Position
--==========================================================
Modify.applyNeonPostion = function(data)
    if GetIsVehicleEngineRunning(data.vehicle) then
        SetVehicleEngineOn(data.vehicle, true, true, true)
    end

    if data.id == -1 then
        local anyOff = not IsVehicleNeonLightEnabled(data.vehicle, 2)
                    or not IsVehicleNeonLightEnabled(data.vehicle, 1)
                    or not IsVehicleNeonLightEnabled(data.vehicle, 3)
                    or not IsVehicleNeonLightEnabled(data.vehicle, 0)

        if anyOff then
            for i = 0, 4 do
                SetVehicleNeonLightEnabled(data.vehicle, i, true)
                Wait(40)
            end
        else
            for i = 0, 4 do
                SetVehicleNeonLightEnabled(data.vehicle, i, false)
                Wait(40)
            end
        end
    else
        if IsVehicleNeonLightEnabled(data.vehicle, data.id) then
            SetVehicleNeonLightEnabled(data.vehicle, data.id, false)
        else
            SetVehicleNeonLightEnabled(data.vehicle, data.id, true)
        end
    end

    Helper.addCarToUpdateLoop(data.vehicle)
    LightingControl.NeonToggleMenu(data)
end

--==========================================================
-- Apply Neon Color
--==========================================================
Modify.applyNeonColour = function(data)
    if GetIsVehicleEngineRunning(data.vehicle) then
        SetVehicleEngineOn(data.vehicle, true, true, true)
    end

    SetVehicleNeonLightsColour(data.vehicle, data.r, data.g, data.b)
    Helper.addCarToUpdateLoop(data.vehicle)
    LightingControl.NeonColourMenu(data)
end