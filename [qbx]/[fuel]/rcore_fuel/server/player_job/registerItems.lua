SharedObject.RegisterUsableItem("fuel_pump", function(source)
    TriggerClientEvent("rcore_fuel:selectCarToPumpOut", source)
end)

SharedObject.RegisterUsableItem("vehicle_manual", function(source)
    TriggerClientEvent("rcore_fuel:checkFuelType", source)
end)

SharedObject.RegisterUsableItem("window_cleaner", function(source)
    TriggerClientEvent("rcore_fuel:selectVehicleForCleaning", source)
end)