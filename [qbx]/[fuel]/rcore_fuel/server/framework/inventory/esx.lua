if Config.InventorySystem == Inventory.ESX then

    function RemovePlayerItem(source, item, count)
        local player = SharedObject.GetPlayerFromId(source)

        player.removeInventoryItem(item, count)
    end

    function AddPlayerItem(source, item, count)
        local player = SharedObject.GetPlayerFromId(source)

        player.addInventoryItem(item, count)
    end

    function CanPlayerCarryItem(source, item, count)
        local player = SharedObject.GetPlayerFromId(source)
        return player.canCarryItem(item, count)
    end

    function GetItemCount(source, itemName)
        local player = SharedObject.GetPlayerFromId(source)
        local item = player.getInventoryItem(itemName)
        if not item then
            print("Error!", itemName, "doesnt exists!! This isnt issue of this resource but you didnt installed all items correctly!")
            return -9999
        end
        return item.count
    end

    -- the resource is using ESX syntax so no need to edit anything for this one function
    --SharedObject.RegisterUsableItem = function(itemName, callBack)
    --end
end