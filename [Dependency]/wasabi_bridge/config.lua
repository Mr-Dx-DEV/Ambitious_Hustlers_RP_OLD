-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
Config = {}

-------------------------------------------------------
-- Check for updates? (RECOMMENDED TO LEAVE AS true) --
-------------------------------------------------------
Config.CheckForUpdates = true

----------------------------------------------------------
--- UI Settings (Only works if using built-in systems) ---
----------------------------------------------------------

Config.DefaultColor = '#218988' -- Default color for progress bars, circles, menus, etc if not defined when used.
-- (Most of the time there will be configuration of color within specific Wasabi Scripts, but this is a fallback)
-- (If you wish to use this color as default in other Wasabi Scripts set their UI color to false if applicable)

-- Has built-in notify and automatic detection for wasabi_notify
-- If using ox_lib, you can uncomment the code in wasabi_bridge/customize/client/notifications.lua
-- and comment out the wasabi_notify/default code to use ox_lib instead.
-- Grab wasabi_notify here: https://store.wasabiscripts.com/package/6215100
Config.Notifications = {
    defaults = {                                    -- Default notification settings
        position = 'top-right',                     -- position options: 'center', 'top-right', 'top-left', 'right', 'left', 'bottom-right', and 'bottom-left'
        time = 3500,                                -- Time in MS to show notifications by default if not defined
        iconSize = '2.2rem',                        -- Default icon size if shown and not defined. (Default is 1.5rem)
        fontColor = '#e5e5e5',                      -- Color, hex, etc (default: '#b5b3b3')
        backgroundColor = 'rgba(37, 38, 43, 0.60)', -- Background color of notification (default: 'rgba(80, 80, 80, 0.651)')
        sound = false,                               -- Play a sound when the notification is shown
    },
    styles = {                           -- Notification styles (Feel free to edit and add, but don't remove any default styles completely)

        info = {                         -- Type of notification to use in 'type' parameter of notification exports
            icon = 'circle-exclamation', -- Fontawesome icon to use, or false to not show an icon
            color = '#07B8F9',           -- Color of the notification
        },
        success = {
            icon = 'circle-check',
            color = '#1ce21c',
        },
        error = {
            icon = 'circle-xmark',
            color = '#e21c1c',
        },
        warning = {
            icon = 'exclamation-triangle',
            color = '#dece21',
        }
    }
}

Config.TextUISettings = {
    position = 'right-center',   -- Position of the text UI ('right-center', 'left-center', 'top-center', or 'bottom-center')
    iconColor = '#ffffff',       -- Default icon color if not defined
    textColor = '#ffffff',       -- Default text color if not defined
    backgroundColor = '#25262B', -- Background color of the text UI
}
