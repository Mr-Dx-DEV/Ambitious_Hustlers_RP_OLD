lib.callback.register("snipe-evidence:server:getNearbyPlayerId", function()
    local players = lib.getNearbyPlayers(GetEntityCoords(cache.ped), 5.0, false)
    if not players then 
        return false 
    end
    if #players == 0 then 
        return false 
    end
    local nearbyPlayerId = players[1].id
    local p = promise.new()
    DoProgress(function(result)
        p:resolve(result)
    end, Config.Progress["dna_swab"])
    local progressComplete = Citizen.Await(p)
    if not progressComplete then return false end
    local players2 = lib.getNearbyPlayers(GetEntityCoords(cache.ped), 5.0, false)
    if not players2 then
        return false 
    end
    if #players2 == 0 then
        return false 
    end
    if nearbyPlayerId ~= players2[1].id then 
        return false 
    end

    local playerId = players[1].id

    local serverID = GetPlayerServerId(playerId)

    return serverID
end)