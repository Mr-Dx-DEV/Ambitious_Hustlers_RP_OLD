local PlayerData = {}

function UpdatePlayerDataForQBCore()
    local pData = SharedObject.Functions.GetPlayerData()

    local jobName = "none"
    local gradeName = "none"

    if pData.job then
        jobName = pData.job.name or "none"

        if pData.job.grade then
            gradeName = pData.job.grade.name
        end
    end

    PlayerData = {
        job = {
            name = jobName,
            grade_name = gradeName,
        }
    }

    TriggerEvent("rcore_fuel:PlayerJobUpdated")
end

OnObjectLoaded(function()
    if SharedObject.IsPlayerLoaded then
        if SharedObject.IsPlayerLoaded() then
            PlayerData = SharedObject.GetPlayerData()
            TriggerEvent("rcore_fuel:PlayerJobUpdated")
        end
    end

    if SharedObject and SharedObject.Functions then
        if SharedObject and SharedObject.Functions.GetPlayerData then
            UpdatePlayerDataForQBCore()
        end
    end
end)

RegisterNetEvent(Config.Events.QBCore.playerLoaded, function()
    UpdatePlayerDataForQBCore()
end)

RegisterNetEvent(Config.Events.QBCore.jobUpdate, function()
    UpdatePlayerDataForQBCore()
end)

RegisterNetEvent(Config.Events.ESX.playerLoaded, function(xPlayer)
    PlayerData = xPlayer
    TriggerEvent("rcore_fuel:PlayerJobUpdated")
end)

RegisterNetEvent(Config.Events.ESX.jobUpdate, function(job)
    PlayerData.job = job
    TriggerEvent("rcore_fuel:PlayerJobUpdated")
end)

function IsPlayerBossGrade(name)
    if Config.Framework.Active == Framework.ESX then
        return IsAtJob(name, "boss")
    end

    if Config.Framework.Active == Framework.QBCORE then
        local pData = SharedObject.Functions.GetPlayerData()
        return IsAtJob(name, "*") and pData.job.isboss
    end
    return false
end

function GetPlayerBossName()
    if Config.Framework.Active == Framework.ESX then
        return PlayerData.job.grade_name
    end

    if Config.Framework.Active == Framework.QBCORE then
        local pData = SharedObject.Functions.GetPlayerData()
        return string.format("QBcore boss = %s", pData.job.isboss)
    end
    return "No framework detected"
end

function GetPlayerJobName()
    if not PlayerData or not PlayerData.job then
        return "none"
    end
    return PlayerData.job.name
end

function IsAtJob(name, grade)
    if not PlayerData or not PlayerData.job then
        print("ERROR", "the job for ESX/QBCore is nil value please check if your events are correct.")
        return true
    end

    if grade and grade == "*" and PlayerData.job.name == name then
        return true
    end
    if grade then
        return PlayerData.job.name == name and PlayerData.job.grade_name == grade
    end
    return PlayerData.job.name == name
end