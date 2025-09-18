function OpenOptionalAcceptMenu(bossName, cb)
    local menu = CreateMenu("fuel_mission_accept_menu")

    menu.SetPrimaryTitle(_U("fuel_mission_primary_title_menu"))
    menu.SetSecondaryTitle(_U("select_item"))

    menu.SetProperties({
        float = "right",
        position = "middle",
    })

    menu.AddItem(_U("accept_task"), function()
        menu.RemoveAllEvents()
        cb("yes")
        menu.Close()
    end, _U("fuel_mission_title_menu", bossName))

    menu.AddItem(_U("decline_task"), function()
        menu.RemoveAllEvents()
        cb("no")
        menu.Close()
    end, _U("fuel_mission_title_menu", bossName))

    menu.OnCloseEvent(function()
        cb("no")
    end)

    menu.OnExitEvent(function()
        cb("no")
    end)

    menu.Open()
end