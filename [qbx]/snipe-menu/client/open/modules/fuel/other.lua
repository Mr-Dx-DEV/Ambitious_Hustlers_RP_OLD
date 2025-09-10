if Config.Fuel ~= "other" then return end
function RefuelVehicle(vehicle)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 then
        SetVehicleFuelLevel(vehicle, 100.0)
    end
end