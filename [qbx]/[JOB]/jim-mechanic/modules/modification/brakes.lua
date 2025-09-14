--===================================================================
-- BRAKES
--===================================================================
Modify.applyBrakes = function(data)
    local Ped      = PlayerPedId()
    local level    = 1
    level          = data.client.level
    local vehicle = nil

    if data.client.remove == nil then
        print("You need to update your ox_inv items")
        return
    end

    local remove   = data.client.remove

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
        local possMods      = Helper.checkHSWMods(vehicle)
        local currentBrakes = GetVehicleMod(vehicle, 12)

        if not remove and (GetNumVehicleMods(vehicle, 12) == 0 or level > possMods[12]) then
            triggerNotify(nil, locale("common", "cannotInstall"), "error")
            return
        end
        if not remove and GetVehicleMod(vehicle, 12) == level then
            triggerNotify(nil, Items["brakes"..(level+1)].label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end

        local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))

        local emote = {
            anim = above and "idle_b" or "machinic_loop_mechandplayer",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            flag = above and 1 or 8
        }

        SetVehicleEngineOn(vehicle, false, false, true)
        Helper.propHoldCoolDown("screwdriver")
        Wait(10)

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
        if not Config.SkillChecks.brakes or skillCheck() then
            if not remove then
                -- Install brakes
                local item = Items["brakes"..(level+1)]

                local installTime = math.random(7000, 10000)
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item.label,
                    time  = installTime,
                    cancel= true,
                    icon  = "brakes"..(level+1),
                    cam   = cam
                }) then
                    if (GetVehicleMod(vehicle, 12) ~= currentBrakes) or (not hasItem("brakes"..(level+1), 1)) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "brakes"..(level+1),
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to add ^3".."brakes"..(level+1).." ^1but didn't have the item^7"
                        )
                        return
                    end
                    sendLog(item.label.."(brakes"..(level+1)..") - installed ["..plate.."]")
                    Helper.checkSetVehicleMod(vehicle, 12, level)
                    Helper.addCarToUpdateLoop(vehicle)
                    removeItem("brakes"..(level+1), 1)

                    -- Return old brakes as item/material
                    if currentBrakes ~= -1 then
                        if Config.Overrides.receiveMaterials then
                            Helper.removeToMaterials("brakes"..currentBrakes+1)
                        else
                            currentToken = triggerCallback(AuthEvent)
                            addItem("brakes"..currentBrakes+1, 1)
                        end
                    end

                    triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                else
                    triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                end
            else
                -- Remove brakes
                local item = Items["brakes"..(currentBrakes+1)]
                local removeTime = math.random(7000, 10000)

                if progressBar({
                    label = locale("common", "actionRemoving")..": "..item.label,
                    time  = removeTime,
                    cancel= true,
                    icon  = "brakes"..(currentBrakes+1),
                    cam   = cam
                }) then
                    if (GetVehicleMod(vehicle, 12) ~= currentBrakes) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "brakes"..(currentBrakes+1)
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3".."brakes"..(currentBrakes+1).." ^1but it wasn't on the vehicle^7"
                        )
                        return
                    end

                    if Helper.checkSetVehicleMod(vehicle, 12, -1) then
                        sendLog(item.label.."(brakes"..(currentBrakes+1)..") - removed ["..plate.."]")
                        Helper.addCarToUpdateLoop(vehicle)

                        if currentBrakes ~= -1 then
                            if Config.Overrides.receiveMaterials then
                                Helper.removeToMaterials("brakes"..currentBrakes+1)
                            else
                                currentToken = triggerCallback(AuthEvent)
                                addItem("brakes"..currentBrakes+1, 1)
                            end
                        end

                        triggerNotify(nil, item.label.." "..locale("common", "removedMsg"), "success")
                    end
                else
                    triggerNotify(nil, item.label..locale("common", "removalFailed"), "error")
                end
            end
            Helper.removePropHoldCoolDown()
        end
    end
end

RegisterNetEvent(getScript()..":client:applyBrakes", function(data)
    Modify.applyBrakes(data)
end)