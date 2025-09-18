if Config.InventorySystem == Inventory.CORE then
    local resourceName = InventoryResourceNames[Inventory.CORE]

    function RemovePlayerItem(source, itemName, count)
        if Config.Framework.Active == Framework.ESX then
            local player = SharedObject.GetPlayerFromId(source)

            player.removeInventoryItem(itemName, count)
        end

        if Config.Framework.Active == Framework.QBCORE then
            local player = SharedObject.Functions.GetPlayer(source)

            player.Functions.RemoveItem(itemName, count)
        end
    end

    function AddPlayerItem(source, itemName, count)
        if Config.Framework.Active == Framework.ESX then
            local player = SharedObject.GetPlayerFromId(source)

            player.addInventoryItem(itemName, count)
        end

        if Config.Framework.Active == Framework.QBCORE then
            local player = SharedObject.Functions.GetPlayer(source)

            player.Functions.AddItem(itemName, count, false)
        end
    end

    function CanPlayerCarryItem(source, itemName, count)
        return exports[resourceName]:canCarry(source, itemName, count)
    end

    function GetItemCount(source, itemName)
        if Config.Framework.Active == Framework.ESX then
            local player = SharedObject.GetPlayerFromId(source)

            local item = player.getInventoryItem(itemName)
            if not item then
                print("Error!", itemName, "doesnt exists!! This isnt issue of this resource but you didnt installed all items correctly!")
                return -9999
            end
            return item.count
        end

        if Config.Framework.Active == Framework.QBCORE then
            local player = SharedObject.Functions.GetPlayer(source)
            local totalAmount = 0

            for k, v in pairs(player.Functions.GetItemsByName(itemName)) do
                totalAmount = totalAmount + (v.amount or v.count)
            end
            return totalAmount
        end

        return 0
    end

    if Config.Framework.Active == Framework.QBCORE then
        SharedObject.RegisterUsableItem = function(itemName, callBack)
            SharedObject.Functions.CreateUseableItem(itemName, callBack)
        end
    end
end