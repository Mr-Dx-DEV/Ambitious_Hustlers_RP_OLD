if Config.Framework ~= "esx" then return end
local status, errorMsg = pcall(function() ESX = exports[Config.FrameworkTriggers["esx"].ResourceName]:getSharedObject() end)
if (ESX == nil) then
    TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
end

function GetPlayerFrameworkIdentifier(id)
    if PlayerIdentifiers[id] then
        return PlayerIdentifiers[id]
    end
    local xPlayer = ESX.GetPlayerFromId(id)
    if not xPlayer then
        return
    end
    PlayerIdentifiers[id] = xPlayer.identifier
    return xPlayer.identifier
end

function CanAccess(id)
   
    local xPlayer = ESX.GetPlayerFromId(id)
    local job = xPlayer.job.name
    if Config.Jobs[job] then
        return true
    end
    
end

function CanRemoveEvidence(id)
    local Player = QBCore.Functions.GetPlayer(id)
    local job = Player.PlayerData.job.name
    local jobGrade = Player.PlayerData.job.grade.level
    return Config.EditPerms[job] and jobGrade >= Config.EditPerms[job] or false
end