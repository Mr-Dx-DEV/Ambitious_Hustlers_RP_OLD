---@diagnostic disable: duplicate-set-field
-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
-- Use this file to add support for another inventory by simply copying the file and replacing the logic within the functions
local found = GetResourceState('codem-inventory')
if found ~= 'started' and found ~= 'starting' then return end

WSB.inventorySystem = 'codem-inventory'
WSB.inventory = {}

function WSB.inventory.openPlayerInventory(targetId)
    TriggerServerEvent('codem-inventory:server:robplayer', targetId)
end

function WSB.inventory.openStash(data)
    -- data = {name = name, unique = true, maxWeight = maxWeight, slots = slots}
    if data.unique then
        data.name = ('%s_%s'):format(data.name, WSB.getIdentifier())
    end

    TriggerServerEvent('inventory:server:OpenInventory', 'stash', data.name,
        { maxweight = data.maxWeight, slots = data.slots })
    TriggerEvent('inventory:client:SetCurrentStash', data.name)
end

function WSB.inventory.openShop(data)
    --[[
        For security, you need to register shops on the server side
        using server only event 'wasabi_bridge:registerShop'
        see server.lua of this inventory for more information
    ]]
    local shopData = WSB.awaitServerCallback('wasabi_bridge:getShopDetails', data)
    TriggerEvent('codem-inventory:OpenPlayerShop', shopData)
end
