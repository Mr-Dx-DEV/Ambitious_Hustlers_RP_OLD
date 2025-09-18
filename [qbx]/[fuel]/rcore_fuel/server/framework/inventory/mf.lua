if Config.InventorySystem == Inventory.MF then
    local resourceName = InventoryResourceNames[Inventory.MF]

    function RemovePlayerItem(source, itemName, count)
        local identifier = GetPlayerIdentifier(source).identifier
        return exports[resourceName]:removeInventoryItem(identifier, itemName, count, source)
    end

    function AddPlayerItem(source, itemName, count)
        local identifier = GetPlayerIdentifier(source).identifier
        return exports[resourceName]:addInventoryItem(identifier, itemName, count, source)
    end

    function CanPlayerCarryItem(source, itemName, count)
        local identifier = GetPlayerIdentifier(source).identifier
        return exports[resourceName]:canCarry(identifier, itemName, count)
    end

    function GetItemCount(source, itemName)
        local identifier = GetPlayerIdentifier(source).identifier
        local item = exports[resourceName]:getInventoryItem(identifier, itemName)
        return item and item.count or 0
    end

    -- seems like mf_inventory doesnt have any specific export for registrable items
    --SharedObject.RegisterUsableItem = function(itemName, callBack)
    --end
end
