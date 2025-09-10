if Config.Keys ~= "cd" then return end
function GiveKeys(vehicle, plate)
    TriggerEvent('cd_garage:AddKeys', plate)
end