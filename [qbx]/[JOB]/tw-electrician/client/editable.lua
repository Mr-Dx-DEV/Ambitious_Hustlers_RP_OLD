function ShowUniversalInteraction(interactionId, coords, text, distance, interactionOptions)
    if coords and type(coords) == "table" and coords.x then
        if text and type(text) == "string" then
            DrawText3D(coords.x, coords.y, coords.z, text)
        end
    else
        if text and type(text) == "string" then
            DrawText3D(coords.x, coords.y, coords.z, text)
        end
    end

    if interactionOptions and interactionOptions[1] and interactionOptions[1].onSelect and
        type(interactionOptions[1].onSelect) == "function" and
        IsControlJustPressed(0, tonumber(interactionId) or 38) and not IsPedInAnyVehicle(PlayerPedId(), false) then
        interactionOptions[1].onSelect()
    end
end

function drawTextForTrafo()
    Citizen.CreateThread(function()
        local wait = 1000

        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                local playerCoords = GetEntityCoords(PlayerPedId())
                local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)

                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regiontrafficLampCoords) do
                    local trafodistance = #(playerCoords - vector3(value.regionFixedTrafo.coords.x, value.regionFixedTrafo.coords.y, value.regionFixedTrafo.coords.z))

                    if trafodistance < 25.0 and not value.regionFixedTrafo.fixed then
                        wait = 0
                        DrawMarker(2, value.regionFixedTrafo.coords.x, value.regionFixedTrafo.coords.y,
                            value.regionFixedTrafo.coords.z + 1.0, 0, 0.75, 0.75, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255,
                            210, 0, 0.10, 0, 0, 0, 0.0, 0)

                        if trafodistance < 4.0 and not value.regionFixedTrafo.fixed and not isInteracting then
                            ShowUniversalInteraction(
                                Config.InteractionKeys['E'],
                                vector3(value.regionFixedTrafo.coords.x, value.regionFixedTrafo.coords.y,
                                    value.regionFixedTrafo.coords.z + 0.2),
                                "[E] - " .. (Locales[Config.Locale]['regionFixedTrafoText']),
                                5.0,
                                {
                                    {
                                        onSelect = function()
                                            TrafoInteraction(value)
                                        end
                                    }
                                }
                            )

                            if not electricianData.activeSmokeEffectsTrafo[index] then
                                electricianData.activeSmokeEffectsTrafo[index] = CreateSmokeEffect(value
                                    .regionFixedTrafo.coords)
                            end
                        end
                    else
                        if electricianData.activeSmokeEffectsTrafo[index] then
                            RemoveSmokeEffect(electricianData.activeSmokeEffectsTrafo[index])
                            electricianData.activeSmokeEffectsTrafo[index] = nil
                        end
                    end
                end
            end
            Citizen.Wait(wait)
        end
    end)
end

function TrafoInteraction(value)
    StartInteraction()
    local missionPermit = TriggerServerCallback(_event('server:getMissionsDetails'), {
        owneridentifier = CoopDataClient.roomSetting.owneridentifier,
        missionControl = 'trafoopen'
    })
    if missionPermit then
        SetNuiFocus(true, true)
        NuiMessage('SWITCH_MINIGAME', {
            key = value.regiontrafficKey,
            missionName = false,
            coords = value.regionFixedTrafo.coords
        })
    else
        Config.sendNotification(Config.NotificationText['missionnotpermit'].text)
    end

    SetTimeout(1000, function()
        EndInteraction()
    end)
end

function drawTextForTrafic()
    Citizen.CreateThread(function()
        local sleep = 1000

        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                local playerCoords = GetEntityCoords(PlayerPedId())
                local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)

                for index, vv in ipairs(CoopDataClient.roomSetting.Mission.regiontrafficLampCoords) do
                    if vv.regionFixedTrafo.fixed then
                        sleep = 0
                        for trafficIndex, selectedCoords in ipairs(vv.regionTrafficCoords) do
                            local coordsKey = string.format("%f,%f,%f", selectedCoords.coords.x, selectedCoords.coords.y,
                                selectedCoords.coords.z)
                            if not createdBlips[coordsKey] then
                                addBlipsFunctions(selectedCoords.coords, 'Traffic Light', 'fixTrafficLamp2', 4)
                                createdBlips[coordsKey] = true
                            end

                            local trafodistance = #(playerCoords - vector3(selectedCoords.coords.x, selectedCoords.coords.y, selectedCoords.coords.z))

                            if trafodistance < 10.0 and not selectedCoords.fixed and not isInteracting then
                                ShowUniversalInteraction(
                                    Config.InteractionKeys['E'],
                                    vector3(selectedCoords.coords.x, selectedCoords.coords.y,
                                        selectedCoords.coords.z + 1.0),
                                    "[E] - " .. (Locales[Config.Locale]['fixTrafficLamp']),
                                    5.0,
                                    {
                                        {
                                            onSelect = function()
                                                if trafodistance < 5.0 then
                                                    handleTrafficLamp(selectedCoords)
                                                end
                                            end
                                        }
                                    }
                                )
                            end
                        end
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end)
end

function handleTrafficLamp(selectedCoords)
    StartInteraction()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        if selectedCoords.open then
            Config.sendNotification(Config.NotificationText['missionnotpermit'].text)
        else
            SetNuiFocus(true, true)
            NuiMessage('WIRING_MINIGAME',
                { coords = selectedCoords.coords, missionName = 'fixTrafficLamp' })
            TriggerServerEvent(_event('server:trafficLightsOpenStatus'),
                CoopDataClient.roomSetting.owneridentifier, selectedCoords.coords,
                true)
        end
    end

    SetTimeout(1000, function()
        EndInteraction()
    end)
end

function drawTextForHouseBoard()
    Citizen.CreateThread(function()
        local sleep = 1000

        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                local playerCoords = GetEntityCoords(PlayerPedId())
                local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)

                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regionhouseBoardCoords) do
                    local trafodistance = #(playerCoords - vector3(value.coords.x, value.coords.y, value.coords.z))

                    if trafodistance < 10.0 and not value.fixed then
                        sleep = 0
                        DrawMarker(2, value.coords.x, value.coords.y, value.coords.z + 0.5, 0, 0.75, 0.75, 0, 0, 0, 0.5,
                            0.5, 0.5, 255, 255, 255, 210, 0, 0.10, 0, 0, 0, 0.0, 0)
                        if trafodistance < 5.0 and not value.fixed and not isInteracting then
                            ShowUniversalInteraction(
                                Config.InteractionKeys['E'],
                                vector3(value.coords.x, value.coords.y, value.coords.z + 0.2),
                                "[E] - " .. (Locales[Config.Locale]['fixHouseBoard']),
                                5.0,
                                {
                                    {
                                        onSelect = function()
                                            handleHouseBoard(value, index)
                                        end
                                    }
                                }
                            )

                            if not electricianData.activeSmokeEffectsHouseBoard[index] and not value.fixed and not value.open then
                                electricianData.activeSmokeEffectsHouseBoard[index] = CreateSmokeEffect(value.coords)
                            end
                        end
                    else
                        if electricianData.activeSmokeEffectsHouseBoard[index] then
                            RemoveSmokeEffect(electricianData.activeSmokeEffectsHouseBoard[index])
                            electricianData.activeSmokeEffectsHouseBoard[index] = nil
                        end
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end)
end

function handleHouseBoard(value, index)
    StartInteraction()
    if not playerInVehicle then
        local missionPermit = TriggerServerCallback(_event('server:getTrafoModal'), {
            owneridentifier = CoopDataClient.roomSetting.owneridentifier,
            missionName = 'fixHouseBoard',
            coords = value.coords,
            index = index
        })

        if missionPermit then
            SetNuiFocus(true, true)
            NuiMessage('SWITCH_MINIGAME_HOUSE',
                {
                    coords = value.coords,
                    missionName = 'fixHouseBoard',
                    fixed = value
                        .fixed
                })
            TriggerServerEvent(_event('server:changeTrafoModal'),
                CoopDataClient.roomSetting.owneridentifier, index, value.coords,
                'fixHouseBoard', true)
        else
            Config.sendNotification(Config.NotificationText['missionnotpermit'].text)
        end
    end

    SetTimeout(1000, function()
        EndInteraction()
    end)
end

function drwTextForstreetTrafo()
    Citizen.CreateThread(function()
        local smokeEffect = nil
        local sleep = 1000

        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regionstreetTrafoCoords) do
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local trafodistance = #(playerCoords - vector3(value.coords.x, value.coords.y, value.coords.z))
                    local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)

                    if trafodistance < 10 and not value.fixed then
                        sleep = 0
                        DrawMarker(2, value.coords.x, value.coords.y,
                            value.coords.z + 1.0, 0, 0.75, 0.75, 0,
                            0,
                            0,
                            0.5,
                            0.5, 0.5, 255, 255, 255, 210, 0, 0.10, 0, 0, 0, 0.0, 0)
                        if trafodistance < 10.0 and not value.fixed and not isInteracting then
                            ShowUniversalInteraction(Config.InteractionKeys['E'],
                                vector3(value.coords.x, value.coords.y, value.coords.z + 0.2),
                                "[E] - " .. Locales[Config.Locale]['fixTrafo'],
                                5.0,
                                {
                                    {
                                        onSelect = function()
                                            if trafodistance < 5.0 then
                                                handleStreetTrafo(value)
                                            end
                                        end
                                    }
                                })

                            if not electricianData.activeSmokeEffectsstreetTrafo[index] then
                                electricianData.activeSmokeEffectsstreetTrafo[index] = CreateSmokeEffect(value.coords)
                            end
                        end
                    else
                        if electricianData.activeSmokeEffectsstreetTrafo[index] then
                            RemoveSmokeEffect(electricianData.activeSmokeEffectsstreetTrafo[index])
                            electricianData.activeSmokeEffectsstreetTrafo[index] = nil
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

function handleStreetTrafo(value, index)
    StartInteraction()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        local missionPermit = TriggerServerCallback(
            _event('server:getTrafoModal'),
            {
                owneridentifier = CoopDataClient.roomSetting.owneridentifier,
                missionName = 'fixTrafo',
                coords = value.coords,
                index = index
            })
        if missionPermit then
            SetNuiFocus(true, true)
            NuiMessage('SWITCH_MINIGAME_HOUSE',
                {
                    coords = value.coords,
                    missionName = 'fixTrafo',
                    fixed = value.fixed
                })
            TriggerServerEvent(_event('server:changeTrafoModal'),
                CoopDataClient.roomSetting.owneridentifier, index,
                value.coords, 'fixTrafo', true)
        else
            Config.sendNotification(Config.NotificationText
                ['missionnotpermit'].text)
        end
    end
    SetTimeout(1000, function()
        EndInteraction()
    end)
end

function liftdrawtextphonePole()
    Citizen.CreateThread(function()
        while true do
            local sleep = 1000
            local room = CoopDataClient and CoopDataClient.roomSetting
            if room and (room.startJob or room.finishJob) then
                local mission = room.Mission
                local playerPed = PlayerPedId()
                local playerCoords = GetEntityCoords(playerPed)
                local playerInVehicle = IsPedInAnyVehicle(playerPed, false)

                for index, pole in ipairs(mission.regionphonePoleCoords) do
                    if not pole.fixed and not room.liftCraft then
                        if room.regionJobVehiclePlate and type(room.regionJobVehiclePlate) == "table" then
                            for _, vehicleData in ipairs(room.regionJobVehiclePlate) do
                                if vehicleData.mainVehicle then
                                    local veh = NetworkGetEntityFromNetworkId(vehicleData.netID)
                                    if DoesEntityExist(veh) then
                                        local vehCoords = GetEntityCoords(veh)
                                        local distVehPole = #(vector2(vehCoords.x, vehCoords.y) - vector2(pole.coords.x, pole.coords.y))

                                        if distVehPole < 9.0 then
                                            sleep = 0

                                            local distPlayerPole = #(vector2(playerCoords.x, playerCoords.y) - vector2(pole.coords.x, pole.coords.y))

                                            if distVehPole <= 5.0 then
                                                DrawText3D(playerCoords.x, playerCoords.y, playerCoords.z,
                                                    Locales[Config.Locale]['parkVehicle'])
                                            elseif distVehPole > 5.0 and distVehPole < 9.0 and distPlayerPole < 2.0 then
                                                local areaIsClear = true
                                                local vehiclesNearby = GetVehiclesInArea(pole.coords, 4.0)

                                                for _, nearVehicle in ipairs(vehiclesNearby) do
                                                    if DoesEntityExist(nearVehicle) and nearVehicle ~= veh then
                                                        areaIsClear = false
                                                        break
                                                    end
                                                end

                                                local canBuild = true
                                                if next(electricianData.Lifts) then
                                                    for _, lift in pairs(electricianData.Lifts) do
                                                        local playerCoords = GetEntityCoords(playerPed)
                                                        local liftDist = #(vector2(lift.coords.x, lift.coords.y) - vector2(playerCoords.x, playerCoords.y))
                                                        if liftDist < 20.0 then
                                                            canBuild = false
                                                            break
                                                        end
                                                    end
                                                end

                                                if canBuild and areaIsClear and not isInteracting then
                                                    local playerCoords = GetEntityCoords(playerPed)
                                                    ShowUniversalInteraction(Config.InteractionKeys['E'],
                                                        vector3(playerCoords.x, playerCoords.y, playerCoords.z),
                                                        "[E] - " .. (Locales[Config.Locale]['buildlift']),
                                                        5.0,
                                                        {
                                                            {
                                                                onSelect = function()
                                                                    handlePhonePole(pole, room)
                                                                end
                                                            }
                                                        })
                                                elseif not areaIsClear then
                                                    ShowUniversalInteraction(Config.InteractionKeys['E'],
                                                        vector3(playerCoords.x, playerCoords.y, playerCoords.z),
                                                        Locales[Config.Locale]['errorbuildlift'],
                                                        nil,
                                                        5.0,
                                                        {})
                                                end
                                            end
                                        end
                                    end
                                    break
                                end
                            end
                        end
                    end
                end
            end

            Wait(sleep)
        end
    end)
end

function handlePhonePole(pole, room)
    StartInteraction()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        TriggerServerEvent(_event('server:build'),
            'lift', pole.coords,
            room.owneridentifier)
        room.liftCraft = true
    end
    SetTimeout(1000, function()
        EndInteraction()
    end)
end

function drwTextForphonePole()
    Citizen.CreateThread(function()
        local sleep = 1000

        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                local playerCoords = GetEntityCoords(PlayerPedId())
                local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                local allPolesAreFar = true

                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regionphonePoleCoords) do
                    local trafodistance = #(playerCoords - vector3(value.coords.x, value.coords.y, value.coords.z))
                    if trafodistance < 100.0 then
                        allPolesAreFar = false
                    end

                    local onlyZdistance = 0
                    if trafodistance < 20.0 and not value.fixed then
                        onlyZdistance = math.abs(playerCoords.z - value.coords.z)

                        local drawMarkerZ = electricianData.cachedZCoords[index]

                        if not drawMarkerZ then
                            drawMarkerZ = FindZForCoords(value.coords.x, value.coords.y)
                            electricianData.cachedZCoords[index] = drawMarkerZ - 0.05
                        end

                        sleep = 0
                        DrawMarker(25, value.coords.x, value.coords.y, drawMarkerZ, 0.0, 0.0, 0.0, 0.0, 0.0,
                            0.0, 4.0, 4.0, 4.0, 255, 255, 255, 80, false, false, 2, nil, nil, false)
                    end

                    if trafodistance < 5.0 and not value.fixed and onlyZdistance < 1.0 and not isInteracting then
                        sleep = 0

                        ShowUniversalInteraction(Config.InteractionKeys['E'],
                            vector3(value.coords.x, value.coords.y, value.coords.z + 1.0),
                            "[E] - " .. (Locales[Config.Locale]['phonePole']),
                            5.0,
                            {
                                {
                                    onSelect = function()
                                        handlephonepole2(value, index)
                                    end
                                }
                            })

                        if not electricianData.activeSmokeEffectsphonePole[index] then
                            electricianData.activeSmokeEffectsphonePole[index] = CreateSmokeEffect(value.coords)
                        end
                    else
                        if electricianData.activeSmokeEffectsphonePole[index] then
                            RemoveSmokeEffect(electricianData.activeSmokeEffectsphonePole[index])
                            electricianData.activeSmokeEffectsphonePole[index] = nil
                        end
                    end
                end

                if allPolesAreFar then
                    Wait(5000)
                end
            end
            Wait(sleep)
        end
    end)
end

function handlephonepole2(value, index)
    StartInteraction()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        local missionPermit = TriggerServerCallback(
            _event('server:getTrafoModal'),
            {
                owneridentifier = CoopDataClient.roomSetting.owneridentifier,
                missionName = 'phonePole',
                coords = value.coords,
                index = index
            })
        if missionPermit then
            TriggerServerEvent(_event('server:changeTrafoModal'),
                CoopDataClient.roomSetting.owneridentifier, index, value.coords,
                'phonePole', true)
            local settings = {
                wireCount = 4,
                wireWidth = 0.74,
                maxWeldFails = 3,
                time = 64,
                missionName = 'phonePole',
                coords = value.coords
            }
            StartGame(settings, function(success)
                if success then
                    TriggerServerEvent(_event('server:switchFixedPhonePole'),
                        CoopDataClient.roomSetting.owneridentifier, value.coords)
                    updateJobTask(5)
                else
                    if (not IsPedClimbing(PlayerPedId())) then
                        PlayAnim('failMinigame')
                        Wait(2000)
                    end
                    Wait(2700)
                    local health = GetEntityHealth(PlayerPedId())
                    SetEntityHealth(PlayerPedId(), health - math.random(10, 25))
                    TriggerServerEvent(_event('server:changeTrafoModal'),
                        CoopDataClient.roomSetting.owneridentifier, index,
                        value.coords, 'phonePole',
                        false)
                end
            end)
        else
            Config.sendNotification(Config.NotificationText['missionnotpermit']
                .text)
        end
    end

    SetTimeout(1000, function()
        EndInteraction()
    end)
end

function liftdrawtextStreetLamp()
    Citizen.CreateThread(function()
        while true do
            local sleep = 1000

            if CoopDataClient and CoopDataClient.roomSetting and (CoopDataClient.roomSetting.startJob or CoopDataClient.roomSetting.finishJob) then
                for key, value in ipairs(CoopDataClient.roomSetting.Mission.regionstreetLampCoords) do
                    if CoopDataClient.roomSetting.regionJobVehiclePlate and type(CoopDataClient.roomSetting.regionJobVehiclePlate) == "table" then
                        for _, vehicleData in ipairs(CoopDataClient.roomSetting.regionJobVehiclePlate) do
                            if vehicleData.mainVehicle then
                                local vehicle = NetworkGetEntityFromNetworkId(vehicleData.netID)
                                if DoesEntityExist(vehicle) and not CoopDataClient.roomSetting.ladderCraft then
                                    local vehicleCoords = GetEntityCoords(vehicle)
                                    local trafodistance = #(vector2(vehicleCoords.x, vehicleCoords.y) - vector2(value.coords.x, value.coords.y))
                                    local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)

                                    if trafodistance < 8 and not value.fixed then
                                        sleep = 0
                                        local playerCoords = GetEntityCoords(PlayerPedId())
                                        local distanceToTrunk = #(vector2(playerCoords.x, playerCoords.y) - vector2(value.coords.x, value.coords.y))

                                        if next(electricianData.Ladders) ~= nil then
                                            for k, v in pairs(electricianData.Ladders) do
                                                local dist = #(v2(v.props.ladder) - v2(playerCoords))

                                                if not (dist < 20.0) then
                                                    if distanceToTrunk < 8.0 then
                                                        if not electricianData.laddercraft and not isInteracting then
                                                            ShowUniversalInteraction(Config.InteractionKeys['E'],
                                                                vector3(playerCoords.x, playerCoords.y,
                                                                    playerCoords.z),
                                                                "[E] - " ..
                                                                (Locales[Config.Locale]['buildladder']),
                                                                5.0,
                                                                {
                                                                    {
                                                                        onSelect = function()
                                                                            if distanceToTrunk < 5.0 then
                                                                                handlebuildLadder(electricianData, value)
                                                                            end
                                                                        end
                                                                    }
                                                                })
                                                        end
                                                    end
                                                end
                                            end
                                        else
                                            if distanceToTrunk < 8.0 then
                                                if not electricianData.laddercraft and not isInteracting then
                                                    ShowUniversalInteraction(Config.InteractionKeys['E'],
                                                        vector3(playerCoords.x, playerCoords.y, playerCoords.z),
                                                        "[E] - " ..
                                                        (Locales[Config.Locale]['buildladder']),
                                                        5.0,
                                                        {
                                                            {
                                                                onSelect = function()
                                                                    if distanceToTrunk < 5.0 then
                                                                        handlebuildLadder(electricianData, value)
                                                                    end
                                                                end
                                                            }
                                                        })
                                                end
                                            end
                                        end
                                    end
                                end
                                break
                            end
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

function handlebuildLadder(electricianData, value)
    StartInteraction()
    if not electricianData.laddercraft and not IsPedInAnyVehicle(PlayerPedId(), false) then
        TriggerServerEvent(
            _event('server:build'), 'ladder',
            value.coords,
            CoopDataClient.roomSetting
            .owneridentifier)
        electricianData.laddercraft = true
    end
    SetTimeout(1000, function()
        EndInteraction()
    end)
end

function drwTextForStreetLamp()
    Citizen.CreateThread(function()
        local sleep = 1000

        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                local playerCoords = GetEntityCoords(PlayerPedId())
                local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                local allLampsAreFar = true

                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regionstreetLampCoords) do
                    local trafodistance = #(playerCoords - vector3(value.coords.x, value.coords.y, value.coords.z))
                    if trafodistance < 100.0 then
                        allLampsAreFar = false
                    end
                    local onlyZdistance = math.abs(playerCoords.z - value.coords.z)
                    local drawMarkerZ = electricianData.cachedZCoordsStreet[index]

                    if not drawMarkerZ then
                        drawMarkerZ = FindZForCoords(value.coords.x, value.coords.y)
                        electricianData.cachedZCoordsStreet[index] = drawMarkerZ + 0.1
                    end
                    if trafodistance < 15 and not value.fixed then
                        sleep = 0
                        DrawMarker(25, value.coords.x, value.coords.y, drawMarkerZ, 0.0, 0.0, 0.0, 0.0, 0.0,
                            0.0, 4.0, 4.0, 4.0, 255, 255, 255, 80, false, false, 2, nil, nil, false)
                    end

                    if trafodistance < 5.0 and not value.fixed and onlyZdistance < 2.0 and not isInteracting then
                        sleep = 0

                        ShowUniversalInteraction(Config.InteractionKeys['E'],
                            vector3(value.coords.x, value.coords.y, value.coords.z + 1.0),
                            (Locales[Config.Locale]['fixStreetLamp']),
                            5.0, {
                                {
                                    onSelect = function()
                                        handleStreetLamp(value, index)
                                    end
                                }
                            })


                        if not electricianData.activeSmokeEffectStreetLamp[index] then
                            electricianData.activeSmokeEffectStreetLamp[index] = CreateSmokeEffect(value.coords)
                        end
                    else
                        if electricianData.activeSmokeEffectStreetLamp[index] then
                            RemoveSmokeEffect(electricianData.activeSmokeEffectStreetLamp[index])
                            electricianData.activeSmokeEffectStreetLamp[index] = nil
                        end
                    end
                end
                if allLampsAreFar then
                    Wait(5000)
                end
            end

            Wait(sleep)
        end
    end)
end

function handleStreetLamp(value, index)
    StartInteraction()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        local missionPermit = TriggerServerCallback(
            _event('server:getTrafoModal'),
            {
                owneridentifier = CoopDataClient.roomSetting.owneridentifier,
                missionName = 'fixStreetLamp',
                coords = value.coords,
                index = index
            })
        if missionPermit then
            TriggerServerEvent(_event('server:changeTrafoModal'),
                CoopDataClient.roomSetting.owneridentifier, index, value.coords,
                'fixStreetLamp',
                true)
            local settings = {
                wireCount = 4,
                wireWidth = 0.74,
                maxWeldFails = 3,
                time = 64,
                missionName = 'fixStreetLamp',
                coords = value.coords
            }
            StartGame(settings, function(success)
                if success then
                    TriggerServerEvent(_event('switchFixedstreetLamp'),
                        CoopDataClient.roomSetting.owneridentifier, value.coords)
                    updateJobTask(3)
                else
                    Wait(2700)
                    if (not IsPedClimbing(PlayerPedId())) then
                        PlayAnim('failMinigame')
                        Wait(2000)
                    end
                    local health = GetEntityHealth(PlayerPedId())
                    SetEntityHealth(PlayerPedId(), health - math.random(10, 25))
                    TriggerServerEvent(_event('server:changeTrafoModal'),
                        CoopDataClient.roomSetting.owneridentifier, index,
                        value.coords,
                        'fixStreetLamp',
                        false)
                end
            end)
        else
            Config.sendNotification(Config.NotificationText['missionnotpermit']
                .text)
        end
    end
    SetTimeout(1000, function()
        EndInteraction()
    end)
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local wait = 1500
        local isInRange = false
        for k, v in pairs(electricianData.Lifts) do
            local dist = #(v2(v.coords) - v2(coords))
            if (dist < 75.0) then
                wait = 0
                local lift = EnsureLift(k)
                local location = GetOffsetFromEntityInWorldCoords(lift.lift, 0.0, 0.0, 0.0)
                local dist = #(location - coords)
                if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.owneridentifier == v.owneridentifier then
                    if dist < 1.3 then
                        ControlLift(k)
                        isInRange = true
                    end
                end
                local location = GetOffsetFromEntityInWorldCoords(lift.rails[1], -1.0, 0.0, -1.0)
                local dist = #(location - coords)
                --local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.owneridentifier == v.owneridentifier then
                    if dist < 1.3 and not isInteracting then
                        ShowUniversalInteraction(Config.InteractionKeys['E'], vector3(coords.x, coords.y, coords.z),
                            "[E] - " .. (Locales[Config.Locale]['removelift']),
                            3.0, {
                                {
                                    onSelect = function()
                                        handleRemoveLift(k)
                                    end
                                }
                            })
                    end
                end
            elseif (GetLift(k)) then
                DeleteLift(k)
            end
        end

        if isInRange then
            liftInfo = true
        else
            liftInfo = false
        end
        Wait(wait)
    end
end)

function handleRemoveLift(k)
    StartInteraction()
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        RemoveLift(k)
    end
    SetTimeout(2000, function()
        EndInteraction()
    end)
end

CreateThread(function()
    while true do
        local wait = 1500
        local ped = PlayerPedId()
        local pcoords = GetEntityCoords(ped)
        for k, v in pairs(electricianData.Ladders) do
            local coords = v.props.ladder
            local dist = #(pcoords - coords)
            if dist < 75.0 then
                wait = 0
                EnsureLadder(k)
                if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.owneridentifier == v.owneridentifier then
                    if dist < 2.25 and not isInteracting then
                        ShowUniversalInteraction(Config.InteractionKeys['E'], vector3(coords.x, coords.y, coords.z),
                            (Locales[Config.Locale]['removeladder']),
                            2.25, {
                                {
                                    onSelect = function()
                                        handleRemoveLadder(dist, k)
                                    end
                                }
                            })
                    end
                end
            else
                DeleteLadder(k)
            end
        end
        Wait(wait)
    end
end)

function handleRemoveLadder(dist, k)
    StartInteraction()
    local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
    if dist < 2.25 and not playerInVehicle then
        RemoveLadder(k)
    end

    SetTimeout(2000, function()
        EndInteraction()
    end)
end
