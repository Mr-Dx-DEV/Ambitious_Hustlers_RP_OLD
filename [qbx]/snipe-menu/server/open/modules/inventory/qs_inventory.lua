if Config.Inventory ~= "qsv2" then return end

function RegisterStash(jobStashName, slots, size) -- only for ox

end

function GetAllStashes()
    local result = MySQL.query.await('SELECT id, stash FROM inventory_stash')
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

function GiveItemToPlayer(playerId, giveItem, giveAmount, src)
    exports['qs-inventory']:AddItem(playerId, giveItem, giveAmount)
end

function ClearInventory(otherPlayerId)
    exports['qs-inventory']:ClearInventory(otherPlayerId, {})
end

function GetAllOwnedVehicles()
    local result = MySQL.query.await('SELECT plate FROM inventory_trunk')
    local returnData = {}
    if result ~= nil then
        for k, v in pairs(result) do
            returnData[#returnData + 1] = {
                id = k,
                name = v.plate,
            }
        end
    else
        returnData = {}
    end

    local result = MySQL.query.await('SELECT plate FROM inventory_glovebox')
    if result ~= nil then
        for k, v in pairs(result) do
            returnData[#returnData + 1] = {
                id = k,
                name = v.plate,
            }
        end
    else
        returnData = nil
    end
    return returnData
end