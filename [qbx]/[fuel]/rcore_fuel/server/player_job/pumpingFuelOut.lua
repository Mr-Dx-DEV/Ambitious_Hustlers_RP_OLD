local insertedData = {}

RegisterNetEvent("rcore_fuel:resetFuel", function(netId, insert)
    local ownerServerID = NetworkGetEntityOwner(NetworkGetEntityFromNetworkId(netId))
    if #(GetEntityCoords(NetworkGetEntityFromNetworkId(netId)) - GetEntityCoords(GetPlayerPed(source))) <= 10 then
        TriggerClientEvent("rcore_fuel:insertPump", -1, insert)
        insertedData[insert.identifier] = insert.pos
        RemovePlayerItem(source, "fuel_pump", 1)
    end

    Wait(Config.FuelPumperInterval)
    if insertedData[insert.identifier] then
        ownerServerID = NetworkGetEntityOwner(NetworkGetEntityFromNetworkId(netId))
        if #(GetEntityCoords(NetworkGetEntityFromNetworkId(netId)) - insert.pos) <= 10 then
            TriggerClientEvent("rcore_fuel:resetFuel", ownerServerID, netId)
        end
    end
end)

RegisterNetEvent("rcore_fuel:removeFromCache", function(identifier)
    if insertedData[identifier] then
        if #(insertedData[identifier] - GetEntityCoords(GetPlayerPed(source))) <= 10 then
            if CanPlayerCarryItem(source, "fuel_pump", 1) then
                insertedData[identifier] = nil
                TriggerClientEvent("rcore_fuel:removeFromCache", -1, identifier)
                AddPlayerItem(source, "fuel_pump", 1)
            end
        end
    end
end)