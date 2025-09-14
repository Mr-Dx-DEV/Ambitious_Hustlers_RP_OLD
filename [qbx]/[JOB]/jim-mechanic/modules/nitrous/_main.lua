--==========================================================
-- DO NOT EDIT THIS SECTION UNLESS YOU KNOW WHAT YOU'RE DOING
--==========================================================
soundId       = GetSoundId()

NitrousActivated = false

Nitrous = {}

if Config.NOS.enable then
    --==========================================================
    -- NOS
    --==========================================================
    onPlayerLoaded(function()
        while not GlobalState.VehicleNitrous do Wait(100) end
        debugPrint("^5Statebag^7: ^2Recieving ^4VehicleNitrous: ^7'^6"..countTable(GlobalState.VehicleNitrous).."^7'")
        VehicleNitrous = GlobalState.VehicleNitrous
        for plate in pairs(VehicleNitrous) do
            debugPrint("^5Debug^7: ^3VehicleNitrous^7[^6" ..
                        tostring(plate).."^7] = { ^2level^7: ^4" ..
                        tonumber(VehicleNitrous[plate].level) ..
                        "^7, ^2hasnitro^7: ^4" ..
                        tostring(VehicleNitrous[plate].hasnitro).."^7 }")
        end
    end, true)

    Nitrous.localupdateLevel = function(Plate, level)
        VehicleNitrous[Plate] = { hasnitro = true, level = level }
    end

    local boosting, CurrentVehicle, CurrentTopSpeed, Plate = false, false, 0, nil
    purgemode, purgeSize, purgeCool = false, 0.3, 0
    damageTimer, boostLevel = 0, 1

    --==========================================================
    -- Statebag handler for nitrous levels
    --==========================================================

    -- Recieve VehicleStatus update
    AddStateBagChangeHandler("vehicleNitrousUpdate", nil, function(_, _, newValue)
        if not newValue or type(newValue) ~= "table" then return end
        -- Announce change
        debugPrint("^5Statebag^7: ^2Statebag change recieved^7: vehicleNitrous", json.encode(newValue))

        -- Update local cache with server synced cache
        VehicleNitrous[newValue.plate] = newValue.VehicleNitrous or nil
        -- Check if the player is in vehicle to update hud now
        local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
        if DoesEntityExist(CurrentVehicle) then
            local CPlate = Helper.getTrimmedPlate(CurrentVehicle)
            if CPlate == newValue.plate then
                --pushVehicle(CurrentVehicle)
                debugPrint("^5Debug^7: ^2Player is inside current NosChange vehicle^7, ^2updating hud^7")
                Helper.updateHudNitrous(
                    VehicleNitrous[newValue.plate] and VehicleNitrous[newValue.plate].level or 0,
                    VehicleNitrous[newValue.plate] and VehicleNitrous[newValue.plate].hasnitro or false,
                    false
                )
            end
        end
    end)

    --==========================================================
    -- Keybindings for adjusting Purge/Boost levels
    --==========================================================
    Nitrous.Keys = {}
    Nitrous.Keys.upLevel = function()
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if not vehicle or vehicle == 0 or seat ~= -1 then return end
        debugPrint("^5Debug^7: Nitrous.Keys.upLevel Triggered")
        local Plate = Helper.getTrimmedPlate(vehicle)
        if VehicleNitrous[Plate]
           and VehicleNitrous[Plate].hasnitro
           and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId()
        then
            -- Purge
            if purgemode and purgeSize < 1.0 then
                purgeSize += 0.1
                if purgeSize >= 1.0 then purgeSize = 1.0 end
                if purgeSize > 0.1 then
                    if Config.NOS.nosNotifications then
                        triggerNotify(nil, locale("nosSettings", "sprayStrength")..": "..math.floor(purgeSize * 10))
                    end
                end
            end

            -- Boost
            if not purgemode and boostLevel < 3 and not NitrousActivated then
                boostLevel = boostLevel + 1
                if boostLevel > 3 then boostLevel = 3 end
                if boostLevel <= 3 then
                    if Config.NOS.nosNotifications then
                        triggerNotify(nil, locale("nosSettings", "boostPower")..": "..boostLevel)
                    end
                end
            end
        end
    end

    Nitrous.Keys.downLevel = function()
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if not vehicle or vehicle == 0 or seat ~= -1 then return end
        debugPrint("^5Debug^7: Nitrous.Keys.downLevel Triggered")
        local Plate = Helper.getTrimmedPlate(vehicle)
        if VehicleNitrous[Plate]
           and VehicleNitrous[Plate].hasnitro
           and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId()
        then
            -- Purge
            if purgemode and purgeSize > 0.1 then
                purgeSize = purgeSize - 0.1
                if purgeSize < 0.1 then purgeSize = 0.1 end
                if purgeSize > 0.1 then
                    if Config.NOS.nosNotifications then
                        triggerNotify(nil, locale("nosSettings", "sprayStrength")..": "..math.floor(purgeSize * 10))
                    end
                end
            end

            -- Boost
            if not purgemode and boostLevel > 1 and not NitrousActivated then
                boostLevel = boostLevel - 1
                if boostLevel < 1 then boostLevel = 1 end
                if Config.NOS.nosNotifications then
                    triggerNotify(nil, locale("nosSettings", "boostPower")..boostLevel)
                end
            end
        end
    end

    Nitrous.Keys.nosToggle = function()
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if not vehicle or vehicle == 0 or seat ~= -1 then return end
        debugPrint("^5Debug^7: Nitrous.Keys.nosToggle Triggered")
        local Plate = Helper.getTrimmedPlate(vehicle)
        if VehicleNitrous[Plate]
           and VehicleNitrous[Plate].hasnitro
           and GetPedInVehicleSeat(vehicle, -1) == PlayerPedId()
        then
            if purgemode then
                purgemode = false
                if Config.NOS.nosNotifications then
                    triggerNotify(nil, locale("nosSettings", "boostMode"), "success")
                end
            else
                purgemode = true
                if Config.NOS.nosNotifications then
                    triggerNotify(nil, locale("nosSettings", "purgeMode"), "success")
                end
            end
        end
    end

    Nitrous.Keys.boostTrigger = function()
        local Ped = PlayerPedId()
        CurrentVehicle = GetVehiclePedIsIn(Ped)
        if not CurrentVehicle or CurrentVehicle == 0 or seat ~= -1 then return end
        debugPrint("^5Debug^7: Nitrous.Keys.boostTrigger Triggered")

        if IsPedInAnyVehicle(Ped) then
            local Plate = Helper.getTrimmedPlate(CurrentVehicle)
            if VehicleNitrous[Plate]
               and VehicleNitrous[Plate].hasnitro
               and (GetVehicleWheelieState(CurrentVehicle) ~= 129
               and GetVehicleWheelieState(CurrentVehicle) ~= 65
               and not IsEntityInAir(CurrentVehicle))
               and GetPedInVehicleSeat(CurrentVehicle, -1) == Ped
            then
                Helper.updateHudNitrous(VehicleNitrous[Plate].level, VehicleNitrous[Plate].hasnitro, false)

                -- Purge
                if purgemode then
                    TriggerServerEvent(getScript()..":server:SyncPurge", VehToNet(CurrentVehicle), true, purgeSize)
                    CreateThread(function()
                        while boosting do
                            purgeCool += 1
                            Wait(500)
                        end
                    end)
                end

                -- Actual NOS Boost
                if not purgemode then
                    if (GetEntitySpeed(CurrentVehicle) * 3.6) > 25.0 and not boosting then
                        boosting         = true
                        NitrousActivated = true
                        ApplyForceToEntity(CurrentVehicle, 3, 0, Config.NOS.NosBoostPower[boostLevel], 0, 0.0, -1.2, 0.0, 0, true, true, true, false, true)

                        if Config.NOS.EnableScreen then
                            Nitrous.Effects.ScreenToggle(true)
                        end
                        if Config.NOS.EnableTrails then
                            TriggerServerEvent(getScript()..":server:SyncTrail", VehToNet(CurrentVehicle), true)
                        end
                        if Config.NOS.EnableFlame then
                            TriggerServerEvent(getScript()..":server:SyncFlame", VehToNet(CurrentVehicle), true, boostLevel)
                        end

                        SetVehicleBoostActive(CurrentVehicle, true)
                        -- Handling/Performance Thread
                        CreateThread(function()
                            while NitrousActivated and Config.NOS.HandlingChange do
                                if boostLevel == 1 then
                                    SetVehicleCheatPowerIncrease(CurrentVehicle, 1.25)
                                    SetVehicleTurboPressure(CurrentVehicle, 1.25 * GetVehicleCurrentRpm(CurrentVehicle))
                                    SetVehicleHandlingFloat(CurrentVehicle, "CHandlingData", "fMass", defVehStats[Plate]["hFloat"] + 30.0)
                                end
                                if boostLevel == 2 then
                                    SetVehicleCheatPowerIncrease(CurrentVehicle, 1.5)
                                    SetVehicleTurboPressure(CurrentVehicle, 1.5 * GetVehicleCurrentRpm(CurrentVehicle))
                                    SetVehicleHandlingFloat(CurrentVehicle, "CHandlingData", "fMass", defVehStats[Plate]["hFloat"] + 60.0)
                                end
                                if boostLevel == 3 then
                                    SetVehicleCheatPowerIncrease(CurrentVehicle, 2.2)
                                    SetVehicleTurboPressure(CurrentVehicle, 2.2 * GetVehicleCurrentRpm(CurrentVehicle))
                                    SetVehicleHandlingFloat(CurrentVehicle, "CHandlingData", "fMass", defVehStats[Plate]["hFloat"] + 90.0)
                                end
                                ModifyVehicleTopSpeed(CurrentVehicle, Config.NOS.NosBoostPower[boostLevel])
                                Wait(0)
                            end
                        end)

                        -- NOS Usage Thread
                        CreateThread(function()
                            while NitrousActivated do
                                if VehicleNitrous[Plate].level - 1 >= 0 then
                                    local nitrousUseRate = Config.NOS.NitrousUseRate
                                    if boostLevel == 1 then
                                        nitrousUseRate = nitrousUseRate - (Config.NOS.NitrousUseRate / 2)
                                    end
                                    if boostLevel == 3 then
                                        nitrousUseRate = nitrousUseRate + (Config.NOS.NitrousUseRate / 2)
                                    end
                                    Nitrous.localupdateLevel(Plate, (VehicleNitrous[Plate].level - nitrousUseRate))
                                    Helper.updateHudNitrous(VehicleNitrous[Plate].level, VehicleNitrous[Plate].hasnitro, true)

                                elseif VehicleNitrous[Plate].level - 1 <= 0 then
                                    TriggerServerEvent(getScript()..":server:setNitrous", VehToNet(CurrentVehicle), { unloadNitrous = true })
                                    currentToken = triggerCallback(AuthEvent)
                                    addItem("noscan", 1)
                                    if Config.NOS.EnableScreen then
                                        Nitrous.Effects.ScreenToggle(false)
                                    end
                                    if Config.NOS.EnableTrails then
                                        TriggerServerEvent(getScript()..":server:SyncTrail", VehToNet(CurrentVehicle), false)
                                    end
                                    if Config.NOS.EnableFlame then
                                        TriggerServerEvent(getScript()..":server:SyncFlame", VehToNet(CurrentVehicle), false, nil, nil)
                                    end
                                    NitrousActivated = false
                                    boosting         = false
                                    SetVehicleBoostActive(CurrentVehicle, false)

                                    -- Reset vehicle modifiers
                                    if Config.NOS.HandlingChange then
                                        SetVehicleCheatPowerIncrease(CurrentVehicle, defVehStats[Plate]["pIncrease"])
                                        SetVehicleHandlingFloat(CurrentVehicle, "CHandlingData", "fMass", defVehStats[Plate]["hFloat"])
                                        ModifyVehicleTopSpeed(CurrentVehicle, defVehStats[Plate]["speedMod"])
                                    end
                                end

                                Wait(100)
                                if IsVehicleStopped(CurrentVehicle) or (GetEntitySpeed(CurrentVehicle) * 3.6) < 20.0 then
                                    ExecuteCommand("-nosBoost")
                                end
                            end
                        end)

                        -- Overheating/Explosion Thread
                        CreateThread(function()
                            local plate = Helper.getTrimmedPlate(CurrentVehicle)
                            while NitrousActivated do
                                damageTimer = damageTimer + 1
                                local engDamage = math.random(14, 19)
                                local dmgFctr   = (math.random(40, 60) / 10)

                                if damageTimer > 7 then
                                    CreateThread(function()
                                        RequestAmbientAudioBank("DLC_sum20_Open_Wheel_Racing_Sounds", 0)
                                        PlaySoundFromEntity(soundId, "tyre_health_warning", CurrentVehicle, "DLC_sum20_Open_Wheel_Racing_Sounds", 1, 0)
                                        Wait(1000)
                                        StopSound(soundId)
                                    end)

                                    if boostLevel == 1 then
                                        engDamage = math.random(0, 13)
                                        dmgFctr   = (math.random(10, 20) / 10)
                                    elseif boostLevel == 3 then
                                        engDamage = math.random(19, 25)
                                        dmgFctr   = (math.random(40, 70) / 10)
                                    end

                                    SetVehicleEngineHealth(CurrentVehicle, (GetVehicleEngineHealth(CurrentVehicle) - engDamage))

                                    if Config.Repairs.ExtraDamages == true then
                                        ExtraDamageComponents.Damage(plate, GetVehicleEngineHealth(CurrentVehicle), GetVehicleBodyHealth(CurrentVehicle))
                                    end
                                end

                                if damageTimer >= 14 then
                                    damageTimer = 14
                                    if boostLevel == 3 and Config.NOS.boostExplode then
                                        local coords = GetOffsetFromEntityInWorldCoords(CurrentVehicle, 0.0, 1.6, 1.0)
                                        AddExplosion(coords, 23, 0.8, 1, 0, 1.0, true)
                                        TriggerServerEvent(getScript().."server:setNitrous", VehToNet(CurrentVehicle), { unloadNitrous = true })

                                        if Config.NOS.EnableScreen then
                                            Nitrous.Effects.ScreenToggle(false)
                                        end
                                        if Config.NOS.EnableTrails then
                                            TriggerServerEvent(getScript()..":server:SyncTrail", VehToNet(CurrentVehicle), false)
                                        end
                                        NitrousActivated = false
                                        boosting = not boosting
                                        SetVehicleBoostActive(CurrentVehicle, false, 0.0, 0.0, 0.0, false)

                                        CreateThread(function()
                                            if Config.NOS.EnableFlame then
                                                for i = 0, 10 do
                                                    TriggerServerEvent(getScript()..":server:SyncFlame", VehToNet(CurrentVehicle), true, nil, nil)
                                                    Wait(math.random(200, 500))
                                                    TriggerServerEvent(getScript()..":server:SyncFlame", VehToNet(CurrentVehicle), false, nil, nil)
                                                    Wait(math.random(0, 100))
                                                end
                                            end
                                        end)

                                        boostLevel = 1
                                        damageTimer = 0
                                    end
                                end
                                Wait(1000)
                            end
                        end)
                    end
                end
            end
        end
    end

    Nitrous.Keys.boostStop = function()
        local Ped = PlayerPedId()
        if not CurrentVehicle or CurrentVehicle == 0 or seat ~= -1 then return end
        debugPrint("^5Debug^7: Nitrous.Keys.boostStop Triggered")
        local Plate = Helper.getTrimmedPlate(CurrentVehicle)

        TriggerServerEvent(getScript()..":server:SyncPurge", VehToNet(CurrentVehicle), false, nil)
        if NitrousActivated then
            StopSound(soundId)
            SetVehicleBoostActive(CurrentVehicle, false)

            if Config.NOS.EnableFlame then
                TriggerServerEvent(getScript()..":server:SyncFlame", VehToNet(CurrentVehicle), false, nil, nil)
            end

            Helper.updateHudNitrous(VehicleNitrous[Plate].level, VehicleNitrous[Plate].hasnitro, false)

            NitrousActivated = false
            --boosting = false
            purgeCool = 0
            damageTimer = 0

            -- Reset veh modifiers
            if Config.NOS.HandlingChange and CurrentVehicle then
                SetVehicleCheatPowerIncrease(CurrentVehicle, defVehStats[Plate]["pIncrease"])
                SetVehicleHandlingFloat(CurrentVehicle, "CHandlingData", "fMass", defVehStats[Plate]["hFloat"])
                ModifyVehicleTopSpeed(CurrentVehicle, defVehStats[Plate]["speedMod"])
            end

            if Config.NOS.EnableTrails then
                TriggerServerEvent(getScript()..":server:SyncTrail", VehToNet(CurrentVehicle), false)
            end
            if Config.NOS.EnableScreen then
                Nitrous.Effects.ScreenToggle(false)
            end

            if VehicleNitrous[Plate] then
                TriggerServerEvent(getScript()..":server:setNitrous", VehToNet(CurrentVehicle), { updateNitrous = true, level = VehicleNitrous[Plate].level })
                CreateThread(function()
                    while boosting do
                        Wait(1200)
                        purgeCool += 1
                        if purgeCool >= Config.NOS.NitrousCoolDown then
                            if Config.NOS.CooldownConfirm and boosting then
                                RequestAmbientAudioBank("dlc_xm_heists_fm_uc_sounds", 0)
                                PlaySoundFromEntity(soundId, "download_complete", GetVehiclePedIsIn(Ped), "dlc_xm_heists_fm_uc_sounds", 1, 0)
                                Wait(200)
                            end
                            purgeCool = 0
                            damageTimer = 0
                            boosting = false
                        end
                    end
                end)
            end
            CurrentVehicle = nil
            Plate          = nil
        end
    end

    RegisterKeyMapping("levelUP", locale("nosSettings", "keyBoostLevelUp"), "keyboard", "PRIOR")
    RegisterCommand("levelUP", function() Nitrous.Keys.upLevel() end, false)

    RegisterKeyMapping("levelDown", locale("nosSettings", "keyBoostLevelDown"), "keyboard", "NEXT")
    RegisterCommand("levelDown", function() Nitrous.Keys.downLevel() end, false)

    RegisterKeyMapping("nosSwitch", locale("nosSettings", "keyToggleBoost"), "keyboard", "LCONTROL")
    RegisterCommand("nosSwitch", function() Nitrous.Keys.nosToggle() end, false)

    RegisterKeyMapping("+nosBoost", locale("nosSettings", "keyBoost"), "keyboard", "LSHIFT")
    RegisterCommand("+nosBoost", function() Nitrous.Keys.boostTrigger() end, false)
    RegisterCommand("-nosBoost", function() Nitrous.Keys.boostStop() end, false)

    --==========================================================
    -- Forcibly Stop NOS and effects
    --==========================================================
    Nitrous.forceStopNos = function()
        local Ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(Ped, true)

        if veh == 0 then
            debugPrint("^5Debug^7: ^3forceStopNos^7: ^4Driver left vehicle, resetting NOS effects")
            SetVehicleBoostActive(veh, false, 0.0, 0.0, 0.0, false)

            TriggerServerEvent(getScript()..":server:SyncPurge", VehToNet(veh), false, nil)
            if Config.NOS.EnableFlame then
                TriggerServerEvent(getScript()..":server:SyncFlame", VehToNet(veh), false, nil, nil)
            end
            if Config.NOS.EnableTrails then
                TriggerServerEvent(getScript()..":server:SyncTrail", VehToNet(veh), false)
            end
            if Config.NOS.EnableScreen then
                Nitrous.Effects.ScreenToggle(false)
            end

            local plate = Helper.getTrimmedPlate(veh)
            if VehicleNitrous[plate] then
                TriggerServerEvent(getScript()..":server:setNitrous", VehToNet(veh), { updateNitrous = true, level = VehicleNitrous[plate].level })
                Helper.updateHudNitrous(VehicleNitrous[Plate].level, VehicleNitrous[Plate].hasnitro, false)
            else
                Helper.updateHudNitrous()
            end

            if Config.NOS.HandlingChange and CurrentVehicle then
                if DoesEntityExist(veh) and veh ~= 0 and veh ~= nil and defVehStats[plate] ~= nil then
                    SetVehicleCheatPowerIncrease(CurrentVehicle, defVehStats[plate]["pIncrease"])
                    SetVehicleHandlingFloat(CurrentVehicle, "CHandlingData", "fMass", defVehStats[plate]["hFloat"])
                    ModifyVehicleTopSpeed(CurrentVehicle, defVehStats[plate]["speedMod"])
                end
            end
        end

        NitrousActivated = false
        boostLevel       = 1
        damageTimer      = 0
        purgeCool        = 0
        boosting         = false
        CurrentVehicle   = nil
        Plate            = nil
        Wait(1500)
        StopSound(soundId)
    end

end

Nitrous.GetNosLevel = function(vehicle)
    local plate = Helper.getTrimmedPlate(vehicle)
    if VehicleNitrous[plate] then
        return VehicleNitrous[plate].level, VehicleNitrous[plate].hasnitro
    else
        return 0, false
    end
end

exports("GetNosLevel", function(vehicle)
    return Nitrous.GetNosLevel(vehicle)
end)