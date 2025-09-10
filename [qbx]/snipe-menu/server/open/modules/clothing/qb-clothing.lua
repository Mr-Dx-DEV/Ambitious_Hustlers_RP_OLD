if Config.Clothing ~= "qb-clothing" then return end

RegisterServerEvent('snipe-menu:server:giveClothes', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["give_clothes_used"]..GetPlayerName(otherPlayerId))
        TriggerClientEvent('qb-clothing:client:openMenu', otherPlayerId)
    else
        SendLogs(src, "exploit", Config.Locales["clothes_exploit_event"])
    end
end)

RegisterServerEvent("snipe-menu:server:giveOutfits", function(id)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        TriggerClientEvent("qb-clothing:client:openOutfitMenu", id)
        SendLogs(src, "triggered", Config.Locales["clothing_outfit_option"]..GetPlayerName(id))
    else
        SendLogs(src, "exploit", Config.Locales["clothing_outfit_option_exploit"])
    end
end)