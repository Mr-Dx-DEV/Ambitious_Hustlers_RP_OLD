local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_qb-banking_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

exportHandler("GetAccount", function(account)
    if not jobGangAccounts[account] then
        return false
    end
    return jobGangAccounts[account]
end)

exportHandler("GetAccountBalance", function(account)
    if not jobGangAccounts[account] then
        return false
    end
    return jobGangAccounts[account]
end)

exportHandler("AddMoney", function(account, amount)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    jobGangAccounts[account] = jobGangAccounts[account] + amount
    return true
end)

exportHandler("RemoveMoney", function(account, amount)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    if jobGangAccounts[account] >= amount then
        jobGangAccounts[account] = jobGangAccounts[account] - amount
        return true
    else
        return false
    end
end)

RegisterCommand("convertqbbanking", function(source)
    if source ~= 0 then 
        print("This command can only be run from the server console.")
        return
    end
    local qbBankingData = MySQL.Sync.fetchAll("SELECT * FROM `bank_accounts`")
    local totalAmount = {}
    local jobMoney = {}
    for k, v in pairs(qbBankingData) do
        if v.citizenid then
            if not totalAmount[v.citizenid] then
                totalAmount[v.citizenid] = v.account_balance
            else
                totalAmount[v.citizenid] = totalAmount[v.citizenid] + v.account_balance
            end
        else
            if not jobMoney[v.account_name] then
                jobMoney[v.account_name] = v.account_balance
            else
                jobMoney[v.account_name] = jobMoney[v.account_name] + v.account_balance
            end
        end
    end
    for k, v in pairs(totalAmount) do
        print("Adding money for player with citizenid: " .. k .. " with amount: " .. v)
        MySQL.query.await("UPDATE players SET money = JSON_SET(money, '$.bank', JSON_EXTRACT(money, '$.bank') + ?) WHERE citizenid = ?", {v, k})
    end

    for k, v in pairs(jobMoney) do
        print("Adding money for job with id: " .. k .. " with amount: " .. v)
        MySQL.query.await("UPDATE banking_accounts SET amount = ? WHERE account = ?", {v, k})
        jobGangAccounts[k] = v
    end

    -- Delete from bank_accounts where Creator is not null
    
    -- MySQL.Async.execute("DELETE FROM `bank_accounts_new` WHERE `creator` IS NOT NULL", {}, function(rowsChanged)
    --     print(rowsChanged)
    -- end)
end, true)