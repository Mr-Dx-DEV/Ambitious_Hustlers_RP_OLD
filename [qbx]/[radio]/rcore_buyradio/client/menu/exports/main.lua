function ExitAllOpenedMenu()
    for k, v in pairs(CachedMenu) do
        if v.self.IsOpen() then
            CallOn(v.self.GetIdentifier(), "exit")
        end
    end
    SendNUIMessage({ type_menu = "ui", status = false })
end

exports("ExitAllOpenedMenu", ExitAllOpenedMenu)

function CloseAll()
    for k, v in pairs(CachedMenu) do
        if v.self.IsOpen() then
            v.self.Close()
        end
    end
    SendNUIMessage({ type_menu = "ui", status = false })
end

exports("CloseAll", CloseAll)