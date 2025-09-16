QBCore, ESX = nil, nil
PlayerInfo = {}
PlayerJob = nil
PlayerGang = nil
PlayerFullyLoaded = false

if Config.Framework == "qb" then
    QBCore = exports[Config.FrameworkTriggers["qb"].ResourceName]:GetCoreObject()
elseif Config.Framework == "esx" then
    local status, errorMsg = pcall(function() ESX = exports[Config.FrameworkTriggers["esx"].ResourceName]:getSharedObject() end)
    if (ESX == nil) then
        while ESX == nil do
            Wait(100)
            TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
        end
    end
end

local function PopulateData()
    if Config.Framework == "qb" then
        PlayerData = QBCore.Functions.GetPlayerData()
        PlayerJob = PlayerData.job
        PlayerGang = PlayerData.gang
        CheckIfAccountFrozen(PlayerData.citizenid)
        PlayerInfo = {
            job = PlayerData.job.name,
            jobLabel = PlayerData.job.label,
            jobGrade = PlayerData.job.grade.level,
            isBossJob = PlayerData.job.isboss,
            gang = PlayerData.gang.name,
            gangLabel = PlayerData.gang.label,
            isBossGang = PlayerData.gang.isboss,
            identifier = PlayerData.citizenid,
            name = PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname,
        }
        Config.JobAccounts = true
        PlayerData = nil
    elseif Config.Framework == "esx" then
        while ESX.GetPlayerData().job == nil do
            Citizen.Wait(10)
        end
        PlayerData = ESX.GetPlayerData()
        PlayerJob = PlayerData.job
        CheckIfAccountFrozen(PlayerData.identifier)
        PlayerInfo = {
            job = PlayerData.job.name,
            jobLabel = PlayerData.job.label,
            jobGrade = PlayerData.job.grade,
            isBossJob = PlayerData.job.grade_name == "boss",
            identifier = PlayerData.identifier,
            name = lib.callback.await("snipe-banking:server:getCharacterName", false),
        }
        PlayerData = nil
    end

    lib.callback.await("snipe-banking:server:playerInitialised", false, PlayerInfo)
    print("Snipe-Banking: Player Data Loaded")
    PlayerFullyLoaded = true
end

local function UpdateJob(jobData)
    if (PlayerInfo.job == jobData.name) and (PlayerInfo.jobGrade == jobData.grade) then 
        return 
    end
    if Config.Framework == "qb" then
        PlayerInfo.job = jobData.name
        PlayerInfo.isBossJob = jobData.isboss
        PlayerInfo.jobLabel = jobData.label
        PlayerInfo.jobGrade = jobData.grade.level
    elseif Config.Framework == "esx" then
        PlayerInfo.job = jobData.name
        PlayerInfo.isBossJob = jobData.grade_name == "boss"
        PlayerInfo.jobLabel = jobData.label
        PlayerInfo.jobGrade = jobData.grade
    end
    if PlayerInfo.isBossJob then
        isFirstTime = true
    end
    lib.callback.await("snipe-banking:server:playerJobUpdated", false, PlayerInfo)
end

RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].PlayerLoaded)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].PlayerLoaded, function()
    PopulateData()
end)

RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].PlayerUnload)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].PlayerUnload, function()
    PlayerLoaded = false
    PlayerJob = nil
    lib.callback.await("snipe-banking:server:playerUnloaded", false)
end)

RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].OnJobUpdate)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].OnJobUpdate, function(job)
    PlayerJob = job
    UpdateJob(job)
end)

if Config.Framework == "qb" then
    RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].OnGangUpdate)
    AddEventHandler(Config.FrameworkTriggers[Config.Framework].OnGangUpdate, function(gang)
        PlayerGang = gang
        PlayerInfo.gang = gang.name
        PlayerInfo.isBossGang = gang.isboss
        PlayerInfo.gangLabel = gang.label
        if PlayerInfo.gang.isBossGang then
            isFirstTime = true
        end
    end)

end

AddEventHandler("onResourceStart", function(name)
    Wait(5000)
    if name ~= GetCurrentResourceName() then return end
    PopulateData()
    
end)

function ShowNotification(msg, type)
    if Config.Notify == "ox" then
        lib.notify({type = type, description = msg})
    elseif Config.Notify == "qb" then
        QBCore.Functions.Notify(msg, type)
    elseif Config.Notify == "esx" then
        ESX.ShowNotification(msg)
    elseif Config.Notify == "okok" then
        exports['okokNotify']:Alert("Banking", msg, 5000, type)
    end
end