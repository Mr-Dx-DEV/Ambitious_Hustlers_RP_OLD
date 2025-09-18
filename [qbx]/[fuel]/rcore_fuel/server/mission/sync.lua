RegisterNetEvent("rcore_fuel:processBarrelLocation:setStatus", function(key, val, netID)
    Config.ProcessingLocationForBarrel[key].busy = val
    if val then
        Config.ProcessingLocationForBarrel[key].entity = netID
        Config.ProcessingLocationForBarrel[key].source = source
    else
        Config.ProcessingLocationForBarrel[key].entity = nil
        Config.ProcessingLocationForBarrel[key].source = nil
    end
    TriggerClientEvent("rcore_fuel:processBarrelLocation:setStatus", -1, key, val)
end)

RegisterNetEvent("rcore_fuel:missionFuelpipe:setStatus", function(status)
    if Config.MissionFuelPipe.source then
        return
    end
    Config.MissionFuelPipe.source = source
    TriggerClientEvent("rcore_fuel:missionFuelpipe:setStatus", -1, status)
end)

function WipeDataForMissionSource(source)
    if Config.MissionFuelPipe.source == source then
        TriggerClientEvent("rcore_fuel:missionFuelpipe:setStatus", -1, false)
    end

    for k, v in pairs(Config.ProcessingLocationForBarrel) do
        if v.source == source then
            TriggerClientEvent("rcore_fuel:processBarrelLocation:setStatus", -1, k, false)

            local entity = NetworkGetEntityFromNetworkId(Config.ProcessingLocationForBarrel[k].entity)
            if DoesEntityExist(entity) then
                DeleteEntity(entity)
            end

            Config.ProcessingLocationForBarrel[k].entity = nil
            Config.ProcessingLocationForBarrel[k].source = nil
            return
        end
    end
end

AddEventHandler('playerDropped', function()
    local source = source
    RefundCompanyMoney(source)
    WipeDataForMissionSource(source)
end)