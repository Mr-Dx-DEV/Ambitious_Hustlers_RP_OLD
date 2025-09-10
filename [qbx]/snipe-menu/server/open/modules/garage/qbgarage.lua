if Config.Garage ~= "qb" then return end

function GetOutsideVehicles()
    local query = 'SELECT id, plate as name FROM '..Config.FrameworkTriggers[Config.Framework].Garage_Table.. ' WHERE state = ?'
    local result = MySQL.query.await(query, { 0 })
    return result or {}
end

function ChangeVehicleState(plate)
    local query = 'UPDATE '..Config.FrameworkTriggers[Config.Framework].Garage_Table..' SET state = ? WHERE plate = ?'
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
    garageName = "pillboxgarage"
    local otherPlayer = nil
    if Config.Framework == "qb" then
        otherPlayer= QBCore.Functions.GetPlayer(playerid)
    elseif Config.Framework == "qbx" then
        otherPlayer = exports.qbx_core:GetPlayer(playerid)
    end
    if not otherPlayer then
        ShowNotification(src, 'Player not found', 'error')
        return
    end

    MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
        otherPlayer.PlayerData.license,
        otherPlayer.PlayerData.citizenid,
        carname,
        GetHashKey(carname),
        json.encode(properties.props),
        properties.props.plate,
        garageName,
        1
    })

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
    garageName = "pillboxgarage"
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

    MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
        otherPlayer.PlayerData.license,
        otherPlayer.PlayerData.citizenid,
        carname,
        GetHashKey(carname),
        json.encode(properties.props),
        properties.props.plate,
        garageName,
        1
    })
    SendLogs(src, "triggered", Config.Locales["admin_car_used"].." "..carname)
end