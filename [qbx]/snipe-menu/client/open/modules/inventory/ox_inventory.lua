if Config.Inventory ~= "ox" then return end

function GetItemsWithNameAndLabel()
    local returnData = {}
    for k, v in pairs(exports.ox_inventory:Items()) do
        if type(v) == "table" then
            if v.label then
                returnData[#returnData + 1] = {
                    id = k,
                    name = v.label or "No Label Item",
                }
            end
        end
    end
    return returnData
end

function OpenStash(stashName, owner)
    if owner ~= "" then
        if not exports.ox_inventory:openInventory('stash', { id = stashName, owner = owner }) then
            TriggerServerEvent("snipe-menu:server:registerStash", stashName)
            exports.ox_inventory:openInventory('stash', { id = stashName, owner = owner })
        end
    else
        if not exports.ox_inventory:openInventory('stash', stashName) then
            TriggerServerEvent("snipe-menu:server:registerStash", stashName)
            exports.ox_inventory:openInventory('stash', stashName)
        end
    end
end

function OpenTrunk(vehicle, plate)
end

function OpenGlovebox(plate)
end

function openJobStash(data)
    exports.ox_inventory:openInventory('stash', data.jobStashName)

end

RegisterNetEvent("snipe-menu:client:openinventory", function(otherPlayer)
    TriggerServerEvent("snipe-menu:server:openInventory", otherPlayer)
end)