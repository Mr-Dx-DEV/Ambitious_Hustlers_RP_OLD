local Core
local PlayerData

Config.Framework = "STANDALONE"

CreateThread(function()
    Wait(2500)
    if Core == nil or Config.UseBuiltInNotifications then
        RegisterNetEvent('17mov_DrawDefaultNotification' .. GetCurrentResourceName(), function(msg)
            Notify(msg)
        end)

        if Core == nil then
            TriggerEvent("esx:getSharedObject", function(obj)
                Core = obj
                Config.Framework = "ESX"
            end)
        end
    end
end)

TriggerEvent("__cfx_export_qb-core_GetCoreObject", function(getCore)
    Core = getCore()
    Config.Framework = "QBCore"
end)

TriggerEvent("__cfx_export_es_extended_getSharedObject", function(getCore)
    Core = getCore()
    Config.Framework = "ESX"
end)

function VehicleCleaned(vehicle)
    -- A function for devs to integrate with other resources
end

function GetClosetVehicle(coords)
    local vehicle = nil
    local radius = 5
    local ignoreZ = true

    for k,v in pairs(GetGamePool("CVehicle")) do
        local vehicleCoords = GetEntityCoords(v)
        local distance = #(vehicleCoords - coords)

        if ignoreZ then
            distance = #(vector2(coords.x, coords.y) - vector2(vehicleCoords.x, vehicleCoords.y))
        end

        if distance < radius then
            vehicle = v
        end
    end

    return vehicle
end

function Notify(msg)
    if Config.Framework == "QBCore" then
        Core.Functions.Notify(msg)
    elseif Config.Framework == "ESX" then
        Core.ShowNotification(msg)
    else
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(false, true)
    end
end

function ShowHelpNotification(msg)
    if msg == nil then return end
    AddTextEntry('HelpNotification', msg)
    DisplayHelpTextThisFrame('HelpNotification', false)
end

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    SetTextScale(0.32, 0.32)
    SetTextFont(4)
    SetTextProportional(true)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 500
    DrawRect(_x, _y + 0.0125, 0.030 + factor, 0.03, 0, 0, 0, 150)
end

-- Job
CreateThread(function()
    while Core == nil do
        Wait(250)
    end

    while PlayerData == nil do
        if Config.Framework == "QBCore" then
            PlayerData = Core.Functions.GetPlayerData()
        elseif Config.Framework == "ESX" then
            PlayerData = Core.GetPlayerData()
        else
            print(("STANDALONE - You need to configure %s/client/functions.lua by yourself"):format(GetCurrentResourceName()))
        end

        Wait(250)
    end

    if Config.Framework == "QBCore" then
        RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
            if PlayerData == nil then return end
            PlayerData.job = job
        end)
    elseif Config.Framework == "ESX" then
        RegisterNetEvent('esx:setJob', function(job)
            if PlayerData == nil then return end
            PlayerData.job = job
        end)
    else
        print(("STANDALONE - You need to configure %s/client/functions.lua by yourself"):format(GetCurrentResourceName()))
    end
end)

function GetPlayerJobName()    
    if Config.Framework == "QBCore" then
        PlayerData = Core.Functions.GetPlayerData()
        if( PlayerData == nil or PlayerData.job == nil ) then return "" end
        return PlayerData.job.name
    elseif Config.Framework == "ESX" then
        PlayerData = Core.GetPlayerData()
        if( PlayerData == nil or PlayerData.job == nil ) then return "" end 
        return PlayerData.job.name
    else
        print(("STANDALONE - You need to configure GetPlayerJobName() in resource %s by yourself"):format(GetCurrentResourceName()))
    end

    return nil
end