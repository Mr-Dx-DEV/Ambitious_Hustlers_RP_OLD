if Config.Clothing ~= "illenium-appearance" then return end

RegisterServerEvent('snipe-menu:server:giveClothes', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["give_clothes_used"]..GetPlayerName(otherPlayerId))
        TriggerClientEvent('illenium-appearance:client:openClothingShopMenu', otherPlayerId, true)
    else
        SendLogs(src, "exploit", Config.Locales["clothes_exploit_event"])
    end
end)

RegisterServerEvent("snipe-menu:server:giveOutfits", function(id)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        TriggerClientEvent("illenium-appearance:client:openOutfitMenu", id)
        TriggerClientEvent("snipe-menu:client:forceCloseAdminMenu", id)
        SendLogs(src, "triggered", Config.Locales["clothing_outfit_option"]..GetPlayerName(id))
    else
        SendLogs(src, "exploit", Config.Locales["clothing_outfit_option_exploit"])
    end
end)