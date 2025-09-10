if Config.Fuel ~= "cdn" then return end
function RefuelVehicle(vehicle)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 then
        exports["cdn-fuel"]:SetFuel(vehicle, 100.0)
    end
end