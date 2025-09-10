if Config.Ambulance ~= "qbx_ambulance" then return end

RegisterServerEvent('snipe-menu:server:reviveplayer', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["revive_player_used"]..GetPlayerName(otherPlayerId))
        TriggerClientEvent('qbx_medical:client:playerRevived', otherPlayerId)

    else
        SendLogs(src, "exploit", Config.Locales["revive_exploit_event"])
    end
end)

RegisterServerEvent('snipe-menu:server:healPlayer', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["heal_player_used"]..GetPlayerName(otherPlayerId))
        TriggerClientEvent('qbx_medical:client:playerRevived', otherPlayerId)

    else
        SendLogs(src, "exploit", Config.Locales["heal_player_exploit"])
    end
end)
