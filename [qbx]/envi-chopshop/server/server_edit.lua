if not rawget(_G, "lib") then include('ox_lib', 'init') end
WEBHOOK = 'https://discord.com/api/webhooks/1431026180357754920/Mi8zXKapLQrnQvll5CzCgB9jq1UWXxu6V8yuEHZI_cKpI7-Iiw6kiyLLLRz4nsnN9id7' -- REPLACE WITH YOUR WEBHOOK
--- EDIT HERE FOR CHECKING IF VEHICLE IS OWNED AND HARDCORE MODE COMPLETION
--- 
local savedPlates = {}
local activeChopSessions = {}
local playerCooldowns = {}
local vehiclePartsClaimed = {}
local contractCooldown = {}
local contractPlayerCooldown = {}

function CanStartChop(cb, source)
    -- ADD ADDITIONAL CHECKS HERE
    -- DONT TOUCH IF YOURE UNSURE
    if source then
        if Config.Debug then
            print('CanStartChop (Server): ' .. source)
        end
        cb(true)
    else
        if Config.Debug then
            print('CanStartChop (Server): false')
        end
        cb(false)
    end
end

local function IsPlayerNearVehicle(source, netID, maxDistance)
    local player = GetPlayerPed(source)
    if not player then return false end

    local vehicle = NetworkGetEntityFromNetworkId(netID)
    if not DoesEntityExist(vehicle) then return false end

    local playerCoords = GetEntityCoords(player)
    local vehicleCoords = GetEntityCoords(vehicle)
    local distance = #(playerCoords - vehicleCoords)

    return distance <= (maxDistance or 5.0)
end

local function IsVehicleAtChopShop(netID)
    local vehicle = NetworkGetEntityFromNetworkId(netID)
    if not DoesEntityExist(vehicle) then return false end

    local vehicleCoords = GetEntityCoords(vehicle)

    for shopName, shopData in pairs(Config.ChopShops) do
        if shopData.ChopLocation then
            local shopCoords = shopData.ChopLocation
            local distance = #(vehicleCoords - shopCoords)
            if distance <= (shopData.ChopZoneRadius or 50.0) then
                return true, shopName
            end
        end
    end
    return false
end
-------------------------------------------------------------

function HardcoreChopComplete(carData, vehicleModel, vehiclePlate)
    if not carData or not vehiclePlate then return end
    if not savedPlates[source] then return end
    if savedPlates[source] ~= vehiclePlate then return end
    if Config.Debug then
        print('DATABASE Plate: ', carData.plate)
        print('Chopping vehicle plate: ', vehiclePlate)
        print('DATABASE vehicle model hash: ', GetHashKey(carData.vehicle))
        print('Chopping vehicle model: ', vehicleModel)
    end
    if carData.plate ~= vehiclePlate then
        print(
            'envi-chopshop: Possible exploit attempt. - Vehicle plate being chopped does not match the database. Player: ' ..
            GetPlayerName(source) .. ' - Plate: ' .. vehiclePlate .. ' - Database Plate: ' .. carData.plate)
        return
    end
    if Bridge.Framework == 'qbox' or Bridge.Framework == 'qb' then
        MySQL.Async.execute('DELETE FROM player_vehicles WHERE plate = @plate', {
            ['@plate'] = carData.plate
        }, function(rowsChanged)
            if rowsChanged > 0 then
                print('envi-chopshop: ' .. carData.plate .. ' has been removed from the database.')
            else
                print('envi-chopshop: ' .. carData.plate .. ' was not found in the database.')
            end
        end)
    elseif Bridge.Framework == 'esx' then
        MySQL.Async.execute('DELETE FROM owned_vehicles WHERE plate = @plate', {
            ['@plate'] = carData.plate
        }, function(rowsChanged)
            if rowsChanged > 0 then
                print('envi-chopshop: ' .. carData.plate .. ' has been removed from the database.')
            else
                print('envi-chopshop: ' .. carData.plate .. ' was not found in the database.')
            end
        end)
    else
        print('No compatible framework found - please edit server_edit.lua to use this feature!')
        return
    end
    local player = Framework.GetPlayer(source)
    if not player then return end
    local identifier = player.Identifier
    local name = player.Firstname .. ' ' .. player.Lastname
    local message = ":fire: Hardcore Chop Completed: " ..
        name .. " has chopped an OWNED " .. vehicleModel .. " with the plate " .. vehiclePlate ..
        " - Identifier: " .. identifier
    SendDiscordLog(WEBHOOK, message, 15158332)
end

Framework.CreateCallback('envi-chopshop:isVehOwned', function(source, cb, vehiclePlate)
    print('envi-chopshop: isVehOwned called for player ' .. source .. ' with plate: ' .. vehiclePlate)
    savedPlates[source] = vehiclePlate
    if Bridge.Framework == 'qbox' or Bridge.Framework == 'qb' then
        print('envi-chopshop: Using QB/QBox framework for vehicle ownership check')
        MySQL.Async.fetchAll('SELECT * FROM player_vehicles WHERE plate = @plate', {
            ['@plate'] = vehiclePlate
        }, function(result)
            if result[1] then
                local vehicleData = result[1]
                local owner = vehicleData.citizenid
                print('envi-chopshop: Vehicle found in database - Owner: ' .. owner .. ', Plate: ' .. vehiclePlate)
                cb(vehicleData, owner)
            else
                print('envi-chopshop: Vehicle not found in database - Plate: ' .. vehiclePlate)
                cb(false)
            end
        end)
    elseif Bridge.Framework == 'esx' then
        print('envi-chopshop: Using ESX framework for vehicle ownership check')
        MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
            ['@plate'] = vehiclePlate
        }, function(result)
            if result[1] then
                local vehicleData = result[1]
                local owner = vehicleData.owner
                print('envi-chopshop: Vehicle found in database - Owner: ' .. owner .. ', Plate: ' .. vehiclePlate)
                cb(vehicleData, owner)
            else
                print('envi-chopshop: Vehicle not found in database - Plate: ' .. vehiclePlate)
                cb(false)
            end
        end)
    else
        print('No compatible framework found for isVehOwned - please edit server_edit.lua to use this feature!')
        cb(false)
    end
end)

local function GetMaximumReward()
    local classModifiers = Config.ClassMultipliers
    local highestModifier = 0
    for class, modifier in pairs(classModifiers) do
        if modifier > highestModifier then
            highestModifier = modifier
        end
    end
    return highestModifier * Config.Rewards
end

------------------------------------------------------------------------------------------------------
local paidNetIDs = {}
local payoutCooldowns = {}

Framework.CreateCallback('envi-chopshop:payOut', function(source, cb, reward, stage, shopName, netID)
    local src = source
    if not stage then
        cb(false)
        return
    end
    if not netID then
        cb(false)
        return
    end
    if not shopName then
        cb(false)
        return
    end
    if not Config.ChopShops[shopName] then
        cb(false)
        return
    end
    local currentTime = os.time()
    if payoutCooldowns[src] and currentTime < payoutCooldowns[src] then
        print('envi-chopshop: Exploit attempt - Player ' .. src .. ' trying to spam payouts')
        cb(false)
        return
    end
    payoutCooldowns[src] = currentTime + 5
    local session = activeChopSessions[netID]
    if not session then
        print('envi-chopshop: Exploit attempt - No active chop session for payout NetID: ' ..
            netID .. ' by player: ' .. src)
        cb(false)
        return
    end
    if session.player ~= src then
        print('envi-chopshop: Exploit attempt - Player ' ..
            src .. ' trying to claim payout from vehicle being chopped by player ' .. session.player)
        cb(false)
        return
    end
    if currentTime - session.startTime > 1800 then
        print('envi-chopshop: Payout denied - Chop session expired for NetID: ' .. netID)
        activeChopSessions[netID] = nil
        vehiclePartsClaimed[netID] = nil
        cb(false)
        return
    end
    local shopRadius = Config.ChopShops[shopName].ChopZoneRadius or 50.0
    if not IsPlayerNearVehicle(src, netID, shopRadius) then
        print('envi-chopshop: Exploit attempt - Player ' .. src .. ' too far from vehicle for payout NetID: ' .. netID)
        cb(false)
        return
    end
    local atChopShop, validShop = IsVehicleAtChopShop(netID)
    if not atChopShop or validShop ~= session.shopName then
        print('envi-chopshop: Exploit attempt - Vehicle NetID: ' .. netID .. ' not at valid chop shop for payout')
        cb(false)
        return
    end
    if paidNetIDs[netID] then
        cb(false)
        return
    end
    paidNetIDs[netID] = true

    local vehicle = NetworkGetEntityFromNetworkId(netID)
    if not DoesEntityExist(vehicle) then
        cb(false)
        return
    end
    local maxReward = GetMaximumReward()
    if reward > maxReward then
        print('envi-chopshop: Exploit attempt - Excessive reward amount: ' .. reward .. ' by player: ' .. src)
        reward = maxReward
    end

    if Config.RewardsAccount then
        if Config.RewardsAccount == 'money' then Config.RewardsAccount = 'cash' end
        local player = Framework.GetPlayer(src)
        if not player then
            cb(false)
            return
        end
        player.AddMoney(Config.RewardsAccount, reward)
        TriggerClientEvent('envi-chopshop:notify', src, Config.Lang['reward_message'] .. reward, 'success', 3500)
        local identifier = player.Identifier
        local shop = Database.query('SELECT * FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
        if shop then
            local shopInfo = shop[1]
            if shopInfo then
                if shopInfo.owner ~= identifier then
                    local amount = reward / Config.ChopShops[shopName].Percentage
                    if Config.Debug then
                        print('envi-chopshop: ' .. shopName .. ' has been paid ' .. amount .. ' by ' .. identifier)
                    end
                    Database.query('UPDATE `envi-chopshop` SET `funds` = `funds` + ? WHERE `shop` = ?',
                        { amount, shopName })
                end
            end
        end

        if Config.AdditionalRewardsItem then
            Framework.AddItem(src, Config.AdditionalRewardsItem, Config.AdditionalRewardsAmount)
        end
        SetTimeout(Config.DeleteVehicleTime * 1000, function()
            if DoesEntityExist(vehicle) then
                print('envi-chopshop: Deleting vehicle from server: ' .. netID)
                DeleteEntity(vehicle)
            end
            paidNetIDs[netID] = nil
            print('envi-chopshop: Paid NetID: ' .. netID .. ' has been deleted.')
            print(json.encode(paidNetIDs))
        end)
        cb(true)
    else
        cb(false)
    end
end)

local itemCooldowns = {}
Framework.CreateCallback('envi-chopshop:giveItem', function(source, cb, itemFind, netID)
    local src = source
    if not itemFind then
        cb(false)
        return
    end
    if not netID then
        cb(false)
        return
    end
    if not DoesEntityExist(NetworkGetEntityFromNetworkId(netID)) then
        cb(false)
        return
    end
    local currentTime = os.time()
    if itemCooldowns[src] and currentTime < itemCooldowns[src] then
        if Config.Debug then
            print('envi-chopshop: Player ' .. src .. ' is on cooldown for receiving items')
        end
        cb(false)
        return
    end
    itemCooldowns[src] = currentTime + 2

    local session = activeChopSessions[netID]
    if not session then
        print('envi-chopshop: Exploit attempt - No active chop session for item NetID: ' ..
            netID .. ' by player: ' .. src)
        cb(false)
        return
    end

    if session.itemsLeft <= 0 then
        print('envi-chopshop: Exploit attempt - Player ' ..
        src .. ' trying to get items from vehicle being chopped by player when none are remaining' .. session.player)
        cb(false)
        return
    end
    session.itemsLeft = session.itemsLeft - 1

    if session.player ~= src then
        print('envi-chopshop: Exploit attempt - Player ' ..
            src .. ' trying to get items from vehicle being chopped by player ' .. session.player)
        cb(false)
        return
    end

    if currentTime - session.startTime > 1800 then
        print('envi-chopshop: Item denied - Chop session expired for NetID: ' .. netID)
        activeChopSessions[netID] = nil
        vehiclePartsClaimed[netID] = nil
        cb(false)
        return
    end

    if not IsPlayerNearVehicle(src, netID, 7.0) then
        print('envi-chopshop: Exploit attempt - Player ' .. src .. ' too far from vehicle for item NetID: ' .. netID)
        cb(false)
        return
    end

    local atChopShop, validShop = IsVehicleAtChopShop(netID)
    if not atChopShop or validShop ~= session.shopName then
        print('envi-chopshop: Exploit attempt - Vehicle NetID: ' .. netID .. ' not at valid chop shop for item')
        cb(false)
        return
    end

    if not Config.LootItems or #Config.LootItems == 0 then
        print('envi-chopshop: Error - No loot items configured')
        cb(false)
        return
    end

    local randomItem = Config.LootItems[math.random(#Config.LootItems)]
    local player = Framework.GetPlayer(src)
    if player then
        local amount = math.random(Config.LootMin, Config.LootMax)
        Framework.AddItem(src, randomItem, amount)

        if Config.Debug then
            print('envi-chopshop: Legitimate item reward - Player ' ..
                src .. ' received ' .. amount .. 'x ' .. randomItem .. ' from NetID: ' .. netID)
        end
        cb(true)
    else
        cb(false)
    end
end)

Framework.CreateCallback('envi-chopshop:startChopSession', function(source, cb, netID, shopName)
    local src = source
    if not netID or not shopName then
        cb(false)
        return
    end
    if not Config.ChopShops[shopName] then
        print('envi-chopshop: Exploit attempt - Invalid shop name for chop session: ' ..
            shopName .. ' by player: ' .. src)
        cb(false)
        return
    end
    local vehicle = NetworkGetEntityFromNetworkId(netID)
    if not DoesEntityExist(vehicle) then
        cb(false)
        return
    end
    local shopRadius = Config.ChopShops[shopName].ChopZoneRadius or 50.0
    if not IsPlayerNearVehicle(src, netID, shopRadius) then
        print('envi-chopshop: Exploit attempt - Player ' .. src .. ' too far from vehicle to start chop session')
        cb(false)
        return
    end
    local atChopShop, validShop = IsVehicleAtChopShop(netID)
    if not atChopShop or validShop ~= shopName then
        print('envi-chopshop: Exploit attempt - Vehicle not at valid chop shop for session. Expected: ' ..
            shopName .. ', Found: ' .. (validShop or 'none'))
        cb(false)
        return
    end
    for existingNetID, existingSession in pairs(activeChopSessions) do
        if existingSession.player == src then
            print('envi-chopshop: Exploit attempt - Player ' ..
                src .. ' trying to start multiple chop sessions. Existing NetID: ' .. existingNetID)
            cb(false)
            return
        end
    end
    local player = Framework.GetPlayer(src)
    if not player then
        cb(false)
        return
    end
    local shopConfig = Config.ChopShops[shopName]
    if shopConfig.AllowedRolesOnly and shopConfig.AllowedRolesOnly.enabled then
        local playerJob = player.Job.Name
        local hasAllowedJob = false
        for _, allowedJob in pairs(shopConfig.AllowedRolesOnly.roles) do
            if playerJob == allowedJob then
                hasAllowedJob = true
                break
            end
        end
        if not hasAllowedJob then
            print('envi-chopshop: Access denied - Player ' ..
                src .. ' (' .. playerJob .. ') not in allowed jobs for shop: ' .. shopName)
            cb(false)
            return
        end
    end
    if shopConfig.BlacklistedRoles and shopConfig.BlacklistedRoles.enabled then
        local playerJob = player.Job.Name
        for _, blacklistedJob in pairs(shopConfig.BlacklistedRoles.roles) do
            if playerJob == blacklistedJob then
                print('envi-chopshop: Access denied - Player ' ..
                    src .. ' (' .. playerJob .. ') has blacklisted job for shop: ' .. shopName)
                cb(false)
                return
            end
        end
    end
    if shopConfig.ChopshopWorkersOnly then
        local identifier = player.Identifier
        local shop = Database.query('SELECT * FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
        if not shop or #shop == 0 then
            print('envi-chopshop: Access denied - Shop not found in database: ' .. shopName)
            cb(false)
            return
        end
        local shopData = shop[1]
        local hasAccess = false
        if shopData.owner == identifier then
            hasAccess = true
        else
            local workers = json.decode(shopData.workers) or {}
            for _, worker in pairs(workers) do
                if worker.identifier == identifier then
                    hasAccess = true
                    break
                end
            end
        end
        if not hasAccess then
            cb(false)
            return
        end
    end
    activeChopSessions[netID] = {
        player = src,
        startTime = os.time(),
        shopName = shopName,
        partsRemaining = {},
        itemsLeft = 24,
    }
    vehiclePartsClaimed[netID] = {}
    if Config.Debug then
        print('envi-chopshop: Started chop session for NetID: ' ..netID .. ' by player: ' .. src .. ' at shop: ' .. shopName)
    end
    cb(true)
end)

Framework.CreateCallback('envi-chopshop:endChopSession', function(source, cb, netID)
    local src = source
    if not netID then
        cb(false)
        return
    end
    local session = activeChopSessions[netID]
    if session and session.player == src then
        activeChopSessions[netID] = nil
        vehiclePartsClaimed[netID] = nil

        if Config.Debug then
            print('envi-chopshop: Ended chop session for NetID: ' .. netID)
        end
        cb(true)
    else
        cb(false)
    end
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    for netID, session in pairs(activeChopSessions) do
        if session.player == src then
            activeChopSessions[netID] = nil
            vehiclePartsClaimed[netID] = nil
            if Config.Debug then
                print('envi-chopshop: Cleaned up chop session for disconnected player: ' .. src)
            end
        end
    end
    playerCooldowns[src] = nil
    payoutCooldowns[src] = nil
    itemCooldowns[src] = nil
    contractPlayerCooldown[src] = nil
end)

CreateThread(function() -- cleanup
    while true do
        Wait(60000)
        local currentTime = os.time()
        local toCleanup = {}
        for netID, session in pairs(activeChopSessions) do
            local shouldCleanup = false
            if currentTime - session.startTime > 1800 then
                shouldCleanup = true
                if Config.Debug then
                    print('envi-chopshop: Cleaning up expired session for NetID: ' .. netID)
                end
            end
            if not DoesEntityExist(NetworkGetEntityFromNetworkId(netID)) then
                shouldCleanup = true
                if Config.Debug then
                    print('envi-chopshop: Cleaning up session for deleted vehicle NetID: ' .. netID)
                end
            end
            if not GetPlayerPed(session.player) then
                shouldCleanup = true
                if Config.Debug then
                    print('envi-chopshop: Cleaning up session for disconnected player: ' .. session.player)
                end
            end

            if shouldCleanup then
                table.insert(toCleanup, netID)
            end
        end
        for _, netID in ipairs(toCleanup) do
            activeChopSessions[netID] = nil
            vehiclePartsClaimed[netID] = nil
        end
        for playerId, cooldownTime in pairs(playerCooldowns) do
            if currentTime > cooldownTime + 300 then
                playerCooldowns[playerId] = nil
            end
        end
        for playerId, cooldownTime in pairs(payoutCooldowns) do
            if currentTime > cooldownTime + 300 then
                payoutCooldowns[playerId] = nil
            end
        end
        for playerId, cooldownTime in pairs(itemCooldowns) do
            if currentTime > cooldownTime + 300 then
                itemCooldowns[playerId] = nil
            end
        end
        for playerId, cooldownTime in pairs(contractPlayerCooldown) do
            if currentTime > cooldownTime + 300 then
                contractPlayerCooldown[playerId] = nil
            end
        end
    end
end)

Framework.CreateCallback('envi-chopshop:salvageParts', function(source, cb, part, netID)
    local src = source
    if not part then
        cb(false)
        return
    end
    if not netID then
        cb(false)
        return
    end
    if not DoesEntityExist(NetworkGetEntityFromNetworkId(netID)) then
        cb(false)
        return
    end
    local currentTime = os.time()
    if playerCooldowns[src] and currentTime < playerCooldowns[src] then
        if Config.Debug then
            print('envi-chopshop: Player ' .. src .. ' is on cooldown for salvaging parts')
        end
        cb(false)
        return
    end
    playerCooldowns[src] = currentTime + 3
    local session = activeChopSessions[netID]
    if not session then
        print('envi-chopshop: Exploit attempt - No active chop session for NetID: ' .. netID .. ' by player: ' .. src)
        cb(false)
        return
    end
    if session.player ~= src then
        print('envi-chopshop: Exploit attempt - Player ' ..
            src .. ' trying to salvage parts from vehicle being chopped by player ' .. session.player)
        cb(false)
        return
    end
    if currentTime - session.startTime > 1800 then
        print('envi-chopshop: Chop session expired for NetID: ' .. netID)
        activeChopSessions[netID] = nil
        vehiclePartsClaimed[netID] = nil
        cb(false)
        return
    end
    -- if not IsPlayerNearVehicle(src, netID, 7.0) then
    --     print('envi-chopshop: Exploit attempt - Player ' .. src .. ' too far from vehicle NetID: ' .. netID)
    --     cb(false)
    --     return
    -- end
    local atChopShop, validShop = IsVehicleAtChopShop(netID)
    if not atChopShop or validShop ~= session.shopName then
        print('envi-chopshop: Exploit attempt - Vehicle NetID: ' .. netID .. ' not at valid chop shop')
        cb(false)
        return
    end
    local itemFound = false
    for k, v in pairs(Config.CarPartsItems) do
        if v == part then
            itemFound = true
            break
        end
    end
    if not itemFound then
        print('envi-chopshop: Exploit attempt - Invalid part: ' .. part .. ' requested by player: ' .. src)
        cb(false)
        return
    end
    if not vehiclePartsClaimed[netID] then
        vehiclePartsClaimed[netID] = {}
    end
    -- max allowed parts per vehicle
    local partLimits = {}
    if Config.CarPartsItems then
        partLimits[Config.CarPartsItems.Door] = 8     -- Max 8 doors
        partLimits[Config.CarPartsItems.Wheels] = 10  -- Max 10 wheels
        partLimits[Config.CarPartsItems.Hood] = 1     -- Max 1 hood per vehicle
        partLimits[Config.CarPartsItems.Trunk] = 1    -- Max 1 trunk per vehicle
        partLimits[Config.CarPartsItems.Battery] = 1  -- Max 1 battery per vehicle
        partLimits[Config.CarPartsItems.GearBox] = 1  -- Max 1 gearbox per vehicle
        partLimits[Config.CarPartsItems.Radiator] = 1 -- Max 1 radiator per vehicle
        partLimits[Config.CarPartsItems.Scrap] = 1    -- Max 1 scrap pieces per vehicle
    end

    local currentCount = vehiclePartsClaimed[netID][part] or 0
    local maxAllowed = partLimits[part] or 1
    if currentCount >= maxAllowed then
        if Config.Debug then
            print('envi-chopshop: Part limit reached for ' ..
                part .. ' on vehicle NetID: ' .. netID .. ' (' .. currentCount .. '/' .. maxAllowed .. ')')
        end
        cb(false)
        return
    end
    local totalPartsClaimed = 0
    for partName, count in pairs(vehiclePartsClaimed[netID]) do
        totalPartsClaimed = totalPartsClaimed + count
    end
    local maxPartsPerVehicle = 25
    if totalPartsClaimed >= maxPartsPerVehicle then
        if Config.Debug then
            print('envi-chopshop: Max parts limit reached for vehicle NetID: ' .. netID)
        end
        cb(false)
        return
    end
    local player = Framework.GetPlayer(src)
    if player then
        Framework.AddItem(src, part, 1)
        vehiclePartsClaimed[netID][part] = (vehiclePartsClaimed[netID][part] or 0) + 1

        if Config.Debug then
            print('envi-chopshop: Legitimate salvage - Player ' .. src ..
                ' received part: ' ..
                part .. ' from NetID: ' .. netID .. ' (count: ' .. vehiclePartsClaimed[netID][part] .. ')')
        end
        cb(true)
    else
        cb(false)
    end
end)

Framework.CreateCallback('envi-chopshop:checkPolice', function(source, cb)
    local jobsToCheck = Config.JobsToCheck or {}
    local jobAmount = Config.AmountOnline
    local jobOnline = 0
    if Config.CheckPoliceOnline then
        local players = GetPlayers()
        for k, v in pairs(players) do
            local player = Framework.GetPlayer(tonumber(v))
            if player then
                for _, jobName in pairs(jobsToCheck) do
                    if player.Job.Name == jobName then
                        jobOnline = jobOnline + 1
                        break
                    end
                end
            end
        end
        if jobOnline < jobAmount then
            cb(false)
        else
            cb(true)
        end
    else
        cb(true)
    end
end)

Framework.CreateCallback('envi-chopshop:checkShopOwner', function(source, cb, shopName)
    local shop = Database.query('SELECT * FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
    if not shop then
        cb(nil)
    end
    local shopInfo = shop[1]
    if shopInfo then
        cb(shopInfo)
    else
        cb(nil)
    end
end)

Framework.CreateCallback('envi-chopshop:buyChopShop', function(source, cb, shopName, price)
    local player = Framework.GetPlayer(source)
    if not player then
        cb(false)
        return
    end
    local identifier = player.Identifier
    local bankBalance = player.GetMoney('bank')
    local ownerName = player.Firstname .. ' ' .. player.Lastname
    local existingPlayerShop = Database.query('SELECT * FROM `envi-chopshop` WHERE `owner` = ?', { identifier })
    if existingPlayerShop and #existingPlayerShop > 0 then
        cb(false, 'already_owns_shop')
        return
    end
    local existingShop = Database.query('SELECT * FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
    if existingShop and #existingShop > 0 then
        cb(false, 'shop_already_owned')
        return
    end
    if bankBalance >= price then
        local insertResult = Database.query('INSERT INTO `envi-chopshop` (`shop`, `owner`, `ownerName`) VALUES (?, ?, ?)',
            { shopName, identifier, ownerName })
        if insertResult then
            player.RemoveMoney('bank', price)
            cb(true)
        else
            cb(false, 'shop_already_owned')
        end
    else
        cb(false, 'insufficient_funds')
    end
end)

Framework.CreateCallback('envi-chopshop:sellChopShop', function(source, cb, shopName, price)
    local player = Framework.GetPlayer(source)
    if not player then
        cb(false)
    end
    local identifier = player.Identifier
    local shop = Database.query('SELECT * FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
    if not shop then
        cb(false)
    end
    local shopInfo = shop[1]
    if shopInfo then
        if shopInfo.owner == identifier then
            Database.query('DELETE FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
            player.AddMoney('bank', price)
            if shopInfo.funds > 0 then
                player.AddMoney('bank', shopInfo.funds)
                Framework.Notify(source, Config.Lang['recieved'] .. shopInfo.funds .. Config.Lang['from_fund'], 'success', 3500)
            end
            Wait(1000)
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

Framework.CreateCallback('envi-chopshop:transferChopShop', function(source, cb, shopName, ID)
    local player = Framework.GetPlayer(source)
    local buyerPlayer = Framework.GetPlayer(ID)
    if not player then
        cb(false)
    end
    if not buyerPlayer then
        cb(false)
    end
    local identifier = player.Identifier
    local buyerID = buyerPlayer.Identifier
    local shop = Database.query('SELECT * FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
    if not shop then
        cb(false)
    end
    local shopInfo = shop[1]
    if shopInfo then
        if shopInfo.owner == identifier then
            Database.query('UPDATE `envi-chopshop` SET `owner` = ? WHERE `shop` = ?', { buyerID, shopName })
            print('envi-chopshop: ' .. identifier .. ' has transferred ' .. shopName .. ' to ' .. buyerID)
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

Framework.CreateCallback('envi-chopshop:withdrawFunds', function(source, cb, shopName, amount)
    local player = Framework.GetPlayer(source)
    if not player then
        cb(false)
    end
    local identifier = player.Identifier
    local shop = Database.query('SELECT * FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
    if not shop then
        cb(false)
    end
    local shopInfo = shop[1]
    if shopInfo then
        if shopInfo.owner == identifier then
            local fundsBalance = shopInfo.funds
            if fundsBalance >= amount then
                player.AddMoney('cash', amount)
                Database.query('UPDATE `envi-chopshop` SET `funds` = `funds` - ? WHERE `shop` = ?', { amount, shopName })
                cb(true)
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

Framework.CreateCallback('envi-chopshop:generateSpecialContract', function(source, cb, shopName)
    local src = source
    if not shopName then
        cb(false)
        return
    end
    local currentTime = os.time()
    if contractPlayerCooldown[src] and currentTime < contractPlayerCooldown[src] then
        local remainingTime = contractPlayerCooldown[src] - currentTime
        print('envi-chopshop: Player ' .. src .. ' is on cooldown for generating contracts')
        TriggerClientEvent('envi-chopshop:notify', src, string.format(Config.Lang['cooldown_time_remaining'], remainingTime), 'error', 3500)
        cb(false)
        return
    end
    contractPlayerCooldown[src] = currentTime + 10
    if not Config.ChopShops[shopName] then
        print('envi-chopshop: Exploit attempt - Invalid shop name: ' .. shopName .. ' by player: ' .. src)
        cb(false)
        return
    end
    local ownerPlayer = Framework.GetPlayer(src)
    if not ownerPlayer then
        cb(false)
        return
    end
    local identifier = ownerPlayer.Identifier
    local shop = Database.query('SELECT * FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
    if not shop then
        cb(false)
        return
    end
    local shopInfo = shop[1]
    if not shopInfo then
        cb(false)
        return
    end
    local hasAccess = false
    if shopInfo.owner == identifier then
        hasAccess = true
    else
        local workers = json.decode(shopInfo.workers) or {}
        for _, worker in pairs(workers) do
            if worker.identifier == identifier and worker.access.contracts then
                hasAccess = true
                break
            end
        end
    end
    if not hasAccess then
        print('envi-chopshop: Exploit attempt - Player ' .. src .. ' (' .. identifier .. ') trying to generate contract for shop owned by: ' .. shopInfo.owner)
        TriggerClientEvent('envi-chopshop:notify', src, Config.Lang['no_contract_permission'], 'error', 3500)
        cb(false)
        return
    end
    local ownerName = ownerPlayer.Firstname .. ' ' .. ownerPlayer.Lastname
    if not contractCooldown[shopName] or currentTime > contractCooldown[shopName] then
        contractCooldown[shopName] = currentTime + Config.SpecialContractCooldown * 60
        local vehicle, vehicleName, displayName
        local attempts, maxAttempts = 0, 25
        repeat
            local contract = math.random(1, #Config.SpecialContractVehicles)
            vehicle = Config.SpecialContractVehicles[contract].model
            displayName = Config.SpecialContractVehicles[contract].display
            vehicleName = lib.callback.await('envi-chopshop:getVehicleInfo', src, vehicle)
            attempts = attempts + 1
            Wait(1000)
        until (vehicle and vehicleName) or attempts >= maxAttempts
        if vehicle and vehicleName then
            Framework.AddItem(src, Config.ContractItem, 1, { vehicle = vehicleName, display = displayName, shop = shopName, shopOwner = ownerName })
            cb(true)
        else
            TriggerClientEvent('envi-chopshop:notify', src, 'Failed to generate special contract. Vehicle data could not be retrieved. Please try again later.', 'error', 3500)
            cb(false)
        end
    else
        local remainingSeconds = contractCooldown[shopName] - currentTime
        local timeInMins = math.floor(remainingSeconds / 60)
        local timeInSecs = remainingSeconds % 60
        local timeMessage
        if timeInMins > 0 then
            timeMessage = timeInMins .. ' minutes and ' .. timeInSecs .. ' seconds'
        else
            timeMessage = timeInSecs .. ' seconds'
        end
        TriggerClientEvent('envi-chopshop:notify', src, 'This shop is on cooldown. Please wait ' .. timeMessage .. ' before generating another special contract.', 'error', 3500)
        cb(false)
    end
end)


RegisterNetEvent('envi-chopshop:checkForContracts', function(vehicleName, shopName, reward)
    if not shopName or not vehicleName then return end
    local src = source
    local item = Framework.HasItem(src, Config.ContractItem, 1)
    if item then
        local player = Framework.GetPlayer(src)
        if not player then return end
        local identifier = player.Identifier
        local shop = Database.query('SELECT * FROM `envi-chopshop` WHERE `shop` = ?', { shopName })
        if not shop then return end
        local shopInfo = shop[1]
        if not shopInfo then return end
        local ownerName = shopInfo.ownerName
        local itemWithData = Framework.HasItem(src, Config.ContractItem, 1,
            { vehicle = vehicleName, shop = shopName, shopOwner = ownerName })
        if itemWithData then
            if shopInfo then
                if shopInfo.owner == identifier then
                    TriggerClientEvent('envi-chopshop:notify', src, Config.Lang['cannot_claim_own'], 'error', 3500)
                    return
                end
                if not Config.WorkersCanCompleteContracts then
                    local workers = json.decode(shopInfo.workers) or {}
                    for _, worker in pairs(workers) do
                        if worker.identifier == identifier then
                            TriggerClientEvent('envi-chopshop:notify', src, Config.Lang['cannot_claim_worker'], 'error', 3500)
                            return
                        end
                    end
                end
            end
            local removed = Framework.RemoveItem(src, Config.ContractItem, 1,
                { vehicle = vehicleName, shop = shopName, shopOwner = ownerName })
            print('Contract Removed: ', removed)
            local ownerBonus = Config.ContractCompleteBonus * Config.ChopShops[shopName].Percentage /
                100 -- if the reward is 1000 and the percentage is 10, then the owner bonus is 100
            local playerReward = Config.ContractCompleteBonus - ownerBonus
            if removed then
                player.AddMoney(Config.RewardsAccount, playerReward)
                TriggerClientEvent('envi-chopshop:notify', src,
                    Config.Lang['completed_contract'] .. shopInfo.ownerName ..
                    Config.Lang['recieved_extra'] .. playerReward, 'success', 3500)
                Database.query('UPDATE `envi-chopshop` SET `funds` = `funds` + ? WHERE `shop` = ?',
                    { ownerBonus, shopName })
            end
            -- ADD WEBHOOK FOR CONTRACT
            local message = Config.Lang['webhook_contract_completed']:format(player.Firstname .. ' ' .. player.Lastname, shopInfo.ownerName, playerReward, vehicleName, identifier)
            SendDiscordLog(WEBHOOK, message, 3066993)
        end
    end
end)

RegisterNetEvent('envi-chopshop:log', function(vehDisplayName, reward, shop, netID)
    if not WEBHOOK or WEBHOOK == '' then
        return
    end
    if not vehDisplayName or not reward or not shop or not netID then return end
    if not Config.ChopShops[shop] then return end
    if not DoesEntityExist(NetworkGetEntityFromNetworkId(netID)) then return end
    local src = source
    local player = Framework.GetPlayer(src)
    if not player then return end
    local identifier = player.Identifier
    local name = player.Firstname .. ' ' .. player.Lastname
    local message = Config.Lang['webhook_vehicle_chopped']:format(name, vehDisplayName, shop, reward, identifier)
    SendDiscordLog(WEBHOOK, message, 3447003)
end)

Framework.CreateUseableItem(Config.ContractItem, function(source, item, data)
    local metadata = data.metadata
    local src = source
    TriggerClientEvent('envi-chopshop:viewContract', src, metadata)
end)

function SendDiscordLog(webhookUrl, message, color)
    local embed = {
        {
            ["color"] = color,
            ["title"] = Config.Lang['webhook_chop_log_title'],
            ["description"] = message,
            ["footer"] = {
                ["text"] = Config.Lang['webhook_chop_log_footer'],
            },
        }
    }
    PerformHttpRequest(webhookUrl, function(err, text, headers) end, 'POST', json.encode({ embeds = embed }), { ['Content-Type'] = 'application/json' })
end