if Config.Framework ~= "qb" then return end
QBCore = exports[Config.FrameworkTriggers["qb"].ResourceName]:GetCoreObject()

function PopulateData()
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
    PlayerGang = PlayerData.gang
    PlayerInfo = {
        job = PlayerData.job.name,
        grade = PlayerData.job.grade.level,
        identifier = PlayerData.citizenid,
    }
    PlayerData = nil
    SetupUI()
    dna, fingerprint = lib.callback.await("snipe-evidence:server:playerLoaded", false)
end


RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].OnJobUpdate)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].OnJobUpdate, function(job)
    PlayerInfo.job = job.name
    PlayerInfo.grade = job.grade.level
end)


RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].PlayerUnload)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].PlayerUnload, function()
    PlayerInfo = nil
end)


RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].PlayerLoaded)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].PlayerLoaded, function()
    PopulateData()
end)
