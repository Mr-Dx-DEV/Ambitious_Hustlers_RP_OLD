if Config.Garage ~= 'RxGarages' then
    return
end

function TriggerHouseUpdateGarage() end

function StoreVehicle(UniqueHouseId)
    exports['RxGarages']:ParkVehicle("House Garage ("..tostring(UniqueHouseId)..")", 'garage', 'car')
end

function OpenGarage(UniqueHouseId, coords)
    exports['RxGarages']:OpenGarage("House Garage ("..tostring(UniqueHouseId)..")", 'garage', 'car', coords)
end

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        if CurrentHouse ~= nil and (CurrentHouseData.haskey or not Config.Houses[CurrentHouse].locked) and Config.Houses and Config.Houses[CurrentHouse] and Config.Houses[CurrentHouse].garage then
            local garage = Config.Houses[CurrentHouse].garage
            local dist = GetDistanceBetweenCoords(pos, garage.x, garage.y, garage.z, true)

            if dist < 5.0 then
                DrawMarker(20, garage.x, garage.y, garage.z + 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 120, 10, 20, 155, false, false, false, 1, false, false, false)

                if dist < 2.0 then
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

                    if vehicle and vehicle ~= 0 then
                        DrawText3D(garage.x, garage.y, garage.z + 0.3, 'GARAGE', 'open_garage1', 'E')
                        if IsControlJustPressed(0, Keys['E']) or IsDisabledControlJustPressed(0, Keys['E']) then
                            StoreVehicle(CurrentHouse)
                        end
                    else
                        DrawText3D(garage.x, garage.y, garage.z + 0.3, 'GARAGE', 'open_garage2', 'E')
                        if IsControlJustPressed(0, Keys['E']) or IsDisabledControlJustPressed(0, Keys['E']) then
                            OpenGarage(CurrentHouse, vector3(garage.x, garage.y, garage.z))
                        end
                    end
                end
            else
                Wait(1000)
            end
        end
    end
end)
