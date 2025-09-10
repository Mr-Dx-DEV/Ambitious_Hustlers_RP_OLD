if Config.Framework ~= "qb" then return end

QBCore = nil
PlayerJob = nil


QBCore = exports[Config.FrameworkTriggers[Config.Framework].ResourceName]:GetCoreObject()

function GetJobsWithNameAndLabel()
    local returnData = {}
    for k, v in pairs(QBCore.Shared.Jobs) do
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
    for k, v in pairs(QBCore.Shared.Jobs) do
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
    for k, v in pairs(QBCore.Shared.Gangs) do
        returnData[#returnData + 1] = {
            id = k,
            name = v.label,
        }
    end
    return returnData
end

function GetGangsWithNameAndLabelAndGrades()
    local returnData = {}
    for k, v in pairs(QBCore.Shared.Gangs) do
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
    for k, v in pairs(QBCore.Shared.Vehicles) do
        returnData[#returnData + 1] = {
            id = v.model,
            name = v.name,
        }
    end
    return returnData
end


function GetVehicleTypeFromHash(hash, veh)
	for _, v in pairs(QBCore.Shared.Vehicles) do
        local vehHash
        if type(v.hash) == "string" then
            if Config.Debug then
                print("hash for the vehicle ".. v.model .. " is a string. Make sure to change it to a hash value in the qb-core/shared/vehicles.lua file")
            end
            vehHash = GetHashKey(v.hash)
        else
            vehHash = v.hash
        end
		if hash == vehHash then
			return v.type
		end
	end
    return nil
end

function GetVehicleNameFromHash(hash)
    for _, v in pairs(QBCore.Shared.Vehicles) do
        local vehHash
        if type(v.hash) == "string" then
            if Config.Debug then
                print("hash for the vehicle ".. v.model .. " is a string. Make sure to change it to a hash value in the qb-core/shared/vehicles.lua file")
            end
            vehHash = GetHashKey(v.hash)
        else
            vehHash = v.hash
        end
        if hash == vehHash then
            return v.model
        end
    end
    return nil
end

function GetVehicleProperties(veh)
    return QBCore.Functions.GetVehicleProperties(veh)
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
    PlayerData = QBCore.Functions.GetPlayerData()
    PlayerJob = PlayerData.job
end


function ToggleDuty()
    TriggerServerEvent("QBCore:ToggleDuty") -- this event is present in qb-core/server/main.lua
end

function ShowNotification(msg, type)
    QBCore.Functions.Notify(msg, type)
end

function BennyOpen()
    TriggerServerEvent("snipe-menu:server:toggleBennys")
end