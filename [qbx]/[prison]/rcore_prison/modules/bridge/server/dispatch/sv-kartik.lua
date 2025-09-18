CreateThread(function()
    if Config.Dispatches == Dispatches.KARTIK then
        Dispatch.Breakout = function(playerId)
            local coords = vec3(SH.data.prisonYard.x, SH.data.prisonYard.y, SH.data.prisonYard.z)
            local payload = {
                code = '10-64',
                title = 'Prison break',
                description = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE'),
                coords = coords,
                blip = {
                    radius = 100.0,
                    sprite = 488,
                    color = 1,
                    scale = 1.5,
                    length = 30
                },
                jobs = {
                    police = true,
                    ems = true
                }
            }

            TriggerClientEvent('rcore_prison:client:setDispatch', playerId, payload)

            dbg.info('Dispatch.Breakout: This will be shown to all players, adjust it to your needs.')
        end
    end
end, "sv-standalone code name: Phoenix")
