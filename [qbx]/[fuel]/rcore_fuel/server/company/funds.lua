RegisterNetEvent("rcore_fuel:depositMoney", function(identifier, moneyType, number)
    local source = source
    local shopModal = GetCompanyModal(identifier)

    if not (number >= 0 and number <= 2147483647) then
        print("Player", source, "Is trying to exploit the company funds(1) by setting it to nosense value: ", number)
        return
    end

    if shopModal.IsSourceOwner(source) then
        if PayWithType(moneyType, source, number) then
            shopModal.AddCompanyStockMoney(number)
            shopModal.Save()

            TriggerClientEvent("rcore_fuel:refreshMoneyManagementMenu", source, identifier, shopModal.GetCompanyStockMoney())
        else
            TriggerClientEvent("rcore_fuel:showHelpNotification", source, _U("player_lack_funds_deposit"), false, false, 10000)
        end
    end
end)

RegisterNetEvent("rcore_fuel:withDrawMoney", function(identifier, moneyType, number)
    local source = source
    local shopModal = GetCompanyModal(identifier)

    if not (number >= 0 and number <= 2147483647) then
        print("Player", source, "Is trying to exploit the company funds(1) by setting it to nosense value: ", number)
        return
    end

    if shopModal.IsSourceOwner(source) then
        if shopModal.GetCompanyStockMoney() >= number then
            local player = SharedObject.GetPlayerFromId(source)

            shopModal.RemoveCompanyStockMoney(number)
            shopModal.Save()

            if moneyType == "cash" then
                player.addMoney(number)
            end

            if moneyType == "bank" then
                player.addAccountMoney("bank", number)
            end

            TriggerClientEvent("rcore_fuel:refreshMoneyManagementMenu", source, identifier, shopModal.GetCompanyStockMoney())
        else
            TriggerClientEvent("rcore_fuel:showHelpNotification", source, _U("not_enough_money_in_company"), false, false, 10000)
        end
    end
end)