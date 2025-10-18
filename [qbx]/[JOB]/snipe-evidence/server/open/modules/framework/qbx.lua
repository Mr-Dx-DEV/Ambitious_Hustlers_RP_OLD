if Config.Framework ~= "qbx" then return end

function GetPlayerFrameworkIdentifier(id)
    if PlayerIdentifiers[id] then
        return PlayerIdentifiers[id]
    end
    local Player = exports.qbx_core:GetPlayer(id)
    if not Player then
        return
    end
    PlayerIdentifiers[id] = Player.PlayerData.citizenid
    return Player.PlayerData.citizenid
end

function CanAccess(id)
    local Player = exports.qbx_core:GetPlayer(id)
    local job = Player.PlayerData.job.name
    if Config.Jobs[job] then
        return true
    end
    return false
end

function CanRemoveEvidence(id)
    local Player = exports.qbx_core:GetPlayer(id)
    local job = Player.PlayerData.job.name
    local jobGrade = Player.PlayerData.job.grade.level
    return Config.EditPerms[job] and jobGrade >= Config.EditPerms[job] or false

end