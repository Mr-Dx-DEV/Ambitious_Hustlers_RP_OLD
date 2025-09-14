--==========================================================
-- ARMOR
--==========================================================

Modify.applyArmour = function(data)
    local Ped  = PlayerPedId()
    local item = Items["car_armor"]
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

        lookEnt(vehicle)

        if not remove and GetNumVehicleMods(vehicle, 16) == 0 then
            triggerNotify(nil, locale("common", "cannotInstall"), "error")
            return
        end

        if not remove and ((GetVehicleMod(vehicle, 16) + 1) == GetNumVehicleMods(vehicle, 16)) then
            triggerNotify(nil, item.label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end

        -- Setup
        local above   = isVehicleLift(vehicle)
        local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))

        local emote = {
            anim = above and "idle_b" or "fixing_a_ped",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
            flag = above and 1 or 16
        }

        Helper.propHoldCoolDown("screwdriver")
        Wait(10)

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
        if not Config.SkillChecks.armour or skillCheck() then
            if not remove then
                --======================================================
                -- Install Car Armor
                --======================================================
                SetVehicleEngineOn(vehicle, false, false, true)
                if Config.Overrides.DoorAnimations then
                    SetVehicleDoorOpen(vehicle, 4, false, false)
                end

                local installTime = math.random(7000, 10000)
                if progressBar({
                    label  = locale("common", "actionInstalling")..": "..item.label,
                    time   = installTime,
                    cancel = true,
                    icon   = "car_armor",
                    cam    = cam
                }) then
                    if (GetVehicleMod(vehicle, 16) == GetNumVehicleMods(vehicle, 16) - 1) or (not hasItem("car_armor", 1)) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "car_armor",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to add ^3car_armor ^1but didn't have the item^7"
                        )
                        return
                    end

                    sendLog(item.label.."(car_armor) - installed ["..plate.."]")
                    Helper.checkSetVehicleMod(vehicle, 16, GetNumVehicleMods(vehicle, 16) - 1)
                    Helper.addCarToUpdateLoop(vehicle)
                    removeItem("car_armor", 1)
                    triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                else
                    triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                end
            else
                --======================================================
                -- Remove Car Armor
                --======================================================

                local removeTime = math.random(7000, 10000)
                if progressBar({
                    label  = locale("common", "actionRemoving")..": "..item.label,
                    time   = removeTime,
                    cancel = true,
                    icon   = "car_armor",
                    cam    = cam,
                }) then

                    if (GetVehicleMod(vehicle, 16) == -1) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "car_armor",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3car_armor ^1but vehicle didn't have it^7"
                        )
                        return
                    end

                    sendLog(item.label.."(car_armor) - removed ["..plate.."]")
                    Helper.checkSetVehicleMod(vehicle, 16, -1)
                    Helper.addCarToUpdateLoop(vehicle)

                    if Config.Overrides.receiveMaterials then
                        Helper.removeToMaterials("car_armor")
                    else
                        currentToken = triggerCallback(AuthEvent)
                        addItem("car_armor", 1)
                    end
                    triggerNotify(nil, item.label.." "..locale("common", "removedMsg"), "success")
                else
                    triggerNotify(nil, item.label.." "..locale("common", "removalFailed"), "error")
                end
            end
        end
        Helper.removePropHoldCoolDown()
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorShut(vehicle, 4, false)
        end
    end
end

RegisterNetEvent(getScript()..":client:applyArmour", function(data)
    Modify.applyArmour(data)
end)