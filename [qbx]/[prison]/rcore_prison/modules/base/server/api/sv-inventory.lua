Inventory.CreatePrisonerStash = function(playerId, charId)
    if not playerId then
        dbg.critical("Cannot create prisoner stash - no playerId")
        return
    end

    if not charId then
        dbg.critical("Cannot create prisoner stash - no charId")
        return
    end


    local success, result = pcall(function()
        local stash = db.CreateStashForPrisoner(charId)

        if stash then
            Inventory.SaveAndTakePrisonerItems(playerId, charId)
        else    
            local version = MySQL.Sync.fetchScalar("SELECT VERSION()", {})
        
            if not version then
                version = 'FAILED_FETCH_DB_INFORMATIONS'
            end
        
            dbg.critical("ERROR: 1. Failed to create prisoner stash, seems like issue with your database - create support ticket on our RCore discord\nKeep this message for support: DB: %s", version)        
        end
    end)

    if not success then
        dbg.critical(
        "ERROR: 2. Failed to create prisoner stash, seems like issue with your database - create support ticket on our RCore discord: %s",
            result)
    end
end

Inventory.GatherInventoryData = function(playerId)
    dbg.debugInventory("GatherInventoryData: Loading for player %s (%s)", GetPlayerName(playerId), playerId)

    local success, inventoryData = pcall(function()
        return Inventory.getInventoryItems(playerId)
    end)

    if not success then
        dbg.critical('GatherInventoryData - failure: %s', success)
    end

    local inventory, statusCode = {}, INVENTORY_STATUS_CODES.EMPTY_INVENTORY
    local p = promise.new()
    local iterCount = 0
    local id = 0

    if not inventoryData or not success then
        dbg.debugInventory('Failed to gather player inventory data for user : %s', GetPlayerName(playerId))
        return inventory, statusCode
    end

    local size = table.size(inventoryData)

    if inventoryData and next(inventoryData) then
        for k, item in pairs(inventoryData) do
            iterCount = iterCount + 1
            id = id + 1

            if item then
                local itemCount = 1

                if item.count then
                    itemCount = item.count
                end

                if item.amount then
                    itemCount = item.amount
                end

                inventory[id] = {
                    name = item and item.name or 'UNK-NAME',
                    label = item and (item.label or item.name) or 'UNK-LABEL',
                    count = itemCount,
                    metadata = item.metadata or item.info or {}
                }
            end

            if iterCount >= size then
                p:resolve(true)
                statusCode = INVENTORY_STATUS_CODES.HAS_ITEMS
            end
        end
    else
        p:resolve(true)
    end

    Citizen.Await(p)

    dbg.debugInventory("GatherInventoryData: Loaded inventory data for player %s (%s) with status: %s",
        GetPlayerName(playerId), playerId, statusCode)

    return inventory, statusCode
end

Inventory.ClearPlayerInventory = function(playerId)
    if not playerId then
        return
    end

    local retval = false

    if Config.Inventories == Inventories.OX then
        retval = Inventory.clearInventory(playerId)
    end

    if Config.Inventories == Inventories.CODEM then
        retval = Inventory.clearInventory(playerId)
    end

    if Config.Inventories == Inventories.QS then
        retval = Inventory.clearInventory(playerId)
    end

    if Config.Inventories == Inventories.CHEEZA then
        retval = Inventory.clearInventory(playerId)
    end

    if Config.Inventories == Inventories.CORE then
        retval = Framework.clearInventory(playerId)
    end

    if Config.Inventories == Inventories.NONE then
        retval = Framework.clearInventory(playerId)
    end

    if Config.Inventories == Inventories.TGIANN then
        retval = Inventory.clearInventory(playerId)
    end


    if not retval then
        retval = Framework.clearInventory(playerId)
    end

    dbg.debugInventory('ClearPlayerInevntory: State %s inventory for user %s! | FW: %s',
        retval and 'CLEARED' or 'NOT_CLEARED', GetPlayerName(playerId), Config.Framework)

    return retval
end

Inventory.HandleOpenState = function(playerId, state)
    dbg.debug('Inventory handle open for user named: %s with state %s', GetPlayerName(playerId), state)

    if not playerId then
        return false
    end

    local ply = Player(playerId)

    if not ply then
        return false
    end

    if isResourcePresentProvideless(Inventories.OX) then
        ply.state:set('invBusy', state, true)
    elseif Config.Framework == Framework.QBCore then
        ply.state:set('inv_busy', state, true)
    end

    return true
end


Inventory.SaveAndTakePrisonerItems = function(playerId, charId)
    if not Config.Stash.EnableStashing then
        return
    end


    dbg.debugInventory("SaveAndTakePrisonerItems: Loading for player %s (%s) and with charId %s", GetPlayerName(playerId),
        playerId, charId)

    local inventoryState = Config.Inventories
    local playerInventory, statusCode = Inventory.GatherInventoryData(playerId)
    local p = promise.new()

    if inventoryState ~= nil then
        dbg.debugInventory("SaveAndTakePrisonerItems: Status: %s for %s (%s)", statusCode, GetPlayerName(playerId),
            playerId)

        if statusCode == INVENTORY_STATUS_CODES.HAS_ITEMS then
            local clearInventoryState, clearInventoryRetval = pcall(function()
                return Inventory.ClearPlayerInventory(playerId)
            end)

            if clearInventoryState then
                if Config.Stash.KeepItemsState and playerInventory then
                    local size = #playerInventory

                    if size <= 0 then
                        size = table.size(playerInventory)
                    end

                    for i = 1, size, 1 do
                        local itemName = playerInventory[i].name

                        if Config.Inventories ~= Inventories.ESX and Inventory.KeepSessionItemsWithName[itemName] then
                            playerInventory[i] = {}
                        end

                        if i >= size then
                            p:resolve(true)
                            break
                        end
                    end

                    Citizen.Await(p)

                    db.SavePrisonerItems(playerInventory, charId)
                else
                    db.SavePrisonerItems(playerInventory, charId)
                end
            else
                dbg.debugInventory("SaveAndTakePrisonerItems: Failed to clear inventory for %s (%s) since error: [%s]",
                    GetPlayerName(playerId), playerId, clearInventoryRetval)
            end
        end
    else
        dbg.debugInventory(
        "SaveAndTakePrisonerItems: Inventory is not detected - skipping saving and taking prisoner items")
    end
end
