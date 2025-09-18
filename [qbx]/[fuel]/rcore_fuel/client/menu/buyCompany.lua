function OpenBuyMenu(cb, price)
    local menu = CreateMenu("buy_company")

    menu.SetPrimaryTitle(_U("buy_company_main_title_menu"))
    menu.SetSecondaryTitle(_U("buy_company_title_menu", CommaValue(price)))

    menu.SetProperties({
        float = "right",
        position = "middle",
    })

    local choices = {
        {
            label = _U("cash"),
            type = "cash",
        },
        {
            label = _U("bank"),
            type = "bank",
        },
    }

    menu.AddChoiceItem(_U("buy_company"), choices, function(selected, isArrowKey)
        if not isArrowKey then
            cb("yes", selected.type)
            menu.Close()
        end
    end)

    menu.AddItem(_U("decline_buying_company"), function()
        cb("no")
        menu.Close()
    end)

    menu.Open()
end