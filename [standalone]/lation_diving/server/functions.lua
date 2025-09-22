-- Initialize global variable to store phone
Phone = nil

-- Initialize config(s)
local shared = require 'config.shared'
local server = require 'config.server'

-- Check to see if fm-logs or fmsdk is started
local fmlogs = GetResourceState('fm-logs') == 'started'
local fmsdk = GetResourceState('fmsdk') == 'started'

-- Localize export
local diving = exports.lation_diving

-- Get phone
local function InitializePhone()
    if GetResourceState('lb-phone') == 'started' then
        Phone = 'lb-phone'
    elseif GetResourceState('qb-phone') == 'started' then
        Phone = 'qb-phone'
    elseif GetResourceState('qs-smartphone-pro') == 'started' then
        Phone = 'qs-smartphone-pro'
    elseif GetResourceState('qs-smartphone') == 'started' then
        Phone = 'qs-smartphone'
    elseif GetResourceState('gksphone') == 'started' then
        Phone = 'gksphone'
    elseif GetResourceState('roadphone') == 'started' then
        Phone = 'roadphone'
    elseif GetResourceState('npwd') == 'started' then
        Phone = 'npwd'
    elseif GetResourceState('yseries') == 'started' then
        Phone = 'yseries'
    elseif GetResourceState('okokPhone') == 'started' then
        Phone = 'okokPhone'
    else
        -- Add custom phone here
    end
end

-- Send an email
--- @param message string
function SendEmail(source, message)
    if not source or not message then return end
    if Phone == 'lb-phone' then
        local number = exports[Phone]:GetEquippedPhoneNumber(source)
        if not number then return end
        local email = exports[Phone]:GetEmailAddress(number)
        if not email then return end
        exports[Phone]:SendMail({
            to = email,
            subject = 'Scuba Diving',
            message = message
        })
    elseif Phone == 'qb-phone' then
        exports[Phone]:sendNewMailToOffline(GetIdentifier(source), {
            sender = 'Diving Expert',
            subject = 'Scuba Diving',
            message = message
        })
    elseif Phone == 'qs-smartphone-pro' then
        exports[Phone]:sendNewMail(source, {
            sender = 'Diving Expert',
            subject = 'Scuba Diving',
            message = message
        })
    elseif Phone == 'qs-smartphone' then
        TriggerClientEvent('lation_diving:sendEmail', source, message)
    elseif Phone == 'gksphone' then
        exports[Phone]:SendNewMail(source, {
            sender = 'Diving Expert',
            image = '/html/static/img/icons/mail.png',
            subject = 'Scuba Diving',
            message = message
        })
    elseif Phone == 'roadphone' then
        TriggerClientEvent('lation_diving:sendEmail', source, message)
    elseif Phone == 'npwd' then
        local player = exports[Phone]:getPlayerData({ source = source })
        if not player then return end
        exports[Phone]:emitMessage({
            senderNumber = exports[Phone]:generatePhoneNumber(),
            targetNumber = player.phoneNumber,
            message = message
        })
    elseif Phone == 'yseries' then
        local number = exports[Phone]:GetPhoneNumberBySourceId(source)
        if not number then return end
        exports[Phone]:SendMail({
            title = 'Scuba Diving',
            sender = 'Diving Expert',
            senderDisplayName = 'Diving Expert',
            content = message
        }, 'phoneNumber', number)
    elseif Phone == 'okokPhone' then
        local email = exports[Phone]:getEmailAddressFromSource(source)
        if not email then return end
        exports[Phone]:sendEmail({
            sender = 'Diving Expert',
            recipients = {email},
            subject = 'Scuba Diving',
            body = message
        })
    else
        TriggerClientEvent('lation_diving:sendEmail', source, message)
    end
end

-- Return an inventory's "durability/quality" types
function GetDurabilityType()
    if Inventory == 'ox_inventory' then
        return 'durability'
    else
        return 'quality'
    end
end

-- Returns an items metadata
--- @param source number Player ID
--- @param item string Item name
function GetMetadata(source, item)
    if not source or not item then return end
    local player = GetPlayer(source)
    if not player then return end
    if Inventory == 'ox_inventory' then
        local data = exports[Inventory]:Search(source, 'slots', item)
        if not data or #data == 0 then return end
        return data[1].metadata
    elseif Inventory == 'core_inventory' then
        local data = exports[Inventory]:getItem(source, item)
        if not data then return end
        return data.info
    else
        local data = exports[Inventory]:GetItemByName(source, item)
        if not data then return end
        return data.info
    end
end

-- Set an items metadata
--- @param source number Player ID 
--- @param item string Item name
--- @param metatype string Metadata type
--- @param metavalue any Metadata value
function SetMetadata(source, item, metatype, metavalue)
    if not source or not item or not metatype or not metavalue then return end
    local player = GetPlayer(source)
    if not player then return end
    if Inventory == 'ox_inventory' then
        local itemData = exports[Inventory]:Search(source, 'slots', item)
        if not next(itemData) then return end
        itemData[1].metadata[metatype] = metavalue
        exports[Inventory]:SetMetadata(source, itemData[1].slot, itemData[1].metadata)
    elseif Inventory == 'codem-inventory' then
        local itemData = exports[Inventory]:GetItemByName(source, item)
        if not itemData then return end
        itemData.info[metatype] = metavalue
        exports[Inventory]:SetItemMetadata(source, itemData.slot, itemData.info)
    elseif Inventory == 'core_inventory' then
        local itemData = exports[Inventory]:getItem(source, item)
        if not itemData then return end
        local slot = exports[Inventory]:getFirstSlotByItem(source, item)
        if not slot then return end
        itemData.info[metatype] = metavalue
        exports[Inventory]:setMetadata(source, slot, itemData.info)
    else
        local itemData = exports[Inventory]:GetItemByName(source, item)
        if not itemData then return end
        itemData.info[metatype] = metavalue
        exports[Inventory]:SetItemData(source, item, 'info', itemData.info)
    end
end

-- Register usable item(s)
for gearId, gear in pairs(shared.gear.tanks) do
    RegisterUsableItem(gear.item, function(source)
        TriggerClientEvent('lation_diving:useGear', source, gearId)
    end)
end

-- Register hook if ox_inventory is detected
if Inventory and Inventory == 'ox_inventory' then
    local filter = {}

    -- Build item filter
    local function buildFilter()
        for _, gear in pairs(shared.gear.tanks) do
            filter[gear.item] = true
        end
        filter[shared.gear.refill] = true
    end

    -- Return if item is a tank
    --- @param item string
    local function isTank(item)
        for _, gear in ipairs(shared.gear.tanks) do
            if gear.item == item then
                return true
            end
        end
        return false
    end

    -- Merge items durability
    --- @param payload table
    local function mergeItems(payload)
        if not payload or type(payload) ~= 'table' then return false end

        local fromType, toType = payload.fromType, payload.toType
        local fromItem, toItem = payload.fromSlot, payload.toSlot

        if type(toItem) == 'table' and fromItem.name == shared.gear.refill and isTank(toItem.name) then
            local fromDurability, toDurability = fromItem.metadata.durability, toItem.metadata.durability

            if fromDurability and toDurability and fromType == toType then
                local maxDurability = 100
                local availableSpace = maxDurability - toDurability
                local transferAmount = math.min(fromDurability, availableSpace)

                toItem.metadata.durability = toDurability + transferAmount
                fromItem.metadata.durability = fromDurability - transferAmount

                exports[Inventory]:SetMetadata(payload.fromInventory, fromItem.slot, fromItem.metadata)
                exports[Inventory]:SetMetadata(payload.toInventory, toItem.slot, toItem.metadata)
            end
        end

        return true
    end

    buildFilter()

    exports[Inventory]:registerHook('swapItems', function(payload)
        return mergeItems(payload)
    end, {itemFilter = filter})

end

-- Item merging for other inventory types
if Inventory and Inventory ~= 'ox_inventory' then
    RegisterUsableItem(shared.gear.refill, function(source)
        TriggerClientEvent('lation_diving:useRefill', source)
    end)
end

-- Register usable item(s)
--- @param source number
RegisterUsableItem(shared.crates.item, function(source)
    if not source then return end

    local source = source

    local level = diving:getPlayerData(source, 'level')
    if not level then return end

    local anim = lib.callback.await('lation_diving:openCrate', source)
    if not anim then return end

    local rewards = {}

    for requiredLvl, items in pairs(shared.crates.loot) do
        if level >= requiredLvl then
            for _, data in ipairs(items) do
                if math.random(100) <= data.chance then
                    rewards[#rewards + 1] = {
                        item = data.item,
                        quantity = math.random(data.quantity.min, data.quantity.max),
                        metadata = data.metadata or false
                    }
                end
            end
        end
    end

    if #rewards == 0 then
        print('^1[ERROR]: A player has tried opening ls_diving_crate but no rewards were assigned^0')
        print('^1[ERROR]: This issue occurs when the loot table does not have enough items with a high enough chance to be rolled successfully^0')
        print('^1[ERROR]: Please check your loot table configuration in config/shared.lua crate.loot section^0')
        print('^1[ERROR]: Ensure that at least one item has a high enough chance (e.g., 100) to guarantee a reward^0')
        return
    end

    RemoveItem(source, shared.crates.item, 1)

    for _, reward in ipairs(rewards) do
        if CanCarry(source, reward.item, reward.quantity) then
            if reward.metadata then
                AddItem(source, reward.item, reward.quantity, reward.metadata)
            else
                AddItem(source, reward.item, reward.quantity)
            end
        else
            TriggerClientEvent('lation_diving:notify', source, locale('notify.cant-carry'), 'error')
        end
    end

    if server.logs.events.crateOpened then
        local baseStr = {}
        for _, reward in ipairs(rewards) do
            table.insert(baseStr, ('x%d %s'):format(reward.quantity, reward.item))
        end

        local finalStr = table.concat(baseStr, ', ')

        PlayerLog(source, locale('logs.crate-opened-title'), locale('logs.crate-opened-message', GetName(source), GetIdentifier(source), finalStr))
    end
end)

-- Log player events if applicable
--- @param source number Player ID
--- @param title string Log title
--- @param message string Message contents
function PlayerLog(source, title, message)
    if server.logs.service == 'fivemanage' then
        if not fmsdk then return end
        if server.logs.screenshots then
            exports.fmsdk:takeServerImage(source, {
                name = title,
                description = message,
            })
        else
            exports.fmsdk:LogMessage('info', message)
        end
    elseif server.logs.service == 'fivemerr' then
        if not fmlogs then return end
        exports['fm-logs']:createLog({
            LogType = 'Player',
            Message = message,
            Resource = 'lation_coke',
            Source = source,
        }, { Screenshot = server.logs.screenshots })
    elseif server.logs.service == 'discord' then
        local embed = {
            {
                ["color"] = 16711680,
                ["title"] = "**".. title .."**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = os.date("%a %b %d, %I:%M%p"),
                    ["icon_url"] = server.logs.discord.footer
                }
            }
        }
        PerformHttpRequest(server.logs.discord.link, function()
        end, 'POST', json.encode({username = server.logs.discord.name, embeds = embed, avatar_url = server.logs.discord.image}),
        {['Content-Type'] = 'application/json'})
    end
end

-- Register callback(s)
lib.callback.register('lation_diving:getMetadata', GetMetadata)

-- Register net event(s)
RegisterNetEvent('lation_diving:setMetadata', SetMetadata)
RegisterNetEvent('lation_diving:sendEmail', SendEmail)

-- Initialize default(s)
InitializePhone()