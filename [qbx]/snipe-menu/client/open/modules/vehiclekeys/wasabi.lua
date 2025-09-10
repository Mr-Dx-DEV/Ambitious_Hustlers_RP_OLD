if Config.Keys ~= "wasabi" then return end
function GiveKeys(vehicle, plate)
    exports.wasabi_carlock:GiveKey(plate)
end