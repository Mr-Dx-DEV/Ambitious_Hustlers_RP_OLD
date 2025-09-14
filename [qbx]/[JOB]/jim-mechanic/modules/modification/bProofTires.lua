--===================================================================
-- BULLET-PROOF TIRES
--===================================================================
Modify.applyBulletProofTires = function(data)
    local Ped  = PlayerPedId()
    local item = Items["bprooftires"]
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
        if GetNumVehicleMods(vehicle, 11) == 0 then
            triggerNotify(nil, locale("common", "noOptionsAvailable"), "error")
            return
        end

        if (GetVehicleTyresCanBurst(vehicle) == false) and (remove == false) then
            triggerNotify(nil, item.label.." "..locale("common", "alreadyInstalled"), "error")
            return
        end

        -- Setup
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
        if not Config.SkillChecks.bprooftires or skillCheck() then
            if not remove then
                -- Install bulletproof
                local installTime = math.random(7000, 10000)
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item.label,
                    time  = installTime,
                    cancel= true,
                    cam   = cam,
                }) then
                    SetVehicleModKit(vehicle, 0)
                    if GetVehicleTyresCanBurst(vehicle) == false then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "bprooftires",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to install ^3bprooftires ^1but it was already installed^7"
                        )
                        return
                    end

                    sendLog(item.label.."(bprooftires) - changed ["..plate.."]")
                    for i = 0, 4 do
                        SetVehicleTyreFixed(vehicle, i)
                    end
                    SetVehicleTyresCanBurst(vehicle, false)
                    Helper.addCarToUpdateLoop(vehicle)
                    removeItem("bprooftires", 1)

                    -- If drift tires were enabled, revert them
                    if GetDriftTyresEnabled(vehicle) ~= false then
                        if Config.Overrides.receiveMaterials then
                            Helper.removeToMaterials("drifttires")
                        else
                            currentToken = triggerCallback(AuthEvent)
                            addItem("drifttires", 1)
                        end
                        SetDriftTyresEnabled(vehicle, false)
                        triggerNotify(nil, locale("tireActions", "removeDriftTires"), "success")
                    end
                    triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                else
                    triggerNotify(nil, item.label..locale("common", "installationFailed"), "error")
                end
            else
                -- Remove bulletproof
                local removeTime = math.random(7000, 10000)
                if progressBar({
                    label = locale("common", "actionRemoving")..": "..item.label,
                    time  = removeTime,
                    cancel= true,
                    cam   = cam,
                }) then
                    SetVehicleModKit(vehicle, 0)
                    if GetVehicleTyresCanBurst(vehicle) ~= false then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            "bprooftires",
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3bprooftires ^1but vehicle didn't have it^7"
                        )
                        return
                    end

                    sendLog(item.label.."(bprooftires) - changed ["..plate.."]")
                    for i = 0, 4 do
                        SetVehicleTyreFixed(vehicle, i)
                    end
                    SetVehicleTyresCanBurst(vehicle, true)
                    Helper.addCarToUpdateLoop(vehicle)

                    if Config.Overrides.receiveMaterials then
                        Helper.removeToMaterials("bprooftires")
                    else
                        currentToken = triggerCallback(AuthEvent)
                        addItem("bprooftires", 1)
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

RegisterNetEvent(getScript()..":client:applyBulletProof", function(data)
    Modify.applyBulletProofTires(data)
end)