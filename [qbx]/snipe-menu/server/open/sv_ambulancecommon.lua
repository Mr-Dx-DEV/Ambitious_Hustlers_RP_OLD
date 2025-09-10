
RegisterServerEvent("snipe-menu:server:reviveall", function()
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["revive_all_used"])
        TriggerClientEvent("snipe-menu:client:reviveall", -1, src)
    else
        SendLogs(src, "exploit", Config.Locales["revive_all_exploit"])
    end
end)

RegisterServerEvent('snipe-menu:server:reviveInRadius', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["revive_radius_used"])
        TriggerClientEvent('snipe-menu:client:reviveInRadius', -1, GetEntityCoords(GetPlayerPed(src)))
    else
        SendLogs(src, "exploit", Config.Locales["revive_radius_exploit_event"])
    end
end)


RegisterServerEvent("snipe-menu:server:removeStress", function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["remove_stress_used"]..GetPlayerName(otherPlayerId))
        TriggerClientEvent("snipe-menu:client:removeStress", otherPlayerId, src)
    else
        SendLogs(src, "exploit", Config.Locales["remove_stress_exploit"])
    end
end)