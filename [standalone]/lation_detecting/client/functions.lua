-- You can change the textUI script here
-- Options: 'lation_ui', 'ox_lib', 'jg-textui', 'okokTextUI', 'qbcore' & 'custom'
local textui = 'ox_lib'

-- Display a notification
--- @param message string
--- @param type string
function ShowNotification(message, type)
    if Config.Setup.notify == 'lation_ui' then
        exports.lation_ui:notify({ title = 'Metal Detecting', message = message, type = type, icon = 'fas fa-magnifying-glass' })
    elseif Config.Setup.notify == 'ox_lib' then
        lib.notify({ title = 'Metal Detecting', description = message, type = type, position = 'top', icon = 'fas fa-magnifying-glass' })
    elseif Config.Setup.notify == 'esx' then
        ESX.ShowNotification(message)
    elseif Config.Setup.notify == 'qb' then
        QBCore.Functions.Notify(message, type)
    elseif Config.Setup.notify == 'okok' then
        exports['okokNotify']:Alert('Metal Detecting', message, 5000, type, false)
    elseif Config.Setup.notify == 'sd-notify' then
        exports['sd-notify']:Notify('Metal Detecting', message, type)
    elseif Config.Setup.notify == 'wasabi_notify' then
        exports.wasabi_notify:notify('Metal Detecting', message, 5000, type, false, 'fas fa-magnifying-glass')
    elseif Config.Setup.notify == 'custom' then
        -- Add custom notification export/event here
    end
end

-- Event handler for sending notifications from server
--- @param message string
--- @param type string
RegisterNetEvent('lation_detecting:Notify', function(message, type)
    ShowNotification(message, type)
end)

-- Display TextUI
--- @param text string 
--- @param icon string
function ShowTextUI(text, icon)
    if textui == 'lation_ui' then
        exports.lation_ui:showText({
            description = text,
            icon = icon,
        })
    elseif textui == 'ox_lib' then
        lib.showTextUI(text, {
            position = 'left-center',
            icon = icon
        })
    elseif textui == 'jg-textui' then
        exports['jg-textui']:DrawText(text)
    elseif textui == 'okokTextUI' then
        exports['okokTextUI']:Open(text, 'lightblue ', 'left', false)
    elseif textui == 'qbcore' then
        exports['qb-core']:DrawText(text, 'left')
    else
        -- Add custom textUI here
    end
end

-- Hide TextUI
--- @param label string
function HideTextUI(label)
    if textui == 'lation_ui' then
        local isOpen, text = exports.lation_ui:isOpen()
        if isOpen and text == label then
            exports.lation_ui:hideText()
        end
    elseif textui == 'ox_lib' then
        local isOpen, text = lib.isTextUIOpen()
        if isOpen and text == label then
            lib.hideTextUI()
        end
    elseif textui == 'jg-textui' then
        exports['jg-textui']:HideText()
    elseif textui == 'okokTextUI' then
        exports['okokTextUI']:Close()
    elseif textui == 'qbcore' then
        exports['qb-core']:HideText()
    else
        -- Add custom textUI here
    end
end

-- Register menu
--- @param data table
function RegisterMenu(data)
    if Config.Setup.menu == 'lation_ui' then
        exports.lation_ui:registerMenu(data)
    elseif Config.Setup.menu == 'ox_lib' then
        lib.registerContext(data)
    elseif Config.Setup.menu == 'custom' then
        -- Add 'custom' menu system here
    end
end

-- Show menu
--- @param menuId string
function ShowMenu(menuId)
    if Config.Setup.menu == 'lation_ui' then
        exports.lation_ui:showMenu(menuId)
    elseif Config.Setup.menu == 'ox_lib' then
        lib.showContext(menuId)
    elseif Config.Setup.menu == 'custom' then
        -- Add 'custom' menu system here
    end
end

-- Display an alert dialog
--- @param data table
function ShowAlert(data)
    if Config.Setup.dialogs == 'lation_ui' then
        return exports.lation_ui:alert(data)
    elseif Config.Setup.dialogs == 'ox_lib' then
        return lib.alertDialog(data)
    elseif Config.Setup.dialogs == 'custom' then
        -- Add your custom alert dialog here
    end
end

-- Display an input dialog
--- @param data table
function ShowInput(data)
    if Config.Setup.dialogs == 'lation_ui' then
        return exports.lation_ui:input({title = data.title, options = data.options})
    elseif Config.Setup.dialogs == 'ox_lib' then
        return lib.inputDialog(data.title, data.options)
    elseif Config.Setup.dialogss == 'custom' then
        -- Add your custom input dialog here
    end
end

-- Empty function that's triggered when a player begins detecting
-- Can be used for things like disabling inventory, etc
function StartedDetecting()
    -- DisableInventory()
end

-- Empty function that's triggered when a player stops detecting
-- Can be used for things like re-enabling inventory, etc
function StoppedDetecting()
    -- EnableInventory()
end

-- Empty function that's triggered when a player begins digging
-- Can be used for things like disabling inventory, etc
function StartedDigging()
    -- DisableInventory()
end

-- Empty function that's triggered when a player stops digging
-- Can be used for things like re-enabling inventory, etc
function StoppedDigging()
    -- EnableInventory()
end

-- Add target to entity
--- @param entity number Entity number
--- @param data table Options table
function AddTargetEntity(entity, data)
    if Config.Setup.interact == 'ox_target' then
        exports.ox_target:addLocalEntity(entity, data)
    elseif Config.Setup.interact == 'qb-target' then
        exports['qb-target']:AddTargetEntity(entity, {options = data, distance = 2})
    elseif Config.Setup.interact == 'interact' then
        exports.interact:AddLocalEntityInteraction({
            entity = entity,
            interactDst = 2.0,
            offset = vec3(0.0, 0.0, 1.0),
            options = data
        })
    elseif Config.Setup.interact == 'textui' then
        -- TextUI is being used
    elseif Config.Setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('No interaction system defined in the config file.')
    end
end

-- Remove target from entity
--- @param entity any|number Entity number
--- @param data table|string Options table or table name
function RemoveTargetEntity(entity, data)
    if Config.Setup.interact == 'ox_target' then
        exports.ox_target:removeLocalEntity(entity, data)
    elseif Config.Setup.interact == 'qb-target' then
        exports.qtarget:RemoveTargetEntity(entity, data)
    elseif Config.Setup.interact == 'interact' then
        exports.interact:RemoveLocalEntityInteraction(entity, data)
    elseif Config.Setup.interact == 'textui' then
        -- TextUI is being used
    elseif Config.Setup.interact == 'custom' then
        -- Add support for a custom target system here
    else
        print('No interaction system defined in the config file.')
    end
end

-- Function used to spawn NPCs
--- @param model string
--- @param coords vector3 | vector4
function SpawnNPC(model, coords)
    lib.requestModel(model)
    while not HasModelLoaded(model) do Wait(0) end
    local ped = CreatePed(0, model, coords.x, coords.y, coords.z, coords.w, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedFleeAttributes(ped, 0, false)
    SetEntityInvincible(ped, true)
    SetPedCanRagdoll(ped, false)
    SetEntityProofs(ped, true, true, true, true, true, true, true, true)
    FreezeEntityPosition(ped, true)
    SetModelAsNoLongerNeeded(model)
    return ped
end

-- Returns interval at which to play detecting sound
--- @param distance number
function GetBeepTime(distance)
    if distance < 15 then
        return math.floor(distance) * 150
    elseif distance < 20 then
        return 2000
    elseif distance < 25 then
        return 2500
    elseif distance < 30 then
        return 3000
    else
        return 3500
    end
end

-- Function used to print events if Config.Setup.debug is enabled
--- @param string string Event message
function EventLog(string)
    if not string or not Config.Setup.debug then return end
    print(string)
end