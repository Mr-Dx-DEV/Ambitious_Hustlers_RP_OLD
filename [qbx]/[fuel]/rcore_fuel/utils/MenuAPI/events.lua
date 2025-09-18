--------------- Input related only ----------------
-- User send input froom html
RegisterNUICallback("inputmethod", function(data, cb)
    if CachedMenu[data.identifier] then
        CallOn(data.identifier, "inputtext", data.message)
    end
    if cb then
        cb('ok')
    end
end)

-- User send input froom html
RegisterNUICallback("close", function(data, cb)
    local menu = CachedMenu[data.identifier]
    if menu then
        if menu.self.isInputMenu then
            menu.self.Destroy()
        else
            menu.self.Close()
        end
    end

    if cb then
        cb('ok')
    end
end)
--------------- Menu related only ----------------
-- click on item
RegisterNUICallback("clickItem", function(data, cb)
    local identifier = data.identifier
    local menuData = CachedMenu[identifier].Items[data.index]

    if CachedMenu[identifier] and menuData then
        PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)

        local callBack = menuData.cb
        if not menuData.data then
            menuData.data = {}
        end
        menuData.data.value = data.data.value

        menuData.data.isCheckBox = function()
            return menuData.checkBox ~= nil
        end

        menuData.data.isItem = function()
            return menuData.addItem ~= nil
        end

        menuData.data.isChoice = function()
            return menuData.isChoice ~= nil
        end

        if menuData.isChoice then
            for k, v in pairs(data.data) do
                menuData.data[k] = v
            end
        end

        if callBack then
            callBack(menuData.data, data.isArrowKey)
        end
        CallOn(identifier, "selectitem", data.index, menuData.data, data.isArrowKey)
    end

    if cb then
        cb('ok')
    end
end)

-- calls when player select new item, and check for events & call them
RegisterNUICallback("selectNew", function(data, cb)
    local identifier = data.identifier

    if CachedMenu[identifier] and CachedMenu[identifier].Items[data.index] then
        PlaySoundFrontend(-1, 'NAV_UP_DOWN', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
        CallOn(identifier, "changeitem", data.newIndex, data.oldIndex, CachedMenu[identifier].Items[data.newIndex].data or {})
    end

    if cb then
        cb('ok')
    end
end)


-- unregister events if resource is stopped
AddEventHandler('onResourceStop', function(resourceName)
    RemoveEventsWithNameResource(resourceName)
end)