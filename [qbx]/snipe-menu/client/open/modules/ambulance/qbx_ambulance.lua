if Config.Ambulance ~= "qbx_ambulance" then return end
function RevivePlayer()
    TriggerEvent("qbx_medical:client:playerRevived")
end