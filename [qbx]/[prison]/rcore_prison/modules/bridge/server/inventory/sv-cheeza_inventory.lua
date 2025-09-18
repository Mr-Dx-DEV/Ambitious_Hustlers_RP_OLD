ESX_ITEMS_DEPLOY = {
    {
        name = 'sprunk',
        label = 'Sprunk',
        weight = 100,
    },
    {
        name = 'sludgie',
        label = 'Sludgie',
        weight = 250,
    },
    {
        name = 'ecola_light',
        label = 'Ecola light',
        weight = 100,
    },
    {
        name = 'ecola',
        label = 'Ecola',
        weight = 100,
    },
    {
        name = 'coffee',
        label = 'Coffee',
        weight = 100,
    },
    {
        name = 'coffee',
        label = 'Coffee',
        weight = 100,
    },
    {
        name = 'water',
        label = 'Water',
        weight = 100,
    },
    {
        name = 'fries',
        label = 'Fries',
        weight = 100,
    },
    {
        name = 'pizza_ham',
        label = 'Pizza Ham',
        weight = 100,
    },
    {
        name = 'chips',
        label = 'Chips',
        weight = 100,
    },
    {
        name = 'donut',
        label = 'Donut',
        weight = 100,
    },
    {
        name = 'wire_cutter',
        label = 'Wire cutter',
        weight = 100,
    },
    {
        name = 'prison_tablet',
        label = 'Prison Tablet',
        weight = 100,
    },
}

CreateThread(function()
    if Config.Inventories == Inventories.CHEEZA then
        Inventory.hasItem = function(client, item, amount)
            local player = Framework.getPlayer(client)
            local retval = false

            if player == nil then
                return retval
            end

            if not amount then
                amount = 1
            end

            local playerInventory = Inventory.getInventoryItems(client)

            if playerInventory and next(playerInventory) then
                for k, v in pairs(playerInventory) do
                    if v.name:lower() == item:lower() and v.count >= amount then
                        retval = true
                    end
                end
            end

            return retval
        end

        Inventory.getInventoryItems = function(playerId)
            local player = Framework.getPlayer(playerId)

            if not player then
                return nil
            end

            local inventory = {}

            if doesExportExistInResource(Inventories.CHEEZA, "getPlayerInventory") then
                inventory = exports[Inventories.CHEEZA]:getPlayerInventory(player)
            else
                local playerInventory = player.getInventory()
                local playerLoadout = player.getLoadout()

                for _, v in pairs(playerInventory) do
                    if v.count > 0 then
                        table.insert(inventory, v)
                    end
                end

                for _, v in pairs(playerLoadout) do
                    table.insert(inventory, v)
                end
            end


            return inventory
        end


        Inventory.addItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)

            if player == nil then
                return false
            end

            if item == 'cash' or item == 'money' then
                return player.addMoney(amount)
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                return player.addWeapon(item:lower(), math.random(30, 120))
            end

            player.addInventoryItem(item, amount)
        end

        Inventory.removeItem = function(client, item, amount, data)
            local player = Framework.getPlayer(client)

            if player == nil then
                return false
            end

            if item == 'cash' or item == 'money' then
                return player.removeMoney(amount)
            end

            local match = string.match(item, "^WEAPON_(.*)")

            if match then
                return player.removeWeapon(item:lower(), math.random(30, 120))
            end

            player.removeInventoryItem(item, amount)
        end

        Inventory.DoesItemExist = function(itemName, playerId)
            if ServerItems[itemName:upper()] then
                return true
            end

            return false
        end

        Inventory.registerUsableItem = function(name, cb)
            Framework.object.RegisterUsableItem(name, function(source)
                cb(source, name)
            end)
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

        Inventory.clearInventory = function(client)
            local player = Framework.getPlayer(client)
            if player == nil then return false end

            local clearinventory = ('%s %s'):format('clearinventory', client)
            local commandState, commandErrMessage = pcall(function()
                if Config.Stash.KeepItems and Inventory.KeepSessionItems then
                    return exports[Config.Inventories]:clearInventory(player, true, Inventory.KeepSessionItems)
                else
                    return exports[Config.Inventories]:clearInventory(player, true, {})
                end
            end)

            if commandState then
                clearState = true
            else
                local backClear, backClearErr = pcall(function()
                    return Framework.clearInventory(client)
                end)

                if backClear then
                    clearState = true
                end
            end

            return clearState
        end

        AssetDeployer:registerDeploy('items', Framework.ESX, function(data)
            for _, item in ipairs(data) do
                MySQL.Sync.execute('INSERT INTO items (name, label, weight, rare, can_remove) VALUES (?, ?, ?, 0, 1)', {
                    item.name,
                    item.label,
                    item.weight
                })
            end

            return true
        end, ESX_ITEMS_DEPLOY)
    end
end)
