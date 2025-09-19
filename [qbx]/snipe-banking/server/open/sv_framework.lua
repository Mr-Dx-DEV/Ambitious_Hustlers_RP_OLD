QBCore, ESX = nil, nil
disabled = false

if Config.Framework == "qb" then
    TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
    if QBCore == nil then
        QBCore = exports[Config.FrameworkTriggers["qb"].ResourceName]:GetCoreObject()
    end
    Config.JobAccounts = true
elseif Config.Framework == "esx" then
    local status, errorMsg = pcall(function() ESX = exports[Config.FrameworkTriggers["esx"].ResourceName]:getSharedObject() end)
    -- ESX = exports[Config.FrameworkTriggers["esx"].ResourceName]:getSharedObject()
    if (ESX == nil) then
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
else
    print("Framework not found")
    disabled = true
end

function ShowNotification(source, msg, type)
    if Config.Notify == "qb" then
        TriggerClientEvent('QBCore:Notify', source, msg, type)
    elseif Config.Notify == "ox" then
        TriggerClientEvent('ox_lib:notify', source, {type = type, description = msg})
    elseif Config.Notify == "esx" then
        TriggerClientEvent('esx:showNotification', source, msg)
    elseif Config.Notify == "okok" then
        TriggerClientEvent('okokNotify:Alert', source, "Banking", msg, 5000, type)
    end
end

function GetPlayerFrameWorkName(src)
    if playerInfo[GetPlayerFrameworkIdentifier(src)] and playerInfo[GetPlayerFrameworkIdentifier(src)].name then
        return playerInfo[GetPlayerFrameworkIdentifier(src)].name
    end
    if Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        if not xPlayer then return nil end
        return xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if not xPlayer then return nil end
        return xPlayer.getName()
    end
end

function GetOfflinePlayerName(identifier)
    if Config.Framework == "qb" then
        local player = MySQL.query.await('SELECT CONCAT(JSON_VALUE(players.charinfo, "$.firstname"), " ", JSON_VALUE(players.charinfo, "$.lastname")) as name FROM players WHERE citizenid = ?', {identifier})
        return player[1] and player[1].name or "Unknown"
        
    elseif Config.Framework == "esx" then
        local player = MySQL.query.await('SELECT firstname, lastname FROM users WHERE identifier = ?', {identifier})
        if player[1] ~= nil then
            return player[1].firstname .. " " .. player[1].lastname
        else
            return "Unknown"
        end
    end
end

function GetPlayerFrameworkIdentifier(src)
    if playerIdentifiers[src] then
        return playerIdentifiers[src]
    else
        if Config.Framework == "qb" then
            local xPlayer = QBCore.Functions.GetPlayer(src)
            if not xPlayer then return nil end
            playerIdentifiers[src] = xPlayer.PlayerData.citizenid
            return xPlayer.PlayerData.citizenid
        elseif Config.Framework == "esx" then
            local xPlayer = ESX.GetPlayerFromId(src)
            if not xPlayer then return nil end
            playerIdentifiers[src] = xPlayer.identifier
            return xPlayer.identifier
        end
    end
end

function GetOnlinePlayerSourceFromIdentifier(identifier)
    if not playerInfo[identifier] then return nil end
    return playerInfo[identifier].source 
end

function GetPlayerObjectFromIdentifer(identifier)
    if Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayerByCitizenId(identifier)
        if xPlayer then
            return xPlayer
        end
        return nil
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
        if xPlayer then
            return xPlayer
        end
        return nil
    end
end

lib.callback.register("snipe-banking:server:getCharacterName", function(source)
    return GetPlayerFrameWorkName(source)
end)