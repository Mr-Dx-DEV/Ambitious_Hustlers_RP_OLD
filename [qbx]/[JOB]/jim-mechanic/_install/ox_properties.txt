--[[
    https://github.com/overextended/ox_lib

    This file is licensed under LGPL-3.0 or higher <https://www.gnu.org/licenses/lgpl-3.0.en.html>

    Copyright © 2025 Linden <https://github.com/thelindat>
]]

if cache.game == 'redm' then return end

---@class VehicleProperties
---@field model? number
---@field plate? string
---@field plateIndex? number
---@field bodyHealth? number
---@field engineHealth? number
---@field tankHealth? number
---@field fuelLevel? number
---@field oilLevel? number
---@field dirtLevel? number
---@field paintType1? number
---@field paintType2? number
---@field color1? number | number[]
---@field color2? number | number[]
---@field pearlescentColor? number
---@field interiorColor? number
---@field dashboardColor? number
---@field wheelColor? number
---@field wheelWidth? number
---@field wheelSize? number
---@field wheels? number
---@field windowTint? number
---@field xenonColor? number
---@field neonEnabled? boolean[]
---@field neonColor? number | number[]
---@field extras? table<number | string, 0 | 1>
---@field tyreSmokeColor? number | number[]
---@field modSpoilers? number
---@field modFrontBumper? number
---@field modRearBumper? number
---@field modSideSkirt? number
---@field modExhaust? number
---@field modFrame? number
---@field modGrille? number
---@field modHood? number
---@field modFender? number
---@field modRightFender? number
---@field modRoof? number
---@field modEngine? number
---@field modBrakes? number
---@field modTransmission? number
---@field modHorns? number
---@field modSuspension? number
---@field modArmor? number
---@field modNitrous? number
---@field modTurbo? boolean
---@field modSubwoofer? boolean
---@field modSmokeEnabled? boolean
---@field modHydraulics? boolean
---@field modXenon? boolean
---@field modFrontWheels? number
---@field modBackWheels? number
---@field modCustomTiresF? boolean
---@field modCustomTiresR? boolean
---@field modPlateHolder? number
---@field modVanityPlate? number
---@field modTrimA? number
---@field modOrnaments? number
---@field modDashboard? number
---@field modDial? number
---@field modDoorSpeaker? number
---@field modSeats? number
---@field modSteeringWheel? number
---@field modShifterLeavers? number
---@field modAPlate? number
---@field modSpeakers? number
---@field modTrunk? number
---@field modHydrolic? number
---@field modEngineBlock? number
---@field modAirFilter? number
---@field modStruts? number
---@field modArchCover? number
---@field modAerials? number
---@field modTrimB? number
---@field modTank? number
---@field modWindows? number
---@field modDoorR? number
---@field modLivery? number
---@field modRoofLivery? number
---@field modLightbar? number
---@field windows? number[]
---@field doors? number[]
---@field tyres? table<number | string, 1 | 2>
---@field bulletProofTyres? boolean
---@field driftTyres? boolean

---@deprecated
---Not recommended. Entity owners can change rapidly and sporadically.
RegisterNetEvent('ox_lib:setVehicleProperties', function(netid, data)
    local timeout = 100
    while not NetworkDoesEntityExistWithNetworkId(netid) and timeout > 0 do
        Wait(0)
        timeout -= 1
    end
    if timeout > 0 then
        lib.setVehicleProperties(NetToVeh(netid), data)
    end
end)

AddStateBagChangeHandler('ox_lib:setVehicleProperties', '', function(bagName, _, value)
    if not value or not GetEntityFromStateBagName then return end

    while NetworkIsInTutorialSession() do Wait(0) end

    local entityExists, entity = pcall(lib.waitFor, function()
        local entity = GetEntityFromStateBagName(bagName)

        if entity > 0 then return entity end
    end, '', 10000)

    if not entityExists then return end

    lib.setVehicleProperties(entity, value)
    Wait(200)

    -- this delay and second-setting of vehicle properties hopefully counters the
    -- weird sync/ownership/shitfuckery when setting props on server-side vehicles
    if NetworkGetEntityOwner(entity) == cache.playerId then
        lib.setVehicleProperties(entity, value)
        Entity(entity).state:set('ox_lib:setVehicleProperties', nil, true)
    end
end)

---@param vehicle number
---@return VehicleProperties?
function lib.getVehicleProperties(vehicle)
    if not DoesEntityExist(vehicle) then return end

    local gameBuild = GetGameBuildNumber()

    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
    local paintType1 = GetVehicleModColor_1(vehicle)
    local paintType2 = GetVehicleModColor_2(vehicle)

    if GetIsVehiclePrimaryColourCustom(vehicle) then
        colorPrimary = { GetVehicleCustomPrimaryColour(vehicle) }
    end
    if GetIsVehicleSecondaryColourCustom(vehicle) then
        colorSecondary = { GetVehicleCustomSecondaryColour(vehicle) }
    end

    local extras = {}
    for i = 1, 15 do
        if DoesExtraExist(vehicle, i) then
            extras[i] = IsVehicleExtraTurnedOn(vehicle, i) and 0 or 1
        end
    end

    local xenonColor
    local hasCustom, xr, xg, xb = GetVehicleXenonLightsCustomColor(vehicle)
    if hasCustom == 1 or hasCustom == true then
        xenonColor = { xr, xg, xb }
    else
        xenonColor = GetVehicleHeadlightsColour(vehicle)
    end

    local windowStatus = {}
    for i = 0, 7 do
        RollUpWindow(vehicle, i)
        windowStatus[i] = IsVehicleWindowIntact(vehicle, i)
    end
    local doorStatus = {}
    for i = 0, 5 do
        doorStatus[i] = IsVehicleDoorDamaged(vehicle, i)
    end

    local tyreBurstState, tyreBurstCompletely = {}, {}
    local tyres = {}
    for i = 0, 7 do
        local burstPartial = IsVehicleTyreBurst(vehicle, i, false)
        local burstFull    = IsVehicleTyreBurst(vehicle, i, true)
        tyreBurstState[i] = burstPartial and true or false
        tyreBurstCompletely[i] = burstFull and true or false
        if burstPartial or burstFull then
            tyres[i] = burstFull and 2 or 1
        end
    end

    local tireHealth = {}
    for _, id in ipairs({0,1,2,3,4,5,45,47}) do
        tireHealth[id] = GetVehicleWheelHealth(vehicle, id)
    end

    local neons = {}
    for i = 0, 3 do
        neons[i + 1] = IsVehicleNeonLightEnabled(vehicle, i)
    end

    local modLiveryCount = GetVehicleLiveryCount(vehicle)
    local modLivery = GetVehicleLivery(vehicle)
    if modLiveryCount == -1 or modLivery == -1 then
        modLivery = GetVehicleMod(vehicle, 48)
    end

    return {
        model = GetEntityModel(vehicle),
        plate = GetVehicleNumberPlateText(vehicle),
        plateIndex = GetVehicleNumberPlateTextIndex(vehicle),
        bodyHealth = math.floor(GetVehicleBodyHealth(vehicle) + 0.5),
        engineHealth = math.floor(GetVehicleEngineHealth(vehicle) + 0.5),
        tankHealth = math.floor(GetVehiclePetrolTankHealth(vehicle) + 0.5),
        fuelLevel = math.floor(GetVehicleFuelLevel(vehicle) + 0.5),
        oilLevel = math.floor(GetVehicleOilLevel(vehicle) + 0.5),
        dirtLevel = math.floor(GetVehicleDirtLevel(vehicle) + 0.5),

        paintType1 = paintType1,
        paintType2 = paintType2,
        color1 = colorPrimary,
        color2 = colorSecondary,
        pearlescentColor = pearlescentColor,
        interiorColor = GetVehicleInteriorColor(vehicle),
        dashboardColor = GetVehicleDashboardColour(vehicle),
        wheelColor = wheelColor,

        wheels = GetVehicleWheelType(vehicle),
        wheelSize = GetVehicleWheelSize(vehicle),
        wheelWidth = GetVehicleWheelWidth(vehicle),

        windowStatus = windowStatus,
        doorStatus = doorStatus,
        tireHealth = tireHealth,
        tireBurstState = tyreBurstState,
        tireBurstCompletely = tyreBurstCompletely,
        tyres = tyres,

        xenonColor = xenonColor,
        neonEnabled = neons,
        neonColor = { GetVehicleNeonLightsColour(vehicle) },
        extras = extras,
        tyreSmokeColor = { GetVehicleTyreSmokeColor(vehicle) },

        modSpoilers = GetVehicleMod(vehicle, 0),
        modFrontBumper = GetVehicleMod(vehicle, 1),
        modRearBumper = GetVehicleMod(vehicle, 2),
        modSideSkirt = GetVehicleMod(vehicle, 3),
        modExhaust = GetVehicleMod(vehicle, 4),
        modFrame = GetVehicleMod(vehicle, 5),
        modGrille = GetVehicleMod(vehicle, 6),
        modHood = GetVehicleMod(vehicle, 7),
        modFender = GetVehicleMod(vehicle, 8),
        modRightFender = GetVehicleMod(vehicle, 9),
        modRoof = GetVehicleMod(vehicle, 10),
        modEngine = GetVehicleMod(vehicle, 11),
        modBrakes = GetVehicleMod(vehicle, 12),
        modTransmission = GetVehicleMod(vehicle, 13),
        modHorns = GetVehicleMod(vehicle, 14),
        modSuspension = GetVehicleMod(vehicle, 15),
        modArmor = GetVehicleMod(vehicle, 16),
        modNitrous = GetVehicleMod(vehicle, 17),
        modTurbo = IsToggleModOn(vehicle, 18),
        modSubwoofer = GetVehicleMod(vehicle, 19),
        modSmokeEnabled = IsToggleModOn(vehicle, 20),
        modHydraulics = IsToggleModOn(vehicle, 21),
        modXenon = IsToggleModOn(vehicle, 22),
        modFrontWheels = GetVehicleMod(vehicle, 23),
        modBackWheels = GetVehicleMod(vehicle, 24),
        modCustomTiresF = GetVehicleModVariation(vehicle, 23),
        modCustomTiresR = GetVehicleModVariation(vehicle, 24),
        modPlateHolder = GetVehicleMod(vehicle, 25),
        modVanityPlate = GetVehicleMod(vehicle, 26),
        modTrimA = GetVehicleMod(vehicle, 27),
        modOrnaments = GetVehicleMod(vehicle, 28),
        modDashboard = GetVehicleMod(vehicle, 29),
        modDial = GetVehicleMod(vehicle, 30),
        modDoorSpeaker = GetVehicleMod(vehicle, 31),
        modSeats = GetVehicleMod(vehicle, 32),
        modSteeringWheel = GetVehicleMod(vehicle, 33),
        modShifterLeavers = GetVehicleMod(vehicle, 34),
        modAPlate = GetVehicleMod(vehicle, 35),
        modSpeakers = GetVehicleMod(vehicle, 36),
        modTrunk = GetVehicleMod(vehicle, 37),
        modHydrolic = GetVehicleMod(vehicle, 38),
        modEngineBlock = GetVehicleMod(vehicle, 39),
        modAirFilter = GetVehicleMod(vehicle, 40),
        modStruts = GetVehicleMod(vehicle, 41),
        modArchCover = GetVehicleMod(vehicle, 42),
        modAerials = GetVehicleMod(vehicle, 43),
        modTrimB = GetVehicleMod(vehicle, 44),
        modTank = GetVehicleMod(vehicle, 45),
        modWindows = GetVehicleMod(vehicle, 46),
        modDoorR = GetVehicleMod(vehicle, 47),
        modLivery = modLivery,
        modRoofLivery = GetVehicleRoofLivery(vehicle),
        modLightbar = GetVehicleMod(vehicle, 49),
        windowTint = GetVehicleWindowTint(vehicle),

        modKit49 = GetVehicleMod(vehicle, 49),
        liveryRoof = GetVehicleRoofLivery(vehicle),
        modBProofTires = not GetVehicleTyresCanBurst(vehicle),
        modDrift = gameBuild >= 2372 and GetDriftTyresEnabled(vehicle) or false,
    }
end

---@param vehicle number
---@param props VehicleProperties
---@param fixVehicle? boolean Fix the vehicle after props have been set. Usually required when adding extras.
---@return boolean?
function lib.setVehicleProperties(vehicle, props, fixVehicle)
    if not DoesEntityExist(vehicle) then
        error(("Unable to set vehicle properties for '%s' (entity does not exist)"):format(vehicle))
    end

    local gameBuild = GetGameBuildNumber()

    local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
    local pearlescentColor, wheelColor = GetVehicleExtraColours(vehicle)
    SetVehicleModKit(vehicle, 0)

    if props.extras then
        for id, disable in pairs(props.extras) do
            SetVehicleExtra(vehicle, tonumber(id), disable == 1)
        end
    end

    if props.plate      then SetVehicleNumberPlateText(vehicle, props.plate) end
    if props.plateIndex then SetVehicleNumberPlateTextIndex(vehicle, props.plateIndex) end
    if props.bodyHealth then SetVehicleBodyHealth(vehicle, props.bodyHealth + 0.0) end
    if props.engineHealth then SetVehicleEngineHealth(vehicle, props.engineHealth + 0.0) end
    if props.tankHealth then SetVehiclePetrolTankHealth(vehicle, props.tankHealth + 0.0) end
    if props.fuelLevel  then SetVehicleFuelLevel(vehicle, props.fuelLevel + 0.0) end
    if props.oilLevel   then SetVehicleOilLevel(vehicle, props.oilLevel + 0.0) end
    if props.dirtLevel  then SetVehicleDirtLevel(vehicle, props.dirtLevel + 0.0) end

    if props.color1 then
        if type(props.color1) == 'number' then
            ClearVehicleCustomPrimaryColour(vehicle)
            SetVehicleColours(vehicle, props.color1, colorSecondary)
        else
            if props.paintType1 then SetVehicleModColor_1(vehicle, props.paintType1, colorPrimary, pearlescentColor) end
            SetVehicleCustomPrimaryColour(vehicle, props.color1[1], props.color1[2], props.color1[3])
        end
    end
    if props.color2 then
        if type(props.color2) == 'number' then
            ClearVehicleCustomSecondaryColour(vehicle)
            SetVehicleColours(vehicle, props.color1 or colorPrimary, props.color2)
        else
            if props.paintType2 then SetVehicleModColor_2(vehicle, props.paintType2, colorSecondary) end
            SetVehicleCustomSecondaryColour(vehicle, props.color2[1], props.color2[2], props.color2[3])
        end
    end

    if props.pearlescentColor or props.wheelColor then
        SetVehicleExtraColours(vehicle, props.pearlescentColor or pearlescentColor, props.wheelColor or wheelColor)
    end
    if props.interiorColor then SetVehicleInteriorColor(vehicle, props.interiorColor) end
    if props.dashboardColor then SetVehicleDashboardColour(vehicle, props.dashboardColor) end

    if props.wheels then SetVehicleWheelType(vehicle, props.wheels) end
    if props.wheelSize then SetVehicleWheelSize(vehicle, props.wheelSize) end
    if props.wheelWidth then SetVehicleWheelWidth(vehicle, props.wheelWidth) end
    if props.windowTint then SetVehicleWindowTint(vehicle, props.windowTint) end

    if props.neonEnabled then
        for i = 1, #props.neonEnabled do
            SetVehicleNeonLightEnabled(vehicle, i - 1, props.neonEnabled[i])
        end
    end
    if props.neonColor then
        SetVehicleNeonLightsColour(vehicle, props.neonColor[1], props.neonColor[2], props.neonColor[3])
    end

    if props.windowStatus then
        for windowIndex, smashWindow in pairs(props.windowStatus) do
            if not smashWindow then RemoveVehicleWindow(vehicle, windowIndex) end
        end
    end
    if props.doorStatus then
        for doorIndex, breakDoor in pairs(props.doorStatus) do
            if breakDoor then
                SetVehicleDoorBroken(vehicle, tonumber(doorIndex), true)
            end
        end
    end

    if props.tireHealth then
        for wheelIndex, health in pairs(props.tireHealth) do
            SetVehicleWheelHealth(vehicle, wheelIndex, health)
        end
    end
    if props.tireBurstState or props.tireBurstCompletely then
        for i = 0, 7 do
            if props.tireBurstCompletely and props.tireBurstCompletely[i] then
                SetVehicleTyreBurst(vehicle, i, true, 1000.0)
            elseif props.tireBurstState and props.tireBurstState[i] then
                SetVehicleTyreBurst(vehicle, i, false, 1000.0)
            end
        end
    elseif props.tyres then
        for tyre, state in pairs(props.tyres) do
            SetVehicleTyreBurst(vehicle, tonumber(tyre), state == 2, 1000.0)
        end
    end

    if props.xenonColor then
        if type(props.xenonColor) == "number" then
            ClearVehicleXenonLightsCustomColor(vehicle)
            SetVehicleXenonLightsColor(vehicle, props.xenonColor)
        else
            SetVehicleXenonLightsCustomColor(vehicle, props.xenonColor[1], props.xenonColor[2], props.xenonColor[3])
            SetVehicleXenonLightsColor(vehicle, -1)
        end
    end

    if props.modSmokeEnabled ~= nil then ToggleVehicleMod(vehicle, 20, props.modSmokeEnabled) end
    if props.tyreSmokeColor then SetVehicleTyreSmokeColor(vehicle, props.tyreSmokeColor[1], props.tyreSmokeColor[2], props.tyreSmokeColor[3]) end

    local function setMod(idx, val) if val then SetVehicleMod(vehicle, idx, val, false) end end
    setMod(0,  props.modSpoilers)
    setMod(1,  props.modFrontBumper)
    setMod(2,  props.modRearBumper)
    setMod(3,  props.modSideSkirt)
    setMod(4,  props.modExhaust)
    setMod(5,  props.modFrame)
    setMod(6,  props.modGrille)
    setMod(7,  props.modHood)
    setMod(8,  props.modFender)
    setMod(9,  props.modRightFender)
    setMod(10, props.modRoof)
    setMod(11, props.modEngine)
    setMod(12, props.modBrakes)
    setMod(13, props.modTransmission)
    setMod(14, props.modHorns)
    setMod(15, props.modSuspension)
    setMod(16, props.modArmor)
    setMod(17, props.modNitrous)
    if props.modTurbo      ~= nil then ToggleVehicleMod(vehicle, 18, props.modTurbo) end
    setMod(19, props.modSubwoofer)
    if props.modHydraulics ~= nil then ToggleVehicleMod(vehicle, 21, props.modHydraulics) end
    if props.modXenon      ~= nil then ToggleVehicleMod(vehicle, 22, props.modXenon) end
    if props.modFrontWheels then SetVehicleMod(vehicle, 23, props.modFrontWheels, props.modCustomTiresF) end
    if props.modBackWheels then  SetVehicleMod(vehicle, 24, props.modBackWheels,  props.modCustomTiresR) end
    setMod(25, props.modPlateHolder)
    setMod(26, props.modVanityPlate)
    setMod(27, props.modTrimA)
    setMod(28, props.modOrnaments)
    setMod(29, props.modDashboard)
    setMod(30, props.modDial)
    setMod(31, props.modDoorSpeaker)
    setMod(32, props.modSeats)
    setMod(33, props.modSteeringWheel)
    setMod(34, props.modShifterLeavers)
    setMod(35, props.modAPlate)
    setMod(36, props.modSpeakers)
    setMod(37, props.modTrunk)
    setMod(38, props.modHydrolic)
    setMod(39, props.modEngineBlock)
    setMod(40, props.modAirFilter)
    setMod(41, props.modStruts)
    setMod(42, props.modArchCover)
    setMod(43, props.modAerials)
    setMod(44, props.modTrimB)
    setMod(45, props.modTank)
    setMod(46, props.modWindows)
    setMod(47, props.modDoorR)
    if props.modLivery then SetVehicleMod(vehicle, 48, props.modLivery, false) SetVehicleLivery(vehicle, props.modLivery) end
    if props.modRoofLivery then SetVehicleRoofLivery(vehicle, props.modRoofLivery) end
    setMod(49, props.modLightbar)
    if props.modKit49 then SetVehicleMod(vehicle, 49, props.modKit49, false) end
    if props.liveryRoof then SetVehicleRoofLivery(vehicle, props.liveryRoof) end

    do
        local canBurst = nil
        if props.modBProofTires ~= nil then
            canBurst = not props.modBProofTires
        elseif props.bulletProofTyres ~= nil then
            canBurst = props.bulletProofTyres
        end
        if canBurst ~= nil then SetVehicleTyresCanBurst(vehicle, canBurst) end
    end

    if gameBuild >= 2372 then
        if props.modDrift ~= nil then
            SetDriftTyresEnabled(vehicle, props.modDrift and true or false)
        elseif props.driftTyres ~= nil then
            SetDriftTyresEnabled(vehicle, props.driftTyres and true or false)
        end
    end

    if fixVehicle then SetVehicleFixed(vehicle) end
    if NetworkGetEntityIsNetworked(vehicle) then
        TriggerServerEvent('jim-mechanic:server:loadStatus', props, VehToNet(vehicle))
    end
    return not NetworkGetEntityIsNetworked(vehicle) or NetworkGetEntityOwner(vehicle) == cache.playerId
end