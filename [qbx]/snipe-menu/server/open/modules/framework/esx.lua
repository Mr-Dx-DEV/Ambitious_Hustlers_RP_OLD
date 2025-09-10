if Config.Framework ~= "esx" then return end

ESX = nil
ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("snipe-menu:server:forceLogout", function(id)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        TriggerEvent("esx:playerLogout") -- only works if you use multicharacter (ESX)
        SendLogs(src, "triggered", Config.Locales["forced_logout_player"]..GetPlayerName(id))
    else
        SendLogs(src, "exploit", Config.Locales["forced_logout_player_exploit"])
    end
end)

function GetPlayerInfo(id)
    local returnData = {}
    local otherPlayer = ESX.GetPlayerFromId(id)
    if not otherPlayer then
        return returnData
    end
    returnData.citizenId = otherPlayer.identifier
    returnData.name = otherPlayer.name
    returnData.job = otherPlayer.job.label.." ("..otherPlayer.job.grade_label..")"
    returnData.gang = otherPlayer.job.label.." ("..otherPlayer.job.grade_label..")" -- gang is job in ESX. If you have gangs, you can change this.
    returnData.cashBalance = otherPlayer.getMoney()
    returnData.bankBalance = otherPlayer.getAccount("bank").money
    returnData.radio = Player(otherPlayer.source).state.radioChannel
    returnData.phone = GetPlayerPhoneNumber(id) or "Not Available"
    
    return returnData
end

function GetFrameworkName(src)
    
    local player = ESX.GetPlayerFromId(src)
    if player ~= nil then
        return player.getName()
    end
    
end

function GetPlayerFrameworkIdentifier(id)
    local otherPlayer = ESX.GetPlayerFromId(id)
    if otherPlayer then
        return otherPlayer.identifier
    else
        return nil
    end
end


function SetJobForPlayer(playerid, job, grade)
    local otherPlayer = ESX.GetPlayerFromId(playerid)
    otherPlayer.setJob(job, grade)
end

function GiveMoneyToPlayer(playerid, amount, type)
    local otherPlayer = ESX.GetPlayerFromId(playerid)
    if type == "cash" then
        otherPlayer.addMoney(amount)
    else
        otherPlayer.addAccountMoney(type, amount)
    end
end

function GetAllUniquePlayer()
    local addedLicenses = {}
    local returnData = {}
    local player = MySQL.query.await('SELECT DISTINCT identifier, firstname, lastname FROM users')
    if player ~= nil then
    
        for k, v in pairs(player) do
            local extracted = v.identifier
            if not addedLicenses[extracted] then
                returnData[#returnData + 1] = {
                    id = extracted,
                    name = v.firstname .. " " .. v.lastname
                }
                addedLicenses[extracted] = true
            end
        end
    end
    return returnData
end

function GetOfflinePlayers()
      local addedLicenses = {}
    local returnData = {}
    local player = MySQL.query.await('SELECT DISTINCT identifier, firstname, lastname FROM users')
    if player ~= nil then
    
        for k, v in pairs(player) do
            local extracted = v.identifier
            if string.match(v.identifier, ":") then
                extracted = string.match(v.identifier, ":(.*)")
            end
            if not addedLicenses[extracted] then
                returnData[#returnData + 1] = {
                    id = "license:"..extracted,
                    name = v.firstname .. " " .. v.lastname
                }
                addedLicenses[extracted] = true
            end
        end
    end
    return returnData
end

function ChangeVehiclePlate(src, oldPlate, newPlate)
    local isOwned = MySQL.Sync.fetchScalar('SELECT COUNT(*) FROM owned_vehicles WHERE plate = ?', {oldPlate})
    if isOwned == 0 then
        ShowNotification(src, 'This vehicle is not owned by anyone', 'error')
        return 
    end
    local isNewPlateTaken = MySQL.Sync.fetchScalar('SELECT COUNT(*) FROM owned_vehicles WHERE plate = ?', {newPlate})
    if isNewPlateTaken > 0 then
        ShowNotification(src, 'This plate is already taken', 'error')
        return 
    end
    local query = 'UPDATE owned_vehicles SET plate = ? WHERE plate = ?'
    MySQL.query.await(query, {newPlate, oldPlate})
    TriggerClientEvent('snipe-menu:client:changePlate', src, newPlate)
    SendLogs(src, "triggered", Config.Locales["plate_change_used"]..oldPlate.." to "..newPlate)
end

function ShowNotification(src, msg, type)
    TriggerClientEvent('esx:showNotification', src, msg)
end

-- specific to ESX
-- used for ESX. To make changes, look in client/open/modules/framework/esx.lua
CreateCallback('snipe-menu:server:getAllJobs', function(source, cb)
    local returnData = ESX.GetJobs()
    cb(returnData)
end)


CreateCallback('snipe-menu:server:getAllItems', function(source, cb)
    cb(ESX.Items) -- for ESX
end)


vehicles = {}
categories = {}

CreateThread(function()
    vehicles = MySQL.query.await('SELECT * FROM vehicles')
    categories = MySQL.query.await('SELECT * FROM vehicle_categories')
end)

CreateCallback("snipe-menu:server:getAllVehicles", function(source, cb)
    for i = 1, #vehicles do
		local vehicle = vehicles[i]
		for j = 1, #categories do
			local category = categories[j]
			if category.name == vehicle.category then
				vehicle.categoryLabel = category.label
				break
			end
		end
	end
    cb(vehicles)
end)

local wipeTables = {
    ['users'] = "identifier",
    ["owned_vehicles"] = "owner"
}


function WipePlayer(identifier)
    for tableName, columnName in pairs(wipeTables) do
        MySQL.Async.execute('DELETE FROM '..tableName..' WHERE '..columnName..' = ?', {identifier}, function(rowsChanged)
            print("Wiped "..rowsChanged.." rows from "..tableName)
        end)
    end
end