function OpenShopMenu()
    local menu = CreateMenu("shop")

    menu.SetPrimaryTitle(_U("shop_primary_title"))

    menu.SetProperties({
        float = "right",
        position = "middle",
    })

    for k, v in pairs(Config.ItemShopItems) do
        menu.AddItem(v.label, function()
            OpenShopCurrencyMenu(k)
        end, { secondLabel = _U("currency", CommaValue(v.price)), secondLabelColor = "green", })
    end

    menu.Open()
end

function OpenShopCurrencyMenu(key)
    local menu = CreateMenu("buy_company")

    menu.SetPrimaryTitle(_U("shop_primary_title"))

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

    menu.AddChoiceItem(_U("buy_item"), choices, function(selected, isArrowKey)
        if not isArrowKey then
            TriggerServerEvent("rcore_fuel:buyItem", key, selected.type)
            menu.Close()
        end
    end)

    menu.AddItem(_U("decline_buy"), function()
        OpenShopMenu()
    end)

    menu.Open()
end