if Config.Framework ~= "qbx" then return end

PlayerJob = nil

function GetJobsWithNameAndLabel()

    local returnData = {}
    for k, v in pairs(exports.qbx_core:GetJobs()) do
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
    for k, v in pairs(exports.qbx_core:GetJobs()) do
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


function GetGangsWithNameAndLabel()
    local returnData = {}
    for k, v in pairs(exports.qbx_core:GetGangs()) do
        returnData[#returnData + 1] = {
            id = k,
            name = v.label,
        }
    end
    return returnData
end

function GetGangsWithNameAndLabelAndGrades()
    local returnData = {}
    for k, v in pairs(exports.qbx_core:GetGangs()) do
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
    for k, v in pairs(exports.qbx_core:GetVehiclesByName()) do
        returnData[#returnData + 1] = {
            id = v.model,
            name = v.name,
        }
    end
    return returnData
end

function GetVehicleTypeFromHash(hash, veh)
    local vehicle = exports.qbx_core:GetVehiclesByHash(hash)
    return vehicle and vehicle.type or nil
end

function GetVehicleNameFromHash(hash)
    local vehicle = exports.qbx_core:GetVehiclesByHash(hash)
    return vehicle and vehicle.model or nil
end

function GetVehicleProperties(veh)
    return lib.getVehicleProperties(veh)
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
    PlayerData = exports.qbx_core:GetPlayerData()
    PlayerJob = PlayerData.job
end

function ToggleDuty()
    TriggerServerEvent("QBCore:ToggleDuty")
end

function ShowNotification(msg, type)
    exports.qbx_core:Notify(msg, type)
end

function BennyOpen()
   -- open bennys
end