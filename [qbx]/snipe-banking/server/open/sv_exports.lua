local function GetAccountBalance(account)
    local account = GetGroupNameBasedOnJob(account)
    if not jobGangAccounts[account] then
        return false
    end
    return jobGangAccounts[account]
end

local function AddMoneyToAccount(account, amount)
    local account = GetGroupNameBasedOnJob(account)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    jobGangAccounts[account] = jobGangAccounts[account] + amount
    return true
end

local function RemoveMoneyFromAccount(account, amount)
    local account = GetGroupNameBasedOnJob(account)
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
end

local function SetAccountMoney(account, amount)
    local account = GetGroupNameBasedOnJob(account)
    if not amount then
        return false
    end
    if not jobGangAccounts[account] then
        return false
    end
    jobGangAccounts[account] = amount
    return true
end

local function GetJobGangAccounts()
    while not jobsLoaded do
        Wait(100)
    end
    return jobGangAccounts
end

local function CreateJobGangAccount(name, label, amount, isJob)
    if not jobGangAccounts[name]  then
        MySQL.Async.execute("INSERT IGNORE INTO banking_accounts (account, amount, label) VALUES (@account, @balance, @label)", {
            ["@account"] = name,
            ["@balance"] = amount,
            ["@label"] = label,
        })
        jobGangAccounts[name] = 0
    end
    CheckAndUpdateUsers(name, true)
    if isJob then
        jobs[name] = label
    else
        gangs[name] = label
    end
end

exports("CreateJobGangAccount", CreateJobGangAccount)
exports("GetAccountBalance", GetAccountBalance)
exports("AddMoneyToAccount", AddMoneyToAccount)
exports("RemoveMoneyFromAccount", RemoveMoneyFromAccount)
exports("SetAccountMoney", SetAccountMoney)
exports("GetJobGangAccounts", GetJobGangAccounts)