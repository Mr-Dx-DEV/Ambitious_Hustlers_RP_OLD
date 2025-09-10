-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

local found = GetResourceState('qb-core')
if found ~= 'started' and found ~= 'starting' then return end

QBCore = exports['qb-core']:GetCoreObject()
WSB = {}
WSB.framework = 'qb'

---@diagnostic disable: duplicate-set-field

local qbx = GetResourceState('qbx_core')
local qboxFound = qbx == 'started' or qbx == 'starting' or false

local oxInventory = GetResourceState('ox_inventory')
local oxFound = oxInventory == 'started' or oxInventory == 'starting' or false

function WSB.getCore()
    return QBCore
end

function WSB.getPlayer(source)
    if qboxFound then
        return exports.qbx_core:GetPlayer(source)
    end

    return QBCore.Functions.GetPlayer(source)
end

function WSB.getPlayerFromIdentifier(identifier)
    local player = qboxFound and exports.qbx_core:GetPlayerByCitizenId(identifier) or
        QBCore.Functions.GetPlayerByCitizenId(identifier)
    if not player then return false end
    return player
end

function WSB.getPlayerIdFromIdentifier(identifier)
    local player = qboxFound and exports.qbx_core:GetPlayerByCitizenId(identifier) or
        QBCore.Functions.GetPlayerByCitizenId(identifier)
    if not player then return false end
    return player.PlayerData.source
end

function WSB.getPlayers()
    if qboxFound then
        return exports.qbx_core:GetQBPlayers()
    end

    return QBCore.Functions.GetPlayers()
end

function WSB.getAllJobs()
    local jobs = qboxFound and exports.qbx_core:GetJobs() or QBCore and QBCore.Shared and QBCore.Shared.Jobs or nil
    local returnTb = {}
    if not next(jobs) then return end
    for k, v in pairs(jobs) do
        returnTb[k] = { label = v.label }
        for a, b in pairs(v.grades) do
            if not returnTb[k].grades then returnTb[k].grades = {} end
            local payment = 0
            if b then
                if b.salary then
                    payment = b.salary
                elseif b.payment then
                    payment = b.payment
                end
            end
            returnTb[k].grades[a] = {
                payment = payment,
                name = b.name,
                label = (b and b.label) or b.name
            }
        end
    end
    return returnTb
end

function WSB.awaitClientCallback(name, source, ...)
    local results = { Callback.awaitResponse(name, source, ...) }
    return table.unpack(results)
end

function WSB.registerCallback(name, fn)
   Callback.register(name, function(source, ...)
        local responded = false
        local response = nil
        
        local cb = function(...)
            responded = true
            response = {...}
        end
        
        local ok, ret = pcall(function(...) 
            return table.pack(fn(source, cb, ...)) 
        end, ...)

        if responded then
            return table.unpack(response)
        elseif ret ~= nil then
            return table.unpack(ret, 1, ret.n)
        end

        if not ok then
            print(("[wsb] callback %s threw an error: %s"):format(name, ret))
        end
    end)
end

-- function WSB.registerCallback(name, handler)
--     QBCore.Functions.CreateCallback(name, function(source, cb, ...)
--         local responded = false
--         local function cbWrapper(...)
--             responded = true
--             cb(...)
--         end
--         local ok, ret = pcall(function(...)
--             return table.pack(handler(source, cbWrapper, ...))
--         end, ...)

--         if ok then
--             if not responded and ret ~= nil then
--                 cb(table.unpack(ret, 1, ret.n))
--             end
--         end
--     end)
-- end

function WSB.kickPlayer(source, reason)
    if qboxFound then
        return exports.qbx_core:ExploitBan(source, reason)
    end
    QBCore.Functions.Kick(source, reason, true, true)
end

function WSB.hasPermission(source, group)
    if qboxFound then
        return exports.qbx_core:HasPermission(source, group) or false
    end

    return QBCore.Functions.HasPermission(source, group) 
end

function WSB.hasGroup(source, filter)
    local groups = { 'job', 'gang' }
    local player = WSB.getPlayer(source)
    if not player then return end
    local type = type(filter)

    if type == 'string' then
        for i = 1, #groups do
            local data = player.PlayerData[groups[i]]

            if data and data.name == filter then
                return data.name, data.grade.level
            end
        end
    else
        local tabletype = table.type(filter)

        if tabletype == 'hash' then
            for i = 1, #groups do
                local data = player.PlayerData[groups[i]]
                local grade = filter[data.name]

                if data and grade and grade <= data.grade.level then
                    return data.name, data.grade.level
                end
            end
        elseif tabletype == 'array' then
            for i = 1, #filter do
                local group = filter[i]

                for j = 1, #groups do
                    local data = player.PlayerData[groups[j]]

                    if data and data.name == group then
                        return data.name, data.grade.level
                    end
                end
            end
        end
    end
end

function WSB.setJob(source, job, grade)
    local player = WSB.getPlayer(source)
    if not player then return end
    player.Functions.SetJob(job, grade)
end

function WSB.getJobData(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    local job = player.PlayerData.job
    return job
end

function WSB.getJobLabel(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.PlayerData.job.label
end

function WSB.toggleDuty(source, _job, _grade)
    local player = WSB.getPlayer(source)
    if not player then return end
    if player.PlayerData.job.onduty then
        player.Functions.SetJobDuty(false)
        return 'off'
    else
        player.Functions.SetJobDuty(true)
        return 'on'
    end
end

function WSB.isPlayerBoss(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    if player?.PlayerData?.job?.isboss then return true else return false end
end

function WSB.getIdentifier(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.PlayerData.citizenid
end

function WSB.getName(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
end

function WSB.getNameFromPlayerObj(player)
    if not player then return end
    return player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
end

function WSB.registerUsableItem(item, cb)
    if qboxFound then
        exports.qbx_core:CreateUseableItem(item, cb)
    else
        QBCore.Functions.CreateUseableItem(item, cb)
    end
end

function WSB.getPlayerInventory(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    local cleanedItems, count = {}, 0
    for _, item in pairs(player.PlayerData.items) do
        if item then
            count = count + 1
            cleanedItems[count] = item
            cleanedItems[count].amount = cleanedItems[count].count or cleanedItems[count].amount
            cleanedItems[count].count = cleanedItems[count].count or cleanedItems[count].amount
        end
    end
    return cleanedItems or {}

end

function WSB.hasItem(source, _item)
    if qboxFound or oxFound then
        return exports.ox_inventory:GetItem(source, _item, nil, true) or 0
    end
    local player = WSB.getPlayer(source)
    if not player then return end
    local item = player.Functions.GetItemByName(_item)
    return item?.count or item?.amount or 0
end

local qsInventory = GetResourceState('qs-inventory')
local qsFound = qsInventory == 'started' or qsInventory == 'starting' or false


function WSB.addItem(source, item, count, slot, metadata)
    if qboxFound or oxFound then
        return exports.ox_inventory:AddItem(source, item, count, metadata, slot)
    end

    local player = WSB.getPlayer(source)
    if not player then return end
    local giveItem = player.Functions.AddItem(item, count, slot, metadata)
    item = player.Functions.GetItemByName(item)
    if item and item.count then item.count = count elseif item and item.amount then item.amount = count end
    if not qsFound then
        TriggerClientEvent('inventory:client:ItemBox', source, item, 'add')
    end
    return giveItem
end

function WSB.addWeapon(source, weapon, ammo)
    if qboxFound or oxFound then
        return exports.ox_inventory:AddItem(source, weapon, 1)
    end

    local player = WSB.getPlayer(source)
    if not player then return end
    return player.Functions.AddItem(weapon, 1, nil, nil)
end

function WSB.removeItem(source, item, count, slot, metadata)
    if qboxFound or oxFound then
        return exports.ox_inventory:RemoveItem(source, item, count, metadata, slot)
    end

    local player = WSB.getPlayer(source)
    if not player then return end
    player.Functions.RemoveItem(item, count, slot, metadata)
end

function WSB.addMoney(source, type, amount)
    if type == 'black_money' then
        WSB.addItem(source, 'black_money', amount)
        return
    end
    if type == 'money' then type = 'cash' end
    local player = WSB.getPlayer(source)
    if not player then return end
    player.Functions.AddMoney(type, amount)
end

function WSB.removeMoney(source, type, amount)
    if type == 'black_money' then
        WSB.removeItem(source, 'black_money', amount)
        return
    end
    if type == 'money' then type = 'cash' end
    local player = WSB.getPlayer(source)
    if not player then return end
    player.Functions.RemoveMoney(type, amount)
end

function WSB.hasLicense(source, license)
    local player = WSB.getPlayer(source)
    if not player then return end
    local licenses = player.PlayerData.metadata['licences']
    if licenses and licenses[license] then return true end
    return false
end

function WSB.grantLicense(source, license)
    local player = WSB.getPlayer(source)
    if not player then return false end
    local licenses = player.PlayerData.metadata['licences']
    if licenses and licenses[license] then return false end
    if not licenses then licenses = {} end
    licenses[license] = true
    player.Functions.SetMetaData('licences', licenses)
    return true
end

function WSB.revokeLicense(source, license)
    local targetPlayer = WSB.getPlayer(source)
    if not targetPlayer then return end
    local Oldlicenses = targetPlayer.PlayerData.metadata['licences']
    if not Oldlicenses[license] then return end
    local licenses = {}
    for k, v in pairs(Oldlicenses) do
        if k ~= license then
            licenses[k] = v
        end
    end
    targetPlayer.Functions.SetMetaData('licences', licenses)
end

function WSB.getPlayerAccountFunds(source, type)
    if type == 'money' then type = 'cash' end
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.PlayerData.money[type]
end

WSB.getPlayerIdentity = function(source)
    local player = WSB.getPlayer(source)
    if not player then return end
    local data = {
        name = player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname,
        job = player.PlayerData.job.label,
        position = player.PlayerData.job.grade.name,
        dob = player.PlayerData.charinfo.birthdate,
        licenses = {}
    }
    if player.PlayerData.charinfo.gender == 1 then
        data.sex = 'female'
    else
        data.sex = 'male'
    end
    if player.PlayerData.metadata['licences'] then
        for k, v in pairs(player.PlayerData.metadata['licences']) do
            if v then
                data.licenses[#data.licenses + 1] = {
                    type = k
                }
            end
        end
    end
    return data
end

function WSB.getVehicleOwner(plate)
    local owner
    MySQL.Async.fetchAll('SELECT citizenid FROM player_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            local identifier = result[1].citizenid
            MySQL.Async.fetchAll('SELECT charinfo FROM players WHERE citizenid = @identifier', {
                ['@identifier'] = identifier
            }, function(result2)
                if result2[1] then
                    local charData = json.decode(result2[1].charinfo)
                    owner = charData.firstname .. ' ' .. charData.lastname
                else
                    owner = false
                end
            end)
        else
            owner = false
        end
    end)
    while owner == nil do Wait(0) end
    return owner
end
