if Config.Inventory ~= "chezza" then return end

function GetAllStashes()
    local result = MySQL.query.await('SELECT identifier FROM inventories WHERE type = "stash"')
    local returnData = {}
    if result ~= nil then
        for k, v in pairs(result) do
            returnData[#returnData + 1] = {
                id = k,
                name = v.identifier,
            }
        end
        return returnData
    else
        return nil
    end
end

function GiveItemToPlayer(playerId, giveItem, giveAmount, src)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    if string.starts(giveItem, "WEAPON_") or string.starts(giveItem, "weapon_")  then
        xPlayer.addWeapon(string.upper(giveItem), 250)
    else
        xPlayer.addInventoryItem(giveItem, giveAmount)
    end
end

function ClearInventory(otherPlayerId)
    -- to be implemented
end

function GetAllOwnedVehicles()
    local query = 'SELECT plate FROM owned_vehicles'
    local result = MySQL.query.await(query)
    local returnData = {}
    if result ~= nil then
        for k, v in pairs(result) do
            returnData[#returnData + 1] = {
                id = k,
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