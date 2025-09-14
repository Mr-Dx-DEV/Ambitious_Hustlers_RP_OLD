--===================================================================
-- TRANSMISSION
--===================================================================
Modify.applyTransmission = function(data)
    local Ped   = PlayerPedId()
    local level = data.client.level
    local vehicle   = nil

    if data.client.remove == nil then
        print("You need to update your ox_inv items")
        return
    end

    local remove = data.client.remove

    if not Helper.enforceSectionRestricton("perform") then return end
	if not Helper.haveCorrectItemJob() then return end
	if not Helper.canWorkHere() then return end
	if not Helper.isInCar() then return end
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
        local possMods     = Helper.checkHSWMods(vehicle)
        local currentTrans = GetVehicleMod(vehicle, 13)

        if not remove and (GetNumVehicleMods(vehicle, 13) == 0 or (level+1) > possMods[13]) then
            triggerNotify(nil, locale("common", "cannotInstall"), "error")
            return
        end

        if not remove and currentTrans == level then
            triggerNotify(nil, Items["transmission"..(level+1)].label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end

        -- Setup
        local above = isVehicleLift(vehicle)

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

        if not Config.SkillChecks.transmission or skillCheck() then
            if not remove then
                -- Install transmission
                local item = Items["transmission"..(level+1)]

                local installTime = math.random(7000, 10000)
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item.label,
                    time  = installTime,
                    cancel= true,
                    icon  = "transmission"..(level+1),
                    cam   = cam,
                }) then
                    if (GetVehicleMod(vehicle, 13) ~= currentTrans) or (not hasItem("transmission"..(level+1))) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "transmission"..(level+1),
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to add ^3".."transmission"..(level+1).." ^1but didn't have the item^7"
                        )
                        return
                    end

                    if Helper.checkSetVehicleMod(vehicle, 13, level) then
                        sendLog(item.label.."(transmission"..(level+1)..") installed ["..plate.."]")
                        Helper.addCarToUpdateLoop(vehicle)
                        removeItem("transmission"..(level+1), 1)

                        if currentTrans ~= -1 then
                            if Config.Overrides.receiveMaterials then
                                Helper.removeToMaterials("transmission"..(currentTrans+1))
                            else
                                currentToken = triggerCallback(AuthEvent)
                                addItem("transmission"..(currentTrans+1), 1)
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
                -- Remove transmission
                local item       = Items["transmission"..(currentTrans+1)]
                local removeTime = math.random(7000, 10000)

                if progressBar({
                    label = locale("common", "actionRemoving")..": "..item.label,
                    time  = removeTime,
                    cancel= true,
                    icon  = "transmision"..(currentTrans+1),
                    cam   = cam,
                }) then
                    if (GetVehicleMod(vehicle, 13) ~= currentTrans) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "transmission"..(currentTrans+1),
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3".."transmission"..(currentTrans+1).." ^1but it wasn't on the vehicle^7"
                        )
                        return
                    end

                    if Helper.checkSetVehicleMod(vehicle, 13, -1) then
                        sendLog(item.label.."(transmission"..(currentTrans+1)..") - removed ["..plate.."]")
                        Helper.addCarToUpdateLoop(vehicle)

                        if currentTrans ~= -1 then
                            if Config.Overrides.receiveMaterials then
                                Helper.removeToMaterials("transmission"..(currentTrans+1))
                            else
                                currentToken = triggerCallback(AuthEvent)
                                addItem("transmission"..(currentTrans+1), 1, 1)
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

RegisterNetEvent(getScript()..":client:applyTransmission", function(data)
    Modify.applyTransmission(data)
end)