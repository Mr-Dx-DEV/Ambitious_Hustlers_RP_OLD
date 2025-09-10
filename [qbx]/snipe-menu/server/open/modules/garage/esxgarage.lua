if Config.Garage ~= "esx" then return end

function GetOutsideVehicles()
    local query = 'SELECT id as id, plate as name FROM '..Config.FrameworkTriggers[Config.Framework].Garage_Table.. ' WHERE stored = ?'
    local result = MySQL.query.await(query, { 0 })
    return result or {}
end

function ChangeVehicleState(plate)
    local query = 'UPDATE '..Config.FrameworkTriggers[Config.Framework].Garage_Table..' SET stored = ? WHERE plate = ?'
    MySQL.update.await(query, { 1, plate })
end

function GiveCarToPlayer(playerid, carname, properties, type, src)
    local garageType = "car"
    local garageName = "pillboxgarage"
    local xPlayer = ESX.GetPlayerFromId(playerid)
    MySQL.insert('INSERT INTO owned_vehicles (owner, vehicle, plate, stored, type) VALUES (?, ?, ?, ?, ?)', {
        xPlayer.identifier,
        json.encode(properties.props),
        properties.props.plate,
        true,
        garageType
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
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.insert('INSERT INTO owned_vehicles (owner, vehicle, plate, stored, type) VALUES (?, ?, ?, ?, ?)', {
        xPlayer.identifier,
        json.encode(properties.props),
        properties.props.plate,
        true,
        garageType
    })

    SendLogs(src, "triggered", Config.Locales["admin_car_used"].." "..carname)
end