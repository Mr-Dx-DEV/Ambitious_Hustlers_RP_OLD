if Config.Phone ~= "qsphone" then return end
function GetPlayerPhoneNumber(id)
    local identifier = playerIdToIdentifier[id]
    if not identifier then
        return nil
    end
    return exports['qs-smartphone-pro']:GetPhoneNumberFromIdentifier(identifier, true) or nil
end