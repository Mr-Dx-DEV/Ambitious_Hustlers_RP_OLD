AddEventHandler('rcore_prison:server:playerUnloaded', function(playerId)
    local comsPlayerData = COMSService.getPlayer(playerId)

    if not comsPlayerData then
        return
    end

    local playerZoneId = comsPlayerData.zoneIdx

    if not playerZoneId then
        return
    end

    StartClient(playerId, 'UnregisterCOMSArea', playerId, playerZoneId)

    db.DeleteCOMSZone(comsPlayerData.charId, playerZoneId)

    COMSService.UpdatePlayerKeyByValue(playerId, 'zoneIdx', nil)
    COMSService.UpdatePlayerKeyByValue(playerId, 'state', COMS_STATES.IDLE)
end)