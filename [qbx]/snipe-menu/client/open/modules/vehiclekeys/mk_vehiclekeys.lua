if Config.Keys ~= "mk" then return end
function GiveKeys(vehicle, plate)
    exports["mk_vehiclekeys"]:AddKey(vehicle)
end