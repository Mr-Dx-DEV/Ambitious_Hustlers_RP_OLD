if Config.Framework ~= "esx" then return end

PlayerJob = nil
ESX = nil

ESX = exports[Config.FrameworkTriggers[Config.Framework].ResourceName]:getSharedObject()


function GetJobsWithNameAndLabel()
    local p = promise.new()
    local returnData = {}
    TriggerCallback("snipe-menu:server:getAllJobs", function(result)
        p:resolve(result)
    end)
    local Jobs = Citizen.Await(p)
    for k, v in pairs(Jobs) do
        returnData[#returnData + 1] = {
            id = k,
            name = v.label,
        }
    end
    -- this is added for public stash (do not touch it)
    returnData[#returnData + 1] = {
        id = "all",
        name = "Public Stash",
    }
    return returnData
end

function GetJobsWithNameAndLabelAndGrades()
    local returnData = {}
    local p = promise.new()
    TriggerCallback("snipe-menu:server:getAllJobs", function(result)
        p:resolve(result)
    end)
    local Jobs = Citizen.Await(p)
    for k, v in pairs(Jobs) do
        for a, b in pairs(v.grades) do
            returnData[#returnData + 1] = {
                id = k,
                name = v.label.. " - " ..b.name,
                grade = a
            }
        end
    end
    return returnData
end

function GetVehiclesList()
    local returnData = {}
    local p = promise.new()
    TriggerCallback("snipe-menu:server:getAllVehicles", function(vehicles)
        p:resolve(vehicles)
    end)
    local vehicles = Citizen.Await(p)
    for k, v in pairs(vehicles) do
        returnData[#returnData + 1] = {
            id = v.model,
            name = v.name,
        }
    end
    return returnData
end

function GetVehicleTypeFromHash(hash, veh)
    if GetVehicleClass(veh) == 14 then
        type = "boats"
    elseif GetVehicleClass(veh) == 15 or GetVehicleClass(veh) == 16 then
        type = "air"
    end
end

function GetVehicleNameFromHash(hash)
    return hash
end

function GetVehicleProperties(veh)
    return ESX.Game.GetVehicleProperties(veh)
end

RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].PlayerLoaded)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].PlayerLoaded, function()
    PopulateData()
end)


RegisterNetEvent(Config.FrameworkTriggers[Config.Framework].OnJobUpdate)
AddEventHandler(Config.FrameworkTriggers[Config.Framework].OnJobUpdate, function(jobData)
    PlayerJob = jobData
end)

function PopulateData()
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end
    PlayerData = ESX.GetPlayerData()
    PlayerJob = PlayerData.job
end


function ToggleDuty()
    -- no events to toggle duty in ESX, so we will just return true
end

function ShowNotification(msg, type)
    ESX.ShowNotification(msg)
    
end


function BennyOpen()
   -- open bennys
end