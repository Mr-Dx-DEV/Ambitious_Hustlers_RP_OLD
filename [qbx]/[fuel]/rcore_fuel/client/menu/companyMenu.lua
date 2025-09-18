function OpenCompanyMenu(cb, idenf)
    local menu = CreateMenu("company_menu")
    local shopData = Config.ShopList[idenf]

    menu.SetPrimaryTitle(_U("company_menu_primaty_title"))
    menu.SetSecondaryTitle(_U("company_menu_title"))

    menu.SetProperties({
        float = "right",
        position = "middle",
    })

    if shopData.EnableSociety then
        menu.AddItem(_U("boss_menu"), function()
            menu.Close()
            cb("boss_menu")
        end)
    end

    if shopData.EnableBuyingCompany and not shopData.EnableSociety then
        menu.AddItem(_U("money_management"), function()
            menu.Close()
            cb("money_management")
        end)
    end

    menu.AddCheckBox(_U("sell_company"), function(data)
        cb("sell_company", { status = data.value, })
    end, {
        value = shopData.for_sale,
    })

    menu.AddCheckBox(_U("open/close_shop"), function(data)
        cb("open/close_shop", { status = data.value, })
    end, {
        value = shopData.open,
    })

    if shopData.isMissionRunning then
        menu.AddItem(_U("cancel_mission"), function()
            menu.Close()
            cb("cancel_mission")
        end)
    else
        menu.AddItem(_U("refuel_tankers"), function()
            menu.Close()
            cb("refuel_tankers")
        end)
    end

    menu.AddCheckBox(_U("employee_item"), function(data)
        cb("employee_item", { status = data.value, })
    end, {
        value = shopData.fuel_only_employee,
    })

    menu.AddTitle(_U("fuel_prices"))

    for k, v in pairs(shopData.gasPrices) do
        menu.AddItem(GetFuelLabelByType(k), function()
            cb("change_price_fuel", {
                typeFuel = k,
                priceFuel = v,
            })
        end, {
            secondLabel = _U("currency", v),
            secondLabelColor = "green",
        })
    end

    menu.Open()
end

function CreateMenuForCancelMission(identifier, cb)
    local menu = CreateMenu("cancel_mission")

    menu.SetPrimaryTitle(_U("mission"))
    menu.SetSecondaryTitle(_U("cancel_mission_text"))

    menu.AddItem(_U("y"), function()
        menu.Close()
        cb(true)
    end)

    menu.AddItem(_U("n"), function()
        cb(false)
    end)

    menu.Open()
end

function OpenMoneyManagementMenu(identifier, displayMoney)
    local menu = CreateMenu("money_management")

    menu.SetPrimaryTitle(_U("money_management_title"))
    menu.SetSecondaryTitle(_U("money_management_second_title", CommaValue(RoundDecimalPlace(displayMoney or Config.ShopList[identifier].companyMoney, 2))))

    local choices = {
        {
            label = _U("cash"),
            moneyType = "cash",
        },
        {
            label = _U("bank"),
            moneyType = "bank",
        },
    }

    menu.AddChoiceItem(_U("withdraw"), choices, function(selected, isArrow)
        if not isArrow then
            WithDrawMoney(identifier, selected.moneyType)
        end
    end)

    menu.AddChoiceItem(_U("deposit"), choices, function(selected, isArrow)
        if not isArrow then
            DepositMoney(identifier, selected.moneyType)
        end
    end)

    menu.OnCloseEvent(function()
        OpenLastCompanyMenu()
    end)

    menu.OnExitEvent(function()
        OpenLastCompanyMenu()
    end)

    menu.Open()
end

RegisterNetEvent("rcore_fuel:refreshMoneyManagementMenu", OpenMoneyManagementMenu)

function DepositMoney(identifier, moneyType)
    local inputMenu = CreateInputMenu("deposit_money")

    inputMenu.SetPrimaryTitle(_U("deposit"))

    inputMenu.SetPlaceHolderText(_U("deposit"))

    inputMenu.OnInputText(function(text)
        local number = tonumber(text)
        if number and number >= 0 and number <= 2147483647 then
            TriggerServerEvent("rcore_fuel:depositMoney", identifier, moneyType, number)
            inputMenu.Close()
        else
            print("error while inputing amount 'DepositMoney' The user used negative number or number above 32 integer! User is trying to exploit this.", number)
        end
    end)

    inputMenu.Open()
end

function WithDrawMoney(identifier, moneyType)
    local inputMenu = CreateInputMenu("put_input")

    inputMenu.SetPrimaryTitle(_U("withdraw"))

    inputMenu.SetPlaceHolderText(_U("withdraw"))

    inputMenu.OnInputText(function(text)
        local number = tonumber(text)
        if number and number >= 0 and number <= 2147483647 then
            TriggerServerEvent("rcore_fuel:withDrawMoney", identifier, moneyType, number)
            inputMenu.Close()
        else
            print("error while inputing amount 'WithDrawMoney' The user used negative number or number above 32 integer! User is trying to exploit this.", number)
        end
    end)

    inputMenu.Open()
end

function ShowAllPossibleTypeFuels(data, cb)
    local menu = CreateMenu("type_fuels")

    menu.SetPrimaryTitle(_U("company_fuel_type_title"))
    menu.SetSecondaryTitle(_U("company_fuel_type_subtitle"))

    for k, v in pairs(data.gasPrices) do
        local shopData = Config.ShopList[data.shopIdentifier]
        menu.AddItem(_U(k), {
            typeFuel = k,
            secondLabel = string.format("%.1f%%", (shopData.capacity[k] / shopData.maxCapacity[k]) * 100),
            secondLabelColor = "green",
        })
    end

    menu.OnSelectEvent(function(index, data)
        cb(data.typeFuel)
    end)

    menu.OnCloseEvent(function()
        cb(nil)
    end)

    menu.OnExitEvent(function()
        cb(nil)
    end)

    menu.Open()
end

local cashType = "society"
function SelectLitersToMission(data, cb)
    local missingLiters = data.maxCapacity - data.capacity
    cashType = "society"

    if missingLiters == 0 then
        cb("full")
        return
    end

    local menu = CreateMenu("identifier")

    menu.SetPrimaryTitle(_U("company_menu_primaty_title"))
    menu.SetSecondaryTitle(_U("choose_how_much_fuel"))

    local liters = {
        500, 1000, 1500
    }

    for k, v in pairs(liters) do
        if missingLiters > v then
            menu.AddItem(CommaValue(RoundDecimalPlace(v, 2)) .. " " .. _U(data.fuelType .. "_unit"), { liters = v, secondLabel = _U("currency", CommaValue(RoundDecimalPlace(Config.CompanyGasPrices[data.fuelType].current * v, 2))), secondLabelColor = "green", })
        end
    end

    menu.AddItem(CommaValue(RoundDecimalPlace(missingLiters, 2)) .. " " .. _U(data.fuelType .. "_unit"), { liters = missingLiters, secondLabel = _U("currency", CommaValue(RoundDecimalPlace(Config.CompanyGasPrices[data.fuelType].current * missingLiters, 2))), secondLabelColor = "green", })

    local choices = {
        -- its disabled so there can be a "refund" feature if player wont finish the job or leave the server
        {
            label = _U("cash"),
            moneyType = "cash",
        },
        {
            label = _U("bank"),
            moneyType = "bank",
        },
        {
            label = _U("society"),
            moneyType = "society",
        },
    }

    --menu.AddChoiceItem(_U("select_payment_method"), choices, function(selected)
    --    cashType = selected.moneyType
    --end)
    --
    menu.OnSelectEvent(function(index, data)
        if not data.isChoice() then
            cb({
                liters = data.liters,
                cashType = cashType,
            })
            menu.Close()
        end
    end)
    menu.Open()
end

function FinalizePaymentForNonMissionFuel(data, cb)
    local menu = CreateMenu("type_fuels")

    menu.SetPrimaryTitle(_U("final_payment"))
    menu.SetSecondaryTitle(_U("final_payment_second_title", CommaValue(RoundDecimalPlace(data.money, 2)), _U(data.fuelType)))

    menu.AddItem(_U("y"), function()
        cb(true)
    end)

    menu.AddItem(_U("n"), function()
        cb(false)
    end)

    menu.Open()
end

function OpenSellCompanyInputMenu(data, cb)
    local inputMenu = CreateInputMenu("put_input")

    inputMenu.SetPrimaryTitle(_U("previous_price_of_station", CommaValue(data.price)))

    inputMenu.SetDefaultValueInput(data.price)

    inputMenu.OnExitEvent(function()
        cb(false)
    end)

    inputMenu.OnInputText(function(text)
        local number = tonumber(text)
        if number and number >= (Config.MinimumPriceOfGasStation or 0) and number <= 2147483647 then
            cb(number)
            inputMenu.Close()
        else
            ShowNotification(_U("wrong_price", CommaValue(Config.MinimumPriceOfGasStation or 0), CommaValue(2147483647)))
        end
    end)

    inputMenu.Open()
end

function OpenGasInputMenu(data, cb)
    local inputMenu = CreateInputMenu("put_input")

    inputMenu.SetDefaultValueInput(data.priceFuel)

    inputMenu.SetPrimaryTitle(_U("current_gas_price_input", GetFuelLabelByType(data.typeFuel)))

    inputMenu.OnInputText(function(text)
        local number = tonumber(text)
        if number and number >= 0 and number <= 2147483647 then
            cb(number, data.typeFuel)
            inputMenu.Close()
        else
            print("error while inputing amount 'OpenGasInputMenu' The user used negative number or number above 32 integer! User is trying to exploit this.", number)
        end
    end)

    inputMenu.Open()
end

function OpenPlayerList(cb, playerList, onClose)
    local menu = CreateMenu("company_menu_player_list")

    menu.SetPrimaryTitle(_U("company_menu_primaty_title"))
    menu.SetSecondaryTitle(_U("company_player_list"))

    menu.SetProperties({
        float = "right",
        position = "middle",
    })

    for k, v in pairs(playerList) do
        menu.AddItem(string.format("%s", v.name), function()
            cb(v.id, v.name)
            menu.Close()
        end, {
            secondLabel = string.format("ID %s", v.id),
        })
    end

    menu.OnCloseEvent(onClose)

    menu.Open()
end