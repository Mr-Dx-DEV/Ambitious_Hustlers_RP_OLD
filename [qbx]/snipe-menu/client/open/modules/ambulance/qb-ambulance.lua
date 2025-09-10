if Config.Ambulance ~= "qb-ambulance" then return end
function RevivePlayer()
    TriggerEvent('hospital:client:Revive')
end