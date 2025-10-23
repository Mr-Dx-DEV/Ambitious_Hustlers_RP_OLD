-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Checking for if Complete UI Kit is running
-- Get it here: https://wasabiscripts.com/product/7037645
local wasabi_uikit, uikitFound = GetResourceState('wasabi_uikit'), false
if wasabi_uikit == 'started' or wasabi_uikit == 'starting' then uikitFound = true end

-- Customize this to customize text UI accross all Wasabi Scripts

-- Text UI
local textUI = false

-- Show text UI
function WSB.showTextUI(msg, options)
    -- Customize this logic with your own text UI or ox_lib
    -- msg = string, the message to display
    -- options = { -- Optional, data to pass to text UI system
    --     position = string - either 'right-center', 'left-center', 'top-center', or bottom-center,
    --     icon = string - icon name,
    --     iconColor = string - icon color,
    --     textColor = string - text color,
    --     backgroundColor = string - background color,
    --     iconAnimation = 'pulse', -- currently only pusle available
    -- }

    -- Remove under this to use your own text UI --
    textUI = msg
    if uikitFound then
        -- Function to extract a single key in the format [E] - Text or [E] Text
        local function extractKeyAndText(str)
            if type(str) ~= "string" then return nil, str end
            local key, rest = str:match("^%[([%w])%]%s*%-?%s*(.+)$")
            if key and rest then
                return key, rest
            end
            return nil, str
        end
        local key, text = extractKeyAndText(msg)
        return exports.wasabi_uikit:OpenTextUI(text, key)
    end
    return ShowTextUI(msg, options)
    -- Remove above this if you are using your own menu system / want to use ox_lib

    --[[ Remove this line if you are using lation_ui: https://lationscripts.com/product/modern-ui
    local lation_ui = GetResourceState('lation_ui')
    if lation_ui ~= 'started' and lation_ui ~= 'starting' then
        print('^0[^3WARNING^0] ^1lation_ui^0 is not running, please ensure it is started before using ^wsb.showTextUI or use default!^0')
        return
    end
    exports.lation_ui:showText({description = msg})
    textUI = msg
    ]] -- Remove this line if you are using lation_ui


    --[[
    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then
        print(
            '^0[^3WARNING^0] ^1ox_lib^0 is not running, please ensure it is started before using ^wsb.showTextUI or use default!^0')
        return
    end
    exports.ox_lib:showTextUI(msg)
    textUI = msg
    ]]
end

-- Hide text UI
function WSB.hideTextUI()
    -- Remove under this to use your own text UI --
    textUI = false
    if uikitFound then
        return exports.wasabi_uikit:CloseTextUI()
    end
    return HideTextUI()
    -- Remove above this if you are using your own menu system / want to use ox_lib

    --[[ Remove this line if you are using lation_ui: https://lationscripts.com/product/modern-ui
    local lation_ui = GetResourceState('lation_ui')
    if lation_ui ~= 'started' and lation_ui ~= 'starting' then
        print('^0[^3WARNING^0] ^1lation_ui^0 is not running, please ensure it is started before using ^wsb.hideTextUI or use default!^0')
        return
    end
    exports.lation_ui:hideText()
    textUI = false
    ]] -- Remove this line if you are using lation_ui

    --[[
    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then
        print(
            '^0[^3WARNING^0] ^1ox_lib^0 is not running, please ensure it is started before using ^wsb.showTextUI or use default!^0')
        return
    end
    exports.ox_lib:hideTextUI()
    textUI = false
    ]]
end

-- Checking for text UI
function WSB.isTextUIOpen()
    return textUI and true or false, textUI or false
end

exports('showTextUI', WSB.showTextUI)     -- Export for use in other scripts
exports('hideTextUI', WSB.hideTextUI)     -- Export for use in other scripts
exports('isTextUIOpen', WSB.isTextUIOpen) -- Export for use in other scripts
