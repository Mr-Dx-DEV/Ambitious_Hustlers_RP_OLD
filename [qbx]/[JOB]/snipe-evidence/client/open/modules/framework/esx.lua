if Config.Framework ~= "esx" then return end
local status, errorMsg = pcall(function() ESX = exports[Config.FrameworkTriggers["esx"].ResourceName]:getSharedObject() end)
if (ESX == nil) then
    while ESX == nil do
        Wait(100)
        TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
    end
end

function PopulateData()    
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
    PlayerInfo = {
        job = PlayerData.job.name,
        grade = PlayerData.job.grade,
        identifier = PlayerData.identifier,
    }
    PlayerData = nil
    
    SetupUI()
    dna, fingerprint = lib.callback.await("snipe-evidence:server:playerLoaded", false)
end


RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].OnJobUpdate)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].OnJobUpdate, function(job)
    PlayerInfo.job = job.name
    PlayerInfo.grade = job.grade
end)


RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].PlayerUnload)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].PlayerUnload, function()
    PlayerInfo = nil
end)


RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].PlayerLoaded)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].PlayerLoaded, function()
    PopulateData()
end)
