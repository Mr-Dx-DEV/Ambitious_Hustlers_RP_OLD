if Config.Phone ~= "roadphone" then return end

function GetPlayerPhoneNumber(id)
    local identifier = playerIdToIdentifier[id]
    if not identifier then
        return nil
    end
    return exports['roadphone']:getNumberFromIdentifier(identifier) or nil
end