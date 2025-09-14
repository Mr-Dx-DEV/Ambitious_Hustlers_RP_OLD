--===================================================================
-- MANUAL TRANSMISSION
--===================================================================
Modify.applyManualTransmission = function(data)
    if not Config.Overrides.manualTransmisson then return end

    local canEffect = true
    local Ped       = PlayerPedId()
    local item      = Items["manual"]
    local vehicle   = nil
    Helper.removePropHoldCoolDown()
    if data.client.remove == nil then
        print("You need to update your ox_inv items")
        return
    end

    local remove  = data.client.remove

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

        -- Check for current manual transmission status
        if remove and VehicleStatus[plate]["manual"] ~= 1 then
            return
        end
        if not remove and VehicleStatus[plate]["manual"] == 1 then
            triggerNotify(nil, item.label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end

        -- Setup
        local class = searchCar(vehicle).class
        if class == "Commercial" or class == "Helicopters" or class == "Boats" or class == "Cycles" or class == "Vans" then
            triggerNotify(nil, locale("common", "cannotInstall"), "error")
            return
        end

        local above = isVehicleLift(vehicle)
        local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))

        local emote = {
            anim = above and "idle_b" or "fixing_a_ped",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
            flag = above and 1 or 16
        }
        for _, class in pairs({"Vans", "Cycles", "Boats", "Helicopters", "Commercial", "Trains"}) do
            if searchCar(vehicle).class == class then
                canEffect = false
            end
        end
        if not canEffect then return end

        SetVehicleEngineOn(vehicle, false, false, true)
        Helper.propHoldCoolDown("screwdriver")
        Wait(10)

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)
        if not Config.SkillChecks.manualtransmission or skillCheck() then
            if not remove then
                -- Install manual transmission
                local installTime = math.random(5000,7000)
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item.label,
                    time  = installTime,
                    cancel= true,
                    icon  = "manual",
                    cam   = cam
                }) then
                    if VehicleStatus[plate]["manual"] == 1 then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "manual",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to install ^3manual ^1but it was already on the vehicle^7"
                        )
                        return
                    end

                    ExtraDamageComponents.setVehicleStatus(vehicle, "manual", 1)
                    sendLog(item.label.."(manual) - installed ["..plate.."]")
                    Helper.addCarToUpdateLoop(vehicle)
                    removeItem("manual", 1)
                    triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                else
                    triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                end
            else
                -- Remove manual transmission
                local removeTime = math.random(5000,7000)
                if progressBar({
                    label = locale("common", "actionRemoving")..": "..item.label,
                    time  = removeTime,
                    cancel= true,
                    icon  = "harness",
                    cam   = cam,
                }) then
                    if VehicleStatus[plate].manual == 0 then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "manual",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3manual ^1but it wasn't on the vehicle^7"
                        )
                        return
                    end

                    ExtraDamageComponents.setVehicleStatus(vehicle, "manual", 0)
                    sendLog(item.label.."(manual) - removed ["..plate.."]")
                    Helper.addCarToUpdateLoop(vehicle)

                    if Config.Overrides.receiveMaterials then
                        Helper.removeToMaterials("manual")
                    else
                        currentToken = triggerCallback(AuthEvent)
                        addItem("manual", 1)
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

RegisterNetEvent(getScript()..":client:applyManual", function(data)
    Modify.applyManualTransmission(data)
end)