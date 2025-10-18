if Config.Framework ~= "qb" then return end
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
if QBCore == nil then
    QBCore = exports[Config.FrameworkTriggers["qb"].ResourceName]:GetCoreObject()
end

function GetPlayerFrameworkIdentifier(id)
    if PlayerIdentifiers[id] then
        return PlayerIdentifiers[id]
    end
    local Player = QBCore.Functions.GetPlayer(id)
    if not Player then
        return
    end
    PlayerIdentifiers[id] = Player.PlayerData.citizenid
    return Player.PlayerData.citizenid
end

function CanAccess(id)
    local Player = QBCore.Functions.GetPlayer(id)
    local job = Player.PlayerData.job.name
    if Config.Jobs[job] then
        return true
    end
    return false
end

function CanRemoveEvidence(id)
    local Player = QBCore.Functions.GetPlayer(id)
    local job = Player.PlayerData.job.name
    local jobGrade = Player.PlayerData.job.grade.level
    return Config.EditPerms[job] and jobGrade >= Config.EditPerms[job] or false
end