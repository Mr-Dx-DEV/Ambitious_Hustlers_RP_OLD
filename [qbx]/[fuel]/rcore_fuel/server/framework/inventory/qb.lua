if Config.InventorySystem == Inventory.QB then
    function RemovePlayerItem(source, itemName, count)
        local player = SharedObject.Functions.GetPlayer(source)

        player.Functions.RemoveItem(itemName, count)
    end

    function AddPlayerItem(source, itemName, count)
        local player = SharedObject.Functions.GetPlayer(source)

        player.Functions.AddItem(itemName, count, false)
    end

    function CanPlayerCarryItem(source, itemName, count)
        local player = SharedObject.Functions.GetPlayer(source)
        local item = SharedObject.Shared.Items[itemName:lower()] or {}

        local ItemInfo = {
            name = itemName,
            count = item.amount or 0,
            label = item.label or "none",
            weight = item.weight or 0,
            usable = item.useable or false,
            rare = false,
            canRemove = false,
        }

        local totalWeight = SharedObject.Player.GetTotalWeight(player.PlayerData.items)
        local MaxWeight = 120000

        if SharedObject.Config.Player.MaxWeight then
            MaxWeight = SharedObject.Config.Player.MaxWeight
        end

        return (totalWeight + (ItemInfo.weight * count)) <= MaxWeight
    end

    function GetItemCount(source, itemName)
        local player = SharedObject.Functions.GetPlayer(source)
        local totalAmount = 0

        for k, v in pairs(player.Functions.GetItemsByName(itemName)) do
            totalAmount = totalAmount + (v.amount or v.count)
        end
        return totalAmount
    end

    SharedObject.RegisterUsableItem = function(itemName, callBack)
        SharedObject.Functions.CreateUseableItem(itemName, callBack)
    end

    -- only if qb-inventory is active
    -- this will be removed once there are exports for exactly this.
    PlayerActiveSlots = {}

    -- newest qb-core inventory
    -- unfortunately qb-inventory:client:ItemBox returning item info not item data. So this is work around
    -- how to get active slot on the client side. We will simply send it to the client
    RegisterNetEvent("qb-inventory:server:useItem", function(item)
        PlayerActiveSlots[source] = item.slot

        TriggerClientEvent("rcore_fuel:setPlayerActiveSlotNumber", source, item.slot)
    end)

    RegisterNetEvent("rcore_fuel:setActiveSlotId", function(slotId)
        PlayerActiveSlots[source] = slotId
    end)

    -- so we support old version of inventory
    RegisterNetEvent("inventory:server:UseItemSlot", function(activeSlot)
        -- the result at some point the value of activeSlot was "done" so I will simply end the function early if the active slot will be anything else but number.
        if type(activeSlot) ~= "number" then
            return
        end

        PlayerActiveSlots[source] = activeSlot
    end)

    AddEventHandler("playerDropped", function()
        PlayerActiveSlots[source] = nil
    end)
end