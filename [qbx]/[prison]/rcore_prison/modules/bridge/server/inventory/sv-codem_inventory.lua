CreateThread(function()
    if Config.Inventories == Inventories.CODEM then
        Inventory.hasItem = function(client, itemName, amount)
            amount = amount or 1

            local retval = false
            local inventoryItems = Inventory.getInventoryItems(client)

            if inventoryItems and next(inventoryItems) then
                for k, v in pairs(inventoryItems) do
                    local inventoryAmount = v.amount or v.count or 0

                    if v.name == itemName and tonumber(inventoryAmount) >= tonumber(amount) then
                        retval = true
                        break
                    end
                end
            else
                return false
            end

            dbg.debugInventory('Inventory.hasItem: %s (%s) - checking if user has %s amount (%s) with state: %s',
                GetPlayerName(client), client, itemName, amount, retval)

            return retval
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

        Inventory.addItem = function(client, item, amount, data)
            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:upper()
            end

            if doesExportExistInResource(Config.Inventories, "AddItem") then
                return exports[Config.Inventories]:AddItem(client, item, amount, nil, data)
            end

            return false
        end

        Inventory.removeItem = function(client, item, amount, data)
            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                item = item:lower()
            end

            if doesExportExistInResource(Config.Inventories, "RemoveItem") then
                return exports[Config.Inventories]:RemoveItem(client, item, amount)
            end

            return false
        end

        Inventory.DoesItemExist = function(itemName, playerId)
            if ServerItems[itemName:upper()] then
                return true
            end

            return false
        end

        Inventory.registerUsableItem = function(name, cb)
            if Config.Framework == Framework.ESX then
                Framework.object.RegisterUsableItem(name, function(source)
                    cb(source, name)
                end)
            end

            if Config.Framework == Framework.QBCore then
                Framework.object.Functions.CreateUseableItem(name, function(source, item)
                    cb(source, item.name, item)
                end)
            end
        end

        Inventory.getInventoryItems = function(playerId)
            local player = Framework.getPlayer(playerId)

            if player == nil then return {} end

            local identifier = Framework.getIdentifier(playerId)

            if not identifier then
                return {}
            end

            if doesExportExistInResource(Config.Inventories, "GetInventory") then
                return exports[Config.Inventories]:GetInventory(identifier, source)
            end

            return {}
        end


        Inventory.clearInventory = function(playerId)
            local items = Inventory.getInventoryItems(playerId)

            -- For unk reasons codem_inventory doesnt include remove of player licences in inventory, remove them manually.

            if items and next(items) then
                for k, item in pairs(items) do
                    local itemName = item.name

                    if itemName and itemName:match("_card$") or itemName:match("_license$") then
                        Inventory.removeItem(playerId, itemName, 1)
                    end
                end
            end

            if doesExportExistInResource(Config.Inventories, "ClearInventory") then
                return exports[Config.Inventories]:ClearInventory(playerId)
            end

            return false
        end
    end
end)
