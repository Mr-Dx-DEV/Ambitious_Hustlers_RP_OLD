---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
-- Use this file to add support for another inventory by simply copying the file and replacing the logic within the functions
local found = GetResourceState('ox_inventory')
if found ~= 'started' and found ~= 'starting' then return end

WSB.inventorySystem = 'ox_inventory'
WSB.inventory = {}

local registeredStashes = {}
local registeredShops = {}

function WSB.inventory.getItemSlot(source, item)
    return exports.ox_inventory:GetSlotIdWithItem(source, item) or false
end

function WSB.inventory.getItemSlots(source, item)
    local src = source
    return exports.ox_inventory:GetSlotIdsWithItem(src, item)
end

function WSB.inventory.getItemMetadata(source, slot)
    local item = exports.ox_inventory:GetSlot(source, slot)
    return item.metadata
end

function WSB.inventory.setItemMetadata(source, slot, metadata)
    return exports.ox_inventory:SetMetadata(source, slot, metadata)
end

---Clears specified inventory
---@param source number
---@param keepItems string | table
function WSB.inventory.clearInventory(source, identifier, keepItems)
    exports.ox_inventory:ClearInventory(source, type(keepItems) == 'table' and next(keepItems) and keepItems or nil)
end

AddEventHandler('wasabi_bridge:registerStash', function(data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    if invokingResource:sub(1, 7) ~= 'wasabi_' then return end
    if registeredStashes[data.name] then return end
    exports.ox_inventory:RegisterStash(data.name, data.name, data.slots, data.maxWeight, data.unique or false, nil, nil)
    registeredStashes[data.name] = true
end)

AddEventHandler('wasabi_bridge:registerShop', function(data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    if invokingResource:sub(1, 7) ~= 'wasabi_' then return end
    exports.ox_inventory:RegisterShop(data.identifier, {
        name = data.name,
        groups = data.groups,
        inventory = data.inventory,
        locations = data.locations
    })
    registeredShops[data.identifier] = true
end)
