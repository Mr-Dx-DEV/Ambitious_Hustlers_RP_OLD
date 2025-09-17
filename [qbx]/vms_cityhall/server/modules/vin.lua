local function GenerateVIN()
    local vin = ""
    local chars = "0123456789ABCDEFGHJKLMNPRSTUVWXYZ"
    
    for i = 1, 17 do
        local randIndex = math.random(1, #chars)
        vin = vin .. chars:sub(randIndex, randIndex)
    end

    local isExist = MySQL.scalar.await(("SELECT 1 FROM `%s` WHERE `%s` = ?"):format(
        Config.Core == "ESX" and SV.Database['esx']['table:owned_vehicles'] or Config.Core == "QB-Core" and SV.Database['qbcore']['table:player_vehicles'],
        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:vin'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:vin']
    ), {vin})
    if isExist then
        return GenerateVIN()
    end

    return vin
end
exports('GenerateVIN', GenerateVIN)


RegisterCommand('_generatevin', function(src)
    if src ~= 0 then
        return
    end

    print('^3[MODULE:VIN_GENERATE]^8 Do not restart server!^7')
    Citizen.Wait(200)
    MySQL.Async.fetchAll(('SELECT * FROM `%s`'):format(
        Config.Core == "ESX" and SV.Database['esx']['table:owned_vehicles'] or Config.Core == "QB-Core" and SV.Database['qbcore']['table:player_vehicles']
    ), {}, function(result)
        if result and result[1] then
            local remaining = #result
            for k, v in pairs(result) do
                remaining = remaining - 1
                if not v[Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:vin'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:vin']] then
                    local vehicleVIN = GenerateVIN()
                    MySQL.prepare(("UPDATE `%s` SET `%s` = ? WHERE `%s` = ?"):format(
                        Config.Core == "ESX" and SV.Database['esx']['table:owned_vehicles'] or Config.Core == "QB-Core" and SV.Database['qbcore']['table:player_vehicles'],
                        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:vin'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:vin'],
                        Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:plate'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:plate']
                    ), {vehicleVIN, v[Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:plate'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:plate']]}, function(results)
                        if results then
                            print(('^2[SUCCESS]^7 Generated VIN ^4%s^7 for ^5%s^7 (Remaining: %s)^7'):format(vehicleVIN, v[Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:plate'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:plate']], remaining))
                        else
                            print(('^8[ERROR]^7 Not generated VIN ^4%s^7 for ^5%s^7 (Remaining: %s)^7'):format(vehicleVIN, v[Config.Core == "ESX" and SV.Database['esx']['column-owned_vehicles:plate'] or Config.Core == "QB-Core" and SV.Database['qbcore']['column-player_vehicles:plate']], remaining))
                        end
                    end)
                    Citizen.Wait(300)
                end
            end
            print('^3[MODULE:VIN_GENERATE]^7 Correctly generated VIN for each user!')
        else
            print('^3[MODULE:VIN_GENERATE]^7 No users found!')
        end
    end)
end, true)