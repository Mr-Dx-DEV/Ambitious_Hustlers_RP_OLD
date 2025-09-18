--- Will display help notification
--- @param text string
function ShowNotification(text)
    if IsResourceOnServer("ZSX_UIV2") then
        exports["ZSX_UIV2"]:Notification("Fuel", text, 'fas fa-info', duration or 5000)
        return
    end

    if IsResourceOnServer("codem-notification") then
        TriggerEvent("codem-notification:Create", msg, "info", nil, duration or 5000)
        return
    end

    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(0, 1)
end

RegisterNetEvent("rcore_fuel:ShowNotification", ShowNotification)

--- Will display help notification
--- @param msg string
--- @param thisFrame boolean
--- @param beep boolean
--- @param duration int
function ShowHelpNotification(msg, thisFrame, beep, duration)
    if IsResourceOnServer("ZSX_UIV2") then
        exports["ZSX_UIV2"]:Notification("Fuel", msg, 'fas fa-info', duration or 5000)
        return
    end

    if IsResourceOnServer("codem-notification") then
        TriggerEvent("codem-notification:Create", msg, "info", nil, duration or 5000)
        return
    end

    AddTextEntry('fuel_help_msg', msg)

    if thisFrame then
        DisplayHelpTextThisFrame('fuel_help_msg', false)
    else
        if beep == nil then
            beep = false
        end
        BeginTextCommandDisplayHelp('fuel_help_msg')
        EndTextCommandDisplayHelp(0, false, beep, duration)
    end
end

RegisterNetEvent("rcore_fuel:showHelpNotification", ShowHelpNotification)

--- Will display help notification
--- @param message string
function ShowNativeSubtitles(message)
    if IsResourceOnServer("ZSX_UIV2") then
        exports["ZSX_UIV2"]:Notification("Fuel", message, 'fas fa-info', 5000)
        return
    end

    if IsResourceOnServer("codem-notification") then
        TriggerEvent("codem-notification:Create", message, "info", nil, 5000)
        return
    end

    BeginTextCommandPrint('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandPrint(1000, 1)
end