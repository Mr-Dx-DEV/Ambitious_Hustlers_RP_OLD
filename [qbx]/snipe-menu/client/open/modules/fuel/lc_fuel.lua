if Config.Fuel ~= "lc_fuel" then return end
function RefuelVehicle(vehicle)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 then
        exports["lc_fuel"]:SetFuel(vehicle, 100.0)
    end
end