---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
-- Use this file to add support for another inventory by simply copying the file and replacing the logic within the functions
local found = GetResourceState('ps-inventory')
if found ~= 'started' and found ~= 'starting' then return end

WSB.inventory = {}
WSB.inventorySystem = 'ps-inventory'

function WSB.inventory.getItemSlot(source, itemName)
    return GetItemSlot(source, itemName) or false
end

function WSB.inventory.getItemSlots(source, itemName)
    local src = source
    local player = WSB.getPlayer(src)
    if not player then return {} end
    return GetSlotsByItem(player.PlayerData and player.PlayerData.items, itemName)
end

function WSB.inventory.getItemMetadata(source, slot)
    local player = WSB.getPlayer(source)
    if not player then return end
    return player.Functions.GetItemBySlot(slot).info
end

function WSB.inventory.setItemMetadata(source, slot, metadata)
    if not slot then return false end
    local player = WSB.getPlayer(source)
    if not player then return end
    local item = player.Functions.GetItemBySlot(slot)
    if not item then return false end
    item.info = metadata
    player.PlayerData.items[slot] = item
    player.Functions.SetPlayerData("items", player.PlayerData.items)
    return true
end

---Clears specified inventory
---@param source number
---@param keepItems string | table
function WSB.inventory.clearInventory(source, identifier, keepItems)
    exports['ps-inventory']:ClearInventory(source, keepItems)
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
