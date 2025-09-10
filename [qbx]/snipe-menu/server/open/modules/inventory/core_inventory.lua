if Config.Inventory ~= "core"  then return end

RegisterNetEvent("snipe-menu:server:openStash", function(stashName)
    local src  = source
    if not onlineAdmins[src] then return end

    exports.core_inventory:openInventory(true, stashName, 'stash', nil, nil, false, nil, false)
end)


-- do it yourself or talk to core people
function GetAllStashes()
   return {}
end

function GiveItemToPlayer(playerId, giveItem, giveAmount, src)
   exports.core_inventory:addItem(playerId, giveItem, giveAmount)
end

function ClearInventory(otherPlayerId)
    exports.core_inventory:clearInventory(otherPlayerId, otherPlayerId)
end

-- do it yourself or talk to core people
function GetAllOwnedVehicles()
    return {}
end

function RegisterStash(jobStashName, slots, size) -- only for ox

end