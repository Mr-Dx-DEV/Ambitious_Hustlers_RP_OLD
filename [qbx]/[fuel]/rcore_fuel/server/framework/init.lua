SharedObject = GetSharedObject()

function IsPlayerAtJob(source, name, grade)
    local player = SharedObject.GetPlayerFromId(source)

    if not player.job.name then
        return false
    end

    if grade and grade == "*" and player.job.name == name then
        return true
    end

    if grade then
        return player.job.name == name and player.job.grade_name == grade
    end
    return player.job.name == name
end

function IsPlayerBossGrade(source, name)
    if Config.Framework.Active == Framework.ESX then
        return IsPlayerAtJob(source, name, "boss")
    end

    if Config.Framework.Active == Framework.QBCORE then
        local player = SharedObject.GetPlayerFromId(source)
        return IsPlayerAtJob(source, name, "*") and player.job.isboss
    end
    return false
end