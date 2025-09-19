local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_Renewed-Banking_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end


exportHandler('getAccountMoney', function(account)
    if not jobGangAccounts[account] then
        return false
    end
    return jobGangAccounts[account]
end)

exportHandler('addAccountMoney', function(account, amount)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    jobGangAccounts[account] = jobGangAccounts[account] + amount
    return true
end)

exportHandler('removeAccountMoney', function(account, amount)
    -- print(source)
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

RegisterCommand("convertrenewed", function(source)
    if source ~= 0 then 
        print("This command can only be run from the server console.")
        return
    end
    local renewedData = MySQL.Sync.fetchAll("SELECT * FROM `bank_accounts_new`")
    local totalAmount = {}
    local jobMoney = {}
    for k, v in pairs(renewedData) do
        if v.creator then
            if not totalAmount[v.creator] then
                totalAmount[v.creator] = v.amount
            else
                totalAmount[v.creator] = totalAmount[v.creator] + v.amount
            end
        else
            if not jobMoney[v.id] then
                jobMoney[v.id] = v.amount
            else
                jobMoney[v.id] = jobMoney[v.id] + v.amount
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

    -- Delete from bank_accounts_new where Creator is not null
    
    -- MySQL.Async.execute("DELETE FROM `bank_accounts_new` WHERE `creator` IS NOT NULL", {}, function(rowsChanged)
    --     print(rowsChanged)
    -- end)
end, true)


AddEventHandler('txAdmin:events:serverShuttingDown', function()
	for k, v in pairs(jobGangAccounts) do
        -- insert into bank_accounts
        MySQL.Async.execute("INSERT INTO banking_accounts (account, amount) VALUES (@account, @amount) ON DUPLICATE KEY UPDATE amount = @amount", {
            ["@account"] = k,
            ["@amount"] = v
        }, function (rowsChanged) end)
    end
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining ~= 60 then return end

	for k, v in pairs(jobGangAccounts) do
        -- insert into bank_accounts
        MySQL.Async.execute("INSERT INTO banking_accounts (account, amount) VALUES (@account, @amount) ON DUPLICATE KEY UPDATE amount = @amount", {
            ["@account"] = k,
            ["@amount"] = v
        }, function (rowsChanged) end)
    end
end)

AddEventHandler("onResourceStop", function(name)
    if GetCurrentResourceName() ~= name then return end
    for k, v in pairs(jobGangAccounts) do
        -- insert into bank_accounts
        MySQL.Async.execute("INSERT INTO banking_accounts (account, amount) VALUES (@account, @amount) ON DUPLICATE KEY UPDATE amount = @amount", {
            ["@account"] = k,
            ["@amount"] = v
        }, function (rowsChanged) end)
    end
end)