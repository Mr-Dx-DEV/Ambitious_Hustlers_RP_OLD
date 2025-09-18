CreateThread(function()
    if Config.Dispatches == Dispatches.PQ then
        Dispatch.Breakout = function(playerId)
            local retval, data = Framework.getOfficers()

            if isResourcePresentProvideless(THIRD_PARTY_RESOURCE.WASABI_POLICE) then
                if data and next(data) then
                    for _, playerId in pairs(data) do
                        if playerId then
                            Framework.sendNotification(playerId, _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE'), 'info')
                        end
                    end
                end
            else
                if type(retval) ~= "table" then
                    return
                end

                if retval and next(retval) then
                    for _, playerId in pairs(retval) do
                        if playerId then
                            exports['piotreq_gpt']:SendAlert(playerId, {
                                title = _U('DISPATCH.BREAKOUT_ACTIVE_MESSAGE'),
                                code = '10-90',
                                icon = 'fa-solid fa-mask',
                                info = {
                                    { icon = 'fa-solid fa-road',                 isStreet = true },
                                    { icon = 'fa-solid fa-triangle-exclamation', data = 'Very Danger' },
                                },
                                blip = { -- optional
                                    scale = 1.1,
                                    sprite = 1,
                                    category = 3, -- default 1
                                    color = 1,
                                    hidden = false, -- default false (hidden on legend)
                                    priority = 5, -- default 5
                                    short = true, -- as short range? default true
                                    alpha = 200, -- default 255
                                    name = "Prison break"
                                },
                                type = 'risk', -- default normal
                                canAnswer = true, -- default false
                                maxOfficers = 6, -- default 4
                                time = 10, -- 10 minutes, default 5
                                notifyTime = 8000, -- 8 seconds, default 7
                            })
                        end
                    end
                end
            end
        end
    end
end, "sv-standalone code name: Phoenix")
