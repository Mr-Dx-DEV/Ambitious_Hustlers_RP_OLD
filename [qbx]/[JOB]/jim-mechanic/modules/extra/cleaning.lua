local cleaning = false

CarCleaning = {}

CarCleaning.apply = function(data)
    local Ped = PlayerPedId()
    if not cleaning then
        cleaning = true
    else
        return
    end

    triggerNotify(nil, locale("policeMenu", "cleaningVehicle"))

    local vehicle
    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
    end

    local cam = createTempCam(Ped, GetEntityCoords(vehicle))

    startTempCam(cam)
    Helper.propHoldCoolDown("sponge")

    while cleaning do
        local dirtLevel = GetVehicleDirtLevel(vehicle)

        if dirtLevel >= 1.0 then
            SetVehicleDirtLevel(vehicle, dirtLevel - 0.3)
        elseif dirtLevel <= 1.0 then
            SetVehicleDirtLevel(vehicle, 0.0)
            WashDecalsFromVehicle(vehicle, 1.0)
            cleaning = false
            triggerNotify(nil, locale("extraOptions", "vehicleClean"), "success")
        end

        Wait(300)
    end

    Wait(1000)
    stopTempCam()
    Helper.removePropHoldCoolDown()

    if not cleaning and (data and data.time ~= 0) then
        ExtraDamageComponents.setVehicleStatus(vehicle, "carwax", data.time)
    end

    if Config.BreakTool.CleaningKit then
        breakTool({ item = "cleaningkit", damage = math.random(5, 10) })
    end
    -- if Config.Overrides.CosmeticItemRemoval and not data.skip then removeItem("cleaningkit", 1) end
end

RegisterNetEvent(getScript()..":client:cleanVehicle", function(skip)
    CarCleaning.Menu(skip)
end)

CarCleaning.Menu = function(skip)
    local Ped    = PlayerPedId()
    local coords = GetEntityCoords(Ped)

    if not Helper.isInCar() then return end
    if not Helper.isAnyVehicleNear(coords) then return end

    local vehicle = Helper.getClosestVehicle(coords)
    pushVehicle(vehicle)
    lookEnt(vehicle)

    if DoesEntityExist(vehicle) then
        local plate = Helper.getTrimmedPlate(vehicle)
        if Helper.isCarParked(plate) then
            triggerNotify(nil, "Vehicle is hard parked", "error")
            return
        end

        local Menu = {}

        Menu[#Menu+1] = {
            arrow   = true,
            header  = locale("carWaxOptions", "cleanVehicle"),
            onSelect= function()
                CarCleaning.apply({ time = 0, skip = skip })
            end,
        }

        if Config.Overrides.WaxFeatures then
            ExtraDamageComponents.getVehicleStatus(vehicle)

            Menu[#Menu+1] = {
                arrow   = true,
                header  = locale("carWaxOptions", "cleanAndWax"),
                onSelect= function()
                    CarCleaning.apply({ time = 86400, skip = skip })
                end,
            }
            Menu[#Menu+1] = {
                arrow   = true,
                header  = locale("carWaxOptions", "cleanAndPremiumWax"),
                onSelect= function()
                    CarCleaning.apply({ time = 172800, skip = skip })
                end,
            }
            Menu[#Menu+1] = {
                arrow   = true,
                header  = locale("carWaxOptions", "cleanAndUltimateWax"),
                onSelect= function()
                    CarCleaning.apply({ time = 273600, skip = skip })
                end,
            }
        end

        openMenu(Menu, {
            header    = searchCar(vehicle).name,
            headertxt = locale("checkDetails", "plateLabel")..": "..plate,
            canClose  = true,
            onExit    = function() end,
        })
    end
end