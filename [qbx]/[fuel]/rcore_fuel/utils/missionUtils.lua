local blipMission
local zoneCheckDistance
local pointName = ""
local zoneCoords = vector3(0, 0, 0)

function CreateBlipMission(coords)
    DestroyBlipMission()
    blipMission = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipRoute(blipMission, true)
end

function DestroyBlipMission()
    if blipMission then
        RemoveBlip(blipMission)
        blipMission = nil
    end
end

function CreateMissionZone(coords, zoneName, distance)
    if type(coords) == "string" then
        zoneName = coords
        distance = 0
        coords = vector3(0, 0, 0)
    end

    zoneCoords = coords
    pointName = zoneName
    lastZoneName = nil
    blipCheckDistance = distance
end

function GetMissionName()
    return pointName
end

function GetMissionCoords()
    return zoneCoords
end

function DestroyMissionZone()
    zoneCoords = nil
    pointName = nil
    blipCheckDistance = nil
end

CreateThread(function()
    local lastZoneName = nil
    while true do
        Wait(1000)
        if pointName then
            if #(zoneCoords - GetEntityCoords(PlayerPedId())) < (blipCheckDistance or 20) and lastZoneName ~= pointName then
                lastZoneName = pointName
                TriggerEvent("rcore_fuel:enterZone", pointName)
            end
        end
    end
end, "zone enter name")