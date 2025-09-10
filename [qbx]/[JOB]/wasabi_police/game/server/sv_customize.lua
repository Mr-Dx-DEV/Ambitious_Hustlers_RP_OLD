-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end

-- Customize the way it pulls user identification info?
wsb.registerCallback('wasabi_police:checkPlayerId', function(source, cb, target)
    local data = wsb.getPlayerIdentity(target)
    cb(data)
end)

-- Customize the way it deposits LEO fines, etc
function PaySociety(accountName, amount)
    if wsb.framework == 'qb' then
        local management = Config.OldQBManagement and 'qb-management' or 'qb-banking'
        exports[management]:AddMoney(accountName, amount)
        return
    end
    -- If not QB, assume esx
    TriggerEvent('esx_addonaccount:getSharedAccount', accountName, function(account)
        if account then
            account.addMoney(amount)
            return
        end
        -- if account doesn't exist, try adding society_ prefix
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_'..accountName, function(societyAccount)
            if not societyAccount then
                print(Strings.no_society_account:format(accountName))
                return
            end
            societyAccount.addMoney(amount)
        end)
    end)
end

--Death check
deathCheck = function(serverId)
    local player = wsb.getPlayer(serverId)
    if not player then return end
    local state = Player(serverId).state
    return state.dead or
        state.isDead or
        player?.PlayerData?.metadata?['isdead'] or
        false
end

wsb.registerCallback('wasabi_police:revokeLicense', function(source, cb, id, license)
    if not wsb.hasLicense(id, license) then return cb(false) end
    wsb.revokeLicense(id, license)
    cb(true)
end)

if wsb.framework == 'qb' then
    wsb.registerCallback('wasabi_police:isPlayerDead', function(source, cb, id)
        local player = wsb.getPlayer(id)
        if not player then
            cb(false)
            return
        end
        cb(player.PlayerData.metadata['isdead'])
    end)
end

if wsb.framework == 'esx' then
    CreateThread(function()
        for i = 1, #Config.policeJobs do
            TriggerEvent('esx_society:registerSociety', Config.policeJobs[i], Config.policeJobs[i],
                'society_' .. Config.policeJobs[i], 'society_' .. Config.policeJobs[i], 'society_' ..
                Config.policeJobs[i], { type = 'public' })
        end
    end)
end

wsb.registerCallback('wasabi_police:getIdentifier', function(source, cb, target)
    if not wsb.getPlayer(target) then return cb(false) end
    cb(wsb.getIdentifier(target))
end)
