SV = {}

SV.Webhooks = {
    ['GET_DOCUMENT'] = "",
    ['INVALIDATION_DOCUMENT'] = "",
}

SV.WebhookText = {
    ['TITLE.GET_DOCUMENT'] = "",
    ['DESCRIPTION.GET_DOCUMENT'] = [[
        Player %s [%s] took the document %s, serial number %s.
    ]],

    ['TITLE.INVALIDATION_DOCUMENT'] = "",
    ['DESCRIPTION.INVALIDATION_DOCUMENT'] = [[
        Player %s [%s] invalidated document serial number %s.
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

SV.getDocumentsData = {
    ['firstName'] = {
        dataName = 'firstName',
        getData = function(self, src, xPlayer)
            local data = SV.getPlayerData(xPlayer, self.dataName)
            return data
        end
    },
    ['lastName'] = {
        dataName = 'lastName',
        getData = function(self, src, xPlayer)
            local data = SV.getPlayerData(xPlayer, self.dataName)
            return data
        end
    },
    ['dateOfBirth'] = {
        dataName = 'dateOfBirth',
        getData = function(self, src, xPlayer)
            local data = SV.getPlayerData(xPlayer, self.dataName)
            return data
        end
    },
    ['badgeNumber'] = {
        dataName = 'badgeNumber',
        getData = function(self, src, xPlayer)
            if GetResourceState('vms_bossmenu') == 'started' then
                local badgeNumber = nil
                local response = false
    
                local playerJob = Config.Core == "ESX" and xPlayer.job.name or xPlayer.PlayerData.job.name

                exports['vms_bossmenu']:getPlayerBadge(src, playerJob, function(badge)
                    badgeNumber = badge
                    response = true
                end)
    
                while not response do
                    Citizen.Wait(200)
                end
                
                return badgeNumber or 'NONE'
                
            else
                local data = SV.getPlayerData(xPlayer, self.dataName);
                return data
                
            end
        end
    },
    ['jobGrade'] = {
        dataName = 'jobGrade',
        getData = function(self, src, xPlayer)
            local data = SV.getPlayerJobGradeLabel(xPlayer)
            return data
        end
    },
    ['height'] = {
        dataName = 'height',
        getData = function(self, src, xPlayer)
            local data = SV.getPlayerData(xPlayer, self.dataName)
            return data
        end
    },
    ['nationality'] = {
        dataName = 'nationality',
        getData = function(self, src, xPlayer)
            local data = SV.getPlayerData(xPlayer, self.dataName)
            return data
        end
    },
    ['ssn'] = {
        dataName = 'ssn',
        getData = function(self, src, xPlayer)
            local data = SV.getPlayerData(xPlayer, self.dataName)
            return data
        end
    },
}

SV.getDocumentsLicense = {
    ['drive_a'] = {
        licenseName = 'drive_a',
        getLicense = function(self, src, xPlayer, cb)
            SV.getLicense(src, xPlayer, self.licenseName, function(haveLicense)
                local text = ''
                if haveLicense then
                    text = 'A'
                end
                cb(text)
            end)
        end,
    },
    ['drive_b'] = {
        licenseName = 'drive_b',
        getLicense = function(self, src, xPlayer, cb)
            SV.getLicense(src, xPlayer, self.licenseName, function(haveLicense)
                local text = ''
                if haveLicense then
                    text = 'B'
                end
                cb(text)
            end)
        end,
    },
    ['drive_c'] = {
        licenseName = 'drive_c',
        getLicense = function(self, src, xPlayer, cb)
            SV.getLicense(src, xPlayer, self.licenseName, function(haveLicense)
                local text = ''
                if haveLicense then
                    text = 'C'
                end
                cb(text)
            end)
        end,
    },
    ['practical_plane'] = {
        licenseName = 'practical_plane',
        getLicense = function(self, src, xPlayer, cb)
            SV.getLicense(src, xPlayer, self.licenseName, function(haveLicense)
                local text = ''
                if haveLicense then
                    text = 'Plane'
                end
                cb(text)
            end)
        end,
    },
    ['practical_helicopter'] = {
        licenseName = 'practical_helicopter',
        getLicense = function(self, src, xPlayer, cb)
            SV.getLicense(src, xPlayer, self.licenseName, function(haveLicense)
                local text = ''
                if haveLicense then
                    text = 'Helicopter'
                end
                cb(text)
            end)
        end,
    },
    ['practical_boat'] = {
        licenseName = 'practical_boat',
        getLicense = function(self, src, xPlayer, cb)
            SV.getLicense(src, xPlayer, self.licenseName, function(haveLicense)
                local text = ''
                if haveLicense then
                    text = 'Completed'
                end
                cb(text)
            end)
        end,
    },
}

SV.getLicense = function(src, xPlayer, licenseName, cb)
    if GetResourceState('esx_license') == 'started' then
        TriggerEvent('esx_license:checkLicense', src, licenseName, function(haveLicense)
            cb(haveLicense)
        end)

    else
        if Config.Core == "QB-Core" then
            cb(xPlayer.PlayerData.metadata.licences[licenseName])
        end

    end
end

SV.getIdentifier = function(xPlayer)
    if Config.Core == "ESX" then
        return xPlayer.identifier
    elseif Config.Core == "QB-Core" then
        return xPlayer.PlayerData.citizenid
    end
end

SV.getCharacterName = function(xPlayer)
    if Config.Core == "ESX" then
        return xPlayer.getName()
    elseif Config.Core == "QB-Core" then
        return xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname
    end
end

SV.getPlayer = function(src)
    if Config.Core == "ESX" then
        return Core.GetPlayerFromId(src)
    elseif Config.Core == "QB-Core" then
        return Core.Functions.GetPlayer(src)
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

        elseif name == 'height' then
            return xPlayer.variables.height
            
        elseif name == 'nationality' then
            return xPlayer.variables.nationality
            
        elseif name == 'ssn' then
            return xPlayer.variables.ssn

        elseif name == 'badgeNumber' then
            --[[
                If you are using any badge system, enter the player's badge fetch here
            ]]
            return 'EDIT IT'

        end
    elseif Config.Core == "QB-Core" then
        if name == 'firstName' then
            return xPlayer.PlayerData.charinfo.firstname

        elseif name == 'lastName' then
            return xPlayer.PlayerData.charinfo.lastname

        elseif name == 'dateOfBirth' then
            return xPlayer.PlayerData.charinfo.birthdate

        elseif name == 'height' then
            return 0
            
        elseif name == 'nationality' then
            return xPlayer.PlayerData.charinfo.nationality
            
        elseif name == 'ssn' then
            return xPlayer.PlayerData.citizenid

        elseif name == 'badgeNumber' then
            --[[
                If you are using any badge system, enter the player's badge fetch here
            ]]
            return 'EDIT IT'

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

SV.getPlayerJobGradeLabel = function(xPlayer)
    if Config.Core == "ESX" then
        return xPlayer.job.grade_label
    elseif Config.Core == "QB-Core" then
        return xPlayer.PlayerData.job.grade.name
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

SV.removeMoney = function(xPlayer, moneyType, count)
    if Config.Core == "ESX" then
        local moneyType = moneyType == 'cash' and 'money' or moneyType
        xPlayer.removeAccountMoney(moneyType, count)
    elseif Config.Core == "QB-Core" then
        xPlayer.Functions.RemoveMoney(moneyType, count)
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
        exports['origen_inventory']:addItem(src, name, count, metadata)
        
    else
        if Config.Core == "ESX" then
            xPlayer.addInventoryItem(name, count)

        elseif Config.Core == "QB-Core" then
            xPlayer.Functions.AddItem(name, count, false, metadata)

        end
    end
    
end