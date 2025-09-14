onPlayerLoaded(function()
    CreateThread(function()
        while not GlobalState.VehicleStatus do Wait(100) end
        debugPrint("^5Statebag^7: ^2Recieving ^4VehicleStatus: ^7'^6"..countTable(GlobalState.VehicleStatus).." ^2Entries^7'")
        VehicleStatus = GlobalState.VehicleStatus
    end)
end, true)

--==========================================================
-- Get/Set Vehicle Status
--==========================================================
ExtraDamageComponents = {}

-- Request vehicle status and check if its available
ExtraDamageComponents.getVehicleStatus = function(vehicle)
    debugPrint("running ExtraDamageComponents.getVehicleStatus")
    local netId = VehToNet(vehicle)

    local plate = Helper.getTrimmedPlate(vehicle)

    if not VehicleStatus[plate] then
        debugPrint("^5Debug^7: ^4GetVehicleStatus^7[^6"..plate.."^7]^2 not found^7,^2 creating^7...")
        VehicleStatus[plate] = triggerCallback(getScript()..":server:GetStatus", netId)

        local timeout = 1000
        while not VehicleStatus[plate] and timeout > 0 do
            Wait(10)
            timeout -= 10
        end
    else
        debugPrint("^5Debug^7: ^4GetVehicleStatus^7[^6"..plate.."^7]^2 cache found^7, ^2skipping check^7")
        Wait(100)
    end

    return VehicleStatus[plate]
end

ExtraDamageComponents.setVehicleStatus = function(vehicle, part, level)
    debugPrint("^5Debug^7: ^2Updating ^4VehicleStatus ^2with server^7", part, level)
    TriggerServerEvent(getScript()..":server:updateVehicleStatus", VehToNet(vehicle), part, level)
end

--==========================================================
-- Sync from State Bags
--==========================================================

-- Recieve VehicleStatus update
AddStateBagChangeHandler("VehicleStatusUpdate", nil, function(_, _, newValue)
    if not newValue or type(newValue) ~= "table" or newValue.plate == nil then return end
    -- Announce change
    debugPrint("^5StateBag^7: ^2Recieving ^4VehicleStatus ^2for plate^7: '^6"..newValue.plate.."^7'")
    -- Update local cache with server synced cache
    VehicleStatus[newValue.plate] = newValue.data
end)

AddStateBagChangeHandler("entityVehicleStatus", nil, function(bagName, key, status)
    local entity = GetEntityFromStateBagName(bagName)
    if not entity or entity == 0 or not status then return end
    debugPrint("^5StateBag^7: ^2Recieving ^4entityVehicleStatus ^2for entity^7: '^6"..entity.."^7'")
    if status and status.plate then
        if Config.Stancer.enable then
            local timeout = 15
            while not VehicleStatus[status.plate] and timeout > 0 do
                timeout -= 1
                Wait(1000)
            end
            while not VehicleStatus[status.plate] do Wait(1000) end
            if VehicleStatus[status.plate] and VehicleStatus[status.plate].stancerEnabled == 1 then
                debugPrint("^5Debug^7: ^2Adding veh ^3"..status.plate.." ^2to stance change^7")
                stanceToChange[entity] = status.plate
                Stancer.SetWheelStance(entity, status.plate)
            end
            if stanceToChange[entity] and VehicleStatus[status.plate] and VehicleStatus[status.plate].stancerEnabled == 0 then
                debugPrint("^5Debug^7: Removing veh ^3"..status.plate.." ^2from stance change^7")
                stanceToChange[entity] = nil
            end
        end
    end
end)

--==========================================================
-- Damage Random Vehicle Component
--==========================================================
local DamageComponents = { "oil", "axle", "battery", "fuel", "spark" }

ExtraDamageComponents.Damage = function(vehicle)
    if vehicle ~= 0 and DoesEntityExist(vehicle) and not IsThisModelABicycle(GetEntityModel(vehicle)) then
        local plate = Helper.getTrimmedPlate(vehicle)

        if Config.Repairs.ExtraDamages and VehicleStatus[plate] then
            local dmgFctr = math.random() + math.random(0, 2)
            local randomComponent = DamageComponents[math.random(1, #DamageComponents)]
            local durabilityTable = {
                ["oil"]     = "oillevel",
                ["axle"]    = "shaftlevel",
                ["battery"] = "cylinderlevel",
                ["spark"]   = "cablelevel",
                ["fuel"]    = "fuellevel",
            }

            -- Calculate base damage
            local baseDamage = ((math.random() + math.random(0, 1)) * dmgFctr) * 10

            -- Get the percentage modifier from the config; default to 0 if not set
            local percentageModifier = Config.Repairs.DamagePercentages[randomComponent] or 0

            -- Convert the percentage into a multiplier:
            local multiplier = 1 + (percentageModifier / 100)

            local finalDamage = baseDamage * multiplier

            -- Further adjust damage based on the level of the corresponding upgrade
            for i = 1, VehicleStatus[plate][durabilityTable[randomComponent]] do
                finalDamage -= ((finalDamage / 2) - VehicleStatus[plate][durabilityTable[randomComponent]] / 4)
            end

            finalDamage = VehicleStatus[plate][randomComponent] - finalDamage   -- calculate final damage

            if finalDamage < 0 then finalDamage = 0 end -- dont let damage go below 0

            ExtraDamageComponents.setVehicleStatus(vehicle, randomComponent, finalDamage)
            ExtraDamageComponents.Effects.Trigger(vehicle, randomComponent)
        else
            debugPrint("^5Debug^7: ^4Vehicle damaged and tried to change ^6ExtraDamages^2 but it was disabled^7")
        end
    end
end


exports("GetVehicleStatus", function(vehicle)
    return ExtraDamageComponents.getVehicleStatus(vehicle)
end)
exports("SetVehicleStatus", function(vehicle, part, level)
    return ExtraDamageComponents.setVehicleStatus(vehicle, part, level)
end)
exports("DamageRandomComponent", function(vehicle)
    return ExtraDamageComponents.Damage(vehicle)
end)

--==========================================================
-- Add/Remove Upgrade Parts
--==========================================================
ExtraDamageComponents.applyExtraPart = function(data)
    local Ped = PlayerPedId()
    Helper.removePropHoldCoolDown()

    if data.client.remove == nil then
        print("You need to update your ox_inv items")
        return
    end

    local data = data.client and data.client or data
    local item = Items[data.mod..(data.level ~= nil and data.level or "")]
                  and Items[data.mod..(data.level ~= nil and data.level or "")].label
                  or ""

    if not Helper.enforceSectionRestricton("perform") then return end
	if not Helper.haveCorrectItemJob() then return end
	if not Helper.canWorkHere() then return end
	if not Helper.isInCar() then return end
	if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then return end

	local vehicle = nil
	if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end
    local plate = Helper.getTrimmedPlate(vehicle)
    if Helper.isVehicleLocked(vehicle) then return end
	if not Helper.enforceVehicleOwned(plate) then return end

    local above = isVehicleLift(vehicle)
    local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))

    if not Helper.enforceClassRestriction(searchCar(vehicle).class) then return end

    if DoesEntityExist(vehicle) then
        local emote = {
            anim = above and "idle_b" or "fixing_a_ped",
            dict = above and "amb@prop_human_movie_bulb@idle_a" or "mini@repair",
            flag = above and 1 or 16
        }

        ExtraDamageComponents.getVehicleStatus(vehicle)
        local extrapart = ""
        -- adjust item names to status names, if needed
        if data.mod == "oilp" then
            extrapart = "oillevel"
        elseif data.mod == "drives" then
            extrapart = "shaftlevel"
        elseif data.mod == "cylind" then
            extrapart = "cylinderlevel"
        elseif data.mod == "cables" then
            extrapart = "cablelevel"
        elseif data.mod == "fueltank" then
            extrapart = "fuellevel"
        end

        local currentLevel = VehicleStatus[plate][extrapart]
        if not Helper.lookAtEngine(vehicle) then return end

        SetVehicleEngineOn(vehicle, false, false, true)
        if Config.Overrides.DoorAnimations then
            SetVehicleDoorOpen(vehicle, 4, false, false)
        end

        if data.remove ~= true then
            -- Installing new part
            if currentLevel == data.level then
                triggerNotify(nil, item.." "..locale("common", "alreadyInstalled"), "error")
            else
                local installTime = math.random(9000, 14000)
                if progressBar({
                    label = locale("common", "actionInstalling")..": "..item,
                    time = installTime,
                    cancel = true,
                    anim = emote.anim,
                    dict = emote.dict,
                    flag = emote.flag,
                    cam = cam,
                }) then
                    if (VehicleStatus[plate][extrapart] ~= currentLevel) or (not hasItem(data.mod..data.level, 1)) then
                        Helper.removePropHoldCoolDown()
                        local player = getPlayer()
                        TriggerServerEvent(getScript()..":server:DupeWarn",
                            data.mod..data.level,
                            "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to modify ^3"..data.mod..data.level.." ^1but didn't have the item^7"
                        )
                        return
                    end

                    ExtraDamageComponents.setVehicleStatus(vehicle, extrapart, data.level)
                    Helper.addCarToUpdateLoop(vehicle)
                    removeItem(data.mod..data.level, 1)

                    if currentLevel ~= 0 then
                        if Config.Overrides.receiveMaterials then
                            Helper.removeToMaterials(data.mod..currentLevel)
                        else
                            currentToken = triggerCallback(AuthEvent)
                            addItem(data.mod..currentLevel, 1)
                        end
                    end
                    triggerNotify(nil, Items[data.mod..data.level].label.." "..locale("common", "installedMsg"), "success")
                else
                    triggerNotify(nil, locale("common", "installationFailed"), "error")
                end
            end

        else
            -- Removing existing part
            local removeItemLabel = Items[data.mod..VehicleStatus[plate][extrapart]].label
            local removeTime = math.random(9000, 14000)

            if progressBar({
                label = locale("common", "actionRemoving")..": "..removeItemLabel,
                time = removeTime,
                cancel = true,
                anim = emote.anim,
                dict = emote.dict,
                flag = emote.flag,
                cam = cam,
            }) then
                if VehicleStatus[plate][extrapart] ~= currentLevel then
                    Helper.removePropHoldCoolDown()
                    local player = getPlayer()
                    TriggerServerEvent(getScript()..":server:DupeWarn",
                        data.mod..currentLevel,
                        "^1Possible Exploit^7: (^3"..player.source.."^7)"..player.name.." ^1attempted to remove ^3"..data.mod..currentLevel.." ^1but it wasn't on the vehicle^7"
                    )
                    return
                end

                ExtraDamageComponents.setVehicleStatus(vehicle, extrapart, 0)
                Helper.addCarToUpdateLoop(vehicle)

                if Config.Overrides.receiveMaterials then
                    Helper.removeToMaterials(data.mod..currentLevel)
                else
                    currentToken = triggerCallback(AuthEvent)
                    addItem(data.mod..currentLevel, 1)
                end

                triggerNotify(nil, Items[data.mod..currentLevel].label.." "..locale("common", "removedMsg"), "success")
            else
                triggerNotify(nil, locale("common", "removalFailed"), "error")
            end
        end

        SetVehicleDoorShut(vehicle, 4, false)
        Helper.removePropHoldCoolDown()
    end
end

RegisterNetEvent(getScript()..":client:applyExtraPart", function(data)
    ExtraDamageComponents.applyExtraPart(data)
end)
--==========================================================
-- Damage Effects
--==========================================================
local effectActive = false
ExtraDamageComponents.Effects = {}

ExtraDamageComponents.Effects.OdoLightFlash = function(effect)
    CreateThread(function ()
        local timeout = 5000
        while timeout > 0 do
            timeout -= 1000
            currentEffect[effect] = not currentEffect[effect]
            Wait(1000)
        end
        currentEffect[effect] = false
    end)
end

ExtraDamageComponents.Effects.oilEffect = function(vehicle)
    ExtraDamageComponents.Effects.OdoLightFlash("oilEffect")
    triggerNotify(nil, locale("damageMessages", "engineOverheating"), "warning")
    local engineHealth = GetVehicleEngineHealth(vehicle)
    SetVehicleEngineHealth(vehicle, engineHealth - math.random(20, 30))
    effectActive = false
end

ExtraDamageComponents.Effects.axleEffect = function(vehicle)
    ExtraDamageComponents.Effects.OdoLightFlash("axleEffect")
    triggerNotify(nil, locale("damageMessages", "steeringIssue"), "warning")
    for i = 0, 360 do
        SetVehicleSteeringScale(vehicle, i)
        Wait(15)
    end
    effectActive = false
end

ExtraDamageComponents.Effects.sparkEffect = function(vehicle)
    ExtraDamageComponents.Effects.OdoLightFlash("sparkEffect")
    triggerNotify(nil, locale("damageMessages", "engineStalled"), "warning")

    if GetIsVehicleEngineRunning(vehicle) then
        SetVehicleEngineOn(vehicle, false, false, true)
        Wait(5000)
        SetVehicleEngineOn(vehicle, true, false, true)
    end

    effectActive = false
end

ExtraDamageComponents.Effects.batteryEffect = function(vehicle)
    ExtraDamageComponents.Effects.OdoLightFlash("batteryEffect")
    triggerNotify(nil, locale("damageMessages", "lightsAffected"), "warning")

    local lightLvl = 1.0
    for i = 0, 1000 do
        lightLvl = lightLvl - 0.003
        SetVehicleLightMultiplier(vehicle, lightLvl)
        Wait(0)
        if lightLvl <= 0 then break end
    end

    SetVehicleBrakeLights(vehicle, false)
    SetVehicleLights(vehicle, 0)
    SetVehicleInteriorlight(vehicle, 0)
    SetVehicleLightMultiplier(vehicle, 1.0)

    Wait(2500)
    SetVehicleLights(vehicle, 2)
    effectActive = false
end

ExtraDamageComponents.Effects.fuelEffect = function(vehicle)
    ExtraDamageComponents.Effects.OdoLightFlash("fuelEffect")
    triggerNotify(nil, locale("damageMessages", "drippingSound"), "warning")

    local fuel = GetVehicleFuelLevel(vehicle)
    SetVehicleFuelLevel(vehicle, fuel - math.random(1, 6))
    effectActive = false
end

ExtraDamageComponents.Effects.Trigger = function(vehicle, randomComponent)
    if effectActive == true then return end

    local plate = Helper.getTrimmedPlate(vehicle)
    local noEffect = { "Vans", "Cycles", "Boats", "Helicopters", "Commercial", "Trains" }
    local canEffect = true

    for _, class in pairs(noEffect) do
        if searchCar(vehicle).class == class then
            canEffect = false
            break
        end
    end

    if canEffect then
        if VehicleStatus[plate] then
            local parts = {
                ["oil"] = function()
                    if VehicleStatus[plate]["oil"] <= Config.Repairs.EffectLevels["oil"] then
                        ExtraDamageComponents.Effects.oilEffect(vehicle)
                    end
                end,
                ["axle"] = function()
                    if VehicleStatus[plate]["axle"] <= Config.Repairs.EffectLevels["axle"] then
                        ExtraDamageComponents.Effects.axleEffect(vehicle)
                    end
                end,
                ["spark"] = function()
                    if VehicleStatus[plate]["spark"] <= Config.Repairs.EffectLevels["spark"] then
                        ExtraDamageComponents.Effects.sparkEffect(vehicle)
                    end
                end,
                ["battery"] = function()
                    if VehicleStatus[plate]["battery"] <= Config.Repairs.EffectLevels["battery"] then
                        ExtraDamageComponents.Effects.batteryEffect(vehicle)
                    end
                end,
                ["fuel"] = function()
                    if VehicleStatus[plate]["fuel"] <= Config.Repairs.EffectLevels["fuel"] then
                        ExtraDamageComponents.Effects.fuelEffect(vehicle)
                    end
                end,
            }

            if math.random(1, 100) <= 50 then
                parts[randomComponent]()
            end
        end
    end
end