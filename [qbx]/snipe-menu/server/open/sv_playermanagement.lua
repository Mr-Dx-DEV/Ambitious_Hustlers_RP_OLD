
RegisterServerEvent("snipe-menu:server:kickPlayer", function(playerId, reason)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "bans", Config.Locales["kick_player_used"]..GetPlayerName(playerId).." reason: "..reason)
        DropPlayer(playerId, reason)
    else
        SendLogs(src, "exploit", Config.Locales["kick_player_exploit_event"])
    end
end)

RegisterServerEvent("snipe-menu:server:unbanPlayer", function(id, license)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        MySQL.Async.execute('DELETE FROM bans WHERE license = ? ',{license})
        SendLogs(src, "triggered", Config.Locales["unban_player_used"].." "..id.." ("..license..")")
    else
        SendLogs(src, "exploit", Config.Locales["unban_player_exploit"])
    end
end)

CreateCallback("snipe-menu:server:getPlayerInfo", function(source, cb, otherPlayerId)
    local src = source
    if not onlineAdmins[src] then
        return
    end
    cb(GetPlayerInfo(otherPlayerId))
end)


CreateCallback("snipe-menu:server:getAllUniquePlayers", function(source, cb)
    cb(GetAllUniquePlayer())
end)



RegisterServerEvent("snipe-menu:server:wipePlayer", function(id)
    local src = source
    if onlineAdmins[src] then
        SendLogs(source, "triggered", Config.Locales["wiped_player"]..id)
        WipePlayer(id)
    end
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
    deferrals.defer()
    local playerId = source
    local isBanned, Reason = IsPlayerBanned(playerId)
    
        
    if isBanned then
        deferrals.done(Reason)
    else
        deferrals.done()
    end
end)