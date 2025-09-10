if Config.Inventory ~= "codem" then return end

function GetAllStashes()

    local result = MySQL.query.await('SELECT stashname FROM codem_new_stash')

    local returnData = {}
    if result ~= nil then
        for k, v in pairs(result) do
            returnData[#returnData + 1] = {
                id = v.id,
                name = v.stashname,
            }
        end
        return returnData
    else
        return nil
    end
    
end

function GiveItemToPlayer(playerId, giveItem, giveAmount, src)
    exports['codem-inventory']:AddItem(playerId, giveItem, giveAmount)
end

function ClearInventory(otherPlayerId)
    exports['codem-inventory']:ClearInventory(otherPlayerId)
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