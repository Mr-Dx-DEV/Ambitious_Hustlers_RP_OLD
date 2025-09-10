if Config.Inventory ~= "qb" then return end

if Config.NewQBInventory then
    RegisterServerEvent("snipe-menu:server:OpenInventoryQBCompatibility", function(_type, inventoryName, data)

        local source = source
        if not onlineAdmins[source] then return end
        if _type == "stash" then
            exports['qb-inventory']:OpenInventory(source, inventoryName, data or nil)
        end

        if _type == "player" then
            exports['qb-inventory']:OpenInventoryById(source, inventoryName)
        end
        
    end)
end

function GetAllStashes()
    if Config.NewQBInventory then
        local result = MySQL.query.await('SELECT id, identifier FROM inventories WHERE identifier NOT LIKE "%glovebox%" AND identifier NOT LIKE "%trunk%"')
        local returnData = {}
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = v.id,
                    name = v.identifier,
                }
            end
            return returnData
        else
            return nil
        end
    else
        local result = MySQL.query.await('SELECT id, stash FROM stashitems')
        local returnData = {}
        if result ~= nil then
            for k, v in pairs(result) do
                returnData[#returnData + 1] = {
                    id = v.id,
                    name = v.stash,
                }
            end
            return returnData
        else
            return nil
        end
    end
end

function GiveItemToPlayer(playerId, giveItem, giveAmount, src)
    local Player = QBCore.Functions.GetPlayer(playerId)
    local ItemInfo = QBCore.Shared.Items[giveItem]
    local type =  QBCore.Shared.Items[giveItem]["type"]
    if type == "weapon" then
        giveAmount = 1
    end
    local info = GetItemMetadataInfo(playerId, giveItem, QBCore.Shared.Items[giveItem]["type"])
    if Player.Functions.AddItem(giveItem, giveAmount, false, info) then
        TriggerClientEvent('inventory:client:ItemBox', playerId, QBCore.Shared.Items[giveItem], "add")
    end
end

function ClearInventory(otherPlayerId)
    local otherPlayer = QBCore.Functions.GetPlayer(otherPlayerId)
    otherPlayer.Functions.ClearInventory()
end

function GetAllOwnedVehicles()
    local result = MySQL.query.await('SELECT plate, vehicle FROM player_vehicles')
    local returnData = {}
    if result ~= nil then
        for k, v in pairs(result) do
            returnData[#returnData + 1] = {
                id = v.vehicle,
                name = v.plate,
            }
        end
        return returnData
    else
        return nil
    end
end

function RegisterStash(jobStashName, slots, size) -- only for ox

end