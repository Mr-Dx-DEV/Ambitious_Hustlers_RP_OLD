if Config.Inventory ~= "chezza" then return end
function GetItemsWithNameAndLabel()
    local p = promise.new()
    TriggerCallback("snipe-menu:server:getAllItems", function(result)
        p:resolve(result)
    end)
    local Items = Citizen.Await(p)
    local returnData = {}
    for k, v in pairs(Items) do
        returnData[#returnData + 1] = {
            id = k,
            name = v.label or "No Label Item",
        }
    end
    return returnData
end

function OpenStash(stashName, owner)
    TriggerEvent('inventory:openInventory', {
        type = "stash", -- "type" in database
        id = stashName, -- "identifier" in database
        title = "Stash", 
        weight = 1000000, -- set to false for no weight,
        delay = 100,
        save = true -- save to database true or false
    })
end

function OpenTrunk(vehicle, plate)
    TriggerEvent('inventory:openTrunkGlovebox', 'trunk', plate, 100)

end

function OpenGlovebox(plate)
    TriggerEvent('inventory:openTrunkGlovebox', 'glovebox', plate, 10)

end

function openJobStash(data)
    TriggerEvent('inventory:openInventory', {
        type = "stash", -- "type" in database
        id = data.jobStashName, -- "identifier" in database
        title = "Stash", 
        weight = data.size, -- set to false for no weight,
        delay = 100,
        save = true -- save to database true or false
    })
end

RegisterNetEvent("snipe-menu:client:openinventory", function(otherPlayer)
    TriggerEvent("inventory:openPlayerInventory", otherPlayer, false)
end)