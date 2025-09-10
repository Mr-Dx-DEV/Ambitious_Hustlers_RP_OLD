if Config.Chat ~= "default" then return end

RegisterServerEvent("snipe-menu:server:sendDmToPlayer", function(playerId, reason)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["send_dm_used"]..GetPlayerName(playerId).." reason: "..reason)
        
        TriggerClientEvent('chat:addMessage', tonumber(playerId), {
            color = { 255, 0, 0},
            multiline = true,
            args = {"[DM]", reason}
        })
        
    end
end)

RegisterServerEvent("snipe-menu:server:Announce", function(message)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["announce_used"].." :"..message)
        
        TriggerClientEvent('chat:addMessage', -1, {
            color = { 255, 0, 0},
            multiline = true,
            args = {"Announcement", message}
        })
        
    end
end)

RegisterServerEvent("snipe-menu:server:warnPlayer", function(playerId, reason)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["warn_player_used"]..GetPlayerName(playerId).." reason: "..reason)
       
        TriggerClientEvent('chat:addMessage', tonumber(playerId), {
            color = { 255, 0, 0},
            multiline = true,
            args = {"[Warning]", reason}
        })
        
    else
        SendLogs(src, "exploit", Config.Locales["warn_player_exploit_event"])
    end
end)