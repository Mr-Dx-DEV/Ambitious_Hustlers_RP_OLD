

RegisterServerEvent("snipe-menu:server:giveMoney", function(playerid, amount, type)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["give_money_used"]..GetPlayerName(playerid).." "..amount.." "..type)
        GiveMoneyToPlayer(playerid, amount, type)
    else
        SendLogs(src, "exploit", Config.Locales["give_money_exploit_event"])
    end
end)
