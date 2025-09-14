local antiLagCooldown = 0
local DistAdd, maxSpeed, ShowingOdo, ShowOdo, owned, veh, databasecalc, nosUpdate = 1, 0, false, Config.Odometer.ShowOdo, false, 0, false, false

-- Vehicle Ejection Variables
local seatbeltOn, harnessOn, harnessProp = false, false, nil
seat = nil
local plate, model = nil, nil

currentVehCache = {}

--==========================================================
-- Ox Cache Handling
--==========================================================
if isStarted(OXLibExport) then
    lib.onCache("vehicle", function(vehicle)
        if vehicle then
            TriggerEvent(getScript()..":Client:EnteredVehicle")
        else
            TriggerEvent(getScript()..":Client:ExitVehicle")
        end
    end)
end

local failedToLeave = false

--==========================================================
-- Exit Vehicle Handler
--==========================================================
RegisterNetEvent(getScript()..":Client:ExitVehicle", function()
    Wait(1000)
    if not failedToLeave then
        debugPrint("^5Debug^7: ^3ExitVehicle^7: ^2Player has exited vehicle ^7- ^4Seat^7: ^1"..tostring(seat).."^7")
        local veh = GetVehiclePedIsIn(PlayerPedId(), true)

        if seat == -1 then
            debugPrint("Player was driver")
            if (DoesEntityExist(veh) and NetworkGetEntityIsNetworked(veh)) and Config.Overrides.saveOnExit == true and not PrevFunc.getInPreview() then
                local mods = getVehicleProperties(veh)
                if mods.model == model then
                    debugPrint("Vehicle mods saving to database..")
                    TriggerServerEvent(getScript()..":server:updateVehicle", mods, plate)
                end
            else
                debugPrint("Vehicle can't be found to save, we'll assume a garage saved the mods")
            end
            debugPrint("Saving vehicle status..")
            Helper.saveStatus(DoesEntityExist(veh) and veh or plate)

            if VehicleNitrous[plate] and Config.NOS.enable then
                debugPrint("Saving nitrous data..")
                TriggerServerEvent(getScript()..":server:setNitrous",
                    DoesEntityExist(veh) and VehToNet(veh) or plate,        -- if vehicle doesn't exist fallback to plate
                    {
                        updateNitrous = true,
                        level = VehicleNitrous[plate].level
                    }
                )
                if DoesEntityExist(veh) then
                    debugPrint("Forcing any nos effects to stop..")
                    Nitrous.forceStopNos() -- Remove any changed effects to the vehicle
                end
            end
            debugPrint("Saving milage..")
            TriggerServerEvent(getScript()..":server:UpdateDrivingDistance", plate, math.round(DistAdd))

            if DoesEntityExist(veh) and veh ~= 0 and veh ~= nil and defVehStats[plate] then
                -- Handling Changes
                if Config.NOS.HandlingChange then
                    SetVehicleHandlingFloat(veh, "CHandlingData", "fMass", defVehStats[plate]["hFloat"])
                    SetVehicleTurboPressure(veh, defVehStats[plate]["tPressure"])
                    SetVehicleCheatPowerIncrease(veh, defVehStats[plate]["pIncrease"])
                    --ModifyVehicleTopSpeed(veh, defVehStats[plate]["speedMod"])
                end
            end
            antiLagCooldown, damageTimer, purgeCool, DistAdd, maxSpeed, lastSentData = 0, 0, 0, 0, 0, {}
        end

        seatbeltOn, harnessOn, plate = false, false, nil
        if ShowOdo then
            ExecuteCommand("hideodohud")
        end
        destroyHarness()
        currentVehCache = {}
    end
    Wait(100)
    failedToLeave = false
end)

--==========================================================
-- Speedometer Blacklist
--==========================================================
function speedoBlackList(model)
    if odometerBlacklist[model] ~= nil then
        return true
    else
        return false
    end
end

--==========================================================
-- Enter Vehicle Handler
--==========================================================
RegisterNetEvent(getScript()..":Client:EnteredVehicle", function()
    Wait(1000)
    local Ped = PlayerPedId()
    local veh = Helper.getValidVehiclePedIsIn(Ped, 20, 100) -- tries for up to 2 seconds

    if not veh then
        print("^1ERROR^7:^1 EnteredVehicle triggered but failed to detect a vehicle entity after retries^7")
        return
    end

    local vehIsIn = veh
    local dist    = 0

    if not NetworkGetEntityIsNetworked(veh) then return end

    plate   = Helper.getTrimmedPlate(veh)
    model   = GetEntityModel(veh)
    seat    = Helper.GetSeatPedIsIn(veh)
    local isStopped  = IsVehicleStopped(veh)

    if seat == nil or (not GetIsVehicleElectric(model) and IsThisModelABicycle(model)) or IsThisModelATrain(model) or speedoBlackList(model) then
        return
    end

    debugPrint("^5Debug^7: ^3EnteredVehicle^7: ^2Player has entered vehicle ^4Plate^7: ^1"..tostring(plate).."^7 ^4Seat^7: ^1"..tostring(seat).."^7")

    -- Setup vehicle specific changes and store data
    ExtraDamageComponents.getVehicleStatus(veh)
    Helper.getDefalutHandling(veh, plate)

    Wait(1000)
    if VehicleStatus and VehicleStatus[plate] and seat == -1 then
        if VehicleStatus[plate]["carwax"] ~= 0 then
            CreateThread(function()
                TriggerServerEvent(getScript()..":server:checkWax", VehToNet(vehIsIn))
            end)
        end
        if VehicleStatus[plate]["manual"] == 1 then
            -- When entering a vehicle, enable manual gear system for it
            Helper.enableManualGears(veh, plate)
        else
            -- When entering a vehicle, if you dont have manual transmission ensure manual gear system is disabled for it
            Helper.disableManualGears(veh, plate)
        end
    end

    --[[
    if debugMode then
        CreateThread(function()
            local possMods = Helper.checkHSWMods(veh)
            maxSpeed = 0
            while veh do
                maxSpeed = (GetEntitySpeed(veh) > maxSpeed) and GetEntitySpeed(veh) or maxSpeed
                debugScaleForm({
                    "Vehicle - ~r~"..searchCar(veh).name,
                    "Class - ~r~"..searchCar(veh).class,
                    "Plate - ~r~"..plate,
                    "VehicleId: ~r~"..veh,
                    "Fuel - ~r~"..GetVehicleFuelLevel(veh),
                    "Nos - ~r~"..(VehicleNitrous[plate] and VehicleNitrous[plate].level or "Not installed"),
                    "Engine - ~r~"..math.floor(GetVehicleEngineHealth(veh)/10).."%",
                    "Body - ~r~"..math.floor(GetVehicleBodyHealth(veh)/10).."%",
                    locale("checkDetails", "engineLabel").." - ~r~Lvl "..(GetVehicleMod(veh, 11)+1).." / "..possMods[11],
                    locale("checkDetails", "brakesLabel").." - ~r~Lvl "..(GetVehicleMod(veh, 12)+1).." / "..possMods[12],
                    locale("checkDetails", "suspensionLabel").." - ~r~Lvl "..(GetVehicleMod(veh, 15)+1).." / "..possMods[15],
                    locale("checkDetails", "transmissionLabel").." - ~r~Lvl "..(GetVehicleMod(veh, 13)+1).." / "..possMods[13],
                    locale("checkDetails", "armorLabel").." - ~r~Lvl "..(GetVehicleMod(veh, 16)+1).." / "..GetNumVehicleMods(veh, 16),
                    locale("checkDetails", "turboLabel").." - ~r~"..tostring(IsToggleModOn(veh, 18)),
                    locale("checkDetails", "xenonLabel").." - ~r~"..tostring(IsToggleModOn(veh, 22)),
                    locale("checkDetails", "driftTyresLabel").." - ~r~"..tostring(GetDriftTyresEnabled(veh)),
                    locale("checkDetails", "bulletproofTyresLabel").." - ~r~"..tostring(GetVehicleTyresCanBurst(veh)),
                    "Submerged Level - ~r~"..GetEntitySubmergedLevel(veh),
                    "MaxRecordedSpeed: - ~r~"..math.ceil(maxSpeed * 2.23694),
                    "EstimatedTopSpeed: - ~r~"..math.ceil(GetVehicleEstimatedMaxSpeed(veh) * 2.23694),
                    "TopSpeedModifier: - ~r~"..GetVehicleTopSpeedModifier(veh),
                    "EntityID: - ~r~"..veh,
                    "netID: - ~r~"..VehToNet(veh),
                    "MaxSeats: - ~r~"..GetVehicleMaxNumberOfPassengers(veh)+1,
                    "HandlingFloat: - ~r~"..GetVehicleHandlingFloat(veh , "CHandlingData","fMass"),
                    "TurboPressure: - ~r~"..string.format("%.2f", GetVehicleTurboPressure(veh)),
                    "PowerIncrease: - ~r~"..string.format("%.2f", GetVehicleCheatPowerIncrease(veh)),
                    "SteeringLock: - ~r~"..GetVehicleHandlingFloat(veh, "CHandlingData", "fSteeringLock")
                }, vec2(0.80, 0.05))
                Wait(0)
            end
        end)
    end
    ]]

    -- Loop: Check for collisions, seatbelt ejection, etc.
    CreateThread(function()
        if vehIsIn == veh and ShowOdo then
            ExecuteCommand("showodohud")
        end

        -- Speedometer
        CreateThread(function()
            while vehIsIn == veh and DoesEntityExist(veh) and Config.Odometer.showSpeedometer and ShowOdo do
                updateSpeedometer(veh, model, plate)
                Wait(isStopped and 300 or 120)
            end
        end)

        -- Crash/Ejection/Vehicle Damage Loop
        CreateThread(function()
            local pauseMenuCheck = false

            while vehIsIn == veh do
                vehIsIn    = GetVehiclePedIsIn(Ped, false)
                isStopped  = IsVehicleStopped(veh)
                seat       = Helper.GetSeatPedIsIn(veh) == nil and seat or Helper.GetSeatPedIsIn(veh)

                SetPedHelmet(Ped, false)
                if ShowOdo and DoesEntityExist(veh) then
                    if IsPauseMenuActive() and not pauseMenuCheck then
                        ExecuteCommand("hideodohud")
                        pauseMenuCheck = true
                    elseif not IsPauseMenuActive() and pauseMenuCheck then
                        ExecuteCommand("showodohud")
                        pauseMenuCheck = false
                    end
                end

                if ShowOdo then
                    updateVehicleHUD(dist, veh, plate, model, DistAdd, seat)
                end

                -- Update Veh cache
                currentVehCache =  {
                    currentVeh = vehIsIn,
                    curVehBody = GetVehicleBodyHealth(vehIsIn),
                    thisSpeed = GetEntitySpeed(vehIsIn) * 2.23694,
                    seat = seat
                }

                if Config.Harness.HarnessControl then
                    -- Set GTA config flag for windscreen behavior (true = ejectable)
                    SetPedConfigFlag(Ped, 32, Config.Harness.AltEjection and not Config.Harness.disableCrashEjection or false)

                    if Config.Harness.AltEjection then
                        -- If crash ejection is globally disabled OR harness is worn and ejection is not allowed
                        if Config.Harness.disableCrashEjection or (HasHarness() and not Config.harnessEjection) then
                            -- Set insane values so GTA never ejects
                            SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0)
                        else
                            local speedDivisor = Config.System.distkph and 3.6 or 2.237
                            local minSpeed

                            if HasHarness() then
                                -- Only applies if ejection with harness is allowed (already checked)
                                minSpeed = Config.Harness.minimumSeatBeltSpeed * speedDivisor
                            elseif seatBeltOn() then
                                minSpeed = Config.Harness.minimumSeatBeltSpeed * speedDivisor
                            else
                                minSpeed = Config.Harness.minimumSpeed * speedDivisor
                            end

                            SetFlyThroughWindscreenParams(minSpeed, 1.0, 17.0, 10.0)
                        end
                    else
                        -- AltEjection is off, disable GTA ejection by setting unreachable params
                        SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0)
                    end
                end

                Wait(isStopped and 1000 or (Config.Harness.AltEjection and 600 or 200))
            end
            SetPedHelmet(Ped, true)
            lastSpeed2, lastSpeed, frameBodyChange = 0, 0, 0.0
        end)

        -- for debugging
        if debugMode and seat == -1 and not VehicleNitrous[plate] then
            TriggerServerEvent(getScript()..":server:setNitrous", VehToNet(veh), { loadNitrous = true })
        end

        local prevLoc = GetEntityCoords(veh)
        local nos     = {}

        -- car wax stuff
        if VehicleStatus[plate] and VehicleStatus[plate]["carwax"] ~= 0 then
            SetVehicleDirtLevel(veh, 0.0)
            WashDecalsFromVehicle(veh, 1.0)
        end

        -- if nos, store data locally
        if VehicleNitrous[plate] and Config.NOS.enable then
            nos = { VehicleNitrous[plate].hasnitro, VehicleNitrous[plate].level }
        end
        -- update hud with nos if needed
        Helper.updateHudNitrous(nos[2] or 0, nos[1] or false, false)

        -- grab milage data from server
        dist = triggerCallback(getScript()..":callback:distGrab", plate)

        -- Loop to calculate milage while driving
        CreateThread(function()
            while vehIsIn == veh do
                if seat == -1 then
                    pushVehicle(veh)
                    local newCoords = GetEntityCoords(veh)
                    DistAdd += (#(newCoords - prevLoc) * (Config.System.distkph and 0.001 or 0.00062))
                    prevLoc = newCoords
                end
                Wait(isStopped and 1000 or 5000)
            end
        end)

        -- Fast loop for damage, nitro checks, etc.
        CreateThread(function()
            while vehIsIn == veh do
                if seat == -1 then
                    if VehicleStatus[plate] and VehicleStatus[plate].antiLag == 1 then
                        HandleAntiLag(veh)
                    end
                    if Config.vehFailure.damageLimits then
                        HandleVehicleDamageLimits(veh, model)
                    end
                end
                Wait(seat == -1 and 100 or 10000)
            end
        end)
        CreateThread(function()
            if Config.vehFailure.PreventRoll and DoesEntityExist(veh) then
                while vehIsIn == veh do
                    if seat == -1 then
                        local roll = GetEntityRoll(veh)
                        if (roll > 75.0 or roll < -75.0) and GetEntitySpeed(veh) < 2 then
                            DisableControlAction(2, 59, true) -- Disable left/right
                            DisableControlAction(2, 60, true) -- Disable up/down
                        end
                    end
                    Wait(0)
                end
            end
        end)
    end)
end)

-- Local cooldown tracker
local lastDamageTime = 0
local damageCooldown = 1000 -- in milliseconds (e.g., 1000ms = 1 second)

-- Damage Detection (moved from loop to entityDamaged event detection)
AddEventHandler('entityDamaged', function (entity, _, weapon, _)
    if not currentVehCache.currentVeh then return end
    if entity ~= currentVehCache.currentVeh then return end
    if GetWeapontypeGroup(weapon) ~= 0 then return end

    if not NetworkGetEntityIsNetworked(entity) then return end

    local now = GetGameTimer()
    if now - lastDamageTime < damageCooldown then return end
    lastDamageTime = now

    -- Add Extra damage if needed
    local frameBodyChange = currentVehCache.curVehBody - GetVehicleBodyHealth(currentVehCache.currentVeh)
    if frameBodyChange ~= 0 and frameBodyChange > 0 and currentVehCache.seat == -1 then
        debugPrint("Threshhold met for increased damage")
        local extraDamage = Config.vehFailure.extraDamage or {}

        if extraDamage and extraDamage.enable then
            local random = math.random(extraDamage.randomDamageRange.min, extraDamage.randomDamageRange.max)
            local extra  = frameBodyChange / math.random(extraDamage.randomDamageRange.min, extraDamage.randomDamageRange.max)
            extra = (extra >= 1) and 0 or extra

            local engHealth = GetVehicleEngineHealth(currentVehCache.currentVeh)
            local bodHealth = GetVehicleBodyHealth(currentVehCache.currentVeh)
            debugPrint("^4Debug^7: ^2Previous Health^7", engHealth, bodHealth)
            local engineDamage = extra > 0 and (extra * (extraDamage.engineDamageMultiplier * 1000)) or 0

            SetVehicleEngineHealth(currentVehCache.currentVeh, engHealth - engineDamage)

            --Wait(10)

            local bodyDamage = extra * (extraDamage.bodyDamageMultiplier * 1000)
            SetVehicleBodyHealth(currentVehCache.currentVeh, bodHealth - bodyDamage)

            debugPrint("^4Debug^7: ^2Applying extra engine damage^7: "..engineDamage)
            debugPrint("^4Debug^7: ^2Applying extra body damage^7: "..bodyDamage)
            debugPrint("^4Debug^7: ^2New Health^7", GetVehicleEngineHealth(currentVehCache.currentVeh), GetVehicleBodyHealth(currentVehCache.currentVeh))

        end

        ExtraDamageComponents.Damage(currentVehCache.currentVeh)
    end

    -- Ejection Logic
    if Config.Harness.HarnessControl then
        if not Config.Harness.AltEjection and not Config.Harness.disableCrashEjection and not Helper.isBike(model) then

            -- Block ejection if wearing harness and it's supposed to prevent ejection
            if HasHarness() and not Config.harnessEjection then goto skip end

            local speed = currentVehCache.thisSpeed
            local speedDivisor = Config.System.distkph and 3.6 or 2.237
            local minSpeed

            if HasHarness() and Config.harnessEjection then
                minSpeed = Config.Harness.minimumSeatBeltSpeed * speedDivisor
            elseif seatBeltOn() then
                minSpeed = Config.Harness.minimumSeatBeltSpeed * speedDivisor
            else
                minSpeed = Config.Harness.minimumSpeed * speedDivisor
            end

            if speed > minSpeed then
                if frameBodyChange > (Config.Harness.minimumDamage or 20.0) then
                    EjectFromVehicle(GetEntityVelocity(currentVehCache.currentVeh), speed, frameBodyChange)
                end
            end

            ::skip::
        end
    end

end)

--==========================================================
-- Handling Anti-Lag
--==========================================================
function HandleAntiLag(veh)
    if not plate or not VehicleStatus[plate] or VehicleStatus[plate].antiLag ~= 1 then return end

    antiLagCooldown = antiLagCooldown <= 0 and 0 or (antiLagCooldown - 1)

    if veh == 0 or not DoesEntityExist(veh) or GetVehicleCurrentGear(veh) == 0 then return end

    if not IsControlPressed(1, 71) and not IsControlPressed(1, 72)
       and not IsEntityInAir(veh) and not NitrousActivated
       and GetIsVehicleEngineRunning(veh) and GetVehicleCurrentRpm(veh) > 0.75
    then
        if antiLagCooldown == 0 then
            for i = 1, math.random(1, 4) do
                TriggerServerEvent(getScript()..":server:playSound",
                    "antilag_"..math.random(1, 4),
                    VehToNet(veh),
                    vec3(0, 0, 0),
                    0.45
                )

                Nitrous.Effects.VehicleBackfire(veh)
                Wait(math.random(150,350))
            end
            antiLagCooldown = Config.antiLag.coolDownReset
        end
    end
end

--==========================================================
-- Vehicle Damage Limits
--==========================================================
function HandleVehicleDamageLimits(veh, model)

    local damageLimits = Config.vehFailure.damageLimits

    -- Petrol Tank Health Limits
    if GetVehiclePetrolTankHealth(veh) < (damageLimits.petrolTank or 750.0) then
        SetVehiclePetrolTankHealth(veh, damageLimits.petrolTank or 750.0)
        SetVehicleOilLevel(veh, 5.0)
        SetVehicleCanLeakPetrol(veh, false)
        SetVehicleCanLeakOil(veh, false)
    end

    -- Engine Health Limits
    if GetVehicleEngineHealth(veh) <= (damageLimits.engine or 50.0) then
        SetVehicleEngineHealth(veh, damageLimits.engine or 50.0)
        if damageLimits.engineUndriveable then
            SetVehicleUndriveable(veh, true)
        end
    end

    -- Body Health Limits
    if GetVehicleBodyHealth(veh) <= (damageLimits.body or 50) then
        SetVehicleBodyHealth(veh, (damageLimits.body or 50.0) + 1)
    end

    -- Submersion
    local isBoat =
        IsThisModelABoat(model) or
        IsThisModelAJetski(model) or
        IsThisModelAnAmphibiousCar(model) or
        IsThisModelAnAmphibiousQuadbike(model) or
        amphibiousVehicles[model]

    if GetEntitySubmergedLevel(veh) >= 0.95 and not isBoat then
        SetVehicleEngineHealth(veh, 40.0)
        SetVehicleBodyHealth(veh,   60.0)

        SetVehicleTyreBurst(veh, 1, false, 990.0)
        SetVehicleDoorBroken(veh, 1, true)
        SetVehicleDoorBroken(veh, 6, true)
        SetVehicleDoorBroken(veh, 4, true)

        SetVehicleEngineOn(veh, false, false, true)
    end
end

--==========================================================
-- Odometer Toggle
--==========================================================
RegisterNetEvent(getScript()..":ShowOdo", function()
    print("^3ShowOdo^7: ^2Odometer toggled^7")
    ShowOdo = not ShowOdo
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        ExecuteCommand(ShowOdo and "showodohud" or "hideodohud")
    end
end)

--==========================================================
-- Harness Creation/Destruction
--==========================================================
function destroyHarness()
    if DoesEntityExist(harnessProp) then
        destroyProp(harnessProp)
        harnessProp = nil
    end
end

function createHarness(Ped)
    if not DoesEntityExist(harnessProp) then
        local pedCoords = GetEntityCoords(Ped)
        harnessProp = makeProp({ prop="idrp_racing_harness", coords=vec4(pedCoords.x, pedCoords.y, pedCoords.z, 0.0) }, 1, 1)
        if DoesEntityExist(harnessProp) then
            AttachEntityToEntity(
                harnessProp,
                Ped,
                GetPedBoneIndex(Ped, 24818),
                0.02, -0.04, 0.0, 0.0, 90.0, 180.0,
                true, true, false, true, 1, true
            )
        end
    end
end

--==========================================================
-- Harness/Ejection System
--==========================================================
if Config.Harness.HarnessControl == true then
    local ejecting = false
    -- Eject from Vehicle
    function EjectFromVehicle(veloc, thisFrameSpeed, frameBodyChange)
        debugPrint("^5Debug^7: EjectFromVehicle triggered")

        if ejecting then return else ejecting = true end
        local Ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(Ped, false)

        if DoesEntityExist(veh) and veh ~= 0 then
            debugPrint("^5Debug^7: ^2Ejecting player from vehicle^7", thisFrameSpeed, frameBodyChange)
            local coords = GetOffsetFromEntityInWorldCoords(veh, 1.0, 0.0, 1.0)
            SetEntityCoords(Ped, coords.x, coords.y, coords.z)
            SmashVehicleWindow(veh, 6)
            Wait(1)
            SetPedToRagdoll(Ped, 5511, 5511, 0, 0, 0, 0)
            SetEntityVelocity(Ped, (veloc.x * 2), (veloc.y * 2), (veloc.z * 2))

            if Config.Harness.crashKill then
                local ejectspeed = math.ceil(GetEntitySpeed(Ped) * 8)
                if GetEntityHealth(Ped) - ejectspeed > 0 then
                    SetEntityHealth(Ped, GetEntityHealth(Ped) - ejectspeed)
                elseif GetEntityHealth(Ped) ~= 0 then
                    SetEntityHealth(Ped, 0)
                end
            end
            CreateThread(function()
                Wait(1000)
                ejecting = false
            end)
        end
    end

    -- Seatbelt Loop for preventing exit
    local function SeatBeltLoop()
        CreateThread(function()
            local Ped = PlayerPedId()
            local veh = GetVehiclePedIsIn(Ped, false)
            if Config.Harness.oldPreventLeave then
                while (seatbeltOn or harnessOn) and DoesEntityExist(veh) do
                    if (harnessOn and not Config.Harness.harnessEasyLeave) or (seatbeltOn and not Config.Harness.seatbeltEasyLeave) then    -- if needed to, disable keys
                        DisableControlAction(0, 75, true)
                        DisableControlAction(27, 75, true)
                        if IsDisabledControlJustReleased(0, 75) or IsDisabledControlJustReleased(27, 75) then -- if button pressed
                            triggerNotify(nil, locale("extraOptions", "exitRestriction"), "error")
                        end
                    end
                    Wait(0)
                end
            else
                while (seatbeltOn or harnessOn) and DoesEntityExist(veh) do
                    local attemptingToExit = not IsPedInAnyVehicle(Ped, true) or IsPedJumpingOutOfVehicle(Ped)
                    if (harnessOn and not Config.Harness.harnessEasyLeave) or (seatbeltOn and not Config.Harness.seatbeltEasyLeave)
                    then
                        if attemptingToExit then
                            failedToLeave = true
                            SetPedIntoVehicle(Ped, veh, seat)
                            triggerNotify(nil, locale("extraOptions", "exitRestriction"), "success")
                        end
                    end
                    Wait(100)
                end
            end

            Helper.externalSeatbeltToggle(false)

            destroyHarness()
        end)
    end

    local inProgress = false
    local lastToggleTime = 0
    local function ToggleSeatbelt()
        local Ped = PlayerPedId()
        if IsPedSittingInAnyVehicle(Ped) then
            -- Implementa verificação de tempo para evitar duplicações
            local currentTime = GetGameTimer()
            if currentTime - lastToggleTime < 500 then
                return
            end
            lastToggleTime = currentTime

            local veh  = GetVehiclePedIsIn(Ped, false)

            if not NetworkGetEntityIsNetworked(veh) then return end

            local plate = Helper.getTrimmedPlate(veh)
            ExtraDamageComponents.getVehicleStatus(veh)

            if Helper.isBike(GetEntityModel(veh)) then
                return
            end

            CreateThread(function()
                if not inProgress then
                    inProgress = true
                    local shouldToggleHarness = false

                    if VehicleStatus[plate].harness == 1 then
                        if not harnessOn then

                            TriggerServerEvent(getScript()..":server:playSound", "rapell", VehToNet(veh), nil, 0.75)

                        end
                        if (Config.Harness.progOn and not harnessOn) or (Config.Harness.progOff and harnessOn) then
                            local time = not harnessOn and (Config.Harness.timeOn or math.random(4000, 7000))
                                        or (Config.Harness.timeOff or math.random(3000, 5000))
                            if progressBar({
                                label = (not harnessOn and locale("common", "attachingHarness") or (locale("common", "actionRemoving").." "..locale("checkDetails", "harnessLabel"))),
                                time  = time,
                                cancel= true,
                                anim  = "fixing_a_ped",
                                dict  = "mini@repair",
                                flag  = 48,
                                icon  = "harness"
                            }) then
                                shouldToggleHarness = true
                            end
                        else
                            shouldToggleHarness = true
                        end

                        if shouldToggleHarness then
                            if IsPedInAnyVehicle(Ped) then
                                if not harnessOn then createHarness(Ped) end
                                harnessOn = not harnessOn
                            else
                                destroyHarness()
                                harnessOn = false
                            end
                        end
                    end

                    -- Seatbelt toggling
                    if shouldToggleHarness or VehicleStatus[plate].harness ~= 1 then
                        seatbeltOn = not seatbeltOn
                        if seatbeltOn then SeatBeltLoop() end

                        Helper.externalSeatbeltToggle(seatbeltOn)

                        TriggerServerEvent(getScript()..":server:playSound", (seatbeltOn and "seatbelt" or "seatbeltoff"), VehToNet(veh), nil, 0.35)

                        if Config.Harness.seatbeltNotify then
                            triggerNotify(nil, seatbeltOn and locale("extraOptions", "seatbeltOnMsg") or locale("extraOptions", "seatbeltOffMsg"), "success")
                        end
                    end

                    Wait(500)
                    inProgress = false
                end
            end)
        end
    end
    --==========================================================
    -- Register Key Mapping
    --==========================================================

    RegisterCommand("toggleseatbelt", function()
        ToggleSeatbelt()
    end)

    RegisterNetEvent(getScript()..":client:ToggleSeatbelt", function()
        ToggleSeatbelt()
    end)

    RegisterKeyMapping("toggleseatbelt", locale("extraOptions", "toggleSeatbelt"), "keyboard", "B")
end

--==========================================================
-- Exports
--==========================================================
function HasHarness()
    if not Config.Harness.HarnessControl then
        print("^3Warning^7: HasHarness() ^2was called but ^7HarnessControl ^2is disabled in the script^7")
    end
    return harnessOn
end
function seatBeltOn()
    if not Config.Harness.HarnessControl then
        print("^3Warning^7: seatBeltOn() ^2was called but ^7HarnessControl ^2is disabled in the script^7")
    end
    return seatbeltOn
end

local distPlate = {}
function GetMilage(plate)
    if distPlate[plate] then
        return (distPlate[plate] + DistAdd)
    else
        distPlate = {}
        distPlate[plate] = triggerCallback(getScript()..":callback:distGrab", plate)
        return distPlate[plate]
    end
end
exports("HasHarness", HasHarness)
exports("seatBeltOn", seatBeltOn)
exports("GetMilage", GetMilage)