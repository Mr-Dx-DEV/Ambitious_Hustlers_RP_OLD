function CreateInputMenu(identifier)
    local self = {}
    self.isOpen_ = false
    self.isInputMenu = true
    local _menuTitle = "RCORE"
    self.identifier_ = identifier
    local _properties = {
        float = "middle",
        position = "middle",
        ChooseText = "Accept",
        CloseText = "Close",
        placeHolderText = "",
        defaultValue = "",
    }
    --------------
    self.GetIdentifier = function()
        return self.identifier_
    end

    self.IsOpen = function()
        return self.isOpen_
    end
    --------------
    self.SetPrimaryTitle = function(title)
        _menuTitle = title
    end

    self.GetPrimaryTitle = function()
        return _menuTitle
    end
    --------------
    self.SetProperties = function(properties)
        _properties = {
            float = properties.float or "middle",
            position = properties.position or "middle",
            ChooseText = properties.ChooseText or "Accept",
            CloseText = properties.CloseText or "Close",
            placeHolderText = properties.placeHolderText,
            defaultValue = properties.placeHolderText or "",
        }
    end

    self.GetProperties = function()
        return _properties
    end
    --------------
    self.OnCloseEvent = function(cb)
        On(identifier, "close", cb)
    end

    self.OnOpenEvent = function(cb)
        On(identifier, "open", cb)
    end

    self.OnExitEvent = function(cb)
        On(identifier, "exit", cb)
    end

    self.OnInputText = function(cb)
        On(identifier, "inputtext", cb)
    end

    self.On = function(eventName, cb)
        On(identifier, eventName, cb)
    end
    --------------
    self.SetPlaceHolderText = function(text)
        _properties.placeHolderText = text
    end

    self.SetDefaultValueInput = function(text)
        _properties.defaultValue = text
    end
    --------------
    self.Open = function()
        if not CachedMenu[identifier] then
            CachedMenu[identifier] = {}
        end
        CachedMenu[identifier] = {
            MenuTitle = _menuTitle,
            Properties = _properties,
            self = self,
        }

        SendNUIMessage({ type_menu = "title_input", title = _menuTitle })
        SendNUIMessage({ type_menu = "ui_input", identifier = identifier, properties = _properties, status = true })

        CallOn(identifier, "open")
        self.isOpen_ = true
        SetNuiFocus(true, true)
    end
    --------------
    self.Close = function()
        SendNUIMessage({ type_menu = "ui_input", status = false })
        CallOn(identifier, "close")
        self.isOpen_ = false
        SetNuiFocus(false, false)
    end
    --------------
    self.Destroy = function()
        SendNUIMessage({ type_menu = "ui_input", status = false })
        CallOn(identifier, "exit")
        CachedMenu[identifier] = nil
        Events[identifier] = nil
        SetNuiFocus(false, false)
    end
    return self
end