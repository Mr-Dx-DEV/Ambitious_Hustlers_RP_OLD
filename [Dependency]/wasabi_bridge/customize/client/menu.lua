-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Checking for if Complete UI Kit is running
-- Get it here: https://wasabiscripts.com/product/7037645
local wasabi_uikit, uikitFound = GetResourceState('wasabi_uikit'), false
if wasabi_uikit == 'started' or wasabi_uikit == 'starting' then uikitFound = true end


-- Modify this to for what menu / context menus you would like to utilize by default

--- Context menu
---@param data table
function WSB.showContextMenu(data)
    -- Customize this logic with your own menu system
    -- data = {
    --     id = menu identifier
    --     title = menu title
    --     options = menu options,
    --     color = color of the menu (hex, RGB, etc)
    -- }
    --
    -- example options:
    -- options = {
    --     { title = 'Option 1', description = 'Description 1', icon = 'icon', arrow = false, event = 'event1', args = { arg1 = 'arg1' } },
    --     { title = 'Option 2', description = 'Description 2', icon = 'icon', arrow = false, event = 'event2', args = { arg2 = 'arg2' } },
    --     { title = 'Option 3', description = 'Description 3', icon = 'icon', arrow = false, event = 'event3', args = { arg3 = 'arg3' } },
    -- }
    --
    -- (Basically follow the same as ox_lib menu system and transfer the options to your own menu system)]

    -- Remove below this if you are using your own menu system

    if not data.color then data.color = Config.DefaultColor end
    if uikitFound then

        local uiKitData = {
            id = data.id,
            title = data.title,
            enableWalk = false,
            options = data.options
        }

        exports.wasabi_uikit:RegisterContextMenu(uiKitData)
        exports.wasabi_uikit:OpenContextMenu(data.id)
        return
    end

    return ShowContextMenu(data)
    -- Remove above this if you are using your own menu system

    --[[ Remove this line if you are using lation_ui: https://lationscripts.com/product/modern-ui
    local lation_ui = GetResourceState('lation_ui')
    if lation_ui ~= 'started' and lation_ui ~= 'starting' then
        print('^0[^3WARNING^0] ^1lation_ui^0 is not running, please ensure it is started before using ^wsb.showContextMenu or use default!^0')
        return
    end
    exports.lation_ui:registerMenu(data)
    exports.lation_ui:showMenu(data.id)
    ]] -- Remove this line if you are using lation_ui

    --[[
    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then
        print(
            '^0[^3WARNING^0] ^1ox_lib^0 is not running, please ensure it is started before using ^wsb.showContextMenu or use default!^0')
        return
    end
    exports.ox_lib:registerContext(data)
    exports.ox_lib:showContext(data.id)]]
end

-- Regular Menu
---@param data table
function WSB.showMenu(data)
    -- data: the same as data is for wsb.showContextMenu

    -- Remove below this if you are using your own menu system / want to use ox_lib
    if not data.color then data.color = Config.DefaultColor end
    if uikitFound then

        local uiKitData = {
            id = data.id,
            title = data.title,
            enableWalk = true,
            options = data.options
        }

        exports.wasabi_uikit:RegisterContextMenu(uiKitData)
        exports.wasabi_uikit:OpenContextMenu(data.id)
        return
    end

    return ShowMenu(data)
    -- Remove above this if you are using your own menu system / want to use ox_lib

    --[[
    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then
        print(
            '^0[^3WARNING^0] ^1ox_lib^0 is not running, please ensure it is started before using ^wsb.showMenu or use default!^0')
        return
    end
    local menuOptions = FormatDataForOxLibMenu(data)

    exports.ox_lib:registerMenu({
        id = data.id,
        title = data.title,
        position = data.position or 'bottom-right',
        options = menuOptions
    }, function(selected, _scrollIndex, args)
        if selected then
            TriggerEvent(args.event, (args.args or false))
        end
    end)

    exports.ox_lib:showMenu(data.id) ]]
end

exports('showContextMenu', WSB.showContextMenu) -- Export for use in other scripts
exports('showMenu', WSB.showMenu)               -- Export for use in other scripts
