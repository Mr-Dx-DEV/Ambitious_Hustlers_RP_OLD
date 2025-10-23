-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Checking for if Complete UI Kit is running
-- Get it here: https://wasabiscripts.com/product/7037645
local wasabi_uikit, uikitFound = GetResourceState('wasabi_uikit'), false
if wasabi_uikit == 'started' or wasabi_uikit == 'starting' then uikitFound = true end


-- Modify this with whatever progress bar/circle/both you want

---Displays a running progress based on its type.
---@param type "progressBar" | "progressCircle" | string
---@param data table Same data as used in ox_lib progress bar/circle. Subject to change.
---@return boolean
function WSB.progressUI(data, type)

    -- Remove under this line to use your own progress bar/circle system or ox_lib
    if not data.color then data.color = Config.DefaultColor end
    if uikitFound then
        type = type == 'progressCircle' and 'circle' or 'bar'
        return exports.wasabi_uikit:ProgressBar(data, type) or false
    end
    return ProgressUI(data, type) or false
    -- Remove above this line if you are using your own progress bar/circle system or ox_lib

    --[[ Remove this line if you are using lation_ui: https://lationscripts.com/product/modern-ui
    local lation_ui = GetResourceState('lation_ui')
    if lation_ui ~= 'started' and lation_ui ~= 'starting' then
        print('^0[^3WARNING^0] ^1lation_ui^0 is not running, please ensure it is started before using ^wsb.progressUI or use default!^0')
        return false
    end
    return exports.lation_ui:progressBar(data)
    ]] -- Remove this line if you are using lation_ui

--[[    
    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then
        print(
        '^0[^3WARNING^0] ^1ox_lib^0 is not running, please ensure it is started before using ^wsb.progressUI or use default!^0')
        return false
    end
    if type == 'progressBar' then
        return exports.ox_lib:progressBar(data)
    else
        return exports.ox_lib:progressCircle(data)
    end
]]
end

-- Compatibility functions for ox_lib
function WSB.progressCircle(data) return WSB.progressUI(data, 'progressCircle') end
function WSB.progressBar(data) return WSB.progressUI(data, 'progressBar') end

exports('progressUI', WSB.progressUI) -- Export for use in other scripts
exports('progressCircle', function(data) return WSB.progressUI(data, 'progressCircle') end) -- Export for use in other scripts
exports('progressBar', function(data) return WSB.progressUI(data, 'progressBar') end) -- Export for use in other scripts
