if Config.InventorySystem == Inventory.ORIGEN then
    local resourceName = InventoryResourceNames[Inventory.ORIGEN]

    function RemovePlayerItem(source, itemName, count)
        exports[resourceName]:removeItem(source, itemName, count)
    end

    function AddPlayerItem(source, itemName, count)
        exports[resourceName]:addItem(source, itemName, count)
    end

    function CanPlayerCarryItem(source, itemName, count)
        return exports[resourceName]:canCarryItem(source, itemName, count)
    end

    function GetItemCount(source, itemName)
        return exports[resourceName]:getItemCount(source, itemName)
    end

    SharedObject.RegisterUsableItem = function(itemName, callBack)
        exports[resourceName]:CreateUseableItem(itemName, callBack)
    end

    -- only if codem-inventory is active
    PlayerActiveSlots = {}

    RegisterNetEvent("inventory:server:UseItemSlot", function(activeSlot)
        -- the result at some point the value of activeSlot was "done" so I will simply end the function early if the active slot will be anything else but number.
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
