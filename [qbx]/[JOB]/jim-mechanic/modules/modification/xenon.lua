--==========================================================
-- Apply Xenons
--==========================================================
Modify.applyXenons = function(data)
    local Ped  = PlayerPedId()
    local item = Items["headlights"]
    local vehicle = nil

    local remove = type(data) ~= "table" and true or nil
	if not Helper.haveCorrectItemJob() then return end
	if not Helper.canWorkHere() then return end
	if not Helper.isInCar() then return end
	if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then return end
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

        -- check if installed/uninstalled already
        if GetNumVehicleMods(vehicle, 11) == 0 then
            triggerNotify(nil, locale("common", "noOptionsAvailable"), "error")
            return
        end

        local isInstalled = IsToggleModOn(vehicle, 22)
        if remove == true and not isInstalled then
            triggerNotify(nil, Items["headlights"].label.." "..locale("common", "alreadyRemoved"), "error")
            Helper.removePropHoldCoolDown()
            return
        end
        if not remove and isInstalled then
            triggerNotify(nil, Items["headlights"].label.." "..locale("common", "alreadyInstalled"), "error")
            Helper.removePropHoldCoolDown()
            return
        end

        -- Setup
        local above = isVehicleLift(vehicle)
        local emote = {
            anim = above and "idle_b" or "machinic_loop_mechandplayer",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            flag = above and 1 or 8
        }

        local cam = not above and createTempCam(GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 5.0, 0.5), GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 0.5, 0.0))

        local distanceToL = #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "headlight_l")))
        local distanceToR = #(GetEntityCoords(Ped) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "headlight_r")))
        local currentEngine = GetVehicleMod(vehicle, 11)

        if above or (distanceToL <= 1.5 or distanceToR <= 1.5) then
            lookEnt(vehicle)

            playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
            if not Config.SkillChecks.xenon or skillCheck() then

                if progressBar({
                    label = locale("common", remove == true and "actionRemoving" or "actionInstalling")..": "..item.label,
                    time  = math.random(3000, 7000),
                    cancel= true,
                    icon  = "headlights",
                    cam   = cam,
                }) then
                    SetVehicleModKit(vehicle, 0)

                    if Helper.checkToggleVehicleMod(vehicle, 22, not remove) then
                        sendLog(item.label.."(headlights) "..(remove and "removed" or "installed").." ["..plate.."]")

                        if not remove then
                            Helper.checkSetVehicleMod(vehicle, 11, currentEngine)
                            CreateThread(function()
                                SetVehicleLights(vehicle, 2)
                                Wait(1000)
                                SetVehicleLights(vehicle, 1)
                                Wait(200)
                                SetVehicleLights(vehicle, 0)
                            end)
                            removeItem("headlights", 1)
                        else
                            SetVehicleXenonLightsColor(vehicle, 0)

                            currentToken = triggerCallback(AuthEvent)
                            addItem("headlights", 1)
                        end

                        Helper.addCarToUpdateLoop(vehicle)
                        triggerNotify(nil, item.label.." "..locale("common", remove and "removedMsg" or "actionInstalling"), "success")
                    end
                else
                    triggerNotify(nil, item.label.." "..locale("common", remove and "removalFailed" or "installationFailed"), "error")
                end
            end
            Helper.removePropHoldCoolDown()
        else
            triggerNotify(nil, locale("common", "closerToHeadlights"), "error")
        end
    end
end

RegisterNetEvent(getScript()..":client:applyXenons", function(data)
    Modify.applyXenons(data)
end)

--==========================================================
-- Apply Xenon Color
--==========================================================
LightingControl.applyXenonColour = function(data)
    if GetIsVehicleEngineRunning(data.vehicle) then
        SetVehicleEngineOn(data.vehicle, true, true, true)
    end

    if data.stock then
        ClearVehicleXenonLightsCustomColor(data.vehicle)
        SetVehicleXenonLightsColor(data.vehicle, -1)
        TriggerServerEvent(getScript()..":server:ChangeXenonColour", VehToNet(data.vehicle), nil)
    else
        SetVehicleXenonLightsColor(data.vehicle, -1)
        SetVehicleXenonLightsCustomColor(data.vehicle, data.R, data.G, data.B)
        TriggerServerEvent(getScript()..":server:ChangeXenonColour", VehToNet(data.vehicle), { r = data.R, g = data.G, b = data.B })
    end

    Wait(200)
    Helper.addCarToUpdateLoop(data.vehicle)
    LightingControl.XenonMenu(data)
end

-- Client-side statebag listener
AddStateBagChangeHandler("xenonColour", nil, function(bagName, key, value)
    debugPrint("^5Debug^7: ^2Statebag change^7, xenonColour", json.encode(value))
    local entity = GetEntityFromStateBagName(bagName)
    if entity ~= 0 and DoesEntityExist(entity) then
        if value then
            -- Set color if defined
            SetVehicleXenonLightsColor(entity, -1)
            SetVehicleXenonLightsCustomColor(entity, value.r, value.g, value.b)
        else
            -- Clear the custom xenon color if statebag was cleared
            ClearVehicleXenonLightsCustomColor(entity)
            SetVehicleXenonLightsColor(entity, -1)
        end
    end
end)