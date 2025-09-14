--===================================================================
-- HARNESS (Standard)
--===================================================================
Modify.applyHarness = function(data)
    local canEffect = true
    local Ped       = PlayerPedId()
    local item      = Items["harness"]
    local vehicle   = nil
    if data.client.remove == nil then
        print("You need to update your ox_inv items")
        return
    end

    local remove = data.client.remove

    if not Helper.enforceSectionRestricton("perform") then return end
    if Config.Harness.JobOnly then
        if not Helper.haveCorrectItemJob() then return end
        if not Helper.canWorkHere() then return end
    end

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

        -- Check for current harness status
        if remove and VehicleStatus[plate].harness ~= 1 then
            return
        end
        if not remove and VehicleStatus[plate].harness == 1 then
            triggerNotify(nil, item.label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end

        for _, class in pairs({"Vans", "Cycles", "Boats", "Helicopters", "Commercial", "Trains"}) do
            if searchCar(vehicle).class == class then
                canEffect = false
            end
        end

        if not canEffect then return end

        -- Setup
        local above   = isVehicleLift(vehicle)
        local cam   = not above and createTempCam(Ped, GetEntityCoords(vehicle))
        local emote = {
            anim = above and "idle_b" or "fixing_a_ped",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
            flag = above and 1 or 16
        }

        Helper.propHoldCoolDown("screwdriver")
        Wait(10)

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
        if not Config.SkillChecks.harness or skillCheck() then
            if not remove then
                --======================================================
                -- Install Harness
                --======================================================
                local installTime = math.random(5000,7000)
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item.label,
                    time  = installTime,
                    cancel= true,
                    icon  = "harness",
                    cam   = cam
                }) then
                    if VehicleStatus[plate]["harness"] == 1 then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "harness",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to install ^3harness ^1but it was already on the vehicle^7"
                        )
                        return
                    end

                    ExtraDamageComponents.setVehicleStatus(vehicle, "harness", 1)
                    sendLog(item.label.."(harness) - installed ["..plate.."]")
                    Helper.addCarToUpdateLoop(vehicle)
                    removeItem("harness", 1)
                    triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                else
                    triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                end
            else
                -- Remove harness (Standard)
                local removeTime = math.random(5000,7000)
                if progressBar({
                    label = locale("common", "actionRemoving")..": "..item.label,
                    time  = removeTime,
                    cancel= true,
                    icon  = "harness",
                    cam   = cam,
                }) then
                    if VehicleStatus[plate].harness == 0 then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "harness",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3harness ^1but it wasn't on the vehicle^7"
                        )
                        return
                    end

                    ExtraDamageComponents.setVehicleStatus(vehicle, "harness", 0)
                    sendLog(item.label.."(harness) - removed ["..plate.."]")
                    Helper.addCarToUpdateLoop(vehicle)

                    if Config.Overrides.receiveMaterials then
                        Helper.removeToMaterials("harness")
                    else
                        currentToken = triggerCallback(AuthEvent)
                        addItem("harness", 1)
                    end
                    triggerNotify(nil, item.label.." "..locale("common", "removedMsg"), "success")
                else
                    triggerNotify(nil, item.label.." "..locale("common", "removalFailed"), "error")
                end
            end
        end
        Helper.removePropHoldCoolDown()
    end
end

RegisterNetEvent(getScript()..":client:applyHarness", function(data)
    Modify.applyHarness(data)
end)