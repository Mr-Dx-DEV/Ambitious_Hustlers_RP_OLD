if Config.Phone ~= 'roadphone' then
    return
end

function GetPlayerPhone(source)
    local identifier = GetIdentifier(source)
    return exports['roadphone']:getNumberFromIdentifier(identifier)
end

