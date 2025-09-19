local function GetAccountBalance(account)
    if not jobGangAccounts[account] then
        return false
    end
    return jobGangAccounts[account]
end

local function AddMoneyToAccount(account, amount)
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

exports("GetAccountBalance", GetAccountBalance)
exports("AddMoneyToAccount", AddMoneyToAccount)
exports("RemoveMoneyFromAccount", RemoveMoneyFromAccount)
exports("SetAccountMoney", SetAccountMoney)
exports("GetJobGangAccounts", GetJobGangAccounts)