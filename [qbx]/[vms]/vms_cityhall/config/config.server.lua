SV = {}

-- ██████╗  █████╗ ████████╗ █████╗ ██████╗  █████╗ ███████╗███████╗
-- ██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔════╝
-- ██║  ██║███████║   ██║   ███████║██████╔╝███████║███████╗█████╗  
-- ██║  ██║██╔══██║   ██║   ██╔══██║██╔══██╗██╔══██║╚════██║██╔══╝  
-- ██████╔╝██║  ██║   ██║   ██║  ██║██████╔╝██║  ██║███████║███████╗
-- ╚═════╝ ╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
SV.Database = {
    ['esx'] = {
        ['table:users'] = 'users',
            ['column-users:identifier'] = 'identifier',
            ['column-users:ssn'] = 'ssn',
            ['column-users:firstname'] = 'firstname',
            ['column-users:lastname'] = 'lastname',

        ['table:owned_vehicles'] = 'owned_vehicles',
            ['column-owned_vehicles:owner'] = 'owner',
            ['column-owned_vehicles:owner_name'] = 'owner_name',
            ['column-owned_vehicles:owner_history'] = 'owner_history',
            ['column-owned_vehicles:plate'] = 'plate',
            ['column-owned_vehicles:company'] = 'company',
            ['column-owned_vehicles:insurance'] = 'insurance',
            ['column-owned_vehicles:vehicle'] = 'vehicle',
            ['column-owned_vehicles:type'] = 'type',
            ['column-owned_vehicles:vin'] = 'vin',
            ['column-owned_vehicles:vin_hidden'] = 'vin_hidden',
        
        
    },

    ['qbcore'] = {
        ['table:players'] = 'players',
            ['column-players:citizenid'] = 'citizenid',
            ['column-players:ssn'] = 'citizenid',
            ['column-players:charinfo'] = 'charinfo',
            ['column-players:job'] = 'job',

        ['table:player_vehicles'] = 'player_vehicles',
            ['column-player_vehicles:citizenid'] = 'citizenid',
            ['column-player_vehicles:owner_name'] = 'owner_name',
            ['column-player_vehicles:owner_history'] = 'owner_history',
            ['column-player_vehicles:plate'] = 'plate',
            ['column-player_vehicles:company'] = 'company',
            ['column-player_vehicles:insurance'] = 'insurance',
            ['column-player_vehicles:mods'] = 'mods',
            ['column-player_vehicles:type'] = 'type',
            ['column-player_vehicles:vin'] = 'vin',
            ['column-player_vehicles:vin_hidden'] = 'vin_hidden',
        
    },

}


-- ██╗    ██╗███████╗██████╗ ██╗  ██╗ ██████╗  ██████╗ ██╗  ██╗███████╗
-- ██║    ██║██╔════╝██╔══██╗██║  ██║██╔═══██╗██╔═══██╗██║ ██╔╝██╔════╝
-- ██║ █╗ ██║█████╗  ██████╔╝███████║██║   ██║██║   ██║█████╔╝ ███████╗
-- ██║███╗██║██╔══╝  ██╔══██╗██╔══██║██║   ██║██║   ██║██╔═██╗ ╚════██║
-- ╚███╔███╔╝███████╗██████╔╝██║  ██║╚██████╔╝╚██████╔╝██║  ██╗███████║
--  ╚══╝╚══╝ ╚══════╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝
SV.Webhooks = {
    ['JOINED_JOB'] = "",
    ['SENT_RESUME'] = "",
    ['ORDER_DOCUMENT'] = "",
    ['GET_DOCUMENT'] = "",
    ['PICKUP_DOCUMENT'] = "",
    ['INVALIDATION_DOCUMENT'] = "",
    ['REREGISTRATION_VEHICLE'] = "",
    ['PAYCHECK_WITHDRAW'] = "",
    ['BUY_HEALTH_INSURANCE'] = "",
    ['BUY_VEHICLE_INSURANCE'] = "",
    ['RECEIPT'] = "",
    ['PAY_RECEIPT'] = "",
    ['INVOICE'] = "",
    ['PAY_IVOICE'] = "",
    ['TICKET'] = "",
    ['TRAFFIC_TICKET'] = "",
    ['PAY_TICKET'] = "",
    ['PAY_TAX'] = "",
    ['PAY_COMPANY_TAX'] = "",
    ['VEHICLE_SELL'] = "",
    ['ANNOUNCEMENT'] = "",
    ['EMPLOYEE_HIRE'] = "",
    ['EMPLOYEE_BONUS'] = "",
    ['EMPLOYEE_CHANGE_GRADE'] = "",
    ['EMPLOYEE_FIRE'] = "",
    ['WITHDRAW'] = "",
    ['DEPOSIT'] = "",
}

SV.WebhookText = {
    ['TITLE.JOINED_JOB'] = "Job Center",
    ['DESCRIPTION.JOINED_JOB'] = [[
        Player %s [%s] joined the %s (%s) job.
    ]],

    ['TITLE.SENT_RESUME'] = "",
    ['DESCRIPTION.SENT_RESUME'] = [[
        **Player:** %s [%s]
        **To job:** %s
        **Phone Number:** %s

        **About Me:**
        > %s

        **Work Experience:**
        > %s

        **Skills:** %s

        **Interests:** %s
    ]],

    ['TITLE.ORDER_DOCUMENT'] = "",
    ['DESCRIPTION.ORDER_DOCUMENT'] = [[
        Player %s [%s] ordered document %s (Serial number: %s), will be ready to pick-up %s.
    ]],

    ['TITLE.GET_DOCUMENT'] = "",
    ['DESCRIPTION.GET_DOCUMENT'] = [[
        Player %s [%s] took the document %s.
    ]],

    ['TITLE.PICKUP_DOCUMENT'] = "",
    ['DESCRIPTION.PICKUP_DOCUMENT'] = [[
        Player %s [%s] pick-uped the document %s (Serial number: %s).
    ]],

    ['TITLE.INVALIDATION_DOCUMENT'] = "",
    ['DESCRIPTION.INVALIDATION_DOCUMENT'] = [[
        Player %s [%s] invalidated document serial number %s.
    ]],

    ['TITLE.REREGISTRATION_VEHICLE'] = "",
    ['DESCRIPTION.REREGISTRATION_VEHICLE'] = [[
        Player %s [%s] re-registered vehicle (VIN: %s) by selecting "%s" license plate - %s.
    ]],

    ['TITLE.PAYCHECK_WITHDRAW'] = "",
    ['DESCRIPTION.PAYCHECK_WITHDRAW'] = [[
        Player %s [%s] paid %s out of his paychecks.        
    ]],

    ['TITLE.BUY_HEALTH_INSURANCE'] = "",
    ['DESCRIPTION.BUY_HEALTH_INSURANCE'] = [[
        Player %s [%s] bought insurance for %s days for $%s, insured to: %s.
    ]],
    
    ['TITLE.BUY_VEHICLE_INSURANCE'] = "",
    ['DESCRIPTION.BUY_VEHICLE_INSURANCE'] = [[
        Player %s [%s] insured his vehicle %s by %s day, for $%s, insured to: %s.
    ]],

    ['TITLE.RECEIPT'] = "RECEIPT #%s",
    ['DESCRIPTION.RECEIPT'] = [[
        Player %s [%s] (%s) billed player %s [%s] (%s) in the amount of $%s + tax %s, time to pay %s days.

        ```json
        %s
        ```
    ]],

    ['TITLE.PAY_RECEIPT'] = "RECEIPT #%s",
    ['DESCRIPTION.PAY_RECEIPT'] = [[
        Player %s [%s] paid bill #%s in the amount of $%s + tax %s.
    ]],

    ['TITLE.INVOICE'] = "INVOICE #%s",
    ['DESCRIPTION.INVOICE'] = [[
        Player %s [%s] (%s) invoiced player %s [%s] (%s) in the amount of $%s + tax %s, time to pay %s days.

        ```json
        %s
        ```
    ]],

    ['TITLE.PAY_IVOICE'] = "INVOICE #%s",
    ['DESCRIPTION.PAY_IVOICE'] = [[
        Player %s [%s] paid invoice #%s in the amount of $%s + tax %s.
    ]],
    
    ['TITLE.TICKET'] = "TICKET #%s",
    ['DESCRIPTION.TICKET'] = [[
        Player %s [%s] (%s) issued a ticket %s [%s] (%s) in the amount of $%s, time to pay %s days.
        
        **Location of Violation:** %s
        **Violation:** %s
        **Comments:**
        %s
    ]],

    ['TITLE.TRAFFIC_TICKET'] = "TRAFFIC TICKET #%s",
    ['DESCRIPTION.TRAFFIC_TICKET'] = [[
        Player %s [%s] (%s) issued a traffic ticket %s [%s] (%s) in the amount of $%s, time to pay %s days.
        
        **License Plate:** %s
        **Vehicle Make:** %s
        **Vehicle Model:** %s
        **Vehicle VIN:** %s

        **License:** %s
        **License Revocation:** %s
        **License Suspension Time:** %s

        **Penalty Points:** %s

        **Location of Violation:** %s
        **Violation:** %s
        **Comments:**
        %s
    ]],

    ['TITLE.PAY_TICKET'] = "TICKET #%s",
    ['DESCRIPTION.PAY_TICKET'] = [[
        Player %s [%s] paid ticket #%s in the amount of $%s.
    ]],

    ['TITLE.PAY_TAX'] = "TAX #%s",
    ['DESCRIPTION.PAY_TAX'] = [[
        Player %s [%s] paid tax in the amount of $%s (delay: %s days) on account of "%s".
    ]],

    ['TITLE.PAY_COMPANY_TAX'] = "COMPANY TAX %s",
    ['DESCRIPTION.PAY_COMPANY_TAX'] = [[
        Player %s [%s] paid a company tax (%s) in the amount of $%s (delay: %s months) from the period %s.
    ]],

    ['TITLE.VEHICLE_SELL'] = "",
    ['DESCRIPTION.VEHICLE_SELL'] = [[
        Player %s [%s] sold vehicle %s to player %s [%s] for $%s.
    ]],

    ['TITLE.ANNOUNCEMENT'] = "",
    ['DESCRIPTION.ANNOUNCEMENT'] = [[
        Clerk %s [%s] sent a message to the company %s.

        ```
        %s
        ```
    ]],

    ['TITLE.EMPLOYEE_HIRE'] = "Employee Hire",
    ['DESCRIPTION.EMPLOYEE_HIRE'] = [[
        Player %s [%s] hired an employee %s (%s)
    ]],

    ['TITLE.EMPLOYEE_BONUS'] = "Employee Bonus",
    ['DESCRIPTION.EMPLOYEE_BONUS'] = [[
        Player %s [%s] gave a bonus to employee %s of $%s
    ]],

    ['TITLE.EMPLOYEE_CHANGE_GRADE'] = "Employee Change Grade",
    ['DESCRIPTION.EMPLOYEE_CHANGE_GRADE'] = [[
        Player %s [%s] changed the job grade of player %s to %s
    ]],

    ['TITLE.EMPLOYEE_FIRE'] = "Employee Fire",
    ['DESCRIPTION.EMPLOYEE_FIRE'] = [[
        Player %s [%s] fired an employee %s
    ]],

    ['TITLE.WITHDRAW'] = "Withdraw",
    ['DESCRIPTION.WITHDRAW'] = [[
        Player %s [%s] withdrew $%s
    ]],

    ['TITLE.DEPOSIT'] = "Deposit",
    ['DESCRIPTION.DEPOSIT'] = [[
        Player %s [%s] deposit $%s
    ]],
    
}

SV.Webhook = function(webhook_id, title, description, color, footer)
    local DiscordWebHook = SV.Webhooks[webhook_id]
    local embeds = {{
        ["title"] = title,
        ["type"] = "rich",
        ["description"] = description,
        ["color"] = color,
        ["footer"] = {
            ["text"] = footer..' - '..os.date(),
        },
    }}
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({embeds = embeds}), {['Content-Type'] = 'application/json'})
end


-- ███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
-- ██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
-- █████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
-- ██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
-- ██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
-- ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
SV.getPlayer = function(src)
    if Config.Core == "ESX" then
        return Core.GetPlayerFromId(src)
    elseif Config.Core == "QB-Core" then
        return Core.Functions.GetPlayer(src)
    end
end

SV.getIdentifier = function(xPlayer)
    if Config.Core == "ESX" then
        return xPlayer.identifier
    elseif Config.Core == "QB-Core" then
        return xPlayer.PlayerData.citizenid
    end
end

SV.getPlayerByIdentifier = function(identifier)
    if Config.Core == "ESX" then
        return Core.GetPlayerFromIdentifier(identifier)
    elseif Config.Core == "QB-Core" then
        return Core.Functions.GetPlayerByCitizenId(identifier)
    end
end

SV.getCharacterName = function(xPlayer)
    if Config.Core == "ESX" then
        return xPlayer.getName()
    elseif Config.Core == "QB-Core" then
        return xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
    end
end

SV.getPlayerData = function(xPlayer, name)
    if Config.Core == "ESX" then
        if name == 'firstName' then
            return xPlayer.variables.firstName

        elseif name == 'lastName' then
            return xPlayer.variables.lastName

        elseif name == 'dateOfBirth' then
            return xPlayer.variables.dateofbirth

        elseif name == 'ssn' then
            return xPlayer.variables.ssn

        elseif name == 'nationality' then
            return xPlayer.variables.nationality

        end
    elseif Config.Core == "QB-Core" then
        if name == 'firstName' then
            return xPlayer.PlayerData.charinfo.firstname

        elseif name == 'lastName' then
            return xPlayer.PlayerData.charinfo.lastname

        elseif name == 'dateOfBirth' then
            return xPlayer.PlayerData.charinfo.birthdate

        elseif name == 'ssn' then
            return xPlayer.PlayerData.citizenid

        elseif name == 'nationality' then
            return xPlayer.PlayerData.nationality

        end
    end
end

SV.getPlayerJob = function(xPlayer)
    if Config.Core == "ESX" then
        return xPlayer.job.name
    elseif Config.Core == "QB-Core" then
        return xPlayer.PlayerData.job.name
    end
end

SV.getPlayerJobLabel = function(xPlayer)
    if Config.Core == "ESX" then
        return xPlayer.job.label
    elseif Config.Core == "QB-Core" then
        return xPlayer.PlayerData.job.label
    end
end

SV.setPlayerJob = function(xPlayer, name, grade, isOffline)
    if name then
        if Config.Core == "ESX" then
            xPlayer.setJob(name, grade)
            
        elseif Config.Core == "QB-Core" then
            xPlayer.Functions.SetJob(name, grade)
            Core.Player.Save(xPlayer.PlayerData.source)

        end
    else
        if not isOffline then
            if Config.Core == "ESX" then
                xPlayer.setJob('unemployed', 0)
                
            elseif Config.Core == "QB-Core" then
                xPlayer.Functions.SetJob('unemployed')
                Core.Player.Save(xPlayer.PlayerData.source)
                
            end
        else
            if Config.Core == "ESX" then
                MySQL.Async.execute('UPDATE users SET job = @job, job_grade = @job_grade WHERE identifier = @identifier', {
                    ['@job'] = 'unemployed',
                    ['@job_grade'] = '0',
                    ['@identifier'] = xPlayer
                })
            elseif Config.Core == "QB-Core" then
                
            end
        end
    end
end

SV.getPlayerJobGrade = function(xPlayer)
    if Config.Core == "ESX" then
        return xPlayer.job.grade
    elseif Config.Core == "QB-Core" then
        return xPlayer.PlayerData.job.grade.level
    end
end

SV.getMoney = function(xPlayer, moneyType)
    if Config.Core == "ESX" then
        local moneyType = moneyType == 'cash' and 'money' or moneyType
        return xPlayer.getAccount(moneyType).money
    elseif Config.Core == "QB-Core" then
        return xPlayer.Functions.GetMoney(moneyType)
    end
end

SV.addMoney = function(xPlayer, moneyType, count)
    if Config.Core == "ESX" then
        local moneyType = moneyType == 'cash' and 'money' or moneyType == 'dirty' and 'black_money' or moneyType
        xPlayer.addAccountMoney(moneyType, count)
    elseif Config.Core == "QB-Core" then
        xPlayer.Functions.AddMoney(moneyType, count)
    end
end

SV.removeMoney = function(xPlayer, moneyType, count)
    if Config.Core == "ESX" then
        local moneyType = moneyType == 'cash' and 'money' or moneyType
        xPlayer.removeAccountMoney(moneyType, count)
    elseif Config.Core == "QB-Core" then
        xPlayer.Functions.RemoveMoney(moneyType, count)
    end
end

SV.addMoneyOffline = function(identifier, moneyType, count)
    if Config.Core == "ESX" then
        local moneyType = moneyType == 'cash' and 'money' or moneyType == 'dirty' and 'black_money' or moneyType

        MySQL.Async.fetchScalar('SELECT accounts FROM users WHERE identifier = @identifier', {
            ['@identifier'] = identifier
        }, function(accountsJson)
            if accountsJson then
                local accounts = json.decode(accountsJson)
                if accounts and accounts[moneyType] then
                    accounts[moneyType] = tonumber(accounts[moneyType]) + tonumber(count)
                    local updatedAccountsJson = json.encode(accounts)
                    MySQL.Async.execute('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
                        ['@accounts'] = updatedAccountsJson,
                        ['@identifier'] = identifier
                    })
                end
            end
        end)

    elseif Config.Core == "QB-Core" then
        MySQL.Async.fetchScalar('SELECT money FROM players WHERE citizenid = @citizenid', {
            ['@citizenid'] = identifier
        }, function(accountsJson)
            if accountsJson then
                local accounts = json.decode(accountsJson)
                if accounts and accounts[moneyType] then
                    accounts[moneyType] = tonumber(accounts[moneyType]) + tonumber(count)
                    local updatedAccountsJson = json.encode(accounts)
                    MySQL.Async.execute('UPDATE players SET money = @money WHERE citizenid = @citizenid', {
                        ['@money'] = updatedAccountsJson,
                        ['@citizenid'] = identifier
                    })
                end
            end
        end)

    end
end

SV.getSocietyMoney = function(societyName, cb)
    if GetResourceState('vms_bossmenu') == 'started' then
        societyName = string.gsub(societyName, 'society_', '')
        local money = exports['vms_bossmenu']:getMoney(societyName)
        cb(money)
    else
        if Config.Core == "ESX" then
            TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
                cb(account.money)
            end)

        elseif Config.Core == "QB-Core" then
            local society = exports['qb-banking']:GetAccountBalance(societyName)
            cb(society)
            
            -- local society = exports['qb-management']:GetAccount(societyName)
            -- cb(society)
        end
    end
end

SV.addSocietyMoney = function(societyName, amount)
    if GetResourceState('vms_bossmenu') == 'started' then
        societyName = string.gsub(societyName, 'society_', '')
        exports['vms_bossmenu']:addMoney(societyName, amount)
    else
        if Config.Core == "ESX" then
            TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
                account.addMoney(amount)
            end)
        elseif Config.Core == "QB-Core" then
            local success, response = pcall(function()
                exports['qb-banking']:AddMoney(societyName, amount)
            end)
            
            if not success and string.find(response, "No such export") then
                exports['qb-management']:AddMoney(societyName, amount)
            end
        end
    end
end

SV.removeSocietyMoney = function(societyName, amount)
    if GetResourceState('vms_bossmenu') == 'started' then
        societyName = string.gsub(societyName, 'society_', '')
        exports['vms_bossmenu']:removeMoney(societyName, amount)
    else
        if Config.Core == "ESX" then
            TriggerEvent('esx_addonaccount:getSharedAccount', societyName, function(account)
                account.removeMoney(amount)
            end)
        elseif Config.Core == "QB-Core" then
            local success, response = pcall(function()
                exports['qb-banking']:RemoveMoney(societyName, amount)
            end)
            
            if not success and string.find(response, "No such export") then
                exports['qb-management']:RemoveMoney(societyName, amount)
            end
        end
    end
end

---@param receiver table: {src?, identifier, phoneNumber}
---@param accepted boolean
---@param name string
---@param jobName string
SV.sendPhoneMessage = function(receiver, accepted, name, jobName)
    local qbPhone = GetResourceState('qb-phone') == 'started'
    local qsSmartphonePro = GetResourceState('qs-smartphone-pro') == 'started'
    local yseries = GetResourceState('yseries') == 'started'
    local lbPhone = GetResourceState('lb-phone') == 'started'
    local okokPhone = GetResourceState('okokPhone') == 'started'
    local gksphone = GetResourceState('gksphone') == 'started'

    if qbPhone then
        exports['qb-phone']:sendNewMailToOffline(receiver.identifier, {
            sender = 'City Hall',
            subject = TRANSLATE('phone.email:resume_title'),
            message = accepted and TRANSLATE('phone.email:resume_accepted', name, jobName) or TRANSLATE('phone.email:resume_rejected', name, jobName),
        })

    elseif qsSmartphonePro then
        if not receiver.src then
            return false
        end

        exports['qs-smartphone-pro']:sendNewMail(tonumber(receiver.src), {
            sender = 'City Hall',
            subject = TRANSLATE('phone.email:resume_title'),
            message = accepted and TRANSLATE('phone.email:resume_accepted', name, jobName) or TRANSLATE('phone.email:resume_rejected', name, jobName),
        })

        return true

    elseif yseries then
        local insertId, received = exports['yseries']:SendMail({
            title = TRANSLATE('phone.email:resume_title'),
            sender = 'cityhall@lsmail.com',
            senderDisplayName = 'City Hall',
            content = accepted and TRANSLATE('phone.email:resume_accepted', name, jobName) or TRANSLATE('phone.email:resume_rejected', name, jobName),
        }, 'all', receiver.phoneNumber)

        return received

    elseif lbPhone then
        local emailAdreess = exports["lb-phone"]:GetEmailAddress(receiver.phoneNumber)
        if not emailAdreess then
            return false
        end

        local success, id = exports["lb-phone"]:SendMail({
            to = emailAdreess,
            sender = 'City Hall',
            subject = TRANSLATE('phone.email:resume_title'),
            message = accepted and TRANSLATE('phone.email:resume_accepted', name, jobName) or TRANSLATE('phone.email:resume_rejected', name, jobName)
        })

        return success

    elseif okokPhone then
        if not receiver.src then
            return false
        end

        local emailAdreess = exports['okokPhone']:getEmailAddressFromSource(tonumber(receiver.src))
        if not emailAdreess then
            return false
        end

        exports['okokPhone']:sendEmail({
            sender = "cityhall@lsmail.com",
            recipients = emailAdreess,
            subject = TRANSLATE('phone.email:resume_title'),
            body = accepted and TRANSLATE('phone.email:resume_accepted', name, jobName) or TRANSLATE('phone.email:resume_rejected', name, jobName)
        })

    elseif gksphone then
        if receiver.src then
            exports["gksphone"]:SendNewMail(receiver.src, {
                sender = 'cityhall@lsmail.com',
                image = '/html/static/img/icons/mail.png', -- (Default: GKSPhonev1. Update the image path if using GKSPhonev2.)
                subject = TRANSLATE('phone.email:resume_title'),
                message = accepted and TRANSLATE('phone.email:resume_accepted', name, jobName) or TRANSLATE('phone.email:resume_rejected', name, jobName)
            })
        else
            local success = exports["gksphone"]:SendNewMailOffline(receiver.identifier, {
                sender = 'cityhall@lsmail.com',
                image = '/html/static/img/icons/mail.png', -- (Default: GKSPhonev1. Update the image path if using GKSPhonev2.)
                subject = TRANSLATE('phone.email:resume_title'),
                message = accepted and TRANSLATE('phone.email:resume_accepted', name, jobName) or TRANSLATE('phone.email:resume_rejected', name, jobName)
            })
    
            if not success then
                return false
            end
        end
    
    end
end


SV.getPlayersFromDatabase = function(jobName, cb)
    if Config.Core == "ESX" then
        MySQL.query("SELECT identifier, firstname, lastname FROM `users` WHERE `job`= ?", {jobName}, function(result)
            cb(result)
        end)

    elseif Config.Core == "QB-Core" then
        local players = MySQL.query.await("SELECT citizenid, charinfo FROM `players` WHERE `job` LIKE '%" .. jobName .. "%'", {})
        for k, v in pairs(players) do
            v.charinfo = json.decode(v.charinfo)
        end
        cb(players)

    end
end

SV.fetchVehiclesPrices = function(cb)
    if not Config.InsurancePricesBasedOnDatabasePrices then
        return cb({});
    end
    
    if Config.Core == "ESX" or GetResourceState('vms_vehicleshopv2') == "started" then
        MySQL.Async.fetchAll('SELECT model, price FROM vehicles', {}, function(result)
            if result and result[1] then
                local vehiclesList = {}
                for k, v in pairs(result) do
                    vehiclesList[GetHashKey(v.model)] = v.price
                end
                
                cb(vehiclesList)
            else
                cb({})
            end
        end)
    else
        local allVehicles = Core.Shared.Vehicles
        local vehiclesList = {}
        for k, v in pairs(allVehicles) do
            vehiclesList[GetHashKey(v.model)] = v.price
        end
        cb(vehiclesList)
    end
end

SV.fetchPlayerVehicles = function(xPlayer, cb)
    local identifier = SV.getIdentifier(xPlayer)
    local characterName = SV.getCharacterName(xPlayer)

    local query = ('SELECT `%s`, `%s`, `%s`, `%s`, `%s` FROM `%s` WHERE `%s` = @identifier'):format(
        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:owner_name'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:owner_name'],
        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:plate'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:plate'],
        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:vin'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:vin'],
        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:vehicle'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:mods'],
        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:insurance'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:insurance'],
        Config.Core == "ESX" and SV.Database['esx']['table:owned_vehicles'] or Config.Core == "QB-Core" and SV.Database['qbcore']['table:player_vehicles'],
        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:owner'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:citizenid']
    )
    MySQL.Async.fetchAll(query, {
        ['@identifier'] = identifier
    }, function(result)
        if result and result[1] then
            local vehiclesList = result

            if Config.Core == "ESX" then
                for k, v in pairs(vehiclesList) do
                    v.model = json.decode(v[SV.Database['esx']['column-owned_vehicles:vehicle']]).model
                    v.insurance = v[SV.Database['esx']['column-owned_vehicles:insurance']] and json.decode(v[SV.Database['esx']['column-owned_vehicles:insurance']]) or nil
                    v.vehicle = nil
                    v.isRegistered = v[SV.Database['esx']['column-owned_vehicles:owner_name']] == characterName

                end
                
            elseif Config.Core == "QB-Core" then
                for k, v in pairs(vehiclesList) do
                    v.model = json.decode(v[SV.Database['qbcore']['column-player_vehicles:mods']]).model
                    v.insurance = v[SV.Database['qbcore']['column-player_vehicles:insurance']] and json.decode(v[SV.Database['qbcore']['column-player_vehicles:insurance']]) or nil
                    v.vehicle = nil
                    v.isRegistered = v[SV.Database['qbcore']['column-player_vehicles:owner_name']] == characterName

                end
                
            end
            
            cb(vehiclesList)
            
        else
            cb({})
            
        end
    end)
end

-- SV.getPlayerVehicle = function(identifier, plate, cb)
--     MySQL.query("SELECT insurance FROM `owned_vehicles` WHERE `owner`= ?, `plate`= ?", {identifier, plate}, function(result)
--         cb(result)
--     end)
-- end

SV.updateVehiclePlate = function(vehicleId, oldPlate, newPlate)
    if GetResourceState('AdvancedParking') == 'started' then
        exports["AdvancedParking"]:UpdatePlate(vehicleId, newPlate)

    else
        SetVehicleNumberPlateText(vehicleId, newPlate)

    end

end


local businessesTaxJobAccounts = {
    ['vms_barber'] = {
        ['barber1'] = 'HS_Barber_1',
        ['barber2'] = 'HS_Barber_2',
        ['barber3'] = 'HS_Barber_3',
        ['barber4'] = 'HS_Barber_4',
        ['barber5'] = 'HS_Barber_5',
        ['barber6'] = 'HS_Barber_6',
        ['barber7'] = 'HS_Barber_7',
    },

    ['vms_tattooshop'] = {
        ['tattoo1'] = 'Tattooshop_1',
        ['tattoo2'] = 'Tattooshop_2',
        ['tattoo3'] = 'Tattooshop_3',
        ['tattoo4'] = 'Tattooshop_4',
        ['tattoo5'] = 'Tattooshop_5',
        ['tattoo6'] = 'Tattooshop_6',
    },

    ['vms_gym'] = {
        ['gym1'] = 'Gym_1',
        ['gym2'] = 'Gym_2',
    },

    ['vms_tuning'] = {
        ['mechanic'] = 'BennyS',
    },
    
    ['vms_vehicleshopv2'] = {
        ['pdm'] = 'PDM',
    },

    ['vms_stores'] = {
        ['ltd1'] = 'LTDGasoline_1',
        ['ltd2'] = 'LTDGasoline_2',
        ['ltd3'] = 'LTDGasoline_3',
        ['ltd4'] = 'LTDGasoline_4',
        ['ltd5'] = 'LTDGasoline_5',
        ['robsliquor1'] = 'Robs_Liquor_1',
        ['robsliquor2'] = 'Robs_Liquor_2',
        ['robsliquor3'] = 'Robs_Liquor_3',
        ['robsliquor4'] = 'Robs_Liquor_4',
        ['twentyfourseven1'] = 'TwentyFourSeven_1',
        ['twentyfourseven2'] = 'TwentyFourSeven_2',
        ['twentyfourseven3'] = 'TwentyFourSeven_3',
        ['twentyfourseven4'] = 'TwentyFourSeven_4',
        ['twentyfourseven5'] = 'TwentyFourSeven_5',
        ['twentyfourseven6'] = 'TwentyFourSeven_6',
        ['twentyfourseven7'] = 'TwentyFourSeven_7',
        ['twentyfourseven8'] = 'TwentyFourSeven_8',
        ['twentyfourseven9'] = 'TwentyFourSeven_9',
    },
}
SV.getBusinessTaxAccount = function(resourceName, jobName)
    if resourceName == 'vms_barber' then
        local barberId = businessesTaxJobAccounts[resourceName][jobName];
        return exports['vms_barber']:getCompanyMoney(barberId)

    elseif resourceName == 'vms_tattooshop' then
        local tattooshopId = businessesTaxJobAccounts[resourceName][jobName];
        return exports['vms_tattooshop']:getCompanyMoney(tattooshopId)
        
    elseif resourceName == 'vms_gym' then
        local gymId = businessesTaxJobAccounts[resourceName][jobName];
        return exports['vms_gym']:getCompanyMoney(gymId)
        
    elseif resourceName == 'vms_tuning' then
        local tuningId = businessesTaxJobAccounts[resourceName][jobName];
        return exports['vms_tuning']:getCompanyMoney(tuningId)

    elseif resourceName == 'vms_vehicleshopv2' then
        local vehicleshopId = businessesTaxJobAccounts[resourceName][jobName];
        return exports['vms_vehicleshopv2']:getCompanyMoney(vehicleshopId)
        
    elseif resourceName == 'vms_garagesv2' then
        local garageId = businessesTaxJobAccounts[resourceName][jobName];
        return exports['vms_garagesv2']:getCompanyMoney(garageId)
        
    elseif resourceName == 'vms_stores' then
        local storeId = businessesTaxJobAccounts[resourceName][jobName];
        return exports['vms_stores']:getCompanyMoney(storeId)

    elseif resourceName == 'vms_bossmenu' then
        return exports['vms_bossmenu']:getMoney(jobName)

    end
end

SV.removeBusinessTaxAccount = function(resourceName, jobName, amount)
    if resourceName == 'vms_barber' then
        local barberId = businessesTaxJobAccounts[resourceName][jobName];
        exports['vms_barber']:removeCompanyMoney(barberId, amount)

    elseif resourceName == 'vms_tattooshop' then
        local tattooshopId = businessesTaxJobAccounts[resourceName][jobName];
        exports['vms_tattooshop']:removeCompanyMoney(tattooshopId, amount)
        
    elseif resourceName == 'vms_gym' then
        local gymId = businessesTaxJobAccounts[resourceName][jobName];
        exports['vms_gym']:removeCompanyMoney(gymId, amount)
        
    elseif resourceName == 'vms_tuning' then
        local tuningId = businessesTaxJobAccounts[resourceName][jobName];
        exports['vms_tuning']:removeCompanyMoney(tuningId, amount)

    elseif resourceName == 'vms_vehicleshopv2' then
        local vehicleshopId = businessesTaxJobAccounts[resourceName][jobName];
        exports['vms_vehicleshopv2']:removeCompanyMoney(vehicleshopId, amount)
        
    elseif resourceName == 'vms_garagesv2' then
        local garageId = businessesTaxJobAccounts[resourceName][jobName];
        return exports['vms_garagesv2']:getCompanyMoney(garageId)
        
    elseif resourceName == 'vms_stores' then
        local storeId = businessesTaxJobAccounts[resourceName][jobName];
        exports['vms_stores']:removeCompanyMoney(storeId, amount)

    elseif resourceName == 'vms_bossmenu' then
        exports['vms_bossmenu']:removeMoney(jobName, amount)

    end
end

local businessesMessages = {
    ['barber1'] = {name = 'HS_Barber_1', resource = 'vms_barber'},
    ['barber2'] = {name = 'HS_Barber_2', resource = 'vms_barber'},
    ['barber3'] = {name = 'HS_Barber_3', resource = 'vms_barber'},
    ['barber4'] = {name = 'HS_Barber_4', resource = 'vms_barber'},
    ['barber5'] = {name = 'HS_Barber_5', resource = 'vms_barber'},
    ['barber6'] = {name = 'HS_Barber_6', resource = 'vms_barber'},
    ['barber7'] = {name = 'HS_Barber_7', resource = 'vms_barber'},

    ['tattoo1'] = {name = 'Tattooshop_1', resource = 'vms_tattooshop'},
    ['tattoo2'] = {name = 'Tattooshop_2', resource = 'vms_tattooshop'},
    ['tattoo3'] = {name = 'Tattooshop_3', resource = 'vms_tattooshop'},
    ['tattoo4'] = {name = 'Tattooshop_4', resource = 'vms_tattooshop'},
    ['tattoo5'] = {name = 'Tattooshop_5', resource = 'vms_tattooshop'},
    ['tattoo6'] = {name = 'Tattooshop_6', resource = 'vms_tattooshop'},

    ['gym1'] = {name = 'Gym_1', resource = 'vms_gym'},
    ['gym2'] = {name = 'Gym_2', resource = 'vms_gym'},

    ['mechanic'] = {name = 'BennyS', resource = 'vms_tuning'},

    ['pdm'] = {name = 'PDM', resource = 'vms_vehicleshopv2'},

    ['ltd1'] = {name = 'LTDGasoline_1', resource = 'vms_stores'},
    ['ltd2'] = {name = 'LTDGasoline_2', resource = 'vms_stores'},
    ['ltd3'] = {name = 'LTDGasoline_3', resource = 'vms_stores'},
    ['ltd4'] = {name = 'LTDGasoline_4', resource = 'vms_stores'},
    ['ltd5'] = {name = 'LTDGasoline_5', resource = 'vms_stores'},
    ['robsliquor1'] = {name = 'Robs_Liquor_1', resource = 'vms_stores'},
    ['robsliquor2'] = {name = 'Robs_Liquor_2', resource = 'vms_stores'},
    ['robsliquor3'] = {name = 'Robs_Liquor_3', resource = 'vms_stores'},
    ['robsliquor4'] = {name = 'Robs_Liquor_4', resource = 'vms_stores'},
    ['twentyfourseven1'] = {name = 'TwentyFourSeven_1', resource = 'vms_stores'},
    ['twentyfourseven2'] = {name = 'TwentyFourSeven_2', resource = 'vms_stores'},
    ['twentyfourseven3'] = {name = 'TwentyFourSeven_3', resource = 'vms_stores'},
    ['twentyfourseven4'] = {name = 'TwentyFourSeven_4', resource = 'vms_stores'},
    ['twentyfourseven5'] = {name = 'TwentyFourSeven_5', resource = 'vms_stores'},
    ['twentyfourseven6'] = {name = 'TwentyFourSeven_6', resource = 'vms_stores'},
    ['twentyfourseven7'] = {name = 'TwentyFourSeven_7', resource = 'vms_stores'},
    ['twentyfourseven8'] = {name = 'TwentyFourSeven_8', resource = 'vms_stores'},
    ['twentyfourseven9'] = {name = 'TwentyFourSeven_9', resource = 'vms_stores'},
}
SV.sendBusinessMessage = function(company, message)
    if company and businessesMessages[company] and businessesMessages[company].resource then
        if GetResourceState(businessesMessages[company].resource) ~= 'started' then
            return
        end

        exports[businessesMessages[company].resource]:sendAnnouncement(nil, businessesMessages[company].name, message, 'cityhall')
    elseif GetResourceState('vms_bossmenu') == 'started' then
        exports['vms_bossmenu']:sendAnnouncement(company, message, 'cityhall')

    end
end

SV.getJobInfo = function(jobName, name)
    if Config.Core == "ESX" then
        local job = ESX.GetJobs()[jobName];
        if not job then
            return nil
        end

        if name then
            if name == "label" then
                return job.label
            end
        end
    else
        
    end
end

-- Items:
SV.registerUsableItem = function(name, cb)
    if GetResourceState('ox_inventory') == 'started' then
        if Config.Core == "ESX" then
            Core.RegisterUsableItem(name, function(src, itemName, itemData)
                cb(src, itemName, {metadata = itemData.metadata})
            end)
    
        elseif Config.Core == "QB-Core" then
            Core.Functions.CreateUseableItem(name, function(src, item)
                cb(src, item.name, {metadata = item.metadata})
            end)
    
        end

    elseif GetResourceState('qs-inventory') == 'started' then
        exports['qs-inventory']:CreateUsableItem(name, function(src, item)
            cb(src, item.name, {metadata = item.info})
        end)
        
    elseif GetResourceState('origen_inventory') == 'started' then
        exports['origen_inventory']:CreateUseableItem(name, function(src, item)
            cb(src, item.name, {metadata = item.metadata})
        end)

    else
        if Config.Core == "ESX" then
            Core.RegisterUsableItem(name, function(src, itemName, itemData)
                cb(src, itemName, {metadata = itemData.metadata})
            end)
    
        elseif Config.Core == "QB-Core" then
            Core.Functions.CreateUseableItem(name, function(src, item)
                cb(src, item.name, {metadata = item.info})
            end)
    
        end
    end
end

SV.getItemCount = function(xPlayer, name)
    if Config.Core == "ESX" then
        return xPlayer.getInventoryItem(name).count
    elseif Config.Core == "QB-Core" then
        return xPlayer.Functions.GetItemByName(name) and xPlayer.Functions.GetItemByName(name).amount or 0
    end
end

SV.addItem = function(src, xPlayer, name, count, metadata)
    if GetResourceState('ox_inventory') == 'started' then
        exports['ox_inventory']:AddItem(src, name, count, metadata, nil)

    elseif GetResourceState('qb-inventory') == 'started' then
        exports['qb-inventory']:AddItem(src, name, count, false, metadata)
        
    elseif GetResourceState('qs-inventory') == 'started' then
        exports['qs-inventory']:AddItem(src, name, count, false, metadata)

    elseif GetResourceState('tgiann-inventory') == 'started' then
        exports["tgiann-inventory"]:AddItem(src, name, count, false, metadata, false)

    elseif GetResourceState('core_inventory') == 'started' then
        exports['core_inventory']:addItem(src, name, count, metadata)

    elseif GetResourceState('origen_inventory') == 'started' then
        exports['origen_inventory']:AddItem(src, name, count, nil, nil, metadata)

    else
        if Config.Core == "ESX" then
            xPlayer.addInventoryItem(name, count)

        elseif Config.Core == "QB-Core" then
            xPlayer.Functions.AddItem(name, count)

        end
    end
    
end

SV.removeItem = function(src, xPlayer, name, count)
    if GetResourceState('ox_inventory') == 'started' then
        exports['ox_inventory']:RemoveItem(src, name, count)

    elseif GetResourceState('qb-inventory') == 'started' then
        exports['qb-inventory']:RemoveItem(src, name, count)

    elseif GetResourceState('qs-inventory') == 'started' then
        exports['qs-inventory']:RemoveItem(src, name, count)

    elseif GetResourceState('tgiann-inventory') == 'started' then
        exports["tgiann-inventory"]:RemoveItem(src, name, count)

    elseif GetResourceState('core_inventory') == 'started' then
        exports['core_inventory']:removeItem(src, name, count)

    elseif GetResourceState('origen_inventory') == 'started' then
        exports['origen_inventory']:RemoveItem(src, name, count)

    else
        if Config.Core == "ESX" then
            xPlayer.removeInventoryItem(name, count)
    
        elseif Config.Core == "QB-Core" then
            xPlayer.Functions.RemoveItem(name, count)
    
        end
    end
end

-- Documents:
SV.addDocument = function(src, xPlayer, name, photoId, cb)
    if GetResourceState('vms_documentsv2') == 'started' then
        local success = exports['vms_documentsv2']:giveDocument(src, name, photoId)
        if cb then
            cb(success)
        end
    else
        
    end
end

SV.pickupDocument = function(src, xPlayer, name, serialNumber, cb)
    if GetResourceState('vms_documentsv2') == 'started' then
        exports['vms_documentsv2']:pickupDocument(src, serialNumber, function(done)
            if cb then
                cb(done)
            end
        end)
    else
        SV.addDocument(src, xPlayer, name)

    end
end


-- Licenses:
SV.removeLicense = function(src, xPlayer, xIdentifier, licenseName)
    if GetResourceState('esx_license') == 'started' then
        --[[
            By default export exports['esx_license']:RemoveLicense does not exist in esx_license
            Go to our documentation and add this export according to the guide.
        ]]
        local success, response = pcall(function()
            exports['esx_license']:RemoveLicense(xIdentifier, licenseName)
        end)
        
        if not success then
            library.Debug('You have not implemented custom export RemoveLicense() in your esx_license, there is a tutorial in our documentation.', 'warn')
        end
        
        if GetResourceState('vms_driveschoolv2') == 'started' then
            TriggerEvent('esx_license:getLicenses', src, function(licenses)
                TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src, licenses)
            end)
        end
    elseif GetResourceState('Buty-license') == 'started' then
        exports['Buty-license']:RemoveLicense(xIdentifier, 'driving', licenseName)

    else
        if Config.Core == "QB-Core" then
            local licensesList = xPlayer.PlayerData.metadata['licences']
            licensesList[licenseName] = false
            xPlayer.Functions.SetMetaData('licences', licensesList)

            if GetResourceState('vms_driveschoolv2') == 'started' then
                TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src)
            end
        end

    end
end


SV.sellVehicleWithAgreement = function(data, newOwnerIdentifier, playerJob)
    if GetResourceState('vms_garagesv2') == 'started' then
        if data.garage and data.garageSpotID then
            exports['vms_garagesv2']:updateVehicleNewOwner(data.garage, data.garageSpotID, newOwnerIdentifier, playerJob)
        end
    else
        
    end
end


SV.getClerkPlayerData = function(ssn, cb)
    local playerData = {};
    local query = ("SELECT * FROM `%s` WHERE `%s` = @ssn"):format(
        Config.Core == "ESX" and SV.Database['esx']['table:users'] or SV.Database['qbcore']['table:players'],
        Config.Core == "ESX" and SV.Database['esx']['column-users:ssn'] or SV.Database['qbcore']['column-players:citizenid']
    )
    MySQL.Async.fetchAll(query, {
        ['@ssn'] = ssn,
    }, function(result)
        local data = result[1];
        if data then
            if Config.Core == "ESX" then
                playerData['identifier'] = data.identifier;
                playerData['ssn'] = ssn;

                if data.firstname ~= nil then
                    playerData['firstName'] = data.firstname;
                end
                if data.lastname ~= nil then
                    playerData['lastName'] = data.lastname;
                end
                if data.dateofbirth ~= nil then
                    playerData['dateOfBirth'] = data.dateofbirth;
                end
                if data.nationality ~= nil then
                    playerData['nationality'] = data.nationality;
                end
                if data.sex ~= nil then
                    playerData['sex'] = data.sex;
                end
                
                if data.job ~= nil then
                    local jobData = Core.Jobs[data.job]
                    if jobData then
                        playerData['job'] = jobData.label;
                        
                        if data.job_grade ~= nil then
                            playerData['jobGrade'] = jobData.grades[tostring(data.job_grade)].label;
                        end
                    end
                end

            elseif Config.Core == "QB-Core" then
                playerData['identifier'] = data.citizenid;
                playerData['ssn'] = data.citizenid;
                
                local charinfo = json.decode(data[SV.Database['qbcore']['column-players:charinfo']]);
                if charinfo then
                    if charinfo.firstname ~= nil then
                        playerData['firstName'] = charinfo.firstname;
                    end
                    if charinfo.lastname ~= nil then
                        playerData['lastName'] = charinfo.lastname;
                    end
                    if charinfo.birthdate ~= nil then
                        playerData['dateOfBirth'] = charinfo.birthdate;
                    end
                    if charinfo.nationality ~= nil then
                        playerData['nationality'] = charinfo.nationality;
                    end
                    if charinfo.gender ~= nil then
                        playerData['sex'] = charinfo.gender;
                    end
                end
                
                local job = json.decode(data[SV.Database['qbcore']['column-players:job']]);
                if job ~= nil then
                    playerData['job'] = job and job.label or '-';
                    
                    if job.grade ~= nil then
                        playerData['jobGrade'] = job.grade.name or '-';
                    end
                end                

            end
            playerData['cityhallData'] = json.decode(data.cityhall_data);
        else
            return cb(nil);
        end
        
        cb(playerData);
    end)
end

-- 
SV.getClerkVehicleData = function(vin, cb)
    local vehicleData = {};
    local query = ("SELECT * FROM `%s` WHERE `%s` = @vin"):format(
        Config.Core == "ESX" and SV.Database['esx']['table:owned_vehicles'] or SV.Database['qbcore']['table:player_vehicles'],
        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:vin'] or SV.Database['qbcore']['column-player_vehicles:vin']
    )

    MySQL.Async.fetchAll(query, {
        ['@vin'] = vin,
    }, function(result)
        local data = result[1];
        if data then
            if Config.Core == "ESX" then
                vehicleData['vin'] = vin;

                if data[SV.Database['esx']['column-owned_vehicles:plate']] then
                    vehicleData['plate'] = data[SV.Database['esx']['column-owned_vehicles:plate']];
                end

                if data[SV.Database['esx']['column-owned_vehicles:owner_name']] then
                    vehicleData['ownerName'] = data[SV.Database['esx']['column-owned_vehicles:owner_name']];
                end

                if data[SV.Database['esx']['column-owned_vehicles:owner_history']] then
                    vehicleData['ownerHistory'] = json.decode(data[SV.Database['esx']['column-owned_vehicles:owner_history']]);
                end
                
                if data[SV.Database['esx']['column-owned_vehicles:vehicle']] then
                    local properties = json.decode(data[SV.Database['esx']['column-owned_vehicles:vehicle']])
                    vehicleData['model'] = properties.model;    
                end
                
                if data[SV.Database['esx']['column-owned_vehicles:insurance']] then
                    vehicleData['insurance'] = json.decode(data[SV.Database['esx']['column-owned_vehicles:insurance']]);
                end
                
            elseif Config.Core == "QB-Core" then
                vehicleData['vin'] = vin;

                if data[SV.Database['qbcore']['column-player_vehicles:plate']] then
                    vehicleData['plate'] = data[SV.Database['qbcore']['column-player_vehicles:plate']];
                end

                if data[SV.Database['qbcore']['column-player_vehicles:owner_name']] then
                    vehicleData['ownerName'] = data[SV.Database['qbcore']['column-player_vehicles:owner_name']];
                end

                if data[SV.Database['qbcore']['column-player_vehicles:owner_history']] then
                    vehicleData['ownerHistory'] = json.decode(data[SV.Database['qbcore']['column-player_vehicles:owner_history']]);
                end
                
                if data[SV.Database['qbcore']['column-player_vehicles:mods']] then
                    local properties = json.decode(data[SV.Database['qbcore']['column-player_vehicles:mods']])
                    vehicleData['model'] = properties.model;    
                end
                
                if data[SV.Database['qbcore']['column-player_vehicles:insurance']] then
                    vehicleData['insurance'] = json.decode(data[SV.Database['qbcore']['column-player_vehicles:insurance']]);
                end

            end            
        else
            return cb(nil);
        end
        
        cb(vehicleData);
    end)
end