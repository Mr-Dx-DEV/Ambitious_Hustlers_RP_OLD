
function GetPlayerBankBalance(src)
    if Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        return xPlayer.PlayerData.money["bank"]
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        return xPlayer.getAccount("bank").money
    end
end

function GetPlayerBankFromPlayer(xPlayer)
    if Config.Framework == "qb" then
        return xPlayer.PlayerData.money["bank"]
    elseif Config.Framework == "esx" then
        return xPlayer.getAccount("bank").money
    end
end

function GetPlayerCashBankBalance(src)
    if Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        return {bank = xPlayer.PlayerData.money["bank"], cash =  xPlayer.PlayerData.money["cash"]}
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        -- return xPlayer.getAccount("bank").money + xPlayer.getMoney()
        return {bank = xPlayer.getAccount("bank").money, cash = xPlayer.getMoney()}
    end
end

function GetPlayerCashBalance(src)
    if Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        return xPlayer.PlayerData.money["cash"]
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        return xPlayer.getMoney()
    end
end

function RemoveCashMoney(src, amount)
    if Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        if xPlayer.PlayerData.money["cash"] >= amount then
            xPlayer.Functions.RemoveMoney("cash", amount)
            return true
        else
            return false
        end
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer.getMoney() >= amount then
            xPlayer.removeMoney(amount)
            return true
        else
            return false
        end
    end
end

function AddBankMoney(src, amount, reason, ignoreTransaction)
    local identifier = nil
    if Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        identifier = xPlayer.PlayerData.citizenid
        xPlayer.Functions.AddMoney("bank", amount)
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        identifier = xPlayer.identifier
        xPlayer.addAccountMoney("bank", amount)
    end
    if not ignoreTransaction then
        CreatePersonalTransactions(identifier, amount, reason, "deposit")
    end
end

function RemoveBankMoney(src, amount, reason, ignoreTransaction)
    if Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        if xPlayer.PlayerData.money["bank"] >= amount then
            local identifier = xPlayer.PlayerData.citizenid
            xPlayer.Functions.RemoveMoney("bank", amount)
            if not ignoreTransaction then
                CreatePersonalTransactions(identifier, amount, reason, "withdraw")
            end
            return true
        else
            return false
        end
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer.getAccount("bank").money >= amount then
            local identifier = xPlayer.identifier
            xPlayer.removeAccountMoney("bank", amount)
            if not ignoreTransaction then
                CreatePersonalTransactions(identifier, amount, reason, "withdraw")
            end
            return true
        else
            return false
        end
    end
end

function AddCashMoney(src, amount)
    if Config.Framework == "qb" then
        local xPlayer = QBCore.Functions.GetPlayer(src)
        xPlayer.Functions.AddMoney("cash", amount)
    elseif Config.Framework == "esx" then
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.addMoney(amount)
    end
end


function RemoveJobGangMoney(source, amount, jobgang, memo, transaction_by, type, ignore)
    if jobGangAccounts[jobgang] >= amount then
        if Config.Framework == "esx" then
            TriggerEvent('esx_addonaccount:getSharedAccount', "society_"..jobgang, function(account)
                account.removeMoney(amount)
            end)
        else
            jobGangAccounts[jobgang] = jobGangAccounts[jobgang] - amount
        end
        -- insert to banking_transactions database
        if not ignore then
            CreateJobTransactions(jobgang, amount, memo, type, transaction_by)
        end
        return true
    else
        return false
    end
end

function AddJobGangMoney(source, amount, jobgang, memo, transaction_by, type)
    if Config.Framework == "esx" then
        TriggerEvent('esx_addonaccount:getSharedAccount', "society_"..jobgang, function(account)
            account.addMoney(amount)
        end)
    else
        jobGangAccounts[jobgang] = jobGangAccounts[jobgang] + amount
    end
    if type ~= "transfer" then
        CreateJobTransactions(jobgang, amount, memo, type, transaction_by)
    end
end


function AddOfflinePlayerBankMoney(identifier, amount)
    if Config.Framework == "qb" then
        MySQL.query.await("UPDATE players SET money = JSON_SET(money, '$.bank', JSON_EXTRACT(money, '$.bank') + ?) WHERE citizenid = ?", {amount, identifier})
    elseif Config.Framework == "esx" then
        MySQL.query.await("UPDATE users SET accounts = JSON_SET(accounts, '$.bank', JSON_EXTRACT(accounts, '$.bank') + ?) WHERE identifier = ?", {amount, identifier})
    end
end

function RemoveOfflinePlayerBankMoney(identifier, amount)
    if Config.Framework == "qb" then
        MySQL.query.await("UPDATE players SET money = JSON_SET(money, '$.bank', JSON_EXTRACT(money, '$.bank') - ?) WHERE citizenid = ?", {amount, identifier})
    elseif Config.Framework == "esx" then
        MySQL.query.await("UPDATE users SET accounts = JSON_SET(accounts, '$.bank', JSON_EXTRACT(accounts, '$.bank') - ?) WHERE identifier = ?", {amount, identifier})
    end
end