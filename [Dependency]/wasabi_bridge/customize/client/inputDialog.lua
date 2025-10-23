-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local wasabi_uikit, uikitFound = GetResourceState('wasabi_uikit'), false
if wasabi_uikit == 'started' or wasabi_uikit == 'starting' then uikitFound = true end

-- Modify this with whatever input dialog system you want

---@param heading string
---@param rows string[] | table
---@return table | nil
function WSB.inputDialog(heading, rows, color)
    -- heading = input title
    -- rows = rows of inputs/data
    --
    -- example row usage simple:
    -- { 'First Name', 'Last Name', 'Age' }
    --
    -- example row usage with options:
    -- {
    --     type = 'input', -- Example of type input
    --     label = 'SIMPLE INPUT EXAMPLE', -- Label of input
    --     placeholder = 'PLACE HOLDER EXAMPLE' -- Placeholder of input (optional)
    -- },
    -- {
    --    type = 'select', -- Example of type select
    --    label = 'SELECT EXAMPLE LABEL, -- Label of select
    --    options = { -- Options of select
    --        { value = 'value_that_sends', label = 'Label of drop option 1' }, -- Value and label of drop option 1
    --        { value = 'value_that_sends2',  label = 'Label of drop option 2' } -- Value and label of drop option 2
    --
    --   }
    -- },
    -- {
    --    type = 'multi-select', -- Example of type multi-select
    --    label = 'MULTI-SELECT EXAMPLE LABEL, -- Label of multi-select
    --    options = { -- Options of select
    --        { value = 'value_that_sends', label = 'Label of drop option 1' }, -- Value and label of option 1
    --        { value = 'value_that_sends2',  label = 'Label of drop option 2' } -- Value and label of option 2
    --
    --   }
    -- },
    -- {
    --    type = 'color', -- Example of type color picker
    --    label = 'COLOR PICKER LABEL, -- Label of color picker
    -- },
    -- {
    --    type = 'checkbox', -- Example of type checkbox
    --    label = 'NUMBER CHECKBOX LABEL, -- Label of checkbox
    --    checked = false -- Checked or not checked by default
    -- },
    -- {
    --    type = 'slider', -- Example of type slider
    --    label = 'SLIDER EXAMPLE LABEL, -- Label of slider
    --    default = 2, -- Default value of slider
    --    min = 1, -- Min value of slider
    --    max = 10, -- Max value of slider
    -- },
    --
    -- (Basically follow the same as ox_lib menu system and transfer the options to your own input system)]

    -- Remove under this to use your own input dialog --
    if not color then color = Config.DefaultColor end
    if uikitFound then
        return exports.wasabi_uikit:InputDialog(heading, rows, color)
    end
    return InputDialog(heading, rows, color)
    -- Remove above this to use your own input dialog --

    --[[ Remove this line if you are using lation_ui: https://lationscripts.com/product/modern-ui
    local lation_ui = GetResourceState('lation_ui')
    if lation_ui ~= 'started' and lation_ui ~= 'starting' then
        print('^0[^3WARNING^0] ^1lation_ui^0 is not running, please ensure it is started before using ^wsb.inputDialog or use default!^0')
        return
    end
    return exports.lation_ui:input({
        title = heading,
        options = rows
    })
    ]] -- Remove this line if you are using lation_ui

    -- Remove above this to use your own input dialog or ox_lib
    --[[
    local oxLib = GetResourceState('ox_lib')
    if oxLib ~= 'started' and oxLib ~= 'starting' then
        print(
            '^0[^3WARNING^0] ^1ox_lib^0 is not running, please ensure it is started before using ^wsb.inputDialog or use default!^0')
        return
    end
    return exports.ox_lib:inputDialog(heading, rows)--]]
end

exports('inputDialog', WSB.inputDialog) -- Export for use in other scripts
