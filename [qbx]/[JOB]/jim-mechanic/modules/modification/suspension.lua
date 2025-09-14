--===================================================================
-- SUSPENSION (Levels)
--===================================================================
Modify.applySuspension = function(data)
    local Ped   = PlayerPedId()
    local level = data.client.level
    local vehicle = nil

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
        local above = isVehicleLift(vehicle)
        if Helper.isVehicleLocked(vehicle) then return end
	    if not Helper.enforceVehicleOwned(plate) then return end
        if not Helper.enforceClassRestriction(searchCar(vehicle).class) then return end
        if not above and not Helper.lookAtWheel(vehicle) then return end

        -- check if installed/uninstalled already
        local possMods          = Helper.checkHSWMods(vehicle)
        local currentSuspension = GetVehicleMod(vehicle, 15)
        if not remove and (GetNumVehicleMods(vehicle, 15) == 0 or ((level+1) > possMods[15])) then
            triggerNotify(nil, locale("common", "cannotInstall"), "error")
            return
        end

        if not remove and currentSuspension == level then
            triggerNotify(nil, Items["suspension"..(level+1)].label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end

        -- Setup
        local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))

        local emote = {
            anim = above and "idle_b" or "fixing_a_ped",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
            flag = above and 1 or 16
        }

        SetVehicleEngineOn(vehicle, false, false, true)
        Helper.propHoldCoolDown("screwdriver")
        Wait(10)

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
        if not Config.SkillChecks.suspension or skillCheck() then

            if not remove then
                -- Install suspension
                local item = Items["suspension"..(level+1)]

                local installTime = math.random(7000, 10000)
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item.label,
                    time  = installTime,
                    cancel = true,
                    icon  = "suspension"..(level+1),
                    cam   = cam,
                    request = true,
                }) then
                    if (GetVehicleMod(vehicle, 15) ~= currentSuspension) or (not hasItem("suspension"..(level+1), 1)) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "suspension"..(level+1),
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to add ^3".."suspension"..(level+1).." ^1but didn't have the item^7"
                        )
                        return
                    end

                    if Helper.checkSetVehicleMod(vehicle, 15, level) then
                        sendLog(item.label.."(suspension"..(level+1)..") - installed ["..plate.."]")
                        Helper.addCarToUpdateLoop(vehicle)
                        removeItem("suspension"..(level+1), 1)

                        if currentSuspension ~= -1 then
                            if Config.Overrides.receiveMaterials then
                                Helper.removeToMaterials("suspension"..(currentSuspension+1))
                            else
                                currentToken = triggerCallback(AuthEvent)
                                addItem("suspension"..(currentSuspension+1), 1)
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
                -- Remove suspension
                local item = Items["suspension"..(currentSuspension+1)]
                local removeTime = math.random(7000, 10000)

                if progressBar({
                    label = locale("common", "actionRemoving")..": "..item.label,
                    time  = removeTime,
                    cancel = true,
                    icon  = "suspension"..(currentSuspension+1),
                    cam   = cam,
                }) then
                    if (GetVehicleMod(vehicle, 15) ~= currentSuspension) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "suspension"..(currentSuspension+1),
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3".."suspension"..(currentSuspension+1).." ^1but it wasn't on the vehicle^7"
                        )
                        return
                    end

                    sendLog(item.label.."(suspension"..(currentSuspension+1)..") - installed ["..plate.."]")

                    if Helper.checkSetVehicleMod(vehicle, 15, -1) then
                        Helper.addCarToUpdateLoop(vehicle)
                        if currentSuspension ~= -1 then
                            if Config.Overrides.receiveMaterials then
                                Helper.removeToMaterials("suspension"..(currentSuspension+1))
                            else
                                currentToken = triggerCallback(AuthEvent)
                                addItem("suspension"..(currentSuspension+1), 1)
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
    end
end

RegisterNetEvent(getScript()..":client:applySuspension", function(data)
    Modify.applySuspension(data)
end)