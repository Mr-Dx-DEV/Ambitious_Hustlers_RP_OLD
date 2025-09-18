--- @param moneyType string
--- @param source integer
--- @param money integer
--- @param society string
function CanPlayerPayWithMoneyType(moneyType, source, money, society, companyIdentifier)
    local player = SharedObject.GetPlayerFromId(source)
    if not player then
        return false
    end

    if moneyType == "society" then
        local shopModal = GetCompanyModal(companyIdentifier)

        if shopModal.IsSocietyEnabled() then
            if GetMoneyFromSociety(society) >= money then
                return true
            end
        else
            if shopModal.GetCompanyStockMoney() >= money then
                return true
            end
        end
        return false
    end

    if moneyType == "cash" then
        if Config.IsCashBasedOnItem then
            local itemCount = GetItemCount(source, Config.CashItem)
            if itemCount >= money then
                return true
            end
        else
            if player.getMoney() >= money then
                return true
            end
        end
    end

    if moneyType == "bank" then
        if player.getAccount("bank").money >= money then
            return true
        end
    end
    return false
end

--- @param moneyType string
--- @param source integer
--- @param money integer
--- @param society string
--- This will be called whenever someone want to pay on something
function PayWithType(moneyType, source, money, society, shopIdentifier)
    local player = SharedObject.GetPlayerFromId(source)
    if not player then
        print("For some reason in PayWithType there is player with no player modul loaded in your framework his ID is:", source)
        return false
    end

    if moneyType == "society" then
        local shopModal = GetCompanyModal(shopIdentifier)

        if shopModal.IsSocietyEnabled() then
            if GetMoneyFromSociety(society) >= money then
                RemoveMoneyFromSociety(money, society)
                return true
            end
        else
            if shopModal.GetCompanyStockMoney() >= money then
                shopModal.RemoveCompanyStockMoney(money)
                return true
            end
        end
        return false
    end

    if moneyType == "cash" then
        if Config.IsCashBasedOnItem then
            local itemCount = GetItemCount(source, Config.CashItem)
            if itemCount >= money then
                RemovePlayerItem(source, Config.CashItem, money)
                return true
            end
        else
            if player.getMoney() >= money then
                player.removeMoney(money)
                return true
            end
        end
        return false
    end

    if moneyType == "bank" then
        if player.getAccount("bank").money >= money then
            player.removeAccountMoney("bank", money)
            return true
        end
        return false
    end
    return false
end

function GivePlayerMoney(moneyType, money, id)
    if tonumber(id) then
        id = tonumber(id)
    end

    if type(id) == "string" then
        GiveOfflinePlayerMoney(moneyType, id, money)
    else
        local player = SharedObject.GetPlayerFromId(id)
        if moneyType == "cash" then
            if Config.IsCashBasedOnItem then
                AddPlayerItem(source, Config.CashItem, money)
            else
                player.addMoney(money)
            end
        end

        if moneyType == "bank" then
            player.addAccountMoney("bank", money)
        end
    end
end

function SetOfflinePlayerMoney(moneyType, identifier, money)
    local sqlUpdate = "UPDATE `users` SET accounts = @accounts  WHERE identifier = @identifier"

    if Config.Framework.Active == Framework.QBCORE then
        sqlUpdate = "UPDATE `players` SET money = @accounts  WHERE citizenid = @identifier"
    end
    local playerMoney, accounts = GetOfflinePlayerMoney(moneyType, identifier)

    if moneyType == "bank" then
        if Config.Framework.Active == Framework.QBCORE then
            accounts.bank = money
        end
        if Config.Framework.Active == Framework.ESX then
            accounts.bank = money
        end
    end

    if moneyType == "cash" then
        if Config.Framework.Active == Framework.QBCORE then
            accounts.cash = money
        end
        if Config.Framework.Active == Framework.ESX then
            accounts.money = money
        end
    end

    if playerMoney ~= -1 and (accounts.cash or accounts.money or accounts.bank) and type(accounts) == "table" then
        MySQL.Sync.execute(sqlUpdate, {
            ["@accounts"] = json.encode(accounts),
            ["@identifier"] = identifier,
        })
    end
end

function GetOfflinePlayerMoney(moneyType, identifier)
    local sqlSelect = "SELECT accounts FROM `users` WHERE identifier = @identifier"

    if Config.Framework.Active == Framework.QBCORE then
        sqlSelect = "SELECT money AS accounts FROM `players` WHERE citizenid = @identifier"
    end

    local accountsJson = MySQL.Sync.fetchScalar(sqlSelect, { ["@identifier"] = identifier })
    local accounts = json.decode(accountsJson)

    if moneyType == "bank" then
        if Config.Framework.Active == Framework.QBCORE then
            return accounts.bank, accounts
        end
        if Config.Framework.Active == Framework.ESX then
            return accounts.bank, accounts
        end
    end

    if moneyType == "cash" then
        if Config.Framework.Active == Framework.QBCORE then
            return accounts.cash, accounts
        end
        if Config.Framework.Active == Framework.ESX then
            return accounts.money, accounts
        end
    end

    return -1, accounts
end

function GiveOfflinePlayerMoney(moneyType, identifier, money)
    local playerMoney = GetOfflinePlayerMoney(moneyType, identifier)
    SetOfflinePlayerMoney(moneyType, identifier, playerMoney + money)
end

function TakeOfflinePlayerMoney(moneyType, identifier, money)
    local playerMoney = GetOfflinePlayerMoney(moneyType, identifier)
    SetOfflinePlayerMoney(moneyType, identifier, playerMoney - money)
end
