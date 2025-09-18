if Config.Framework == "2" then
    QBCore = Config.GetQBCoreObject()
    ESX = {}

    ESX.RegisterUsableItem = function(itemName, callBack)
        QBCore.Functions.CreateUseableItem(itemName, callBack)
    end

    ESX.GetPlayerFromId = function(source)
        local xPlayer = {}
        local qbPlayer = QBCore.Functions.GetPlayer(source)
        ---------
        xPlayer.removeInventoryItem = function(itemName, count)
            qbPlayer.Functions.RemoveItem(itemName, count)
        end
        ---------
        xPlayer.canCarryItem = function(itemName, count)
            local item = qbPlayer.Functions.GetItemByName(itemName) or {}
            local ItemInfo = {
                name = itemName,
                count = item.amount or 0,
                label = item.label or "none",
                weight = item.weight or 0,
                usable = item.useable or false,
                rare = false,
                canRemove = false,
            }

            local totalWeight = QBCore.Player.GetTotalWeight(qbPlayer.PlayerData.items) or 0
            local MaxWeight = 120000 -- default config is 120KG I have not found yet if the config can be fetched....

            if QBCore.Config.Player.MaxWeight then
                MaxWeight = QBCore.Config.Player.MaxWeight
            end

            return (totalWeight + (ItemInfo.weight * count)) <= MaxWeight
        end
        ---------
        xPlayer.addInventoryItem = function(itemName, count)
            qbPlayer.Functions.AddItem(itemName, count, false)
        end
        ---------
        xPlayer.getInventoryItem = function(itemName)
            local item = qbPlayer.Functions.GetItemByName(itemName) or {}

            local ItemInfo = {
                name = itemName,
                count = item.amount or 0,
                label = item.label or "none",
                weight = item.weight or 0,
                usable = item.useable or false,
                rare = false,
                canRemove = false,
            }
            return ItemInfo
        end
        ---------

        return xPlayer
    end
end