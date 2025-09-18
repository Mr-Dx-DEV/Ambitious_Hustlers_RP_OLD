local allowedModels = {}

CreateThread(function()
    for k, v in pairs(Config.SupportedGasPumpModel) do
        allowedModels[v.modelHash] = true
        Config.resolution[v.modelHash] = v.inGameUIData
    end
end, "gas pump model convert to old method")

function IsModelAllowedDispenser(model)
    return Config.SupportedGasPumpModel[model] ~= nil
end

function GetAllWorkingDispenserModels()
    return allowedModels
end

function GetDispenserGunModel(model)
    return Config.SupportedGasPumpModel[model].nozzleHand
end

function CreateFuelRopeForPump(obj, side)
    local model = GetEntityModel(obj)
    if not obj or not side or not model then
        return
    end

    local dData = Config.SupportedGasPumpModel[model].dispenserGunObjectsPosition[side]
    if not dData then
        return
    end

    local offsetRope = dData.offsetRope
    local ropePos = GetOffsetFromEntityInWorldCoords(obj, offsetRope)

    local ropeObject = CreateLocalObject(Config.SupportedGasPumpModel[model].nozzleWithTube, ropePos)

    SetEntityCollision(ropeObject, false, true)
    SetEntityHeading(ropeObject, GetEntityHeading(obj) - dData.heading)
    return ropeObject
end

function CreateFuelHolderForPump(obj, side)
    local model = GetEntityModel(obj)
    if not obj or not side or not model then
        return
    end

    if not Config.SupportedGasPumpModel[model] then
        print("Model: ", model, type(model), "doesnt exists!")
        return
    end

    if type(side) ~= "number" then
        print("side: ", side, type(side), "is not a number!")
        return
    end

    local dData = Config.SupportedGasPumpModel[model].dispenserGunObjectsPosition[side]
    if not dData then
        return
    end

    local offsetHolder = dData.offsetHolder
    local holderPos = GetOffsetFromEntityInWorldCoords(obj, offsetHolder)

    local holderObject = CreateLocalObject(Config.SupportedGasPumpModel[model].nozzleHolster, holderPos)

    SetEntityCollision(holderObject, false, true)
    SetEntityHeading(holderObject, GetEntityHeading(obj) - dData.heading)

    return holderObject
end

function GetOffsetCoordsForRopeFuelDispenser(obj)
    local pedPos = GetEntityCoords(PlayerPedId())
    local modelHash = GetEntityModel(obj)

    local offsetOne, offsetTwo = Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[1], Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[2]

    local distance1 = #(GetOffsetFromEntityInWorldCoords(obj, offsetOne) - pedPos)
    local distance2 = #(GetOffsetFromEntityInWorldCoords(obj, offsetTwo) - pedPos)

    if distance1 <= distance2 then
        return Config.SupportedGasPumpModel[modelHash].ropeOffsetPosition[1]
    elseif distance2 < distance1 then
        return Config.SupportedGasPumpModel[modelHash].ropeOffsetPosition[2]
    end
end

function GetOffsetsForUIFlipForDispenserPump(obj)
    local modelHash = GetEntityModel(obj)

    if not Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForCameraSide then
        return vector3(-1.25, -1.0, 0.0), vector3(-1.25, 1.0, 0.0)
    end

    return (Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForCameraSide[1] or vector3(-1.25, -1.0, 0.0)), (Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForCameraSide[2] or vector3(-1.25, 1.0, 0.0))
end

function GetWalkOffsetForPump(obj, side)
    local pedPos = GetEntityCoords(PlayerPedId())
    local modelHash = GetEntityModel(obj)

    local offsetOne, offsetTwo = Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[1], Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[2]

    local distance1 = #(GetOffsetFromEntityInWorldCoords(obj, offsetOne) - pedPos)
    local distance2 = #(GetOffsetFromEntityInWorldCoords(obj, offsetTwo) - pedPos)

    if not offsetOne then
        distance1 = 999999
    end
    if not offsetTwo then
        distance2 = 999999
    end

    if side then
        return GetOffsetFromEntityInWorldCoords(obj, Config.SupportedGasPumpModel[modelHash].playerWalkingOffsetPosition[side]), side
    end

    if distance1 <= distance2 then
        return GetOffsetFromEntityInWorldCoords(obj, Config.SupportedGasPumpModel[modelHash].playerWalkingOffsetPosition[1]), 1
    elseif distance2 < distance1 then
        return GetOffsetFromEntityInWorldCoords(obj, Config.SupportedGasPumpModel[modelHash].playerWalkingOffsetPosition[2]), 2
    end
end

function GetHeadingOffetForPump(obj, side)
    local pedPos = GetEntityCoords(PlayerPedId())
    local modelHash = GetEntityModel(obj)

    local offsetOne, offsetTwo = Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[1], Config.SupportedGasPumpModel[modelHash].positionOffsetCheckForSides[2]

    local distance1 = #(GetOffsetFromEntityInWorldCoords(obj, offsetOne) - pedPos)
    local distance2 = #(GetOffsetFromEntityInWorldCoords(obj, offsetTwo) - pedPos)

    if not offsetOne then
        distance1 = 999999
    end
    if not offsetTwo then
        distance2 = 999999
    end

    if side then
        return Config.SupportedGasPumpModel[modelHash].playerHeadingTowardGasPump[side]
    end

    if distance1 <= distance2 then
        return Config.SupportedGasPumpModel[modelHash].playerHeadingTowardGasPump[1]
    elseif distance2 < distance1 then
        return Config.SupportedGasPumpModel[modelHash].playerHeadingTowardGasPump[2]
    end
end