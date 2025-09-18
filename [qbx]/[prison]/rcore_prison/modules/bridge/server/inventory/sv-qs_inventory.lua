CreateThread(function()
    if Config.Inventories == Inventories.QS then
        Inventory.hasItem = function(client, itemName, amount)
            amount = amount or 1

            local itemCount = exports[Inventories.QS]:GetItemTotalAmount(source, itemName)

            dbg.debugInventory('Inventory.hasItem: %s (%s) - checking if user has %s amount (%s) with state: %s',
                GetPlayerName(client), client, itemName, amount, itemCount >= amount or false)

            return itemCount and itemCount >= amount or false
        end

        Inventory.getInventoryItems = function(playerId)
            local player = Framework.getPlayer(playerId)
            local inventory = {}

            if not player then
                return inventory
            end

            if doesExportExistInResource(Inventories.QS, "GetPlayerInventory") then
                dbg.debug("Inventory-QS: Loading player inventory via existing export GetPlayerInventory")
                return exports[Inventories.QS]:GetPlayerInventory(playerId)
            end

            if doesExportExistInResource(Inventories.QS, "GetInventory") then
                dbg.debug("Inventory-QS: Loading player inventory via existing export GetInventory")
                return exports[Inventories.QS]:GetInventory(playerId)
            end

            if Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX and player then
                return player.PlayerData.items
            end

            if Config.Framework == Framework.ESX and player then
                local playerInventory = player.getInventory()
                local playerLoadout = player.getLoadout()

                for _, v in pairs(playerInventory) do
                    if v.count > 0 then
                        inventory[#inventory + 1] = v
                    end
                end

                for _, v in pairs(playerLoadout) do
                    inventory[#inventory + 1] = v
                end
            end

            return inventory
        end

        Inventory.DoesItemExist = function(itemName, playerId)
            if doesExportExistInResource(Inventories.QS, 'GetItemList') then
                local itemData = exports[Inventories.QS]:GetItemList(itemName)

                if itemData then
                    return true
                end
            end

            if itemName and ServerItems and ServerItems[itemName:upper()] then
                return true
            end

            return false
        end

        Inventory.registerUsableItem = function(itemName, cb)
            if doesExportExistInResource(Inventory.QS, 'CreateUsableItem') then
                exports[Inventory.QS]:CreateUsableItem(itemName, function(src, item)
                    cb(src, item.name, item)
                end)

                return
            end

            if Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
                Framework.object.Functions.CreateUseableItem(itemName, function(source, item)
                    cb(source, item.name, item)
                end)
            end

            if Config.Framework == Framework.ESX then
                Framework.object.RegisterUsableItem(itemName, function(source, item)
                    cb(source, item.name, item)
                end)
            end
        end


        --- @return boolean success
        Inventory.addItem = function(client, item, amount, data)
            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end

            return exports[Inventories.QS]:AddItem(client, item, amount, nil, data)
        end

        Inventory.addMultipleItems = function(client, items)
            if not client then
                return
            end

            if not items then
                return
            end

            local p = promise.new()

            if next(items) then
                for i = 1, #items, 1 do
                    local item = items[i]

                    if item and next(item) then
                        Inventory.addItem(client, item.name, item.count, item.metadata)
                    end

                    if i >= #items then
                        p:resolve(true)
                    end
                end
            else
                p:resolve(false)
            end

            return Citizen.Await(p)
        end

        Inventory.removeItem = function(client, item, amount, data)
            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end

            return exports[Inventories.QS]:RemoveItem(client, item, amount, nil, data)
        end

        Inventory.clearInventory = function(playerId)
            local success, error_message = pcall(function()
                if Config.Stash.KeepItemsState and Inventory.KeepSessionItems then
                    return exports[Inventories.QS]:ClearInventory(playerId, Inventory.KeepSessionItems)
                else
                    return exports[Inventories.QS]:ClearInventory(playerId, {})
                end
            end)

            local state = false

            if success then
                state = true
            elseif Config.Framework == Framework.QBCore or Config.Framework == Framework.QBOX then
                state = Framework.clearInventory(playerId)
            end

            return state
        end

        AssetDeployer:registerCopyFilesDeploy('items-images', Config.Inventories, 'assets/inventoryImages/png',
            'html/images',
            function(data)
                local files = {}

                for _, item in ipairs(data) do
                    table.insert(files, item .. '.png')
                end

                return files
            end,
            { 'sprunk', 'sludgie', 'ecola_light', 'ecola', 'coffee', 'water', 'fries', 'pizza_ham', 'chips', 'donut',
                'wire_cutter', 'cigarrete', 'prison_tablet' }
        )
    end
end)
