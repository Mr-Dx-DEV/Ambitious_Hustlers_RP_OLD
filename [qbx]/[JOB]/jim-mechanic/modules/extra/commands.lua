Commands = {}

--==========================================================
-- Open/Close Door Command
--==========================================================
Commands.openDoor = function(door, override)
    local Ped     = PlayerPedId()
    local vehicle = nil
    local doornum = 0

    local coords  = GetEntityCoords(Ped)
    if not Helper.isAnyVehicleNear(coords) then return end

    if IsPedSittingInAnyVehicle(Ped) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    else
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
    end

    if DoesEntityExist(vehicle) then
        if Helper.isVehicleLocked() then
            triggerNotify(nil, locale("extraOptions", "doorsLocked"), "error")
            return
        else
            if door then
                doornum = tonumber(door) - 1
                if doornum < 0 or doornum > 3 then
                    triggerNotify(nil, locale("extraOptions", "doorError"), "error")
                    return
                end
            elseif override then
                doornum = tonumber(override)
            end
            if GetVehicleDoorAngleRatio(vehicle, override or doornum) > 0.0 then
                SetVehicleDoorShut(vehicle, override or doornum, false)
            else
                SetVehicleDoorOpen(vehicle, override or doornum, false, false)
            end
        end
    end
end

--==========================================================
-- Flip Vehicle
--==========================================================
Commands.flipVehicle = function()
    local Ped    = PlayerPedId()
    local coords = GetEntityCoords(Ped)

    if not Helper.isInCar() then return end
    if not Helper.isAnyVehicleNear(coords) then return end

    local vehicle = Helper.getClosestVehicle(coords)
    pushVehicle(vehicle)

    if DoesEntityExist(vehicle) then
        local plate = Helper.getTrimmedPlate(vehicle)
        if Helper.isCarParked(plate) then
            triggerNotify(nil, "Vehicle is hard parked", "error")
            return
        end

        lookEnt(vehicle)
        local cam = createTempCam(Ped, GetEntityCoords(vehicle))
        startTempCam(cam)

        local flipTime = math.random(10000,15000)
        if progressBar({
            label = locale("extraOptions", "flippingVehicle"),
            time  = flipTime,
            cancel= true,
            dict  = "missfinale_c2ig_11",
            anim  = "pushcar_offcliff_f",
            flag  = 1
        }) then
            stopTempCam()
            sendLog("/flipvehicle used")

            local vehiclecoords = GetEntityCoords(vehicle)
            SetEntityCoords(vehicle, vehiclecoords.x + 0.5, vehiclecoords.y + 0.5, vehiclecoords.z + 1)
            Wait(200)
            SetEntityRotation(vehicle, GetEntityRotation(Ped, 2), 2)
            Wait(500)
            SetVehicleOnGroundProperly(vehicle)

            triggerNotify(nil, locale("extraOptions", "flipped"), "success")
        else
            stopTempCam()
            triggerNotify(nil, locale("extraOptions", "flipFailed"), "error")
        end
        Helper.removePropHoldCoolDown()
    end
end

--==========================================================
-- Move Seat Command
--==========================================================
Commands.pickSeat = function(seat)

    local Ped = PlayerPedId()

    if not seat then
        triggerNotify(nil, locale("extraOptions", "noSeatEntered"), "error")
        return
    end

    local vehicle    = GetVehiclePedIsIn(Ped)
    local IsSeatFree = IsVehicleSeatFree(vehicle, tonumber(seat))
    local speed      = GetEntitySpeed(vehicle)

    if (Config.Harness.HarnessControl and not HasHarness()) and DoesEntityExist(vehicle) then
        local kmh = (speed * 3.6)
        if IsSeatFree then
            if kmh <= 100.0 then
                SetPedIntoVehicle(Ped, vehicle, tonumber(seat))
                triggerNotify(nil, locale("extraOptions", "moveSeat")..seat.."!")
            else
                triggerNotify(nil, locale("extraOptions", "seatFastWarning"))
            end
        else
            triggerNotify(nil, locale("extraOptions", "seatUnavailable"))
        end
    else
        triggerNotify(nil, locale("extraOptions", "raceHarnessActive"), "error")
    end
end

RegisterNetEvent(getScript()..":client:openDoor", function(door, override) Commands.openDoor(door, override) end)
RegisterNetEvent(getScript()..":client:flipvehicle", function() Commands.flipVehicle() end)
RegisterNetEvent(getScript()..":client:seat", function(seat) Commands.pickSeat(seat) end)