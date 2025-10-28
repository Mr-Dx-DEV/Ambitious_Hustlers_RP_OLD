---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local found = GetResourceState('tgiann-inventory')
if found ~= 'started' and found ~= 'starting' then return end

WSB.inventorySystem = 'tgiann-inventory'
WSB.inventory = {}

function WSB.inventory.openPlayerInventory(targetId)
    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", targetId, nil, { showClothe = false })
end

function WSB.inventory.openStash(data)
    -- data = {name = name, unique = true, maxWeight = maxWeight, slots = slots}
    if data.unique then
        data.name = ('%s_%s'):format(data.name, WSB.getIdentifier())
    end
    TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.name, { maxweight = data.maxWeight, slots = data.slots })
    
end

function WSB.inventory.openShop(data)
    --[[
        For security, you need to register shops on the server side
        using server only event 'wasabi_bridge:registerShop'
        see server.lua of this inventory for more information
    ]]
    TriggerServerEvent("wasabi_bridge:openShop", data.identifier)
end
