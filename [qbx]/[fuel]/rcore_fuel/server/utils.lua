local playerNames = {}

function GetPlayerCharacterName(source)
    if playerNames[source] then
        return playerNames[source]
    else
        if Config.Framework.Active == Framework.ESX or Config.Framework.Active == Framework.QBCORE then
            local player = SharedObject.GetPlayerFromId(source)
            local playerName = string.format("%s %s", player.get('firstName'), player.get('lastName'))

            playerNames[source] = playerName
            return playerName
        end
    end

    return GetPlayerName(source)
end