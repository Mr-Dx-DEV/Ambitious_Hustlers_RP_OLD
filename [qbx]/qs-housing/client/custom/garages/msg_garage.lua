if Config.Garage ~= 'msk_garage' then
    return
end

function TriggerHouseUpdateGarage()
    return
end

function OpenGarage(house)
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())
    exports.msk_garage:openGarage({
        label = house,
        garageId = house,
        parkInCoords = coords,
        parkOutCoords = {
            vec4(coords.x, coords.y, coords.z, heading)
        },
        distance = 20.0,          -- Park In Radius
        warp = false,             -- Teleport into vehicle
        type = { 'car', 'truck' } -- 'car', 'truck', 'airplane', ...
    })
end

CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(PlayerPedId())
        if ped and CurrentHouse ~= nil and (CurrentHouseData.haskey or not Config.Houses[CurrentHouse].locked) and Config.Houses and Config.Houses[CurrentHouse] and Config.Houses[CurrentHouse].garage and Config.Houses[CurrentHouse].garage.x then
            local dist = #(pos - vector3(Config.Houses[CurrentHouse].garage.x, Config.Houses[CurrentHouse].garage.y, Config.Houses[CurrentHouse].garage.z))
            if dist < 5.0 then
                DrawMarker(20, Config.Houses[CurrentHouse].garage.x, Config.Houses[CurrentHouse].garage.y, Config.Houses[CurrentHouse].garage.z + 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.15, 120, 10, 20, 155, false, false, false, 1, false, false, false)
                if dist < 2.0 then
                    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    if Config.Houses[CurrentHouse].garage and Config.Houses[CurrentHouse].garage.x and Config.Houses[CurrentHouse].garage.y and Config.Houses[CurrentHouse].garage.z then
                        if vehicle and vehicle ~= 0 then
                            DrawText3Ds(Config.Houses[CurrentHouse].garage.x, Config.Houses[CurrentHouse].garage.y, Config.Houses[CurrentHouse].garage.z + 0.3, Lang('HOUSING_DRAWTEXT_GARAGE_STORE'), 'open_garage1', 'E')

                            if IsControlJustPressed(0, Keys['E']) or IsDisabledControlJustPressed(0, Keys['E']) then
                                --OpenGarage(CurrentHouse)
                            end
                        else
                            DrawText3Ds(Config.Houses[CurrentHouse].garage.x, Config.Houses[CurrentHouse].garage.y, Config.Houses[CurrentHouse].garage.z + 0.3, Lang('HOUSING_DRAWTEXT_GARAGE_STORE'), 'open_garage2', 'E')

                            if IsControlJustPressed(0, Keys['E']) or IsDisabledControlJustPressed(0, Keys['E']) then
                                OpenGarage(CurrentHouse)
                            end
                        end
                    end
                end
            else
                Wait(1000)
            end
        end
    end
end)
