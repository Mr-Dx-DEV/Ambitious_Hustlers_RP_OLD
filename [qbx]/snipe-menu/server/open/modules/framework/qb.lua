if Config.Framework ~= "qb" then return end
QBCore = nil
QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("snipe-menu:server:forceLogout", function(id)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        QBCore.Player.Logout(id)
        TriggerClientEvent('qb-multicharacter:client:chooseChar', id)
        SendLogs(src, "triggered", Config.Locales["forced_logout_player"]..GetPlayerName(id))
    else
        SendLogs(src, "exploit", Config.Locales["forced_logout_player_exploit"])
    end
end)

function GetPlayerInfo(id)
    local returnData = {}
    local otherPlayer = QBCore.Functions.GetPlayer(id)
    if not otherPlayer then
        return returnData
    end
    returnData.citizenId = otherPlayer.PlayerData.citizenid
    returnData.name = otherPlayer.PlayerData.charinfo.firstname.." "..otherPlayer.PlayerData.charinfo.lastname
    returnData.job = otherPlayer.PlayerData.job.label.." ("..otherPlayer.PlayerData.job.grade.name..")"
    returnData.gang = otherPlayer.PlayerData.gang.label.." ("..otherPlayer.PlayerData.gang.grade.name..")"
    returnData.cashBalance = otherPlayer.PlayerData.money["cash"]
    returnData.bankBalance = otherPlayer.PlayerData.money["bank"]
    returnData.radio = Player(otherPlayer.PlayerData.source).state.radioChannel
    -- if you use a custom phone script, make sure to change the line below to the correct phone number
    returnData.phone = GetPlayerPhoneNumber(id) or "Not Available"
    
    return returnData
end

function GetPlayerFrameworkIdentifier(id)
    local otherPlayer = QBCore.Functions.GetPlayer(id)
    if otherPlayer then
        return otherPlayer.PlayerData.citizenid
    else
        return nil
    end
end

function SetJobForPlayer(playerid, job, grade)
    local otherPlayer = QBCore.Functions.GetPlayer(playerid)
    if otherPlayer then
        otherPlayer.Functions.SetJob(job, grade)
    end
end

function GiveMoneyToPlayer(playerid, amount, type)
    local otherPlayer = QBCore.Functions.GetPlayer(playerid)
    if otherPlayer then
        otherPlayer.Functions.AddMoney(type, amount)
    end
end

function SetGangForPlayer(playerid, gang, grade)
    local otherPlayer = QBCore.Functions.GetPlayer(playerid)
    if otherPlayer then
        otherPlayer.Functions.SetGang(gang, grade)
    end
end

function GetAllUniquePlayer()
    local returnData = {}
    local player = MySQL.query.await('SELECT citizenid, JSON_VALUE(players.charinfo, "$.firstname") as firstname, JSON_VALUE(players.charinfo, "$.lastname") as lastname FROM players')
    if player ~= nil then
        for k, v in pairs(player) do
            returnData[#returnData + 1] = {
                id = v.citizenid,
                name = v.firstname.." "..v.lastname
            }
        end
    end
    return returnData
end

function GetOfflinePlayers()
    local returnData = {}
    local player = MySQL.query.await('SELECT DISTINCT license, name FROM players')
    if player ~= nil then
        for k, v in pairs(player) do
            returnData[#returnData + 1] = {
                id = v.license,
                name = v.name
            }
        end
    end
    return returnData
end


function GetFrameworkName(src)
    local player = QBCore.Functions.GetPlayer(src)
    if player ~= nil then
        return player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname
    end
    
end

function ChangeVehiclePlate(src, oldPlate, newPlate)
    local isOwned = MySQL.Sync.fetchScalar('SELECT COUNT(*) FROM player_vehicles WHERE plate = ?', {oldPlate})
    if isOwned == 0 then
        ShowNotification(src, 'This vehicle is not owned by anyone', 'error')
        return 
    end
    local isNewPlateTaken = MySQL.Sync.fetchScalar('SELECT COUNT(*) FROM player_vehicles WHERE plate = ?', {newPlate})
    if isNewPlateTaken > 0 then
        ShowNotification(src, 'This plate is already taken', 'error')
        return 
    end
    local query = 'UPDATE player_vehicles SET plate = ? WHERE plate = ?'
    MySQL.query.await(query, {newPlate, oldPlate})
    TriggerClientEvent('snipe-menu:client:changePlate', src, newPlate)
    SendLogs(src, "triggered", Config.Locales["plate_change_used"]..oldPlate.." to "..newPlate)
end

function ShowNotification(src, msg, type)
    TriggerClientEvent('QBCore:Notify', src, msg, type)
end

local wipeTables = {
    ['players'] = "citizenid",
    ["player_vehicles"] = "citizenid",
    ['player_houses'] = "citizenid",
}


function WipePlayer(identifier)
    for tableName, columnName in pairs(wipeTables) do
        MySQL.Async.execute('DELETE FROM '..tableName..' WHERE '..columnName..' = ?', {identifier}, function(rowsChanged)
            print("Wiped "..rowsChanged.." rows from "..tableName)
        end)
    end
end

local categories = { -- Only include the categories you want. A category not listed defaults to FALSE.
        mods = true, -- Performance Mods
        repair = true,
        armor = true,
        respray = true,
        liveries = true,
        wheels = true,
        tint = true,
        plate = true,
        extras = true,
        neons = true,
        xenons = true,
        horn = true,
        turbo = true,
        cosmetics = true, -- Cosmetic Mods
    }

RegisterServerEvent("snipe-menu:server:toggleBennys", function()
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        SendLogs(src, "triggered", Config.Locales["open_benny"])
        local override = {}
        override["coords"] = GetEntityCoords(GetPlayerPed(src))
        override["heading"] = GetEntityHeading(GetPlayerPed(src))
        override["categories"] = categories
        TriggerClientEvent("qb-customs:client:EnterCustoms", src, override)
    else
        SendLogs(src, "exploit", Config.Locales["toggle_benny_exploit"])
    end
end)

