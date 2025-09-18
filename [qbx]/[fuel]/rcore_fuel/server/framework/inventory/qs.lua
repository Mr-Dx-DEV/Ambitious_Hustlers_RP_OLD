if Config.InventorySystem == Inventory.QS then
    local resourceName = InventoryResourceNames[Inventory.QS]

    function RemovePlayerItem(source, itemName, count)
        exports[resourceName]:RemoveItem(source, itemName, count)
    end

    function AddPlayerItem(source, itemName, count)
        exports[resourceName]:AddItem(source, itemName, count)
    end

    function CanPlayerCarryItem(source, itemName, count)
        return exports[resourceName]:CanCarryItem(source, itemName, count)
    end

    function GetItemCount(source, itemName)
        return exports[resourceName]:GetItemTotalAmount(source, itemName)
    end

    SharedObject.RegisterUsableItem = function(itemName, callBack)
        exports[resourceName]:CreateUsableItem(itemName, callBack)
    end

    -- only if qs-inventory is active
    PlayerActiveSlots = {}

    RegisterNetEvent("inventory:server:UseItemSlot", function(activeSlot)
        -- I am not sure if the activeSlot argument can be something else beside number just like it is
        -- with qb-inventory so  i will leave it here
        if type(activeSlot) ~= "number" then
            return
        end

        PlayerActiveSlots[source] = activeSlot
    end)

    RegisterNetEvent("rcore_fuel:setActiveSlotId", function(slotId)
        PlayerActiveSlots[source] = slotId
    end)

    AddEventHandler("playerDropped", function()
        PlayerActiveSlots[source] = nil
    end)
end