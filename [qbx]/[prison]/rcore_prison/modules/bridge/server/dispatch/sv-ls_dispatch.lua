CreateThread(function()
    if Config.Dispatches == Dispatches.LS then
        Dispatch.Breakout = function(playerId)
            local text = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE')
            local coords = vec3(SH.data.prisonYard.x, SH.data.prisonYard.y, SH.data.prisonYard.z)

            TriggerEvent('l2s-dispatch:server:AddNotification', {
                departments = {'POLICE', 'EMS'}, 
                title = 'Prison break',
                message = text,
                coords = vec2(coords.x, coords.y),
                priority = 1,
                sound = 1, 
                reply = false, 
                anonymous = false, 
                street = '',
                blip = {
                    sprite = 52, 
                    colour = 1,
                    scale = 1.0, 
                    text = '10-64',
                },
                info = { 
                    {icon = 'video', text = 'first'}, 
                    {icon = 'person', text = 'secend'}, 
                },
            })
        end
    end
end, "sv-tk_dispatch code name: Phoenix")


