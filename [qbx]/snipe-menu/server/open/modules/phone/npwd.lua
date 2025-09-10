if Config.Phone ~= "npwd" then return end

function GetPlayerPhoneNumber(id)
    local identifier = playerIdToIdentifier[id]
    if not identifier then
        return nil
    end
    -- local result = MySQL.Sync.fetchScalar('SELECT phone_number FROM players WHERE identifier = ?', {identifier})
    -- return result or nil
    return "Not Implemented"
end