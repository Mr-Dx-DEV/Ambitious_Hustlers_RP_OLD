if Config.Inventory ~= "codem" then return end

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

    TriggerServerEvent('codem-inventory:server:openstash', stashName, 100,1000000, 'Stash')
    
end

function OpenTrunk(vehicle, plate)
    TriggerServerEvent('codem-inventory:server:openstash', "stash", "trunk-"..plate)
    
end

function OpenGlovebox(plate)
    TriggerServerEvent('codem-inventory:server:openstash', "stash", "glovebox-"..plate)
end

function openJobStash(data)
    TriggerServerEvent('codem-inventory:server:openstash', data.jobStashName, data.slots,data.size, 'Stash')
end

RegisterNetEvent("snipe-menu:client:openinventory", function(otherPlayer)
    TriggerEvent('codem-inventory:client:openplayerinventory', otherPlayer)
end)