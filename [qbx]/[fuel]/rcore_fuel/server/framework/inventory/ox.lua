if Config.InventorySystem == Inventory.OX then
    local resourceName = InventoryResourceNames[Inventory.OX]

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
        return exports[resourceName]:GetItemCount(source, itemName)
    end

    SharedObject.RegisterUsableItem = function(itemName, callBack)
        exports(itemName, function(event, item, inventory, slot, data)
            if event ~= "usingItem" then
                return
            end

            callBack(inventory.id)
        end)
    end
end