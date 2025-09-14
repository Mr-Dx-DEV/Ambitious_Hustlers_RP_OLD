--==========================================================
-- ANTILAG
--==========================================================

Modify.applyAntiLag = function(data)
    local Ped = PlayerPedId()
    local item = Items["antilag"]
    local vehicle = nil
    Helper.removePropHoldCoolDown()

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

        ExtraDamageComponents.getVehicleStatus(vehicle)

        -- Check for current antilag status
        if remove and VehicleStatus[plate].antiLag ~= 1 then
            triggerNotify(nil, item.label.." "..locale("common", "notInstalled"), "error")
            return
        end
        if not remove and VehicleStatus[plate].antiLag == 1 then
            triggerNotify(nil, item.label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end
        if not IsToggleModOn(vehicle, 18) then
            triggerNotify(nil, locale("nosSettings", "turboNotInstalled"), "error")
            return
        end

        -- Setup
        local above   = isVehicleLift(vehicle)
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
        if not Config.SkillChecks.antilag or skillCheck() then
            if not remove then
                --======================================================
                -- Install Antilag
                --======================================================
                local installTime = math.random(7000, 12000)
                if progressBar({
                    label  = locale("common", "actionInstalling")..": "..item.label,
                    time   = installTime,
                    cancel = true,
                    cam    = cam
                }) then

                    if VehicleStatus[plate].antiLag == 1 then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "antilag",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to add ^3antilag ^1but it was already on the vehicle^7"
                        )
                        return
                    end

                    ExtraDamageComponents.setVehicleStatus(vehicle, "antiLag", 1)
                    sendLog(item.label.."(antilag) changed ["..plate.."]")
                    Helper.addCarToUpdateLoop(vehicle)
                    removeItem("antilag", 1)
                    triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                else
                    triggerNotify(nil, item.label..locale("common", "installationFailed"), "error")
                end

            else
                -- Remove antilag
                local removeTime = math.random(7000, 12000)
                if progressBar({
                    label  = locale("common", "actionRemoving")..": "..item.label,
                    time   = removeTime,
                    cancel = true,
                    cam    = cam,
                }) then
                    SetVehicleModKit(vehicle, 0)

                    if VehicleStatus[plate].antiLag ~= 1 then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "antilag",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3antilag ^1but it wasn't on the vehicle^7"
                        )
                        return
                    end

                    ExtraDamageComponents.setVehicleStatus(vehicle, "antiLag", 0)
                    sendLog(item.label.."(antilag) changed ["..plate.."]")
                    Helper.addCarToUpdateLoop(vehicle)

                    if Config.Overrides.receiveMaterials then
                        Helper.removeToMaterials("antilag")
                    else
                        currentToken = triggerCallback(AuthEvent)
                        addItem("antilag", 1)
                    end
                    triggerNotify(nil, item.label.." "..locale("common", "removedMsg"), "success")
                else
                    triggerNotify(nil, item.label..locale("common", "removalFailed"), "error")
                end
            end
        end
        Helper.removePropHoldCoolDown()
    end
end

RegisterNetEvent(getScript()..":client:applyAntiLag", function(data)
    Modify.applyAntiLag(data)
end)