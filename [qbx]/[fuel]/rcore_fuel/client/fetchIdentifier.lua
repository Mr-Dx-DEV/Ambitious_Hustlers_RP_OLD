local playerIdentifier = nil

function GetPlayerIdentifier()
    while not playerIdentifier do
        Wait(1000)
    end
    return playerIdentifier
end

function CallEventForIdentifier()
    TriggerServerEvent("rcore_fuel:requestPlayerIdentifier")
end

RegisterNetEvent("rcore_fuel:requestPlayerIdentifier", function(identifier)
    playerIdentifier = identifier
end)

RegisterNetEvent('esx:playerLoaded', CallEventForIdentifier)
RegisterNetEvent("QBCore:Client:OnPlayerLoaded", CallEventForIdentifier)

CreateThread(function()
    if SharedObject then
        if SharedObject.Functions then
            if SharedObject.Functions.GetPlayerData then
                if SharedObject.Functions.GetPlayerData() then
                    CallEventForIdentifier()
                end
            end
        end

        if SharedObject.IsPlayerLoaded then
            if SharedObject.IsPlayerLoaded() then
                CallEventForIdentifier()
            end
        end
    end
end, "Fetching player identifier")
