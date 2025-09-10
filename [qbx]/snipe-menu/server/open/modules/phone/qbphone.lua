if Config.Phone ~= "qbphone" then return end

function GetPlayerPhoneNumber(id)
    local Player = QBCore.Functions.GetPlayer(id)
    return Player and Player.PlayerData.charinfo.phone or nil
end