Inventories = {
    [Inventory.jpr] = {
        AddItem = function(playerId, item, count)
            return exports['jpr-inventory']:AddItem(playerId, item, count)
        end,
        RemoveItem = function(playerId, item, count)
            return exports['jpr-inventory']:RemoveItem(playerId, item, count)
        end,
        GetItemCount = function(playerId, item)
            return exports['jpr-inventory']:GetItemCount(playerId, item)
        end
    },
    [Inventory.Tgiann] = {
        AddItem = function(playerId, item, count)
            return exports["tgiann-inventory"]:AddItem(playerId, item, count)
        end,
        RemoveItem = function(playerId, item, count)
            return exports["tgiann-inventory"]:RemoveItem(playerId, item, count)
        end,
        GetItemCount = function(playerId, item)
            local item = exports['tgiann-inventory']:GetItemByName(playerId, item)
            if item then
                return item.amount
            else
                return 0
            end
        end
    },
    [Inventory.Origen] = {
        AddItem = function(playerId, item, count)
            return exports["origen_inventory"]:AddItem(playerId, item, count)
        end,
        RemoveItem = function(playerId, item, count)
            return exports["origen_inventory"]:RemoveItem(playerId, item, count)
        end,
        GetItemCount = function(playerId, item)
            return exports["origen_inventory"]:GetItemTotalAmount(playerId, item)
        end
    },
    [Inventory.OX] = {
        AddItem = function(playerId, item, count)
            return exports["ox_inventory"]:AddItem(playerId, item, count)
        end,
        RemoveItem = function(playerId, item, count)
            return exports["ox_inventory"]:RemoveItem(playerId, item, count)
        end,
        GetItemCount = function(playerId, item)
            return exports["ox_inventory"]:GetItemCount(playerId, item)
        end
    },
    [Inventory.CodeM] = {
        AddItem = function(playerId, item, count)
            return exports['codem-inventory']:AddItem(playerId, item, count)
        end,
        RemoveItem = function(playerId, item, count)
            return exports['codem-inventory']:RemoveItem(playerId, item, count)
        end,
        GetItemCount = function(playerId, item)
            return exports['codem-inventory']:GetItemsTotalAmount(playerId, item)
        end
    },
    [Inventory.LJ] = {
        AddItem = function(playerId, item, count)
            return exports["lj_inventory"]:AddItem(playerId, item, count)
        end,
        RemoveItem = function(playerId, item, count)
            return exports["lj_inventory"]:RemoveItem(playerId, item, count)
        end,
        GetItemCount = function(playerId, item)
            local itemByName = exports["lj_inventory"]:GetItemByName(playerId, item)
            return itemByName and itemByName.amount or 0
        end
    },
    [Inventory.MF] = {
        AddItem = function(playerId, item, count)
            local identifier = GetPlayerIdentifier(playerId)
            return exports["mf_inventory"]:addInventoryItem(identifier, item, count, playerId)
        end,
        RemoveItem = function(playerId, item, count)
            local identifier = GetPlayerIdentifier(playerId)
            return exports["mf_inventory"]:removeInventoryItem(identifier, item, count, playerId)
        end,
        GetItemCount = function(playerId, item)
            local identifier = GetPlayerIdentifier(playerId)
            local item = exports["mf_inventory"]:getInventoryItem(identifier, item)
            return item and item.count or 0
        end
    },
    [Inventory.PS] = {
        AddItem = function(playerId, item, count)
            return exports["ps_inventory"]:AddItem(playerId, item, count)
        end,
        RemoveItem = function(playerId, item, count)
            local itemByName = exports["ps_inventory"]:RemoveItem(playerId, item, count)
            return itemByName and itemByName.amount or 0
        end,
        GetItemCount = function(playerId, item)
            local itemByName = exports["ps_inventory"]:GetItemByName(playerId, item)
            return itemByName and itemByName.amount or 0
        end
    },
    [Inventory.QS] = {
        AddItem = function(playerId, item, count)
            return exports['qs-inventory']:AddItem(playerId, item, count)
        end,
        RemoveItem = function(playerId, item, count)
            return exports['qs-inventory']:RemoveItem(playerId, item, count)
        end,
        GetItemCount = function(playerId, item)
            return exports['qs-inventory']:GetItemTotalAmount(playerId, item)
        end
    },
    [Inventory.Framework] = {
        AddItem = function(playerId, item, count)
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer then
                xPlayer.addInventoryItem(item, count)
            end
        end,
        RemoveItem = function(playerId, item, count)
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer then
                local invCount = GetPlayerCasinoItemCount(playerId, item)
                if invCount < count then
                    count = invCount
                end
                xPlayer.removeInventoryItem(item, count)
            end
        end,
        GetItemCount = function(playerId, item)
            local xPlayer = ESX.GetPlayerFromId(playerId)
            if xPlayer then
                local xItem = xPlayer.getInventoryItem(item)
                if xItem then
                    return xItem.count or xItem.amount or 0
                end
            end
            return 0
        end
    }
}

-- adds casino inventory item
function AddCasinoItem(playerId, item, count)
    DebugStart("AddCasinoItem")
    local inventoryResource = GetInventoryResource()
    local inv = Inventories[inventoryResource]
    if inv then
        inv.AddItem(playerId, item, count)
    else
        print("Inventory resource not found")
    end
end

-- removes casino inventory item
function RemoveCasinoItem(playerId, item, count)
    DebugStart("RemoveCasinoItem")
    local inventoryResource = GetInventoryResource()
    local inv = Inventories[inventoryResource]
    if inv then
        inv.RemoveItem(playerId, item, count)
    else
        print("Inventory resource not found")
    end
end

-- get player casino inventory item count (chips, snacks...)
function GetPlayerCasinoItemCount(playerId, item)
    DebugStart("GetPlayerCasinoItemCount")
    local inventoryResource = GetInventoryResource()
    local inv = Inventories[inventoryResource]
    if inv then
        return inv.GetItemCount(playerId, item)
    else
        print("Inventory resource not found")
    end
end

local currentInventory
function GetInventoryResource()
    if Config.InventoryResource and Config.InventoryResource ~= Inventory.AutoChoose then
        return Config.InventoryResource
    end

    if currentInventory then
        return currentInventory
    end

    for k, v in pairs(InventoryResourceName) do
        if IsResourceStarted(v) then
            currentInventory = k
            return k
        end
    end
    currentInventory = Inventory.Framework
    return Inventory.Framework
end
