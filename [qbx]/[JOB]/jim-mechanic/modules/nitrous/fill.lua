if Config.NOS.enable then

    --==========================================================
    -- NOS Refill
    --==========================================================
    local refilling = false

    Nitrous.NosCanFill = function(data)
        local Ped = PlayerPedId()
        if refilling then return end

        if not hasItem("noscan", 1) then
            triggerNotify(nil, locale("nosSettings", "needNOSCan"), "warning")
            return
        end

        local cash = 0
        if isStarted(OXInv) then
            if hasItem("money", Config.NOS.NosRefillCharge) then
                cash = Config.NOS.NosRefillCharge
            end
        else
            cash = getPlayer().cash
        end

        if cash >= Config.NOS.NosRefillCharge then
            refilling = true
            local coords = GetOffsetFromEntityInWorldCoords(data.tank, 0, 0.5, 0.02)

            local prop = makeProp({
                prop   = "v_ind_cs_gascanister",
                coords = vec4(coords.x, coords.y, coords.z + 1.03, GetEntityHeading(data.tank))
            }, 1, 1)

            local cam = createTempCam(Ped, GetEntityCoords(prop))
            lookEnt(coords)

            if #(coords - GetEntityCoords(Ped)) > 1.3 then
                TaskGoStraightToCoord(Ped, coords, 0.5, 400, 0.0, 0)
                Wait(400)
            end

            UseParticleFxAssetNextCall("core")
            local gas = StartParticleFxLoopedOnEntity("ent_sht_steam", prop, 0.02, 0.00, 0.42, 0.0, 0.0, 0.0, 0.1, 0, 0, 0)

            if progressBar({
                label = locale("nosSettings", "refillingMsg").." "..Items["nos"].label,
                time  = math.random(8000, 12000),
                cancel= true,
                task  = "CODE_HUMAN_MEDIC_TEND_TO_DEAD",
                cam   = cam,
                request = true
            }) then
                TriggerServerEvent(getScript()..":chargeCash", Config.NOS.NosRefillCharge, data.society)
                addItem("nos", 1)
                removeItem("noscan", 1)
                triggerNotify(nil, locale("liveryMod", "nosPurchased"), "success")
            end

            DeleteObject(prop)
            Helper.removePropHoldCoolDown()
            StopParticleFxLooped(gas)
            prop = nil
            gas  = nil
            refilling = false
        else
            triggerNotify(nil, locale("nosSettings", "insufficientCash"), "error")
            return
        end
    end

    --==========================================================
    -- Adding NOS to Vehicle
    --==========================================================
    Nitrous.nosAdd = function(ped, vehicle)
        local item = Items["nos"]

        local above = isVehicleLift(vehicle)
        local cam = not above and createTempCam(ped, GetEntityCoords(vehicle))

        local emote = {
            anim = above and "idle_b" or "fixing_a_ped",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
            flag = above and 1 or 16
        }

        triggerNotify(nil, locale("common", "actionInstalling")..": "..item.label, "success")

        if progressBar({
            label = locale("common", "actionInstalling")..": "..item.label,
            time = math.random(7000, 10000),
            anim = emote.anim,
            dict = emote.dict,
            flag = emote.flag,
            cam = cam,
            cancel = true,
        }) then

            SetVehicleModKit(vehicle, 0)
            local plate = Helper.getTrimmedPlate(vehicle)

            if VehicleNitrous[plate] then
                currentToken = triggerCallback(AuthEvent)
                addItem("noscan", 1)
            end

            TriggerServerEvent(getScript()..":server:setNitrous", VehToNet(vehicle), { loadNitrous = true })
            Helper.addCarToUpdateLoop(vehicle)
            removeItem("nos", 1)
            triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
        else
            triggerNotify(nil, item.label..locale("common", "installationFailed"), "error")
        end

        if Config.Overrides.DoorAnimations then
            SetVehicleDoorsShut(vehicle, 4, false)
        end

        ClearPedTasks(ped)
        Helper.removePropHoldCoolDown()
    end

    Nitrous.nosFail = function(ped, vehicle)
        stopTempCam()
        triggerNotify(nil, Items["nos"].label.." "..locale("common", "installationFailed"), "error")
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorShut(vehicle, 4, false)
        end
        Helper.removePropHoldCoolDown()
        if Config.NOS.explosiveFail then
            local chance = math.random(1, 10)
            if not Helper.haveCorrectItemJob() then
                if chance == 10 then
                    SetVehicleDoorBroken(vehicle, 4, 0) -- Rip Hood off
                    Wait(100)
                    AddExplosion(GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 1.6, 1.0), 2, 0.8, 1, 0, 1.0, true)
                end
            elseif Config.NOS.explosiveFailJob then
                if chance == 10 then
                    SetVehicleDoorBroken(vehicle, 4, 0) -- Rip Hood off
                    Wait(100)
                    AddExplosion(GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 1.6, 1.0), 2, 0.8, 1, 0, 1.0, true)
                end
            end
        end
    end

    --==========================================================
    -- Mechanic Remove NOS
    --==========================================================
    Nitrous.RemoveNos = function()
        local item = Items["nos"]
        if not Helper.haveCorrectItemJob() then return end

        local Ped    = PlayerPedId()
        local coords = GetEntityCoords(Ped)
        local vehicle= Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
        local plate = Helper.getTrimmedPlate(vehicle)
        if Helper.isCarParked(plate) then
            triggerNotify(nil, "Vehicle is hard parked", "error")
            return
        end
        local above = isVehicleLift(vehicle)
        if Helper.isVehicleLocked(vehicle) then return end
        TaskTurnPedToFaceEntity(Ped, vehicle, 1000)
        Wait(1000)

        local emote = {
            anim = above and "idle_b" or "fixing_a_ped",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
            flag = above and 1 or 16
        }
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorOpen(vehicle, 4, false, false)
        end

        playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)

        if not Config.SkillChecks.nos or skillCheck() then
            local removeTime = math.random(7000, 10000)
            if progressBar({
                label = locale("common", "actionRemoving")..": "..item.label,
                time  = removeTime,
                icon  = "mechanic_tools",
                request = true
            }) then

                if Config.Overrides.DoorAnimations then
                    SetVehicleDoorShut(vehicle, 4, false)
                end
                Helper.addCarToUpdateLoop(vehicle)
                TriggerServerEvent(getScript()..":server:setNitrous", VehToNet(vehicle), { unloadNitrous = true })
                addItem("noscan", 1)
                triggerNotify(nil, item.label.." "..locale("common", "removedMsg"), "success")
            else
                triggerNotify(nil, item.label..locale("common", "removalFailed"), "error")
            end
        end
        Helper.removePropHoldCoolDown()
    end

    Nitrous.applyNos = function()
        local Ped = PlayerPedId()
        local coords = GetEntityCoords(Ped)

        if Config.NOS.JobOnly then
            if not Helper.haveCorrectItemJob() then return end
            if not Helper.canWorkHere() then return end
        end

        if not Helper.isInCar() then return end
        if not Helper.isAnyVehicleNear(coords) then return end

        local vehicle = nil
        if not IsPedInAnyVehicle(Ped, false) then
            vehicle = Helper.getClosestVehicle(coords)
            pushVehicle(vehicle)
        end
        local plate = Helper.getTrimmedPlate(vehicle)
        if Helper.isCarParked(plate) then
            triggerNotify(nil, "Vehicle is hard parked", "error")
            return
        end
        if Helper.isVehicleLocked(vehicle) then return end

        if DoesEntityExist(vehicle) then
            if not IsToggleModOn(vehicle, 18) then
                triggerNotify(nil, locale("nosSettings", "turboNotInstalled"), "error")
                return
            end

            if not Helper.lookAtEngine(vehicle) then return end

            SetVehicleEngineOn(vehicle, false, false, false)
            Wait(1000)

            playAnim(above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
                     above and "idle_b" or "fixing_a_ped",
                     35000, 16)

            if Config.Overrides.DoorAnimations then
                SetVehicleDoorOpen(vehicle, 4, false, false)
            end

            if not Config.SkillChecks.nos or skillCheck() then
                Nitrous.nosAdd(Ped, vehicle)
            else
                Nitrous.nosFail(Ped, vehicle)
            end
        end
    end

    RegisterNetEvent(getScript()..":client:applyNOS", function()
        Nitrous.applyNos()
    end)
end