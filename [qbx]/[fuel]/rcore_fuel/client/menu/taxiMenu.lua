function OpenTaxiMenu(cb)
    local menu = CreateMenu("taxi_menu")

    menu.SetPrimaryTitle(_U("taxi_primary"))
    menu.SetSecondaryTitle(_U("taxi_second"))

    menu.SetProperties({
        float = "right",
        position = "middle",
    })

    menu.AddItem(_U("accept_taxi"), function()
        cb(true)
        menu.Close()
    end)

    menu.AddItem(_U("decline_taxi"), function()
        cb(false)
        menu.Close()
    end)

    menu.Open()
end