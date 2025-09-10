---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local found = GetResourceState('qs-inventory')
if found ~= 'started' and found ~= 'starting' then return end

WSB.inventorySystem = 'qs-inventory'
WSB.inventory = {}

function WSB.inventory.getItemSlot(source, itemName)
    return GetItemSlot(source, itemName) or false
end

function WSB.inventory.getItemSlots(source, itemName)
    local src = source
    local inventory = exports['qs-inventory']:GetInventory(src)
    if not inventory then return {} end
    return GetSlotsByItem(inventory, itemName)
end

function WSB.inventory.getItemMetadata(source, slot)
    if not source or not slot then return end
    return exports['qs-inventory']:GetItemBySlot(source, slot)?.info
end

function WSB.inventory.setItemMetadata(source, slot, metadata)
    if not slot then return false end
    if not metadata then metadata = {} end

    exports['qs-inventory']:SetItemMetadata(source, slot, metadata)
end

---Clears specified inventory
---@param source number
---@param keepItems string | table
function WSB.inventory.clearInventory(source, identifier, keepItems)
    exports['qs-inventory']:ClearInventory(source, keepItems)
    TriggerClientEvent('wasabi_ambulance:weaponRemove', source)
end

local registeredShops = {}
AddEventHandler('wasabi_bridge:registerShop', function(data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    if invokingResource:sub(1, 7) ~= 'wasabi_' then return end
    registeredShops[data.identifier] = ConvertShopData(data)
end)

WSB.registerCallback('wasabi_bridge:getShopDetails', function(_source, cb, data)
    return registeredShops[data.identifier] or false
end)
