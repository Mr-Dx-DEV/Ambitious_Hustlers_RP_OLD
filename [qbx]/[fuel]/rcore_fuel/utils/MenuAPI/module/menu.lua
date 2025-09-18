local openIdentifier = ""

function CreateMenu(identifier)
    local self = {}
    self.isOpen_ = false

    self.index = 0

    self.primaryTitle = ""
    self.secondaryTitle = ""

    self.identifier_ = identifier
    self.properties = {
        float = "right",
        position = "middle",

        backgroundColor = "#ff8410",
        --background_image = "",

        isRounded = false,

        primaryTitleColor = "black",
        secondaryTitleColor = "white",
    }

    local items = {}
    --------------
    self.GetIdentifier = function()
        return self.identifier_
    end

    self.IsOpen = function()
        return self.isOpen_
    end
    --------------
    self.SetPrimaryTitle = function(title)
        self.primaryTitle = title
    end

    self.GetPrimaryTitle = function()
        return self.primaryTitle
    end
    --------------
    self.SetSecondaryTitle = function(title)
        self.secondaryTitle = title
    end

    self.GetSecondaryTitle = function()
        return self.secondaryTitle
    end
    --------------
    self.SetProperties = function(properties)
        for k, v in pairs(properties) do
            self.properties[k] = v
        end
    end

    self.GetProperties = function()
        return self.properties
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

    self.OnChangeItemEvent = function(cb)
        On(identifier, "changeitem", cb)
    end

    self.OnSelectEvent = function(cb)
        On(identifier, "selectitem", cb)
    end

    self.On = function(eventName, cb)
        On(identifier, eventName, cb)
    end

    self.RemoveAllEvents = function()
        RemoveEvent(identifier, "close")
        RemoveEvent(identifier, "open")
        RemoveEvent(identifier, "exit")
        RemoveEvent(identifier, "changeitem")
        RemoveEvent(identifier, "selectitem")
    end
    --------------
    self.AddItem = function(text, cb, data, description)
        if type(data) == "string" then
            description = data
            data = nil
        end

        if type(cb) == "table" then
            data = cb
            cb = nil
        end

        if not data then
            data = {}
        end

        self.index = self.index + 1
        items[self.index] = {
            index = self.index,
            label = text,
            secondLabel = data.secondLabel,
            secondLabelColor = data.secondLabelColor,

            data = data,
            cb = cb,

            description = description,

            addItem = true,
            isItem = true,
            active = false,
        }

        return self.index
    end
    --------------
    self.AddCheckBox = function(text, cb, data, description)
        if type(data) == "string" then
            description = data
            data = nil
        end

        if type(cb) == "table" then
            data = cb
            cb = nil
        end

        if data == nil then
            data = {}
        end

        self.index = self.index + 1
        items[self.index] = {
            index = self.index,
            label = text,

            data = data or {},
            cb = cb,

            description = description,

            value = data.value or false,

            checkBox = true,
            isItem = true,
            active = false,
        }

        return self.index
    end
    --------------
    self.AddChoiceItem = function(text, choice, cb, description)
        self.index = self.index + 1
        items[self.index] = {
            index = self.index,
            label = text,

            data = data or {},
            cb = cb,

            choice = choice,

            description = description,

            activeSubIndex = 0,
            isChoice = true,
            isItem = true,
            active = false,
        }

        return self.index
    end
    --------------
    self.AddTitle = function(text, color)
        self.index = self.index + 1
        items[self.index] = {
            index = self.index,
            title = text,

            color = color or "white",

            isTitle = true,
            active = false,
        }

        return self.index
    end
    --------------
    self.Open = function()
        openIdentifier = identifier
        local deepItems = DeepCopy(items)
        if not CachedMenu[identifier] then
            CachedMenu[identifier] = {}
        end
        CachedMenu[identifier] = {
            MenuTitle = self.secondaryTitle,
            Properties = self.properties,
            Items = items,
            self = self,
        }
        SendNUIMessage({ type_menu = "reset" })

        SendNUIMessage({ type_menu = "primaryTitle", title = self.primaryTitle })
        SendNUIMessage({ type_menu = "secondaryTitle", title = self.secondaryTitle })

        for k, v in ipairs(deepItems) do
            v.cb = nil
            v.data = nil
            SendNUIMessage({
                type_menu = "add",
                menuItems = v,
            })
        end

        SendNUIMessage({ type_menu = "ui", identifier = identifier, properties = self.properties, status = true })
        CallOn(identifier, "open")
        self.isOpen_ = true
        PlaySoundFrontend(-1, 'SELECT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
    end
    --------------
    self.Close = function()
        if openIdentifier == identifier then
            SendNUIMessage({ type_menu = "ui", status = false })
        end
        CallOn(identifier, "close")
        self.isOpen_ = false
        PlaySoundFrontend(-1, 'QUIT', 'HUD_FRONTEND_DEFAULT_SOUNDSET', true)
    end
    --------------
    self.Destroy = function()
        if openIdentifier == identifier then
            SendNUIMessage({ type_menu = "ui", status = false })
        end
        CallOn(identifier, "exit")
        CachedMenu[identifier] = nil
        Events[identifier] = nil
    end
    return self
end