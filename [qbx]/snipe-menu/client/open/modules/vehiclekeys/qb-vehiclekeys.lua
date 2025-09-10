if Config.Keys ~= "qb" then return end
function GiveKeys(vehicle, plate)
    TriggerEvent("vehiclekeys:client:SetOwner", plate) -- change it to your own logic
end