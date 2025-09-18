if Config.InventorySystem == Inventory.CODEM then
    local resourceName = InventoryResourceNames[Inventory.CODEM]

    function RemovePlayerItem(source, itemName, count)
        exports[resourceName]:RemoveItem(source, itemName, count)
    end

    function AddPlayerItem(source, itemName, count)
        exports[resourceName]:AddItem(source, itemName, count)
    end

    function CanPlayerCarryItem(source, itemName, count)
        if Config.Framework.Active == Framework.ESX then
            local player = SharedObject.GetPlayerFromId(source)
            return player.canCarryItem(itemName, count)
        end

        if Config.Framework.Active == Framework.QBCORE then
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

            local totalWeight = exports[resourceName]:GetTotalWeight(player.PlayerData.items)
            local MaxWeight = 120000

            if SharedObject.Config.Player.MaxWeight then
                MaxWeight = SharedObject.Config.Player.MaxWeight
            end

            return (totalWeight + (ItemInfo.weight * count)) <= MaxWeight
        end
        return true
    end

    function GetItemCount(source, itemName)
        local totalAmount = 0
        local items = exports[resourceName]:GetItemsByName(source, itemName)
        for k, v in pairs(items or {}) do
            totalAmount = totalAmount + tonumber((v.amount or v.count))
        end

        return totalAmount
    end

    if Config.Framework.Active == Framework.QBCORE then
        SharedObject.RegisterUsableItem = function(itemName, callBack)
            SharedObject.Functions.CreateUseableItem(itemName, callBack)
        end
    end

    -- only if codem-inventory is active
    PlayerActiveSlots = {}

    RegisterNetEvent("rcore_fuel:setActiveSlotId", function(slotId)
        PlayerActiveSlots[source] = slotId
    end)

    AddEventHandler("playerDropped", function()
        PlayerActiveSlots[source] = nil
    end)
end