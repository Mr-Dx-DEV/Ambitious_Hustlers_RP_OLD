if Config.Ambulance ~= "ak47" then return end

function RevivePlayer()
    TriggerEvent('ak47_qb_ambulancejob:client:revive')
    TriggerEvent('ak47_qb_ambulancejob:client:skellyfix')
end