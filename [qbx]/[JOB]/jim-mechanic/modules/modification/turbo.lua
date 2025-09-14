--===================================================================
-- TURBO
--===================================================================
Modify.applyTurbo = function(data)
    local Ped  = PlayerPedId()
    local item = Items["turbo"]
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

        -- check if installed/uninstalled already

        if not remove and GetNumVehicleMods(vehicle, 11) == 0 then
            triggerNotify(nil, locale("common", "noOptionsAvailable"), "error")
            return
        end
        if not remove and IsToggleModOn(vehicle, 18) then
            triggerNotify(nil, item.label.." "..locale("common", "alreadyInstalled"), "error")
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

        if Config.Overrides.DoorAnimations then
            SetVehicleDoorOpen(vehicle, 4, false, false)
        end

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)

        if not Config.SkillChecks.turbo or skillCheck() then

            if not remove then
                -- Installing turbo
                local installTime = math.random(7000, 10000)
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item.label,
                    time  = installTime,
                    cancel = true,
                    icon  = "turbo",
                    cam   = cam,
                }) then
                    if IsToggleModOn(vehicle, 18) or not hasItem("turbo", 1) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "turbo",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to install ^3turbo ^1but it was already on the vehicle^7"
                        )
                        return
                    end

                    if Helper.checkToggleVehicleMod(vehicle, 18, true) then
                        sendLog(item.label.."(turbo) - installed ["..plate.."]")
                        Helper.addCarToUpdateLoop(vehicle)
                        removeItem("turbo", 1)
                        triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                    else
                        triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                    end
                else
                    triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                end
            else
                -- Removing turbo
                local removeTime = math.random(7000, 10000)
                if progressBar({
                    label = locale("common", "actionRemoving")..": "..item.label,
                    time  = removeTime,
                    cancel = true,
                    icon  = "turbo",
                    cam   = cam,
                }) then
                    if not IsToggleModOn(vehicle, 18) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "turbo",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3turbo ^1but it wasn't on the vehicle^7"
                        )
                        return
                    end

                    if Helper.checkToggleVehicleMod(vehicle, 18, false) then
                        sendLog(item.label.."(turbo) - removed ["..plate.."]")
                        Helper.addCarToUpdateLoop(vehicle)
                        if Config.Overrides.receiveMaterials then
                            Helper.removeToMaterials("turbo")
                        else
                            currentToken = triggerCallback(AuthEvent)
                            addItem("turbo", 1)
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

RegisterNetEvent(getScript()..":client:applyTurbo", function(data)
    Modify.applyTurbo(data)
end)