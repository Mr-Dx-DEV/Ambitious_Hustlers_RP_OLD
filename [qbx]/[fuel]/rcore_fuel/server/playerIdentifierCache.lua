local onlinePlayersIdentifiers = {}

function IsPlayerWithIdentifierOnline(id)
    return onlinePlayersIdentifiers[id] ~= nil
end

function GetPlayerSourceByIdentifier(id)
    return onlinePlayersIdentifiers[id]
end

function GetPlayerIdentifierBySource(source)
    for identifier, playerCachedSource in pairs(onlinePlayersIdentifiers) do
        if playerCachedSource == source then
            return identifier
        end
    end
end

---------------------
---------------------

function AddPlayerIdentifierToCache(player, identifier, source)
    if type(player) == "number" then
        player = SharedObject.GetPlayerFromId(player)
    elseif tonumber(player) then
        player = SharedObject.GetPlayerFromId(tonumber(player))
    end

    if player and player.identifier then
        onlinePlayersIdentifiers[player.identifier] = player.source
    else
        if identifier and source then
            onlinePlayersIdentifiers[identifier] = source
        end
    end
end

AddEventHandler(Config.Events.ESX.playerLoaded, function(player)
    AddPlayerIdentifierToCache(player)
end)

-- apparently this is getting called from client side?
RegisterNetEvent(Config.Events.QBCore.playerLoadedServer, function(player)
    AddPlayerIdentifierToCache(player or source)
end)

RegisterNetEvent("rcore_fuel:playerLoadedCitizenId", function(identifier)
    AddPlayerIdentifierToCache(source, identifier, source)
end)

CreateThread(function()
    Wait(100)
    for key, val in pairs(GetPlayers()) do
        val = tonumber(val)
        AddPlayerIdentifierToCache(val)
    end
end, "adding players to identifier cache")

---------------------
---------------------

function RemovePlayerIdentifierFromCache(player)
    if type(player) == "number" then
        player = SharedObject.GetPlayerFromId(player)
    end
    if player then
        onlinePlayersIdentifiers[player.identifier] = nil
    end
end

AddEventHandler(Config.Events.ESX.playerDropped, function(player)
    RemovePlayerIdentifierFromCache(player)
end)

AddEventHandler(Config.Events.ESX.playerLogout, function(player)
    RemovePlayerIdentifierFromCache(player)
end)

AddEventHandler("playerDropped", function()
    Wait(1000)
    RemovePlayerIdentifierFromCache(source)
end)