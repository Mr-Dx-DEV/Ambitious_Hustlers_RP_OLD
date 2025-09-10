---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local found = GetResourceState('tgiann-inventory')
if found ~= 'started' and found ~= 'starting' then return end

WSB.inventorySystem = 'tgiann-inventory'
WSB.inventory = {}

local registeredShops = {}
AddEventHandler('wasabi_bridge:registerShop', function(data)
    local invokingResource = GetInvokingResource()
    if not invokingResource then return end
    if invokingResource:sub(1, 7) ~= 'wasabi_' then return end
    exports["tgiann-inventory"]:RegisterShop(data.identifier, data.inventory)
    registeredShops[data.identifier] = true
end)

RegisterNetEvent('wasabi_bridge:openShop', function(identifier)
    local src = source
    if not src or not registeredShops[identifier] then return end
    exports["tgiann-inventory"]:OpenShop(src, identifier)
end)

function WSB.inventory.getItemSlot(source, itemName)
    return GetItemSlot(source, itemName) or false
end

function WSB.inventory.getItemSlots(source, itemName)
    local src = source
    local items = exports["tgiann-inventory"]:GetPlayerItems(src)
    if not items then return {} end
    return GetSlotsByItem(items, itemName)
end

function WSB.inventory.getItemMetadata(source, slot)
    if not source or not slot then return end
    return exports["tgiann-inventory"]:GetItemBySlot(source, slot).info
end

function WSB.inventory.setItemMetadata(source, slot, metadata)
    if not slot then return false end
    if not metadata then metadata = {} end
    local item = exports["tgiann-inventory"]:GetItemBySlot(source, slot)
    exports["tgiann-inventory"]:UpdateItemMetadata(source, item.name, slot, metadata)
end

---Clears specified inventory
---@param source number
---@param keepItems string | table
function WSB.inventory.clearInventory(source, identifier, keepItems)
    exports["tgiann-inventory"]:ClearInventory(source, type(keepItems) == 'table' and next(keepItems) and keepItems or nil)
end
