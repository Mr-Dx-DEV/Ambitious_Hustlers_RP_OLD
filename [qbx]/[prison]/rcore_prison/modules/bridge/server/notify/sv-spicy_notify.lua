CreateThread(function()
    if Config.Notifies == Notifies.SPICY_NOTIFY then
        Framework.sendNotification = function(client, message, type)
            exports[Notifies.SPICY_NOTIFY]:Notify(client, type, message, _U('NOTIFY.TITLE'), nil, nil, 5000)
        end
    end
end, "sv-brutal_notify code name: Phoenix")
