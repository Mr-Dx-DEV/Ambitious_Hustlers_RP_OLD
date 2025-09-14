Nitrous.Effects = {}

if Config.NOS.enable then
    local flameTable, vehiclePurge, vehicleTrails = {}, {}, {}

    --==========================================================
    -- Statebags for NOS Effects
    --==========================================================

    -- PURGE
    AddStateBagChangeHandler("jim_syncPurge", nil, function(bagName, key, value)
        local entity = GetEntityFromStateBagName(bagName)
        if entity == 0 then return end
        Nitrous.Effects.PurgeToggle(entity, value[1], value[2])
    end)

    -- TRAILS
    AddStateBagChangeHandler("jim_syncTrail", nil, function(bagName, key, value)
        local entity = GetEntityFromStateBagName(bagName)
        if entity == 0 then return end
        Nitrous.Effects.TrailToggle(entity, value)
    end)

    -- FLAMES
    AddStateBagChangeHandler("jim_syncFlame", nil, function(bagName, key, value)
        local entity = GetEntityFromStateBagName(bagName)
        if entity == 0 then return end

        --if not IsPedInVehicle(PlayerPedId(), entity, false) then return end
        --if GetPedInVehicleSeat(entity, -1) ~= PlayerPedId() then return end

        if value[1] == true then
            Nitrous.Effects.FlameStart(entity, tonumber(value[2]))
        elseif value[1] == false then
            Nitrous.Effects.FlameStop(entity)
        end
    end)

    --==========================================================
    -- Purge Effects
    --==========================================================

    Nitrous.Effects.PurgeToggle = function(vehicle, enabled, size)
        local plate = Helper.getTrimmedPlate(vehicle)
        if enabled and DoesEntityExist(vehicle) then
            RequestAmbientAudioBank("CARWASH_SOUNDS", 0)
            PlaySoundFromEntity(soundId, "SPRAY", vehicle, "CARWASH_SOUNDS", 1, 0)
            local off = GetOffsetFromEntityGivenWorldCoords(vehicle, GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "engine")))
            local ptfxs = {}
            local manFound = false

            for i = 0, 3 do
                if IsThisModelABike(GetEntityModel(vehicle)) then
                    ptfxs[#ptfxs+1] = Nitrous.Effects.CreatePurgeSpray(vehicle, off.x - 0.1, off.y - 0.2, off.z, 40.0, -90.0, 70.0, size) -- Left
                    ptfxs[#ptfxs+1] = Nitrous.Effects.CreatePurgeSpray(vehicle, off.x + 0.1, off.y - 0.2, off.z, 40.0,  90.0, -70.0, size) -- Right
                else
                    for k in pairs(manualPurgeLoc) do
                        if GetEntityModel(vehicle) == k then
                            manFound = true
                            for _, v in pairs(manualPurgeLoc[k]) do
                                ptfxs[#ptfxs+1] = Nitrous.Effects.CreatePurgeSpray(vehicle, off.x + v[1], off.y + v[2], off.z + v[3], v[4], v[5], v[6], size)
                            end
                        end
                    end

                    if not manFound then
                        off = GetOffsetFromEntityGivenWorldCoords(
                            vehicle,
                            GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, "bonnet"))
                        )
                        ptfxs[#ptfxs+1] = Nitrous.Effects.CreatePurgeSpray(vehicle, off.x - 0.2, off.y + 0.5, off.z, 40.0, -20.0, 0.0, size)
                        ptfxs[#ptfxs+1] = Nitrous.Effects.CreatePurgeSpray(vehicle, off.x + 0.2, off.y + 0.5, off.z, 40.0,  20.0, 0.0, size)
                    end
                end

                if nosColour[plate] then
                    for i = 1, #ptfxs do
                        SetParticleFxLoopedColour(
                            ptfxs[i],
                            nosColour[plate][1]/255,
                            nosColour[plate][2]/255,
                            nosColour[plate][3]/255
                        )
                    end
                else
                    for i = 1, #ptfxs do
                        SetParticleFxLoopedColour(ptfxs[i], 255/255, 255/255, 255/255)
                    end
                end
            end
            vehiclePurge[vehicle] = ptfxs
        else
            StopSound(soundId)
            if vehiclePurge[vehicle] and #vehiclePurge[vehicle] > 0 then
                for _, v in pairsByKeys(vehiclePurge[vehicle]) do
                    StopParticleFxLooped(v)
                end
            end
            vehiclePurge[vehicle] = nil
        end
    end

    Nitrous.Effects.CreatePurgeSpray = function(vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale)
        if DoesEntityExist(vehicle) then
            UseParticleFxAssetNextCall("core")
            return StartParticleFxLoopedOnEntity("ent_sht_steam", vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, 0, 0, 0)
        end
    end

    --==========================================================
    -- TRAIL EFFECTS
    --==========================================================

    Nitrous.Effects.TrailToggle = function(vehicle, enabled)
        if enabled then
            vehicleTrails[vehicle] = {
                Nitrous.Effects.TrailStart(vehicle, GetEntityBoneIndexByName(vehicle, "taillight_l"), 1.0),
                Nitrous.Effects.TrailStart(vehicle, GetEntityBoneIndexByName(vehicle, "taillight_r"), 1.0),
            }
        else
            if vehicleTrails[vehicle] and #vehicleTrails[vehicle] > 0 then
                for _, particleId in pairsByKeys(vehicleTrails[vehicle]) do
                    Nitrous.Effects.TrailStop(particleId, 500)
                end
            end
            vehicleTrails[vehicle] = nil
        end
    end

    Nitrous.Effects.TrailStart = function(vehicle, bone, scale)
        if DoesEntityExist(vehicle) then
            UseParticleFxAssetNextCall("core")
            local ptfx = StartParticleFxLoopedOnEntityBone("veh_light_red_trail", vehicle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, bone, scale, false, false, false)
            SetParticleFxLoopedEvolution(ptfx, "speed", 1.0, false)
            return ptfx
        end
    end

    Nitrous.Effects.TrailStop = function(ptfx, duration)
        CreateThread(function()
            local endTime = GetGameTimer() + duration
            while GetGameTimer() < endTime do
                local scale = (endTime - GetGameTimer()) / duration
                SetParticleFxLoopedScale(ptfx, scale)
                SetParticleFxLoopedAlpha(ptfx, scale)
                Wait(0)
            end
            StopParticleFxLooped(ptfx)
        end)
    end

    --==========================================================
    -- FLAME EFFECTS
    --==========================================================
    Nitrous.Effects.FlameStart = function(entity, level)
        flameTable[entity] = true
        local wait = 0
        CreateThread(function()
            while flameTable[entity] do
                if not DoesEntityExist(entity) then break end
                if entity ~= 0 and DoesEntityExist(entity) then
                    wait = 0
                    if level == 1 then
                        Nitrous.Effects.VehicleBackfire(entity)
                        --unloadPtfxDict("veh_xs_vehicle_mods")
                    end
                    if level == 2 or level == 3 then
                        loadPtfxDict("veh_xs_vehicle_mods")
                    end
                    SetVehicleNitroEnabled(entity, true, 2.0, 5.0, 0.1, true)
                    Wait(10)
                    SetVehicleBoostActive(entity, true)
                else
                    wait = 1000
                end
                Wait(wait)
            end
            SetVehicleBoostActive(entity, false)
            SetVehicleNitroEnabled(entity, false, 0.0, 0.0, 0.0, false)
        end)
    end

    Nitrous.Effects.FlameStop = function(entity)
        flameTable[entity] = nil
    end

    --==========================================================
    -- SCREEN EFFECTS
    --==========================================================
    Nitrous.Effects.ScreenToggle = function(enabled)
        if enabled then
            StopScreenEffect("RaceTurbo")
            StartScreenEffect("RaceTurbo", 0, false)
            SetTimecycleModifier("rply_motionblur")
            ShakeGameplayCam("SKY_DIVING_SHAKE", 0.25)
        else
            StopGameplayCamShaking(true)
            SetTransitionTimecycleModifier("default", 0.35)
        end
    end
end

--==========================================================
-- Exhaust Fires
--==========================================================
Nitrous.Effects.VehicleBackfire = function(vehicle)
    local exhaustNames = { "exhaust" }
    for i = 2, 16 do
        exhaustNames[#exhaustNames+1] = "exhaust_"..i
    end
    loadPtfxDict("core")

    for _, exhaustName in pairsByKeys(exhaustNames) do
        local boneIndex = GetEntityBoneIndexByName(vehicle, exhaustName)
        if boneIndex ~= -1 then
            SetPtfxAssetNextCall("core")
            UseParticleFxAssetNextCall("core")
            StartParticleFxNonLoopedOnEntity(
                "veh_backfire",
                vehicle,
                GetOffsetFromEntityGivenWorldCoords(vehicle, GetWorldPositionOfEntityBone(vehicle, boneIndex)),
                0.0, 0.0, 0.0,
                1.25,
                false, false, false
            )
        end
    end
end


-- For testing Purge locations
--[[
CreateThread(function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId())
    while true do
        if DoesEntityExist(vehicle) then
            Nitrous.Effects.PurgeToggle(vehicle, true, 1.0)
            Wait(1000)
            Nitrous.Effects.PurgeToggle(vehicle, false)
            Wait(1000)
        end
        Wait(0)
    end
end)
]]