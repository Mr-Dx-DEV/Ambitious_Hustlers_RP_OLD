if Config.Fuel ~= "legacy" then return end
function RefuelVehicle(vehicle)
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped, false)
    if vehicle ~= 0 then
        exports["LegacyFuel"]:SetFuel(vehicle, 100.0)
    end
end