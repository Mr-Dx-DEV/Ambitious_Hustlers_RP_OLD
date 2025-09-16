function SendPoliceAlertForFlaggedAccount()
    if Config.Dispatch == "cd" then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police', }, 
            coords = data.coords,
            title = '10-15 - Flagged Account Accessed',
            message = 'A '..data.sex..' accessed a flagged account on '..data.street, 
            flash = 0,
            unique_id = data.unique_id,
            sound = 1,
            blip = {
                sprite = 140, 
                scale = 1.2, 
                colour = 3,
                flashes = false, 
                text = '911 - Flagged Account',
                time = 5,
                radius = 0,
            }
        })
    elseif Config.Dispatch == "ps" then
        -- check readme for the changes to be made in ps-dispatch
        -- exports["ps-dispatch"]:FlaggedAccount()
        exports["ps-dispatch"]:CustomAlert({
            coords = GetEntityCoords(PlayerPedId()),
            message = "Flagged Account Accessed",
            dispatchCode = "10-15",
            description = "A flagged account has been detected.",
            length = 3,
            radius = 0,
            sprite = 140,
            color = 3,
            scale = 1.0,
            code = '10-15',
        })
    elseif Config.Dispatch == "moz" then
        exports["moz-dispatch"]:FlaggedAccount()
    elseif Config.Dispatch == "other" then
        local coords = GetEntityCoords(PlayerPedId())
        local streetName, crossing = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
        local streetName = GetStreetNameFromHashKey(streetName)
        local crossing = GetStreetNameFromHashKey(crossing)
        local message = "A flagged account has been detected at " .. streetName .. " and " .. crossing .. "."
        print(message)
    end
end

exports("SendPoliceAlertForFlaggedAccount", SendPoliceAlertForFlaggedAccount)

local function IsAccountFlagged()
    return IsAccountFlagged
end
exports("IsAccountFlagged", IsAccountFlagged)

local function IsAccountFrozen()
    return IsAccountFrozen
end
exports("IsAccountFrozen", IsAccountFrozen)