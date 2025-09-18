if Config.InventorySystem == Inventory.TGIANN then
    local resourceName = InventoryResourceNames[Inventory.TGIANN]

    function RemovePlayerItem(source, itemName, count)
        exports[resourceName]:RemoveItem(source, itemName, count)
    end

    function AddPlayerItem(source, itemName, count)
        exports[resourceName]:AddItem(source, itemName, count)
    end

    function CanPlayerCarryItem(source, itemName, count)
        return exports[resourceName]:CanCarryItems(source, {
            { name = itemName, amount = count },
        })
    end

    function GetItemCount(source, itemName)
        return exports[resourceName]:GetItemCount(source, itemName)
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
