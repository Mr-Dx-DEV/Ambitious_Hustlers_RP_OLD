

RegisterServerEvent("snipe-menu:server:revertClothing", function(id)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        TriggerClientEvent("snipe-menu:client:revertClothing", id)
        SendLogs(src, "triggered", Config.Locales["revert_clothing_used"].." "..GetPlayerName(id))
    else
        SendLogs(src, "exploit", Config.Locales["revert_clothing_exploit"])
    end
end)

RegisterServerEvent("snipe-menu:server:changeModel", function(id, model)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        TriggerClientEvent("snipe-menu:client:changeModel", id, model)
        SendLogs(src, "triggered", Config.Locales["change_model_used"].." "..GetPlayerName(id).." ("..model..")")
    else
        SendLogs(src, "exploit", Config.Locales["change_model_exploit"])
    end
end)