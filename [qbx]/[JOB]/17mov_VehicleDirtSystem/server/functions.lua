Core = nil
Config.Framework = "STANDALONE"

TriggerEvent("__cfx_export_qb-core_GetCoreObject", function(getCore)
    Core = getCore()
    Config.Framework = "QBCore"
end)

TriggerEvent("__cfx_export_es_extended_getSharedObject", function(getCore)
    Core = getCore()
    Config.Framework = "ESX"
end)

CreateThread(function()
    Wait(1000)
    if Core == nil then
        TriggerEvent("esx:getSharedObject", function(obj)
            Core = obj
            Config.Framework = "ESX"
        end)
    end


    for item, _ in pairs(Config.Items) do
        RegisterUsableItem(item, function(source)
            RemoveItem(source, item, 1)
            RemovedItems[tostring(source)] = item
            TriggerClientEvent("17mov_VehicleDirtSystem:ApplyProtection", source, item)
        end)
    end
end)

function RegisterUsableItem(name, cb)
    if Config.Framework == "QBCore" then
        Core.Functions.CreateUseableItem(name, cb)
    elseif Config.Framework == "ESX" then
        Core.RegisterUsableItem(name, cb)
    end
end

function Notify(source, msg)
    if Config.Framework == "QBCore" then
        TriggerClientEvent("QBCore:Notify", source, msg)
    elseif Config.Framework == "ESX" then
        TriggerClientEvent("esx:showNotification", source, msg)
    else
        TriggerClientEvent("17mov_DrawDefaultNotification" .. GetCurrentResourceName(), source, msg)
    end
end

function GetMoney(source, accountType)
    if Config.Framework == "QBCore" then
        local Player = Core.Functions.GetPlayer(source)
        if Player ~= nil and Player.PlayerData ~= nil and Player.PlayerData.money ~= nil then
            return Player.PlayerData.money[accountType]
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = Core.GetPlayerFromId(source)
        if accountType == "cash" then accountType = "money" end
        if xPlayer ~= nil and xPlayer.getAccount ~= nil then
            return xPlayer.getAccount(accountType).money
        end
    else
        -- Configure here ur remove money func
        return 1000000
    end
end

function RemoveMoney(source, amount, accountType)
    if Config.Framework == "QBCore" then
        local Player = Core.Functions.GetPlayer(source)
        if Player ~= nil and Player.Functions ~= nil then
            return Player.Functions.RemoveMoney(accountType, amount)
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = Core.GetPlayerFromId(source)
        if accountType == "cash" then accountType = "money" end
        if xPlayer ~= nil and xPlayer.removeAccountMoney ~= nil then
            xPlayer.removeAccountMoney(accountType, amount)
            return true
        end
    else
        -- Configure here ur remove money func
        print(string.format("^1[WARNING]^0 Player %s attempted to purchase item/run a car wash, but since no money system is added, money has been not charged. Please link your money system in /server/functions.lua file.", source))
        return true
    end
end

function AddItem(source, itemName, quantity)
    if Config.Framework == "QBCore" then
        local Player = Core.Functions.GetPlayer(source)
        if Player ~= nil and Player.Functions ~= nil then
            return Player.Functions.AddItem(itemName, quantity)
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = Core.GetPlayerFromId(source)

        if xPlayer ~= nil and xPlayer.addInventoryItem ~= nil then
            xPlayer.addInventoryItem(itemName, quantity)
            return true
        end
    else
        -- Configure your items system here, but always return true/false, depends if item has been added or not.
        -- Since no we don't know your inventory system, we're triggering the usage right away instead of adding to inventory
        TriggerClientEvent("17mov_VehicleDirtSystem:ApplyProtection", source, itemName)
        return true
    end
end

function RemoveItem(source, itemName, quantity)
    if Config.Framework == "QBCore" then
        local Player = Core.Functions.GetPlayer(source)
        if Player ~= nil and Player.Functions ~= nil then
            return Player.Functions.RemoveItem(itemName, quantity)
        end
    elseif Config.Framework == "ESX" then
        local xPlayer = Core.GetPlayerFromId(source)

        if xPlayer ~= nil and xPlayer.addInventoryItem ~= nil then
            xPlayer.removeInventoryItem(itemName, quantity)
            return true
        end
    else
        -- Configure your items system here, but always return true/false, depends if item has been added or not.
        return true
    end
end

function HasDevToolPermission(source)
    if Config.Framework == 'QBCore' then
        return Core.Functions.HasPermission(source, Config.Premissionlevel)
    elseif Config.Framework == 'ESX' then
        local xPlayer = Core.GetPlayerFromId(source)
        if xPlayer ~= nil and xPlayer.getGroup ~= nil then
            return xPlayer.getGroup() == Config.Premissionlevel
        end
    else
        return IsPlayerAceAllowed(source, Config.Premissionlevel)
    end
end

