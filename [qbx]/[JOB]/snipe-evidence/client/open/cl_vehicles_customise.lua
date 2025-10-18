local inVehicle = false

local prevSpeed, currSpeed, prevBodyHealth, currBodyHealth
local function StartCrashThread(vehicle)
    while inVehicle do 
        Wait(100)
        prevSpeed = currSpeed
        currSpeed = GetEntitySpeed(vehicle)
        prevBodyHealth = currBodyHealth
        currBodyHealth = GetVehicleBodyHealth(vehicle)

        local bodyDamage = prevBodyHealth and (prevBodyHealth - currBodyHealth) or 0.0 
        local speedDiff = prevSpeed and (prevSpeed - currSpeed) or 0.0

        if HasEntityCollidedWithAnything(vehicle) then
            if Config.VehicleEvidence.Crash.debug then
                print("Debug Info: PrevSpeed: "..(prevSpeed or 0).." CurrSpeed: "..(currSpeed or 0).." SpeedDiff: "..speedDiff)
                print("Debug Info: PrevBodyHealth: "..(prevBodyHealth or 0).." CurrBodyHealth: "..(currBodyHealth or 0).." BodyDamage: "..bodyDamage)
            end
            -- Fragments are dropped at the crash location
            if speedDiff > Config.VehicleEvidence.Crash.speedDiff or bodyDamage > Config.VehicleEvidence.Crash.damageDiff then
                if Config.VehicleEvidence.fragment and math.random(1, 100) <= Config.VehicleEvidence.Chance.fragment then
                    local vehicleModel = GetEntityModel(vehicle)
                    local r, g, b = GetVehicleColor(vehicle)
                    local vehCoords = GetEntityCoords(vehicle)
                    local vehHeading = GetEntityHeading(vehicle)
                    local plate = GetVehicleNumberPlateText(vehicle)
                    CreateVehicleFragment(vehicleModel, vehCoords + vec3((math.random(1,10)/100), math.random(1,10)/100, 0.0), vehCoords + vec3((math.random(1,10)/100), math.random(1,10)/100, 0.0), vehHeading, plate, r, g, b)
                end
            end
        end
    end
end

lib.onCache('vehicle', function(value, oldValue)
    Wait(1000)

    local playerPed = PlayerPedId()

    local vehicle = value 
    if not vehicle then inVehicle = false return end
    inVehicle = true
    -- local seat = GetPedInVehicleSeat(vehicle, -1)
    -- if seat == playerPed then
    --     -- if math.random(1, 100) > Config.Chances.leave
    --     if Config.
    -- end
    if IsThisModelABicycle(GetEntityModel(vehicle)) then inVehicle = false return end

    if Config.VehicleEvidence.fingerprint and math.random(1, 100) <= Config.VehicleEvidence.Chance.fingerprint then
        CreateVehicleFingerprint(vehicle)
    end

    local seat = GetPedInVehicleSeat(vehicle, -1)
    if seat == playerPed then
        StartCrashThread(vehicle)
    end
end)

lib.onCache('seat', function()
    Wait(1000)

    local playerPed = PlayerPedId()

    local vehicle = GetVehiclePedIsIn(playerPed, false) 
    if not vehicle then return end
    if IsThisModelABicycle(GetEntityModel(vehicle)) then return end
    local seat = GetPedInVehicleSeat(vehicle, -1)
    if seat == playerPed then
         StartCrashThread(vehicle)
    end
end)