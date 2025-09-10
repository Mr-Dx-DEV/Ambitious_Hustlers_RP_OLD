if Config.Fuel ~= "ox" then return end
function RefuelVehicle(vehicle)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 then
        Entity(vehicle).state.fuel = 100.0
    end
end