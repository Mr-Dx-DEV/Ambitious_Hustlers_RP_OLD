RegisterServerEvent("snipe-menu:server:registerStash", function(name)
    exports.ox_inventory:RegisterStash(name, "Admin Stash", 100, 500000)
end)

function GetItemMetadataInfo(src, item, type)
    local info = {}
    local Player = QBCore.Functions.GetPlayer(src)
    if item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif type == "weapon" then
        info.serie = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(4))
        info.quality = 100
    elseif item == "harness" then
        info.uses = 20
    elseif item == "markedbills" then
        info.worth = math.random(5000, 10000)
    elseif item == "printerdocument" then
        info.url = "https://cdn.discordapp.com/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png"
    end
    return info
end


RegisterServerEvent("snipe-menu:server:openInventory", function(playerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        exports.ox_inventory:forceOpenInventory(src, 'player', playerId)
    end
end)

function string.starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
end

RegisterServerEvent('snipe-menu:server:clearInventory', function(otherPlayerId)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["clear_inventory_used"]..GetPlayerName(otherPlayerId))
        ClearInventory(otherPlayerId)
    else
        SendLogs(src, "triggered", Config.Locales["inventory_open_event_exploit"])
    end
    
end)

RegisterServerEvent("snipe-menu:server:giveItem", function(playerId, giveItem, giveAmount)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        GiveItemToPlayer(playerId, giveItem, giveAmount, src)
        SendLogs(src, "triggered", Config.Locales["give_item_used"]..giveAmount.."x "..giveItem.." to "..GetPlayerName(playerId))

    else
        SendLogs(src, "exploit", Config.Locales["give_item_exploit_event"])
    end
end)

CreateCallback("snipe-menu:server:getAllStashes", function(source, cb)
    if not onlineAdmins[source] then
        return
    end
    cb(GetAllStashes())
end)
