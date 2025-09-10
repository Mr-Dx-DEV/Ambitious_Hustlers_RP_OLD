if Config.Inventory ~= "qb" then return end

function GetItemsWithNameAndLabel()
    local returnData = {}
    for k, v in pairs(QBCore.Shared.Items) do
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
    if not Config.NewQBInventory then
        local other = {
            maxweight = 1000000,
            slots = 100,
        }
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, other)
        TriggerEvent("inventory:client:SetCurrentStash", stashName)
    else
        TriggerServerEvent("snipe-menu:server:OpenInventoryQBCompatibility", "stash", stashName)
    end
end

function OpenTrunk(vehicle, plate)
    if not Config.NewQBInventory then
        local other = {
            maxweight = 120000,
            slots = 50,
        }
        TriggerServerEvent("inventory:server:OpenInventory", "trunk", plate, other)
        TriggerEvent("inventory:client:SetCurrentTrunk", plate)
    else
        TriggerServerEvent("snipe-menu:server:OpenInventoryQBCompatibility", "stash", "trunk-"..plate)
    end
end

function OpenGlovebox(plate)
    if not Config.NewQBInventory then
        local other = {
            maxweight = 120000,
            slots = 50,
        }
        TriggerServerEvent("inventory:server:OpenInventory", "glovebox", plate, other)
        TriggerEvent("inventory:client:SetCurrentGlovebox", plate)
    else
        TriggerServerEvent("snipe-menu:server:OpenInventoryQBCompatibility", "stash", "glovebox-"..plate)
    end
end

function openJobStash(data)
    if not Config.NewQBInventory then
        local other = {
            maxweight = data.size,
            slots = data.slots,
        }
        TriggerServerEvent("inventory:server:OpenInventory", "stash", data.jobStashName, other)
        TriggerEvent("inventory:client:SetCurrentStash", data.jobStashName)
    else
        TriggerServerEvent("snipe-menu:server:OpenInventoryQBCompatibility", "stash", data.jobStashName, {maxweight = data.size, slots = data.slots})
    end
end

RegisterNetEvent("snipe-menu:client:openinventory", function(otherPlayer)
    if not Config.NewQBInventory then
        local other = {
            maxweight = 1000000,
            slots = 100,
        }
        TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", otherPlayer)
    else
        TriggerServerEvent("snipe-menu:server:OpenInventoryQBCompatibility", "player", otherPlayer)
    end
end)