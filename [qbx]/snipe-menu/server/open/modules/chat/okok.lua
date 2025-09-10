if Config.Chat ~= "okok" then return end
RegisterServerEvent("snipe-menu:server:sendDmToPlayer", function(playerId, reason)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["send_dm_used"]..GetPlayerName(playerId).." reason: "..reason)
        TriggerEvent('okokChat:ServerMessage', 'linear-gradient(90deg, rgba(42, 42, 42, 0.9) 0%, rgba(53, 219, 194, 0.9) 100%)', "#35dbc2", "fas fa-briefcase", "DM", "Staff", reason, tonumber(playerId))
        
    end
end)

RegisterServerEvent("snipe-menu:server:Announce", function(message)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["announce_used"].." :"..message)
        TriggerEvent('okokChat:ServerMessage', 'linear-gradient(90deg, rgba(42, 42, 42, 0.9) 0%, rgba(53, 219, 194, 0.9) 100%)', "#35dbc2", "fas fa-briefcase", "Admin", "Announcement", message, -1)
    end
end)

RegisterServerEvent("snipe-menu:server:warnPlayer", function(playerId, reason)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["warn_player_used"]..GetPlayerName(playerId).." reason: "..reason)
        TriggerEvent('okokChat:ServerMessage', 'linear-gradient(90deg, rgba(42, 42, 42, 0.9) 0%, rgba(53, 219, 194, 0.9) 100%)', "#35dbc2", "fas fa-briefcase", "Admin", "Warn", reason, tonumber(playerId))
        
    else
        SendLogs(src, "exploit", Config.Locales["warn_player_exploit_event"])
    end
end)