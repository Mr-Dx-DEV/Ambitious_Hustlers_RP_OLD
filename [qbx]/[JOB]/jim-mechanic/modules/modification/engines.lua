--===================================================================
-- ENGINE
--===================================================================
Modify.applyEngine = function(data)
    local Ped       = PlayerPedId()
    local level     = data.client.level
    local vehicle   = nil

    if data.client.remove == nil then
        print("You need to update your ox_inv items")
        return
    end

    local remove = data.client.remove

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
        if not Helper.lookAtEngine(vehicle) then return end

        -- check if installed/uninstalled already
        local possMods      = Helper.checkHSWMods(vehicle)
        local currentEngine = GetVehicleMod(vehicle, 11)

        if not remove and (GetNumVehicleMods(vehicle, 11) == 0 or (level+1) > possMods[11] )then
            triggerNotify(nil, locale("common", "cannotInstall"), "error")
            return
        end

        if not remove and GetVehicleMod(vehicle, 11) == level then
            triggerNotify(nil, Items["engine"..(level+1)].label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end

        -- Setup
        local above = isVehicleLift(vehicle)
        local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))

        local emote  = {
            anim = above and "idle_b" or "machinic_loop_mechandplayer",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            flag = above and 1 or 8
        }

        SetVehicleEngineOn(vehicle, false, false, true)
        Helper.propHoldCoolDown("screwdriver")
        Wait(10)
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorOpen(vehicle, 4, false, false)
        end

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
        if not Config.SkillChecks.engines or skillCheck() then
            if not remove then
                -- Install engine
                local item = Items["engine"..(level+1)]

                local installTime = math.random(7000, 10000)
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item.label,
                    time  = installTime,
                    cancel= true,
                    icon  = "engine"..(level+1),
                    cam   = cam,
                }) then
                    if (GetVehicleMod(vehicle, 11) ~= currentEngine) or (not hasItem("engine"..(level+1), 1)) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "engine"..(level+1),
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to modify ^3".."engine"..(level+1).." ^1but didn't have the item^7"
                        )
                        return
                    end

                    if Helper.checkSetVehicleMod(vehicle, 11, level) then
                        sendLog(item.label.."(engine"..(level+1)..") - installed ["..plate.."]")
                        Helper.addCarToUpdateLoop(vehicle)
                        removeItem("engine"..(level+1), 1)

                        if currentEngine ~= -1 then
                            if Config.Overrides.receiveMaterials then
                                Helper.removeToMaterials("engine"..(currentEngine+1))
                            else
                                currentToken = triggerCallback(AuthEvent)
                                addItem("engine"..(currentEngine+1), 1)
                            end
                        end

                        triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                    else
                        triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                    end
                else
                    triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                end
            else
                -- Remove engine
                local item       = Items["engine"..(currentEngine+1)]
                local removeTime = math.random(7000, 10000)

                if progressBar({
                    label = locale("common", "actionRemoving")..": "..item.label,
                    time  = removeTime,
                    cancel= true,
                    icon  = "engine"..(currentEngine+1),
                    cam   = cam,
                }) then
                    if (GetVehicleMod(vehicle, 11) ~= currentEngine) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "engine"..(currentEngine+1),
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3".."engine"..(currentEngine+1).." ^1but it wasn't on the vehicle^7"
                        )
                        return
                    end

                    if Helper.checkSetVehicleMod(vehicle, 11, -1) then
                        sendLog(item.label.."(engine"..(currentEngine+1)..") - removed ["..plate.."]")
                        Helper.addCarToUpdateLoop(vehicle)

                        if currentEngine ~= -1 then
                            if Config.Overrides.receiveMaterials then
                                Helper.removeToMaterials("engine"..(currentEngine+1))
                            else
                                currentToken = triggerCallback(AuthEvent)
                                addItem("engine"..(currentEngine+1), 1)
                            end
                        end
                        triggerNotify(nil, item.label.." "..locale("common", "removedMsg"), "success")
                    else
                        triggerNotify(nil, item.label..locale("common", "removalFailed"), "error")
                    end
                else
                    triggerNotify(nil, item.label..locale("common", "removalFailed"), "error")
                end
            end
        end
        Helper.removePropHoldCoolDown()
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorShut(vehicle, 4, false)
        end
    end
end

RegisterNetEvent(getScript()..":client:applyEngine", function(data)
    Modify.applyEngine(data)
end)