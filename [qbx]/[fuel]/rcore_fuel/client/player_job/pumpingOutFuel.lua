local generatorData = {}

RegisterNetEvent("rcore_fuel:selectCarToPumpOut", function()
    ShowHelpNotification(_U("select_vehicle"), false, true, 10000)
    local ped = PlayerPedId()
    local veh = LetUserSelectVehicle()
    if veh then
        if DecorExistOn(veh, DecorEnum.WRONG_FUEL) then
            local size = #GetModelDimensions(GetEntityModel(veh))
            local offsetPos = vector3((size / 2.647) * -1.8, (size / 2.647) * -0.9, 0.5)

            local generatorPos = GetOffsetFromEntityInWorldCoords(veh, offsetPos)

            for k, v in pairs(generatorData) do
                if #(generatorPos - v.pos) <= 5 then
                    ShowHelpNotification(_U("there_is_generator"), false, true, 10000)
                    return
                end
            end

            local entity = CreateLocalObject("ch_prop_ch_generator_01a", generatorPos)
            PlaceObjectOnGroundProperly(entity)

            local toInsert = {
                identifier = GenerateRandomIdentifier(),
                pos = GetEntityCoords(entity),
                model = "ch_prop_ch_generator_01a",
                heading = GetEntityHeading(veh),
                timeElapsed = 0,
            }

            DeleteEntity(entity)
            TriggerServerEvent("rcore_fuel:resetFuel", VehToNet(veh), toInsert)
        else
            ShowHelpNotification(_U("did_not_pick_wrong_fuel"), false, true, 10000)
        end
    end
end)

RegisterNetEvent("rcore_fuel:insertPump", function(data)
    table.insert(generatorData, data)
end)

RegisterNetEvent("rcore_fuel:removeFromCache", function(identifier)
    for k, v in pairs(generatorData) do
        if v.identifier == identifier then
            DeleteEntity(v.entity)

            if v.eleSound then
                v.eleSound.Destroy()
                v.eleSound = nil
            end

            if v.pumpSound then
                v.pumpSound.Destroy()
                v.pumpSound = nil
            end

            if v.modal then
                v.modal.Delete()
            end

            v.entity = nil
            v.modal = nil
            generatorData[k] = nil
            return
        end
    end
end)

RegisterNetEvent("rcore_fuel:resetFuel", function(netId)
    local vehicleEntity = NetToVeh(netId)

    SetVehicleFuel(vehicleEntity, 0.0)
    DecorRemove(vehicleEntity, DecorEnum.WRONG_FUEL)
    DecorRemove(vehicleEntity, DecorEnum.MILEAGE)
end)

CreateThread(function()
    while true do
        Wait(1000)
        for k, v in pairs(generatorData) do
            if #(GetEntityCoords(PlayerPedId()) - v.pos) <= 25 then
                if not v.entity then
                    v.entity = CreateLocalObject(v.model, v.pos)
                    SetEntityHeading(v.entity, v.heading)
                    FreezeEntityPosition(v.entity, true)

                    v.modal = CreateProgressBarAtLocation()

                    v.modal.SetPosition(GetEntityCoords(v.entity) + vector3(0, 0, 2))
                    v.modal.SetDescription(_U("pumping_out"))
                    v.modal.SetProgressBarTime(Config.FuelPumperInterval)

                    v.modal.Create()

                    v.modal.progressbarTime = ((Config.FuelPumperInterval / 1000) - v.timeElapsed)

                    if not v.modal.IsCompleted() then
                        v.eleSound = CreateSoundHandler("ele_" .. v.identifier)
                        v.eleSound.LoadSound(SoundEffect.FUEL_PUMP_SOUND_ELE_LOOP)
                        v.eleSound.SetPlayingPosition(v.pos)
                        v.eleSound.SetVolume(Config.ElectricHummingVolume or 0.4)
                        v.eleSound.SetLoop(true)
                        v.eleSound.SetAutoPlay(true)
                        v.eleSound.CreateMedia()

                        v.pumpSound = CreateSoundHandler("pump_" .. v.identifier)
                        v.pumpSound.LoadSound(SoundEffect.LIQUID_POURING_LOOP)
                        v.pumpSound.SetPlayingPosition(v.pos)
                        v.pumpSound.SetVolume(Config.LiquidVolume or 0.75)
                        v.pumpSound.SetLoop(true)
                        v.pumpSound.SetAutoPlay(true)
                        v.pumpSound.CreateMedia()
                    end
                end
            else
                if v.entity then
                    if v.modal then
                        v.modal.Delete()
                        v.modal = nil
                    end
                    if v.entity then
                        DeleteEntity(v.entity)
                    end

                    v.entity = nil
                end
            end

            if #(GetEntityCoords(PlayerPedId()) - v.pos) <= 25 then
                if v.modal then
                    if v.modal.IsCompleted() then
                        if v.eleSound then
                            v.eleSound.Destroy()
                            v.eleSound = nil
                        end

                        if v.pumpSound then
                            v.pumpSound.Destroy()
                            v.pumpSound = nil
                        end
                    end
                end
            end
            v.timeElapsed = v.timeElapsed + 1
        end
    end
end, "progress bar thread")

RegisterKey(function()
    for k, v in pairs(generatorData) do
        if #(GetEntityCoords(PlayerPedId()) - v.pos) <= 2 then
            TriggerServerEvent("rcore_fuel:removeFromCache", v.identifier)
            return
        end
    end
end, "pickupgenerator", "collect generator from ground", "E")