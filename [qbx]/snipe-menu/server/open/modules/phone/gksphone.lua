if Config.Phone ~= "gks" then return end

function GetPlayerPhoneNumber(id)
    local FindPhoneNumber = exports["gksphone"]:GetPhoneBySource(id)
    return FindPhoneNumber or nil
end