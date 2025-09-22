if Config.Phone ~= 'codem-phone' then
    return
end

function GetPlayerPhone(source)
    local player = GetPlayerFromId(source)
    local identifier = player.identifier
    local result = MySQL.Sync.fetchAll('SELECT phonenumber FROM codem_phone_data WHERE identifier = ?', {
        identifier
    })

    if not result[1] then
        print('Your phone is nil')
        return ''
    end
    return result[1].phonenumber
end
