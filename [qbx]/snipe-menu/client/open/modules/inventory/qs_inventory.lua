if Config.Inventory ~= "qsv2" then return end

function GetItemsWithNameAndLabel()
    local returnData = {}
    local itemList = exports['qs-inventory']:GetItemList()
    for k, v in pairs(itemList) do
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
    TriggerServerEvent("inventory:server:OpenInventory", "stash", stashName, {
        maxweight = 1000000,
        slots = 100,
    })
    TriggerEvent("inventory:client:SetCurrentStash", stashName)
end

function OpenTrunk(vehicle, plate)
    local other = {
        maxweight = 120000,
        slots = 50,
    }
    TriggerServerEvent("inventory:server:OpenInventory", "trunk", plate, other)
    TriggerEvent("inventory:client:SetCurrentTrunk", plate)
end

function OpenGlovebox(plate)
    TriggerServerEvent("inventory:server:OpenInventory", "glovebox", plate, other)
    TriggerEvent("inventory:client:SetCurrentGlovebox", plate)
end

function openJobStash(data)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", data.jobStashName, {
        maxweight = data.size,
        slots = data.slots,
    })
    TriggerEvent("inventory:client:SetCurrentStash", data.jobStashName)
end

RegisterNetEvent("snipe-menu:client:openinventory", function(otherPlayer)
    TriggerServerEvent("inventory:server:OpenInventory", "otherplayer", otherPlayer)
end)