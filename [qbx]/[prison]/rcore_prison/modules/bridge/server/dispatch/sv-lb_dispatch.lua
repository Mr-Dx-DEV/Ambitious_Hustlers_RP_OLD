CreateThread(function()
    if Config.Dispatches == Dispatches.LB then
        Dispatch.Breakout = function(playerId)
            local coords = vec3(SH.data.prisonYard.x,SH.data.prisonYard.y, SH.data.prisonYard.z)
            local data = {
                code = '10-64',
                priority = 'high',
                title = 'Prison break',
                time = 30 * 1000,
                job = 'police',
                description = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE'),
                image = "https://rco.re/product/prison/rcore_dispatch_preview.png",
                location = {
                    label = 'Prison',
                    coords = vec2(coords.x, coords.y)
                }
            }
    
            local dispatchId = exports["lb-tablet"]:AddDispatch(data)

            if dispatchId then
                dbg.info('Dispatch.Breakout: Prison break started!')
            end
        end
    end
end)
