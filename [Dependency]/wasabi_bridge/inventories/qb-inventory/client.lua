---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
-- Use this file to add support for another inventory by simply copying the file and replacing the logic within the functions
local found = GetResourceState('qb-inventory')
local qsFound = GetResourceState('qs-inventory')
if found ~= 'started' and found ~= 'starting' then return end
if qsFound == 'started' or qsFound == 'starting' then return end

WSB.inventorySystem = 'qb-inventory'
WSB.inventory = {}

OldInventory = GetResourceMetadata(WSB.inventorySystem, 'version', 0)
OldInventory = OldInventory:gsub('%.', '')
OldInventory = tonumber(OldInventory)
if not OldInventory or OldInventory >= 200 then OldInventory = false end

function WSB.inventory.openPlayerInventory(targetId)
    if not OldInventory then
        TriggerServerEvent('wasabi_bridge:openPlayerInventory', targetId)
        return
    end

    TriggerServerEvent('inventory:server:OpenInventory', 'otherplayer', targetId)
    TriggerEvent('inventory:server:RobPlayer', targetId)
end

function WSB.inventory.openStash(data)
    -- data = {name = name, unique = true, maxWeight = maxWeight, slots = slots}
    if data.unique then
        data.name = ('%s_%s'):format(data.name, WSB.getIdentifier())
    end

    if not OldInventory then
        TriggerServerEvent('wasabi_bridge:openStash', data)
        return
    end

    TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.name)

    --TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.name,
    --    { maxweight = data.maxWeight, slots = data.slots })
    TriggerEvent('inventory:client:SetCurrentStash', data.name)
end

function WSB.inventory.openShop(data)
    --[[
        For security, you need to register shops on the server side
        using server only event 'wasabi_bridge:registerShop'
        see server.lua of this inventory for more information
    ]]
    if not OldInventory then
        TriggerServerEvent('wasabi_bridge:openShop', data)
        return
    end

    local shopData = WSB.awaitServerCallback('wasabi_bridge:getShopDetails', data)
    TriggerServerEvent("inventory:server:OpenInventory", "shop", data.identifier, shopData)
end
