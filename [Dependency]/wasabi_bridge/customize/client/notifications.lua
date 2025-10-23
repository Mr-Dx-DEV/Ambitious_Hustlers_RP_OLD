-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Checking for if Complete UI Kit is running
-- Get it here: https://wasabiscripts.com/product/7037645
local wasabi_uikit, uikitFound = GetResourceState('wasabi_uikit'), false
if wasabi_uikit == 'started' or wasabi_uikit == 'starting' then uikitFound = true end


-- Customize this to customize notifications accross all Wasabi Scripts

-- Notifications
function WSB.showNotification(title, desc, style, icon, id)
    -- Edit code below to use your own notification system

    -- (This supports wasabi_notify, bridge's built-in notify, and ox_lib is commented out if desired!)
    -- Get wasabi_notify here: https://wasabiscripts.com/product/6215100

    if GetResourceState('wasabi_notify') == 'started' then -- If using wasabi_notify, automatic detection
        if style == 'inform' or style == 'primary' then style = 'info' end

        return exports.wasabi_notify:notify(title, desc, Config.Notifications.defaults.time or 3500, style or 'info',
            Config.NotificationSound or Config.Notifications.defaults.sound or false, icon, id)
    end

    if uikitFound then
        return exports.wasabi_uikit:Notification(title, desc, style or 'info', id, icon)
    end

    --[[ Remove this line if you are using lation_ui: https://lationscripts.com/product/modern-ui
    if GetResourceState('lation_ui') == 'started' then -- If using lation_ui and not wasabi_notify automatic detection
        if style == 'inform' or style == 'primary' then style = 'info' end

        return exports.lation_ui:notify({
            title = title,
            message = desc or nil,
            id = id or nil,
            position = 'top-right',
            icon = icon or nil,
            duration = 3500,
            type = style or 'info'
        })
    end
    ]] -- Remove this line if you are using lation_ui

    --[[
    if GetResourceState('ox_lib') == 'started' then -- If using ox_lib and not wasabi_notfy automatic detection
        if style == 'info' then style = 'inform' end
        exports.ox_lib:notify({
            title = title,
            description = desc or false,
            id = id or false,
            position = 'top-right',
            icon = icon or false,
            duration = 3500,
            type = style or 'inform'
        })
        return
    end
]]                                                        --

    return ShowNotification(title, desc, style, icon, id) -- Default bridge built-in notification system

    -- Edit Code above to use your own notification system
end

RegisterNetEvent('wasabi_bridge:notify', function(title, desc, style, icon, id)
    return WSB.showNotification(title, desc, style, icon, id)
end)

exports('showNotification', WSB.showNotification) -- Export for use in other scripts
