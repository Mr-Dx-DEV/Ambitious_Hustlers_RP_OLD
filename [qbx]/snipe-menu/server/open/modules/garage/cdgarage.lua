if Config.Garage ~= "cd" then return end

function GetOutsideVehicles()
    local query = 'SELECT id as id, plate as name FROM '..Config.FrameworkTriggers[Config.Framework].Garage_Table.. ' WHERE in_garage = ?'
    local result = MySQL.query.await(query, { 0 })
    return result or {}
end

function ChangeVehicleState(plate)
    local query = 'UPDATE '..Config.FrameworkTriggers[Config.Framework].Garage_Table..' SET in_garage = ? WHERE plate = ?'
    MySQL.update.await(query, { 1, plate })
end

function GiveCarToPlayer(playerid, carname, properties, type, src)
    local garageType = "car"
    local garageName = "pillboxgarage"
    if type == "boats" then
        garageType = "boat"
    elseif type == "air" then
        garageType = "air"
    end
    garageName = "A"

    if Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(playerid)
        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, garage_id, garage_type, in_garage) VALUES (?, ?, ?, ?, ?, ?)', {
            xPlayer.identifier,
            properties.props.plate,
            json.encode(properties.props),
            garageName,
            garageType,
            1
        })
    elseif Config.Framework == "qb" or Config.Framework == "qbx" then
        local otherPlayer = nil
        if Config.Framework == "qb" then
            otherPlayer = QBCore.Functions.GetPlayer(playerid)
        elseif Config.Framework == "qbx" then
            otherPlayer = exports.qbx_core:GetPlayer(playerid)
        end
        if not otherPlayer then
            ShowNotification(src, 'Player not found', 'error')
            return
        end
        local cid = otherPlayer.PlayerData.citizenid
        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage_id, garage_type, in_garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            otherPlayer.PlayerData.license,
            cid,
            carname,
            GetHashKey(carname),
            json.encode(properties.props),
            properties.props.plate,
            garageName,
            garageType,
            1
        })
    end

    SendLogs(src, "triggered", Config.Locales["give_car_used"].." "..carname .. " to " .. GetPlayerName(playerid))
end

function AdminCarVehicle(carname, properties, type, src)
    if not onlineAdmins[src] then
        return
    end

    local plate = properties.props.plate
    local existingVehicle = MySQL.query.await('SELECT plate FROM '..Config.FrameworkTriggers[Config.Framework].Garage_Table..' WHERE plate = ?', { plate })
    
    if existingVehicle[1] then
        ShowNotification(src, Config.Locales["car_already_owned"], "error")
        return
    end

    local garageType = "car"
    local garageName = "pillboxgarage"
    if type == "boats" then
        garageType = "boat"
    elseif type == "air" then
        garageType = "air"
    end
    garageName = "A"

    local otherPlayer = nil
    if Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle, garage_id, garage_type, in_garage) VALUES (?, ?, ?, ?, ?, ?)', {
            xPlayer.identifier,
            properties.props.plate,
            json.encode(properties.props),
            garageName,
            garageType,
            1
        })
    elseif Config.Framework == "qb" or Config.Framework == "qbx" then
        local otherPlayer = nil
        if Config.Framework == "qb" then
            otherPlayer = QBCore.Functions.GetPlayer(src)
        elseif Config.Framework == "qbx" then
            otherPlayer = exports.qbx_core:GetPlayer(src)
        end
        if not otherPlayer then
            ShowNotification(src, 'Player not found', 'error')
            return
        end
        local cid = otherPlayer.PlayerData.citizenid
        MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage_id, garage_type, in_garage) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
            otherPlayer.PlayerData.license,
            cid,
            carname,
            GetHashKey(carname),
            json.encode(properties.props),
            properties.props.plate,
            garageName,
            garageType,
            1
        })
    end

    SendLogs(src, "triggered", Config.Locales["admin_car_used"].." "..carname)
end