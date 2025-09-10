if Config.Keys ~= "jaksam" then return end

function GiveKeys(vehicle, plate)
    TriggerServerEvent("vehicles_keys:selfGiveVehicleKeys", plate)
end