CachedMenu = {}
--------------
-- Sending info about changing item in menu
--------------
RegisterKey(function()
    SendNUIMessage({ type_menu = "up" })
end, "menuapiup", "Key up", "UP")

RegisterKey(function()
    SendNUIMessage({ type_menu = "down" })
end, "menuapidown", "Key down", "DOWN")

RegisterKey(function()
    SendNUIMessage({ type_menu = "left" })
end, "menuapileft", "Key left", "left")

RegisterKey(function()
    SendNUIMessage({ type_menu = "right" })
end, "menuapiright", "Key right", "right")
--------------
-- Sending info about selecting item
--------------
RegisterKey(function()
    SendNUIMessage({ type_menu = "enter" })
end, "menuapie", "Key E", "E")

RegisterKey(function()
    SendNUIMessage({ type_menu = "enter" })
end, "menuapienter", "Key ENTER", "RETURN")
--------------
-- closing menu keys
--------------
RegisterKey(function()
    CloseAll()
end, "menuapiesc", "Key ESC", "escape")

RegisterKey(function()
    CloseAll()
end, "menuapiescaper", "Key backspace", "back")
--------------