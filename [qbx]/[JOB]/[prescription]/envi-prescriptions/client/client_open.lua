-----------------For support, scripts, and more----------------
--------------- https://discord.gg/envi-scripts  --------------
---------------------------------------------------------------

local timeouts = {}
local overdose = false
local overdoseCount = 0
local drugsTaken = 0
local blurryvision = false
local visionCycles = 0
local completedCycles = 0
local isHealing = false
local healNow = false
local armorNow = false
local restoreStamina = false
local sippinLean = false
local sipsTaken = 0
local takingSip = false
local leanProp = nil

-- New function for 3.0
function GiveVehicleKeys(vehicle)
    -- add your vehicle keys Client trigger here
end

function CallThePolice(coords)
    if GetResourceState('ps-dispatch') == 'started' then
        exports['ps-dispatch']:StoreRobbery()
    end
    if GetResourceState('cd_dispatch') == 'started' then
        local data = exports['cd_dispatch']:GetPlayerInfo() -- Example of CD-Dispatch
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = { 'police', },
            coords = data.coords,
            title = 'Shoplifting Report',
            message = 'A ' .. data.sex .. ' has been reported shoplifting at ' .. data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 66,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = 'Shoplifting Report',
                time = 5,
                radius = 0,
            }
        })
    end
end

function PanicButton(coords)
    if GetResourceState('ps-dispatch') == 'started' then
        exports['ps-dispatch']:StoreRobbery()
    end
    if GetResourceState('cd_dispatch') == 'started' then
        local data = exports['cd_dispatch']:GetPlayerInfo() -- Example of CD-Dispatch
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = { 'police', },
            coords = data.coords,
            title = 'Panic Button ALERT!',
            message = 'A panic button has been pressed at ' .. data.street,
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 66,
                scale = 1.2,
                colour = 3,
                flashes = false,
                text = 'Panic Button ALERT!',
                time = 5,
                radius = 0,
            }
        })
    end
end

-- loop to lower drugsTaken every 5 minutes
CreateThread(function()
    while true do
        Wait(300000)
        if drugsTaken > 0 then
            drugsTaken = drugsTaken - 1
        end
    end
end)

local function playAnimations(anim)
    if anim == 'pill' then
        local ped = cache.ped
        local dict, anim = "mp_suicide", "pill"
        Framework.LoadAnimDict(dict)
        TaskPlayAnim(cache.ped, dict, anim, 8.0, -8, -1, 49, 0, false, false, false)
        Wait(2830)
        ClearPedTasks(cache.ped)
    elseif anim == 'needle' then
        local prop = `p_syringe_01_s`
        local ped = cache.ped
        local pos = GetEntityCoords(cache.ped)
        Framework.LoadAnimDict('rcmpaparazzo1ig_4')
        Framework.LoadModel('p_syringe_01_s')
        TaskPlayAnimAdvanced(cache.ped, 'rcmpaparazzo1ig_4', 'miranda_shooting_up', pos.x, pos.y, pos.z, 0.0, 0.0,
            GetEntityHeading(cache.ped), 8.0, -8.0, -1, 48, 0.55, 0, 0)
        --needle = CreateObject(prop, pos.x, pos.y, pos.z, true, true, true)
        --AttachEntityToEntity(needle, ped, 28422, 0.05, 0.14, 0.26, -42.6, 40.6, -88.4, 0)
        RemoveAnimDict('rcmpaparazzo1ig_4')
        Wait(2830)
        ClearPedTasks(cache.ped)
    end
end

local function healEffects()
    healNow = true
    local healCount = 0
    while healNow do
        local health = GetEntityHealth(cache.ped)
        healCount = healCount + 1
        SetEntityHealth(cache.ped, health + 15)
        Wait(3000)
        if healCount >= 5 then
            healNow = false
            break
        end
    end
end

local function startHealing()
    if not isHealing then
        isHealing = true
        healEffects()
    end
end


local function armorEffects()
    armorNow = true
    local armorCount = 0
    while armorNow do
        local armor = GetPedArmour(cache.ped)
        armorCount = armorCount + 1
        SetPedArmour(cache.ped, armor + math.random(5, 15))
        Wait(3000)
        if armorCount >= 5 then
            armorNow = false
            break
        end
    end
end

local function staminaEffects()
    restoreStamina = true
    local staminaCount = 0
    while restoreStamina do
        staminaCount = staminaCount + 1
        RestorePlayerStamina(PlayerId(), 1.0)
        if staminaCount >= 5 then
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
            restoreStamina = false
            staminaCount = 0
            break
        end
        Wait(3000)
    end
end


local function blurVision()
    local random = math.random(200, 500)
    blurryvision = true
    completedCycles = math.random(3, 10)
    while blurryvision do
        visionCycles = visionCycles + 1
        local isDriving = IsPedInAnyVehicle(cache.ped, false) and
            GetPedInVehicleSeat(GetVehiclePedIsIn(cache.ped, false), -1) == cache.ped
        if not isDriving then
            DoScreenFadeOut(random)
            Wait(random)
            TriggerScreenblurFadeIn(1000)
            DoScreenFadeIn(math.random(random))
            Wait(math.random(2500, 10000))
            DoScreenFadeOut(random)
            TriggerScreenblurFadeOut(1000)
            Wait(random)
            DoScreenFadeIn(random)
        end
        Wait(math.random(15000, 60000))
        if visionCycles >= completedCycles then
            blurryvision = false
            break
        end
    end
end

local function speedEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.3)
    SetTimeout(30000, function()
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    end)
    staminaEffects()
end

local function strengthEffect()
    for _, weapon in ipairs(Config.MeleeWeapons) do
        SetWeaponDamageModifier(GetHashKey(weapon), 2.0)
    end
    SetTimeout(60000, function()
        for _, weapon in ipairs(Config.MeleeWeapons) do
            SetWeaponDamageModifier(GetHashKey(weapon), 1.0)
        end
    end)
end

local function reduceStress()
    if GetResourceState('envi-hud') == 'started' then
        exports['envi-hud']:RemoveStress(math.random(25, 60)) -- new envi-hud stress detection for 3.0
    end
    -- Add your stress system here
    --TriggerEvent('hud:client:RelieveStress', math.random(25,60))   -- Uncomment this line if you are using qb-core stress
end


local function visionEffect()
    SetTimecycleModifier('spectator6')
    SetTimeout(30000, function()
        SetTimecycleModifier('default')
    end)
end

local function visionEffect2()
    SetTimecycleModifier('spectator6')
    SetTimeout(30000, function()
        SetTimecycleModifier('default')
    end)
end

local function motionBlur()
    SetPedMotionBlur(cache.ped, true)
    SetTimeout(30000, function()
        SetPedMotionBlur(cache.ped, false)
    end)
end

local function slowEffect()
    SetRunSprintMultiplierForPlayer(PlayerId(), 0.5)
    SetTimeout(30000, function()
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    end)
end

local function drowsyEffect()
    Wait(math.random(7000, 20000))
    SetRunSprintMultiplierForPlayer(PlayerId(), 0.7)
    RequestClipSet('move_m@drunk@slightlydrunk')
    while not HasClipSetLoaded('move_m@drunk@slightlydrunk') do
        Wait(100)
    end
    SetPedMovementClipset(cache.ped, 'move_m@drunk@slightlydrunk', true)
    local blackoutCount = 0
    local blackouts = math.random(1, 3)
    for i = 1, blackouts do
        blackoutCount = blackoutCount + 1
        local random = math.random(3000, 15000)
        local isDriving = IsPedInAnyVehicle(cache.ped, false) and
            GetPedInVehicleSeat(GetVehiclePedIsIn(cache.ped, false), -1) == cache.ped
        if not isDriving then
            DoScreenFadeOut(250)
            Wait(500)
            DoScreenFadeIn(250)
            Wait(500)
            DoScreenFadeOut(300)
            Wait(600)
            DoScreenFadeIn(650)
            Wait(math.random(5000, 15000))
            SetPedToRagdoll(cache.ped, random, random, 0, false, false, false)
            DoScreenFadeOut(random)
            Wait(random)
            Wait(math.random(1000, 7000))
            DoScreenFadeIn(math.random(500, 3000))
        end
        Wait(math.random(5000, 15000))
        if blackoutCount >= blackouts then
            break
        end
    end
    SetTimeout(20000, function()
        SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
        ResetPedMovementClipset(cache.ped, 0.0)
    end)
end

local function stopEffects()
    isHealing = false
    healNow = false
    armorNow = false
    restoreStamina = false
    blurryvision = false
    visionCycles = 0
    completedCycles = 0
    SetTimecycleModifier('default')
    SetPedMotionBlur(cache.ped, false)
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    for _, weapon in ipairs(Config.MeleeWeapons) do
        SetWeaponDamageModifier(GetHashKey(weapon), 1.0)
    end
end

local function startOverdose()
    Notify(Config.Lang['you_dont_feel_good'], 'error')
    overdoseCount = 0
    while overdose do
        if Framework.IsPlayerDead() then
            overdose = false
            overdoseCount = 0
            Wait(100000)
            StopScreenEffect("DrugsTrevorClownsFight")
            StopScreenEffect("DrugsTrevorClownsFightIn")
            StopScreenEffect("DrugsTrevorClownsFightOut")
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
            ResetPedMovementClipset(cache.ped, 0.0)
            SetTimecycleModifier('default')
            if IsGameplayCamShaking() then
                StopGameplayCamShaking(true)
            end
            break
        end
        local sickChance = math.random(1, 100) <= 25
        if overdoseCount > 5 and sickChance then
            local dict, anim = 'anim@scripted@ulp_missions@injured_agent@', 'idle'
            local vomitDict = 'scr_familyscenem'
            Framework.LoadAnimDict(dict)
            RequestNamedPtfxAsset(vomitDict)
            while not HasNamedPtfxAssetLoaded(vomitDict) do
                Wait(100)
            end
            TaskPlayAnim(cache.ped, dict, anim, 8.0, -8, -1, 49, 0, false, false, false)
            Wait(500)
            UseParticleFxAssetNextCall(vomitDict)
            local vomitFX = StartNetworkedParticleFxLoopedOnEntityBone('scr_tracey_puke', cache.ped, 0.0, 0.0, 0.0, 0.0,
                0.0, 0.0, 98, 2.0, false, false, false)
            UseParticleFxAssetNextCall(vomitDict)
            local vomitFX2 = StartNetworkedParticleFxLoopedOnEntityBone('scr_trev_puke', cache.ped, 0.0, 0.0, 0.0, 0.0,
                0.0, 2.0, 98, 0.7, false, false, false)
            Wait(400)
            StopParticleFxLooped(vomitFX, 0)
            StopParticleFxLooped(vomitFX2, 0)
            Wait(7000)
            ClearPedTasks(cache.ped)
        end

        overdoseCount = overdoseCount + 1
        local shakeAmount = 0.25 * overdoseCount
        local isDriving = IsPedInAnyVehicle(cache.ped, false) and
            GetPedInVehicleSeat(GetVehiclePedIsIn(cache.ped, false), -1) == cache.ped
        if not isDriving then
            DoScreenFadeOut(250)
        end
        ShakeGameplayCam('DRUNK_SHAKE', shakeAmount)
        if overdoseCount > 3 then
            local passoutChance = math.random(1, 100) --    <= 25
            if passoutChance then
                local random = math.random(3000, 15000)
                SetPedToRagdoll(cache.ped, random, random, 0, false, false, false)
                Wait(500)
                DoScreenFadeIn(250)
                StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
                Wait(1000)
                StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
                Wait(1000)
                local sickChance = math.random(1, 100) -- <= 66
                if sickChance then
                    local vomitDict = 'scr_familyscenem'
                    RequestNamedPtfxAsset(vomitDict)
                    while not HasNamedPtfxAssetLoaded(vomitDict) do
                        Wait(100)
                    end
                    Wait(500)
                    UseParticleFxAssetNextCall(vomitDict)
                    local vomitFX = StartNetworkedParticleFxLoopedOnEntityBone('scr_tracey_puke', cache.ped, 0.0, 0.0,
                        0.0, 0.0, 0.0, 0.0, 98, 2.0, false, false, false)
                    UseParticleFxAssetNextCall(vomitDict)
                    local vomitFX2 = StartNetworkedParticleFxLoopedOnEntityBone('scr_trev_puke', cache.ped, 0.0, 0.0, 0.0,
                        0.0, 0.0, 2.0, 98, 0.7, false, false, false)
                    Wait(400)
                    StopParticleFxLooped(vomitFX, 0)
                    StopParticleFxLooped(vomitFX2, 0)
                end
                StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
                StopScreenEffect("DrugsTrevorClownsFight")
                StopScreenEffect("DrugsTrevorClownsFightIn")
                local health = GetEntityHealth(cache.ped)
                SetEntityHealth(cache.ped, health - overdoseCount)
                Wait(random)
                SetRunSprintMultiplierForPlayer(PlayerId(), 0.6)
            end
        end
        Wait(500)
        DoScreenFadeIn(250)
        local health = GetEntityHealth(cache.ped)
        SetEntityHealth(cache.ped, health - overdoseCount)
        Wait(math.random(5000, 15000))
        if overdoseCount == 3 then
            Notify(Config.Lang['you_feel_more_sick'], 'error')
            SetRunSprintMultiplierForPlayer(PlayerId(), 0.7)
            RequestClipSet('move_m@drunk@slightlydrunk')
            while not HasClipSetLoaded('move_m@drunk@slightlydrunk') do
                Wait(100)
            end
            SetPedMovementClipset(cache.ped, 'move_m@drunk@slightlydrunk', true)
        elseif overdoseCount == 6 then
            StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
            Wait(3000)
            StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
            Wait(3000)
            StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
            StopScreenEffect("DrugsTrevorClownsFight")
            StopScreenEffect("DrugsTrevorClownsFightIn")
            StopScreenEffect("DrugsTrevorClownsFightOut")
            SetRunSprintMultiplierForPlayer(PlayerId(), 0.6)
            SetTimecycleModifier('spectator6')
            -- moderately drunk work
            RequestClipSet('MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP')
            while not HasClipSetLoaded('MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP') do
                Wait(100)
            end
            SetPedMovementClipset(cache.ped, 'MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP', true)
        elseif overdoseCount == 10 then
            -- ragdoll
            SetTimecycleModifier('spectator6')
            RequestClipSet('move_m@drunk@verydrunk')
            while not HasClipSetLoaded('move_m@drunk@verydrunk') do
                Wait(100)
            end
            SetPedMovementClipset(cache.ped, 'move_m@drunk@verydrunk', true)
            local chance = math.random(1, 100) <= 50
            if chance then
                local random = math.random(3000, 15000)
                local isDriving = IsPedInAnyVehicle(cache.ped, false) and
                    GetPedInVehicleSeat(GetVehiclePedIsIn(cache.ped, false), -1) == cache.ped
                if not isDriving then
                    DoScreenFadeOut(250)
                    Wait(500)
                    DoScreenFadeIn(250)
                    Wait(500)
                    DoScreenFadeOut(300)
                    Wait(600)
                    DoScreenFadeIn(650)
                    SetPedToRagdoll(cache.ped, random, random, 0, false, false, false)
                    DoScreenFadeOut(random)
                    Wait(random)
                    DoScreenFadeIn(math.random(500, 3000))
                end
                Wait(math.random(5000, 15000))
                SetRunSprintMultiplierForPlayer(PlayerId(), 0.6)
            end
        elseif overdoseCount >= 20 then
            local random = math.random(3000, 15000)
            local isDriving = IsPedInAnyVehicle(cache.ped, false) and
                GetPedInVehicleSeat(GetVehiclePedIsIn(cache.ped, false), -1) == cache.ped
            if not isDriving then
                DoScreenFadeOut(250)
                Wait(500)
                DoScreenFadeIn(250)
                Wait(500)
                DoScreenFadeOut(300)
                Wait(600)
                DoScreenFadeIn(650)
                SetPedToRagdoll(cache.ped, random, random, 0, false, false, false)
                DoScreenFadeOut(random)
                Wait(random)
                DoScreenFadeIn(math.random(500, 3000))
            end
            Wait(math.random(5000, 15000))
            StartScreenEffect("DrugsTrevorClownsFightIn", 3.0, 0)
            Wait(4000)
            StartScreenEffect("DrugsTrevorClownsFight", 3.0, 0)
            Wait(4000)
            StartScreenEffect("DrugsTrevorClownsFightOut", 3.0, 0)
            StopScreenEffect("DrugsTrevorClownsFight")
            StopScreenEffect("DrugsTrevorClownsFightIn")
            StopScreenEffect("DrugsTrevorClownsFightOut")
            overdose = false
            overdoseCount = 0
            local health = GetEntityHealth(cache.ped)
            SetEntityHealth(cache.ped, health - 100)
            SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
            ResetPedMovementClipset(cache.ped, 0.0)
            break
        end
    end
end

--- Medical Insurance System (New In 3.0)
CreateThread(function()
    if Config.Target then
        for _, location in ipairs(Config.InsuranceLocations) do
            Target.AddBoxZone({
                name = 'insurance_office',
                coords = location.coords,
                size = location.size or vector3(1.0, 1.0, 2.0),
                rotation = location.rotation,
                debug = Config.Debug,
                options = {
                    {
                        name = 'insurance_office',
                        icon = 'fas fa-file-medical',
                        label = 'Access Insurance Office',
                        onSelect = function()
                            local playerJob = Framework.Player.Job.Name
                            local playerGrade = Framework.Player.Job.Grade.Level

                            local isInsuranceBroker = false
                            if Config.InsuranceJob then
                                isInsuranceBroker = (playerJob == Config.InsuranceJob.JobName and playerGrade >= Config.InsuranceJob.MinimumGrade)
                            end

                            if isInsuranceBroker then
                                TriggerEvent('envi-prescriptions:openInsuranceBrokerMenu')
                            else
                                TriggerEvent('envi-prescriptions:openInsuranceMenu')
                            end
                        end
                    }
                }
            })
        end
    else
        for _, location in ipairs(Config.InsuranceLocations) do
            local point = Points.New({
                coords = location.coords,
                distance = 1.5,
                debug = Config.Debug,
                onEnter = function(point)
                    ActivePoint = point
                    local playerJob = Framework.Player.Job.Name
                    local playerGrade = Framework.Player.Job.Grade.Level

                    local isInsuranceBroker = false
                    if Config.InsuranceJob then
                        isInsuranceBroker = (playerJob == Config.InsuranceJob.JobName and playerGrade >= Config.InsuranceJob.MinimumGrade)
                    end

                    if isInsuranceBroker then
                        TextUI('[E] - ' .. Config.Lang['access_insurance_broker_office'])
                    else
                        TextUI('[E] - ' .. Config.Lang['access_insurance_office'])
                    end

                    CreateThread(function()
                        while ActivePoint == point do
                            Wait(0)
                            if IsControlPressed(0, 38) then
                                local isInsuranceBroker = false
                                if Config.InsuranceJob then
                                    isInsuranceBroker = (playerJob == Config.InsuranceJob.JobName and playerGrade >= Config.InsuranceJob.MinimumGrade)
                                end

                                if isInsuranceBroker then
                                    TriggerEvent('envi-prescriptions:openInsuranceBrokerMenu')
                                else
                                    TriggerEvent('envi-prescriptions:openInsuranceMenu')
                                end
                            end
                        end
                    end)
                end,
                onExit = function()
                    HideTextUI()
                    ActivePoint = nil
                end
            })
        end
    end
end)

if Config.TestMode then
    RegisterCommand('testinsurance', function() -- test command for insurance menu while in test mode (new in 3.0)
        TriggerEvent('envi-prescriptions:openInsuranceMenu')
    end, false)
end

RegisterNetEvent('envi-prescriptions:startOverdose', function()
    if overdose then return end
    overdose = true
    Wait(15000)
    startOverdose()
end)

exports('StartOverdose', function()
    if overdose then return end
    overdose = true
    Wait(15000)
    startOverdose()
end)

exports('StopOverdose', function()
    if not overdose then return end
    overdose = false
    overdoseCount = 0
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    ResetPedMovementClipset(cache.ped, 0.0)
end)

exports('DrugTaken', function(amount)
    drugsTaken = drugsTaken + amount
    if drugsTaken >= 5 then
        TriggerEvent('envi-prescriptions:startOverdose')
    end
end)

RegisterNetEvent('envi-prescriptions:stopOverdose', function()
    if not overdose then return end
    Wait(1000)
    Notify(Config.Lang['narkan_use'], 'success')
    Wait(math.random(5000, 25000))
    Notify(Config.Lang['narkan_use2'], 'success')
    while overdoseCount > 0 do
        Wait(math.random(3000, 10000))
        overdoseCount = overdoseCount - 2
    end
    DoScreenFadeOut(1000)
    Wait(3000)
    overdose = false
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    ResetPedMovementClipset(cache.ped, 0.0)
    StopScreenEffect("DrugsTrevorClownsFight")
    StopScreenEffect("DrugsTrevorClownsFightIn")
    StopScreenEffect("DrugsTrevorClownsFightOut")
    SetTimecycleModifier('default')
    if IsGameplayCamShaking() then
        StopGameplayCamShaking(true)
    end
    DoScreenFadeIn(1000)
    Notify(Config.Lang['narkan_use3'], 'success')
end)

RegisterCommand('testsickanimation', function()
    SetTimecycleModifier('default')
    local pos = GetEntityCoords(cache.ped)
    local dict, anim = 'anim@scripted@ulp_missions@injured_agent@', 'idle'
    local vomitDict = 'scr_familyscenem'
    Framework.LoadAnimDict(dict)
    RequestNamedPtfxAsset(vomitDict)
    while not HasNamedPtfxAssetLoaded(vomitDict) do
        Wait(100)
    end
    TaskPlayAnim(cache.ped, dict, anim, 8.0, -8, -1, 49, 0, false, false, false)
    Wait(500)
    UseParticleFxAssetNextCall(vomitDict)
    local vomitFX = StartNetworkedParticleFxLoopedOnEntityBone('scr_tracey_puke', cache.ped, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
        98, 2.0, false, false, false)
    UseParticleFxAssetNextCall(vomitDict)
    local vomitFX2 = StartNetworkedParticleFxLoopedOnEntityBone('scr_trev_puke', cache.ped, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0,
        98, 0.7, false, false, false)
    Wait(400)
    StopParticleFxLooped(vomitFX, 0)
    StopParticleFxLooped(vomitFX2, 0)
    Wait(7000)
    ClearPedTasks(cache.ped)
end, false)

RegisterNetEvent('envi-prescriptions:drugEffects', function(effect, anim, sideEffects)
    drugsTaken = drugsTaken + 1
    if drugsTaken > 5 then
        drugsTaken = 0
        TriggerEvent('envi-prescriptions:startOverdose')
    end
    playAnimations(anim)
    Wait(5000)
    if effect == 'heal' then
        startHealing()
    elseif effect == 'speed' then
        speedEffect()
    elseif effect == 'stamina' then
        staminaEffects()
    elseif effect == 'armor' then
        armorEffects()
    elseif effect == 'strength' then
        strengthEffect()
    elseif effect == 'stress' then
        reduceStress()
    elseif effect == 'sober' then
        stopEffects()
    end
    -- if math.random(1, 100) <= Config.SideEffectsChance then
    --     if sideEffects == 'vision' then
    --         visionEffect()
    --     elseif sideEffects == 'vision2' then
    --         visionEffect2()
    --     elseif sideEffects == 'blurryvision' then
    --         blurVision()
    --     elseif sideEffects == 'motionblur' then
    --         motionBlur()
    --     elseif sideEffects == 'slow' then
    --         slowEffect()
    --     elseif sideEffects == 'drowsy' then
    --         drowsyEffect()
    --     end
    -- end
end)

local function leanEffects()
    local shakeAmount = 0.5 * sipsTaken
    SetPedCanRagdoll(cache.ped, true)
    ShakeGameplayCam('DRUNK_SHAKE', shakeAmount)
    SetTimecycleModifier("Drunk")
    sipsTaken = sipsTaken + 1
    if sipsTaken >= 0 and sipsTaken < 2 then
        local health = GetEntityHealth(cache.ped)
        local armor = GetPedArmour(cache.ped)
        SetEntityHealth(cache.ped, health - 5)
        SetPedArmour(cache.ped, armor + 5)
        SetRunSprintMultiplierForPlayer(PlayerId(), 0.8)
        SetPedMotionBlur(cache.ped, true)
    elseif sipsTaken == 2 then
        local health = GetEntityHealth(cache.ped)
        local armor = GetPedArmour(cache.ped)
        SetEntityHealth(cache.ped, health - 10)
        SetPedArmour(cache.ped, armor + 10)
        SetRunSprintMultiplierForPlayer(PlayerId(), 0.7)
        SetTimecycleModifier("Drunk")
        SetPedMotionBlur(cache.ped, true)
        RequestClipSet('move_m@drunk@slightlydrunk')
        while not HasClipSetLoaded('move_m@drunk@slightlydrunk') do
            Wait(100)
        end
        SetPedMovementClipset(cache.ped, 'move_m@drunk@slightlydrunk', true)
    elseif sipsTaken == 3 then
        local health = GetEntityHealth(cache.ped)
        local armor = GetPedArmour(cache.ped)
        SetEntityHealth(cache.ped, health - 15)
        SetPedArmour(cache.ped, armor + 20)
        SetRunSprintMultiplierForPlayer(PlayerId(), 0.7)
        SetTimecycleModifier('spectator6')
        SetPedMotionBlur(cache.ped, true)
        RequestClipSet('move_m@drunk@slightlydrunk')
        while not HasClipSetLoaded('move_m@drunk@slightlydrunk') do
            Wait(100)
        end
        SetPedMovementClipset(cache.ped, 'move_m@drunk@slightlydrunk', true)
    elseif sipsTaken >= 3 and sipsTaken <= 5 then
        local health = GetEntityHealth(cache.ped)
        local armor = GetPedArmour(cache.ped)
        SetEntityHealth(cache.ped, health - 5)
        SetPedArmour(cache.ped, armor + 25)
        SetRunSprintMultiplierForPlayer(PlayerId(), 0.6)
        SetTimecycleModifier('spectator6')
        SetPedMotionBlur(cache.ped, true)
        RequestClipSet('MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP')
        while not HasClipSetLoaded('MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP') do
            Wait(100)
        end
        SetPedMovementClipset(cache.ped, 'MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP', true)
    elseif sipsTaken >= 6 then
        local health = GetEntityHealth(cache.ped)
        local armor = GetPedArmour(cache.ped)
        SetEntityHealth(cache.ped, health - 5)
        SetPedArmour(cache.ped, armor + 25)
        SetRunSprintMultiplierForPlayer(PlayerId(), 0.6)
        SetTimecycleModifier('spectator6')
        SetPedMotionBlur(cache.ped, true)
        RequestClipSet('move_m@drunk@verydrunk')
        while not HasClipSetLoaded('move_m@drunk@verydrunk') do
            Wait(100)
        end
        SetPedMovementClipset(cache.ped, 'move_m@drunk@verydrunk', true)
    end
end

local function doSipAnimation(lastSip) -- NEW LEAN SIPPING ANIMATIONS (new in 3.0)
    local dict, anim = 'switch@franklin@hit_cup_hand', 'hit_cup_hand_exit'
    Framework.LoadAnimDict(dict)
    TaskPlayAnim(cache.ped, dict, anim, 8.0, -8, -1, 49, 0, false, false, false)
    if lastSip then
        Wait(2900)
        DetachEntity(leanProp, true, true)
        Wait(1000)
        SetTimeout(5000, function()
            SetEntityAsNoLongerNeeded(leanProp)
            leanProp = nil
        end)
    else
        Wait(1000)
        TaskPlayAnim(cache.ped, dict, anim, 8.0, -8, -1, 49, 0, false, false, false)
    end
end

local function leanLoop()
    sippinLean = true
    local sips = math.random(4, 7)
    local dict, anim = 'switch@franklin@hit_cup_hand', 'hit_cup_hand_loop'
    local leanHash = `envi-leancup`
    Framework.LoadModel(leanHash)
    Framework.LoadAnimDict(dict)
    local coords = GetEntityCoords(cache.ped)
    TaskPlayAnim(cache.ped, dict, anim, 8.0, -8, -1, 49, 0, false, false, false)
    leanProp = CreateObject(leanHash, coords.x, coords.y, coords.z, true, true, true)
    AttachEntityToEntity(leanProp, cache.ped, GetPedBoneIndex(cache.ped, 57005), 0.12, 0.03, -0.06, -90.0, 0.0, -30.0,
        true, true, false, false, 1, true)
    --local cupProp2 = CreateObject(hash4, coords.x, coords.y, coords.z, true, true, true)
    TextUI('[E] - Take a sip')
    while sippinLean do
        Wait(0)
        if not IsEntityPlayingAnim(cache.ped, dict, anim, 3) and not takingSip then
            TaskPlayAnim(cache.ped, dict, anim, 8.0, -8, -1, 49, 0, false, false, false)
        end
        if IsControlPressed(0, 38) then -- E to sip
            local lastSip = false
            sips = sips - 1
            if sips <= 0 then
                lastSip = true
            end
            takingSip = true
            doSipAnimation(lastSip)
            takingSip = false
            Notify(Config.Lang['took_sip_lean'], 'error')
            drugsTaken = drugsTaken + 0.1
            if drugsTaken > 5 then
                drugsTaken = 0
                TriggerEvent('envi-prescriptions:startOverdose')
            end
            leanEffects()
            if sips <= 0 then
                sippinLean = false
                Notify(Config.Lang['all_out_lean'], 'error')
                break
            end
        elseif -- X to stop
            IsControlPressed(0, 73) then
            sippinLean = false
            ClearPedTasks(cache.ped)
            DetachEntity(leanProp, true, true)
            Notify(Config.Lang['spilled_lean'], 'error')
            break
        end
        if IsPedDeadOrDying(cache.ped) then
            sippinLean = false
            ClearPedTasks(cache.ped)
            DetachEntity(leanProp, true, true)
            Notify(Config.Lang['spilled_lean'], 'error')
            break
        end
    end
    HideTextUI()
    ClearPedTasks(cache.ped)
    RemoveAnimDict(dict)
    Wait(5000)
    Wait(math.random(60000, 120000))
    SetRunSprintMultiplierForPlayer(PlayerId(), 1.0)
    SetTimecycleModifier('default')
    SetPedMotionBlur(cache.ped, false)
    RemoveClipSet('move_m@drunk@slightlydrunk')
    RemoveClipSet('move_m@drunk@verydrunk')
    ResetPedMovementClipset(cache.ped, 0.0)
    ShakeGameplayCam('DRUNK_SHAKE', 0.0)
    if IsGameplayCamShaking() then
        StopGameplayCamShaking(true)
    end
    if leanProp then
        SetTimeout(5000, function()
            SetEntityAsNoLongerNeeded(leanProp)
            leanProp = nil
        end)
    end
end

RegisterNetEvent('envi-prescriptions:useLean', function(item)
    if item == true then
        leanLoop()
    end
end)

CreateThread(function()
    for _, pharmacy in pairs(Config.Pharmacies) do
        local blip = AddBlipForCoord(pharmacy.PedSpawnCoords.x, pharmacy.PedSpawnCoords.y, pharmacy.PedSpawnCoords.z)
        SetBlipSprite(blip, pharmacy.PedBlip.sprite)
        SetBlipScale(blip, pharmacy.PedBlip.scale)
        SetBlipColour(blip, pharmacy.PedBlip.colour)
        SetBlipDisplay(blip, pharmacy.PedBlip.display)
        SetBlipAsShortRange(blip, pharmacy.PedBlip.shortRange)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(pharmacy.PedBlip.name)
        EndTextCommandSetBlipName(blip)
    end
end)


if Config.TestMode then
    RegisterNetEvent('envi-prescriptions:openPrescriptionsMenu', function()
        local closestPlayer = PlayerId()

        Framework.LoadAnimDict("missheistdockssetup1clipboard@base")

        TaskPlayAnim(cache.ped, "missheistdockssetup1clipboard@base", "base", 8.0, -8.0, -1, 50, 0, false, false, false)

        local prop = CreateObject(GetHashKey("prop_notepad_01"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(prop, cache.ped, GetPedBoneIndex(cache.ped, 18905), 0.1, 0.02, 0.05, 10.0, 0.0, 0.0, true,
            true, false, true, 1, true)

        local secondProp = CreateObject(GetHashKey("prop_pencil_01"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(secondProp, cache.ped, GetPedBoneIndex(cache.ped, 58866), 0.11, -0.02, 0.001, -120.0, 0.0,
            0.0, true, true, false, true, 1, true)

        local closestPlayerServerId = GetPlayerServerId(closestPlayer)

        Framework.TriggerCallback('envi-prescriptions:getPlayerInfo', function(playerInfo)
            if not playerInfo then
                print('[DEBUG] Failed to get player info')
                Notify(Config.Lang['failed_to_get_patient_info'], 'error', 2500)
                ClearPedTasks(cache.ped)
                DeleteEntity(prop)
                DeleteEntity(secondProp)
                return
            end
            print('[DEBUG] Successfully got player info:', json.encode(playerInfo))

            local name = playerInfo.name
            local dob = playerInfo.dob
            local expiry = getExpiryDate()
            local doctor = Framework.Player.Firstname .. ' ' .. Framework.Player.Lastname or Framework.Player.Name
            local docGrade = Framework.Player.Job.Grade.Name
            local prescriptionId = math.random(1234, 9954)
            local selectedMedication = nil
            local selectedDose = 1
            local medicationsMenu = { { label = Config.Lang['choose_meds'], value = '' } }
            for k, medication in pairs(Config.Medications) do
                table.insert(medicationsMenu, { label = medication.label, value = k })
            end

            lib.registerMenu({
                id = 'pre_menu',
                title = Config.Lang['prescriptions_menu_title'],
                position = 'top-right',
                onSideScroll = function(selected, scrollIndex, values)
                    if selected == 4 then
                        if scrollIndex > 1 then
                            local medicationKey = medicationsMenu[scrollIndex].value
                            if Config.Medications[medicationKey] then
                                selectedMedication = Config.Medications[medicationKey].item
                            end
                        else
                            selectedMedication = nil
                        end
                    end
                    if selected == 5 then
                        selectedDose = scrollIndex
                    end
                end,
                onClose = function()
                    if selectedMedication ~= nil then
                        ClearPedTasks(cache.ped)
                        ClearPedTasks(cache.ped)
                        DeleteObject(prop)
                        DeleteObject(secondProp)
                        if selectedDose == nil then
                            Notify(Config.Lang['no_dose_selected'], 'error')
                        end
                        selectedDose = nil
                    else
                        Notify(Config.Lang['no_medication_selected'], 'error', 2500)
                        ClearPedTasks(cache.ped)
                        ClearPedTasks(cache.ped)
                        DeleteObject(prop)
                        DeleteObject(secondProp)
                        if selectedDose == nil then
                            Notify(Config.Lang['no_dose_selected'], 'error')
                        end
                        selectedDose = nil
                    end
                end,
                options = {
                    { label = string.format(Config.Lang['prescription_number'], prescriptionId), description = Config.Lang['unique_prescription_id'] },
                    { label = string.format(Config.Lang['patient_name'], name),                  description = Config.Lang['citizen_gov_name'] },
                    { label = string.format(Config.Lang['patient_dob'], dob),                    description = Config.Lang['citizen_dob'] },
                    { label = Config.Lang['prescribed_medication'],                              icon = 'arrows-left-right',                         values = medicationsMenu, description = Config.Lang['select_medication'] },
                    {
                        label = Config.Lang['prescribed_doses'],
                        icon = 'arrows-left-right',
                        values = (function()
                            local maxDose = 20
                            for _, medication in pairs(Config.Medications) do
                                if medication.total and medication.total > maxDose then
                                    maxDose = medication.total
                                end
                            end
                            local doses = {}
                            for i = 1, maxDose do
                                table.insert(doses, i)
                            end
                            return doses
                        end)(),
                        description = Config.Lang['select_dose']
                    },
                    { label = Config.Lang['confirm_selection'], description = Config.Lang['confirm_your_selection'] },
                }
            }, function(selected, scrollIndex, values)
                if selected then
                    if selectedMedication ~= nil then
                        local itemLabel = ''
                        for medName, medication in pairs(Config.Medications) do
                            if selectedMedication == medication.item then
                                itemLabel = medication.label
                                if medication.total ~= nil then
                                    if selectedDose > medication.total then
                                        Notify(Config.Lang['cant_do_that_much'] .. medication.total, 'error')
                                        DeleteObject(prop)
                                        DeleteObject(secondProp)
                                        ClearPedTasks(cache.ped)
                                        return
                                    end
                                end
                                break
                            end
                        end
                        TriggerServerEvent('envi-prescriptions:writePrescription', selectedMedication, prescriptionId,
                            dob, itemLabel, name, docGrade, doctor, expiry, selectedDose,
                            GetPlayerServerId(closestPlayer))
                        ClearPedTasks(cache.ped)
                        DeleteObject(prop)
                        DeleteObject(secondProp)
                    else
                        Notify(Config.Lang['select_medication_confirm'], 'error', 5000)
                        ClearPedTasks(cache.ped)
                        ClearPedTasks(cache.ped)
                        DeleteObject(prop)
                        DeleteObject(secondProp)
                    end
                end
            end, {})

            lib.showMenu('pre_menu')
        end, GetPlayerServerId(closestPlayer))
        RemoveAnimDict("missheistdockssetup1clipboard@base")
    end)
else
    RegisterNetEvent('envi-prescriptions:openPrescriptionsMenu', function()
        local ped = cache.ped
        local playerCoords = GetEntityCoords(cache.ped)
        local maxDistance = 3.0
        local closestPlayer, closestPlayerPedId, closestPlayerCoords = lib.getClosestPlayer(playerCoords, maxDistance,
            false)
        if closestPlayer == nil or closestPlayer == ped or #(playerCoords - closestPlayerCoords) > maxDistance then
            Notify(Config.Lang['no_patient_nearby'], 'error', 2500)
            return
        end
        --local closestPlayer = PlayerId()
        Framework.LoadAnimDict("missheistdockssetup1clipboard@base")
        TaskPlayAnim(cache.ped, "missheistdockssetup1clipboard@base", "base", 8.0, -8.0, -1, 50, 0, false, false, false)

        local prop = CreateObject(GetHashKey("prop_notepad_01"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(prop, cache.ped, GetPedBoneIndex(cache.ped, 18905), 0.1, 0.02, 0.05, 10.0, 0.0, 0.0, true,
            true, false, true, 1, true)

        local secondProp = CreateObject(GetHashKey("prop_pencil_01"), 0, 0, 0, true, true, true)
        AttachEntityToEntity(secondProp, cache.ped, GetPedBoneIndex(cache.ped, 58866), 0.11, -0.02, 0.001, -120.0, 0.0,
            0.0, true, true, false, true, 1, true)
        local closestPlayerServerId = GetPlayerServerId(closestPlayer)
        Framework.TriggerCallback('envi-prescriptions:getPlayerInfo', function(playerInfo)
            if not playerInfo then
                Notify(Config.Lang['failed_to_get_patient_info'], 'error', 2500)
                ClearPedTasks(cache.ped)
                DeleteEntity(prop)
                DeleteEntity(secondProp)
                return
            end
            local name = playerInfo.name
            local dob = playerInfo.dob
            local expiry = getExpiryDate()
            local doctor = Framework.Player.Firstname .. ' ' .. Framework.Player.Lastname or Framework.Player.Name
            local docGrade = Framework.Player.Job.Grade.Name
            local prescriptionId = math.random(1234, 9954)
            local selectedMedication = nil
            local selectedDose = 1
            local medicationsMenu = { { label = Config.Lang['choose_meds'], value = '' } }
            for k, medication in pairs(Config.Medications) do
                table.insert(medicationsMenu, { label = medication.label, value = k })
            end

            lib.registerMenu({
                id = 'pre_menu',
                title = Config.Lang['prescriptions_menu_title'],
                position = 'top-right',
                onSideScroll = function(selected, scrollIndex, values)
                    if selected == 4 then
                        if scrollIndex > 1 then
                            local medicationKey = medicationsMenu[scrollIndex].value
                            if Config.Medications[medicationKey] then
                                selectedMedication = Config.Medications[medicationKey].item
                            end
                        else
                            selectedMedication = nil
                        end
                    end
                    if selected == 5 then
                        selectedDose = scrollIndex
                    end
                end,
                onClose = function()
                    if selectedMedication ~= nil then
                        ClearPedTasks(cache.ped)
                        ClearPedTasks(cache.ped)
                        DeleteObject(prop)
                        DeleteObject(secondProp)
                        if selectedDose == nil then
                            Notify(Config.Lang['no_dose_selected'], 'error')
                        end
                        selectedDose = nil
                    else
                        Notify(Config.Lang['no_medication_selected'], 'error', 2500)
                        ClearPedTasks(cache.ped)
                        ClearPedTasks(cache.ped)
                        DeleteObject(prop)
                        DeleteObject(secondProp)
                        if selectedDose == nil then
                            Notify(Config.Lang['no_dose_selected'], 'error')
                        end
                        selectedDose = nil
                    end
                end,
                options = {
                    { label = string.format(Config.Lang['prescription_number'], prescriptionId), description = Config.Lang['unique_prescription_id'] },
                    { label = string.format(Config.Lang['patient_name'], name),                  description = Config.Lang['citizen_gov_name'] },
                    { label = string.format(Config.Lang['patient_dob'], dob),                    description = Config.Lang['citizen_dob'] },
                    { label = Config.Lang['prescribed_medication'],                              icon = 'arrows-left-right',                         values = medicationsMenu,                                                           description = Config.Lang['select_medication'] },
                    { label = Config.Lang['prescribed_doses'],                                   icon = 'arrows-left-right',                         values = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 }, description = Config.Lang['select_dose'] },
                    { label = Config.Lang['confirm_selection'],                                  description = Config.Lang['confirm_your_selection'] },
                }
            }, function(selected, scrollIndex, values)
                if selected then
                    if selectedMedication ~= nil then
                        local itemLabel = ''
                        for medName, medication in pairs(Config.Medications) do
                            if selectedMedication == medication.item then
                                itemLabel = medication.label
                                if medication.total ~= nil then
                                    if selectedDose > medication.total then
                                        Notify(Config.Lang['cant_do_that_much'] .. medication.total, 'error')
                                        DeleteObject(prop)
                                        DeleteObject(secondProp)
                                        ClearPedTasks(cache.ped)
                                        return
                                    end
                                end
                                break
                            end
                        end
                        TriggerServerEvent('envi-prescriptions:writePrescription', selectedMedication, prescriptionId,
                        dob, itemLabel, name, docGrade, doctor, expiry, selectedDose,
                            GetPlayerServerId(closestPlayer))
                        ClearPedTasks(cache.ped)
                        DeleteObject(prop)
                        DeleteObject(secondProp)
                    else
                        Notify(Config.Lang['select_medication_confirm'], 'error', 5000)
                        ClearPedTasks(cache.ped)
                        ClearPedTasks(cache.ped)
                        DeleteObject(prop)
                        DeleteObject(secondProp)
                    end
                end
            end, {})

            lib.showMenu('pre_menu')
        end, GetPlayerServerId(closestPlayer))
        RemoveAnimDict("missheistdockssetup1clipboard@base")
    end)
end

if Bridge.Inventory == 'ox_inventory' then
    exports.ox_inventory:displayMetadata({ -- Auto-Detection for OX Inventory Item Metadata Display (new in 3.0)
        prescription = '💊 Prescription',
        name = '👤 Patient Name',
        dob = '📅 Date of Birth',
        itemLabel = '💉 Medication',
        signed = '✍️ Signed By',
        expiry = '⏰ Expires',
        doses = '💊 Doses',
        effects = '🌟 Effects',
        sideEffects = '⚠️ Side Effects',
        total = '📦 Remaining',
        warning = '⚠️ Warning',
        dosage = '⏲️ Dosage'
    })
end
