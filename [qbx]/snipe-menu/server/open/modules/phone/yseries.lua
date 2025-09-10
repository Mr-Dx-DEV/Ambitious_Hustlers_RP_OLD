if Config.Phone ~= "yseries" then return end

function GetPlayerPhoneNumber(id)
    return exports.yseries:GetPhoneNumberBySourceId(id) or nil
end