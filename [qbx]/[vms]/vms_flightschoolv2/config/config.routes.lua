Config.PracticalTest = { -- if you don't know what each action does, don't touch it to avoid spoiling the exam route
    ['HELICOPTER'] = {
        [1] = {
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_1.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    if GetIsVehicleEngineRunning(myVehicle) then
                        FreezeEntityPosition(myVehicle, false)
                        SendNUIMessage({action = 'updateTasks', done = 1, id = 1})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [2] = {
            action = function()
                local startHeight = GetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false))
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_2.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local currentHeight = GetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false))
                    SendNUIMessage({action = 'updateTaskProgress', value = math.floor(currentHeight.z - startHeight.z), id = 2})
                    if (currentHeight.z - startHeight.z) >= 200.0 then
                        setBlipToPoint(3)
                        SendNUIMessage({action = 'updateTaskProgress', value = '200', id = 2})
                        SendNUIMessage({action = 'updateTasks', done = 2, id = 2})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [3] = {
            coords = vector3(-1090.09, -2666.45, 225.29),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_3.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['HELICOPTER'][3]
                local nextpoint = Config.PracticalTest['HELICOPTER'][4].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        DeleteCheckpoint(currentCheckpoint)
                        setBlipToPoint(4)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '1', id = 3})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [4] = {
            coords = vector3(-842.35, -2240.37, 225.29),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][4]
                local nextpoint = Config.PracticalTest['HELICOPTER'][5].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        DeleteCheckpoint(currentCheckpoint)
                        setBlipToPoint(5)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '2', id = 3})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [5] = {
            coords = vector3(-654.5, -1733.39, 225.29),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][5]
                local nextpoint = Config.PracticalTest['HELICOPTER'][6].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    if distance < 10.0 then
                        DeleteCheckpoint(currentCheckpoint)
                        setBlipToPoint(6)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '3', id = 3})
                        SendNUIMessage({action = 'updateTasks', done = 3, id = 3})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [6] = {
            coords = vector3(-724.76, -1444.14, 3.0),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_6.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['HELICOPTER'][6]
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id_ground, current.coords.x, current.coords.y, current.coords.z, nil, nil, nil, Config.Practical['Checkpoint'].diameter_ground, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 5.5 and myCoords.z - current.coords.z < 2.0 and GetEntitySpeed(currentDriveVehicle) < 2.0 then
                        setBlipToPoint(nil)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTasks', done = 6, id = 4})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [7] = {
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_2.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local startHeight = GetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false))
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local currentHeight = GetEntityCoords(GetVehiclePedIsIn(PlayerPedId(), false))
                    SendNUIMessage({action = 'updateTaskProgress', value = math.floor(currentHeight.z - startHeight.z), id = 7})
                    if (currentHeight.z - startHeight.z) >= 175.0 then
                        setBlipToPoint(8)
                        SendNUIMessage({action = 'updateTaskProgress', value = '175', id = 7})
                        SendNUIMessage({action = 'updateTasks', done = 7, id = 5})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [8] = {
            coords = vector3(-342.14, -1009.58, 325.72),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_3.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['HELICOPTER'][8]
                local nextpoint = Config.PracticalTest['HELICOPTER'][9].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(9)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '1', id = 8})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [9] = {
            coords = vector3(-342.14, -1009.58, 325.72),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][9]
                local nextpoint = Config.PracticalTest['HELICOPTER'][10].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(10)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '2', id = 8})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [10] = {
            coords = vector3(272.82, -311.62, 377.04),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][10]
                local nextpoint = Config.PracticalTest['HELICOPTER'][11].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(11)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '3', id = 8})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [11] = {
            coords = vector3(1537.43, 223.5, 275.31),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][11]
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nil, nil, nil, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(10)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '4', id = 8})
                        SendNUIMessage({action = 'updateTasks', done = 8, id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [12] = {
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_12.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                SetVehicleEngineHealth(currentDriveVehicle, 0)
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    if GetEntitySpeed(currentDriveVehicle) < 2.0 then
                        SetVehicleFixed(currentDriveVehicle)
                        setBlipToPoint(13)
                        SendNUIMessage({action = 'updateTasks', done = 12, id = 7})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [13] = {
            coords = vector3(1629.28, 458.26, 316.58),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_3.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['HELICOPTER'][13]
                local nextpoint = Config.PracticalTest['HELICOPTER'][14].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(14)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '1', id = 13})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [14] = {
            coords = vector3(1381.11, 851.3, 341.79),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][14]
                local nextpoint = Config.PracticalTest['HELICOPTER'][15].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(15)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '2', id = 13})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [15] = {
            coords = vector3(1019.41, 1081.33, 422.95),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][15]
                local nextpoint = Config.PracticalTest['HELICOPTER'][16].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(16)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '3', id = 13})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [16] = {
            coords = vector3(459.18, 1064.86, 467.63),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][16]
                local nextpoint = Config.PracticalTest['HELICOPTER'][17].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(17)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '4', id = 13})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [17] = {
            coords = vector3(-172.72, 740.0, 467.55),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][17]
                local nextpoint = Config.PracticalTest['HELICOPTER'][18].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(18)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '5', id = 13})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [18] = {
            coords = vector3(-659.26, 78.28, 467.23),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][18]
                local nextpoint = Config.PracticalTest['HELICOPTER'][19].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(19)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '6', id = 13})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [19] = {
            coords = vector3(-1062.23, -1104.36, 466.89),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][19]
                local nextpoint = Config.PracticalTest['HELICOPTER'][20].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(20)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '7', id = 13})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [20] = {
            coords = vector3(-1243.65, -2236.99, 330.28),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][20]
                local nextpoint = Config.PracticalTest['HELICOPTER'][21].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(21)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '8', id = 13})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [21] = {
            coords = vector3(-1204.14, -2673.27, 195.58),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][21]
                local nextpoint = Config.PracticalTest['HELICOPTER'][22].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(22)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '9', id = 13})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [22] = {
            coords = vector3(-1228.37, -3284.31, 50.86),
            action = function()
                local current = Config.PracticalTest['HELICOPTER'][22]
                local nextpoint = Config.PracticalTest['HELICOPTER'][23].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    if distance < 10.0 then
                        setBlipToPoint(nil)
                        setBlipToSchool(true)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '10', id = 13})
                        SendNUIMessage({action = 'updateTasks', done = 13, id = 8})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [23] = {
            coords = vector3(-1271.22, -3380.2, 12.94),
            action = function()
                local inRange = false
                local shown = false
                if Config.Examiner.SpokenCommands and currentExam and (driveErrors < Config.MaxDriveErrors) then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_23.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['HELICOPTER'][23]
                local returnTable = Config.Zones["return_vehicle"]['HELICOPTER']
                while currentExam do
                    inRange = false
                    local sleep = true
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    if myVehicle then
                        local myCoords = GetEntityCoords(myVehicle)
                        local distance = #(myCoords - current.coords)
                        if distance < 350.0 then
                            sleep = false
                            DrawMarker(returnTable.marker.id, current.coords.x, current.coords.y, current.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, returnTable.marker.scale, returnTable.marker.color[1], returnTable.marker.color[2], returnTable.marker.color[3], returnTable.marker.color[4], returnTable.marker.bobUpAndDown, false, false, returnTable.marker.rotate, false, false, false)
                            if distance < returnTable.marker.scale.x then
                                inRange = true
                                if Config.Core == "ESX" and not Config.Interact.Enabled then
                                    ESX.ShowHelpNotification(TRANSLATE('complete_practical'))
                                end
                                if IsControlJustPressed(0, 38) then
                                    DeleteVehicle(myVehicle)
                                    if Config.Examiner.Enabled then
                                        DeletePed(examinerPed)
                                    end
                                    setBlipToSchool(false)
                                    if Config.TeleportPlayerAfterExam then
                                        SetEntityCoords(myPed, Config.Zones['menu'].coords)
                                    end
                                    SendNUIMessage({action = 'updateTasks', done = 23, id = 9})
                                    SendNUIMessage({action = 'closeTasks'})
                                    if Config.Interact.Enabled then
                                        Config.Interact.Close()
                                    end
                                    break
                                end
                            end
                        end
                        if Config.Interact.Enabled then
                            if inRange and not shown then
                                shown = true
                                Config.Interact.Open(TRANSLATE('complete_practical'))
                            elseif not inRange and shown then
                                shown = false
                                Config.Interact.Close()
                            end
                        end
                    end
                    Citizen.Wait(sleep and 1000 or 1)
                end
            end
        },
    },
    ['PLANE'] = {
        [1] = {
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_1.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    if GetIsVehicleEngineRunning(myVehicle) then
                        FreezeEntityPosition(myVehicle, false)
                        setBlipToPoint(2)
                        SendNUIMessage({action = 'updateTasks', done = 1, id = 1})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [2] = {
            coords = vector3(-1612.94, -3098.39, 13.94),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_2.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][2]
                local nextpoint = Config.PracticalTest['PLANE'][3].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(3)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTasks', done = 2, id = 2})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [3] = {
            coords = vector3(-1170.51, -3353.08, 13.94),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_3.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][3]
                local nextpoint = Config.PracticalTest['PLANE'][4].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(4)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTasks', done = 3, id = 3})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [4] = {
            coords = vector3(-1139.44, -3272.64, 12.93),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_4.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][4]
                local nextpoint = Config.PracticalTest['PLANE'][5].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local current = Config.PracticalTest['PLANE'][4]
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(5)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTasks', done = 4, id = 4})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [5] = {
            coords = vector3(-1412.84, -3099.3, 12.94),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_5.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][5]
                local nextpoint = Config.PracticalTest['PLANE'][6].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(6)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTasks', done = 5, id = 5})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [6] = {
            coords = vector3(-1740.08, -2907.08, 38.87),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_3.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][6]
                local nextpoint = Config.PracticalTest['PLANE'][7].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(7)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '1', id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [7] = {
            coords = vector3(-2118.31, -2640.74, 96.57),
            action = function()
                local current = Config.PracticalTest['PLANE'][7]
                local nextpoint = Config.PracticalTest['PLANE'][8].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(8)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '2', id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [8] = {
            coords = vector3(-1897.77, -1926.49, 140.46),
            action = function()
                local current = Config.PracticalTest['PLANE'][8]
                local nextpoint = Config.PracticalTest['PLANE'][9].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(9)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '3', id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [9] = {
            coords = vector3(-1038.02, -418.74, 347.96),
            action = function()
                local current = Config.PracticalTest['PLANE'][9]
                local nextpoint = Config.PracticalTest['PLANE'][10].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(10)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '4', id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [10] = {
            coords = vector3(-666.63, 320.61, 456.81),
            action = function()
                local current = Config.PracticalTest['PLANE'][10]
                local nextpoint = Config.PracticalTest['PLANE'][11].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(11)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '5', id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [11] = {
            coords = vector3(-215.84, 1112.23, 555.94),
            action = function()
                local current = Config.PracticalTest['PLANE'][11]
                local nextpoint = Config.PracticalTest['PLANE'][12].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(12)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '6', id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [12] = {
            coords = vector3(287.41, 2293.59, 359.82),
            action = function()
                local current = Config.PracticalTest['PLANE'][12]
                local nextpoint = Config.PracticalTest['PLANE'][13].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(13)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '7', id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [13] = {
            coords = vector3(812.76, 3004.02, 142.8),
            action = function()
                local current = Config.PracticalTest['PLANE'][13]
                local nextpoint = Config.PracticalTest['PLANE'][14].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(14)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '8', id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [14] = {
            coords = vector3(1319.54, 3146.92, 39.42),
            action = function()
                local current = Config.PracticalTest['PLANE'][14]
                local nextpoint = Config.PracticalTest['PLANE'][15].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(15)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '9', id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [15] = {
            coords = vector3(1779.83, 3259.92, 40.93),
            action = function()
                local current = Config.PracticalTest['PLANE'][15]
                local nextpoint = Config.PracticalTest['PLANE'][16].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(16)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '10', id = 6})
                        SendNUIMessage({action = 'updateTasks', done = 6, id = 6})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [16] = {
            coords = vector3(1732.02, 3309.42, 40.22),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_16.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][16]
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nil, nil, nil, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myCoords = GetEntityCoords(myPed)
                    local distance = #(myCoords - current.coords)
                    if distance < 2.0 then
                        setBlipToPoint(nil)
                        local myVehicle = GetVehiclePedIsIn(myPed, false)
                        FreezeEntityPosition(myVehicle, true)
                        TaskLeaveVehicle(myPed, myVehicle, 64)
                        SetVehicleDoorsLocked(myVehicle, 2)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTasks', done = 16, id = 7})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [17] = {
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_17.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local inRange = false
                local shown = false
                local isChecking = false
                local lWheelOffset, lWheelDone = GetOffsetFromEntityInWorldCoords(currentDriveVehicle, -2.35, 1.25, 0.0), false
                local rWheelOffset, rWheelDone = GetOffsetFromEntityInWorldCoords(currentDriveVehicle, 2.35, 1.25, 0.0), false
                local lEngineOffset, lEngineDone = GetOffsetFromEntityInWorldCoords(currentDriveVehicle, -1.35, -2.95, 0.0), false
                local rEngineOffset, rEngineDone = GetOffsetFromEntityInWorldCoords(currentDriveVehicle, 1.35, -2.95, 0.0), false
                local _, groundPlane = GetGroundZFor_3dCoord(lWheelOffset.x, lWheelOffset.y, lWheelOffset.z, true)
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myCoords = GetEntityCoords(myPed)
                    if not lEngineDone and not rEngineDone and not rWheelDone and not lWheelDone then
                        DrawMarker(0, lWheelOffset.x, lWheelOffset.y, groundPlane+0.35, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 30, 205, 36, 120, false, false, false, false, false, false, false)
                        if #(myCoords - vec(lWheelOffset.x, lWheelOffset.y, groundPlane+1.0)) < 1.5 then
                            inRange = TRANSLATE('help.check_left_wheel')
                            if Config.Core == "ESX" and not Config.Interact.Enabled then
                                ESX.ShowHelpNotification(inRange)
                            end
                            if not isChecking and IsControlJustPressed(0, 38) then
                                Citizen.CreateThread(function()
                                    isChecking = true
                                    Citizen.CreateThread(function()
                                        while isChecking do
                                            DrawText3D(myCoords, TRANSLATE('3dtext.checking_left_wheel'), 0.35)
                                            Citizen.Wait(1)
                                        end
                                    end)
                                    TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_KNEEL', 0, true)
                                    PlaySoundFrontend(-1, 'Team_Capture_Start', 'GTAO_Magnate_Yacht_Attack_Soundset', 0)
                                    Citizen.Wait(10000)
                                    ClearPedTasks(PlayerPedId())
                                    Config.Notification(TRANSLATE('notify.checked_left_wheel'), 'success')
                                    isChecking = false
                                    lWheelDone = true
                                    SendNUIMessage({action = 'updateTaskProgress', value = '25', id = 17})
                                end)
                            end
                        end
                    end
                    if not lWheelDone then
                        DrawMarker(0, rWheelOffset.x, rWheelOffset.y, groundPlane+0.35, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 19, 135, 23, 15, false, false, false, false, false, false, false)
                    elseif lWheelDone and not rWheelDone and not lEngineDone and not rEngineDone then
                        DrawMarker(0, rWheelOffset.x, rWheelOffset.y, groundPlane+0.35, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 30, 205, 36, 120, false, false, false, false, false, false, false)
                        if #(myCoords - vec(rWheelOffset.x, rWheelOffset.y, groundPlane+1.0)) < 1.5 then
                            inRange = TRANSLATE('help.check_right_wheel')
                            if Config.Core == "ESX" and not Config.Interact.Enabled then
                                ESX.ShowHelpNotification(inRange)
                            end
                            if not isChecking and IsControlJustPressed(0, 38) then
                                Citizen.CreateThread(function()
                                    isChecking = true
                                    Citizen.CreateThread(function()
                                        while isChecking do
                                            DrawText3D(myCoords, TRANSLATE('3dtext.checking_right_wheel'), 0.35)
                                            Citizen.Wait(1)
                                        end
                                    end)
                                    TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_KNEEL', 0, true)
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    PlaySoundFrontend(-1, 'Team_Capture_Start', 'GTAO_Magnate_Yacht_Attack_Soundset', 0)
                                    Citizen.Wait(10000)
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    ClearPedTasks(PlayerPedId())
                                    Config.Notification(TRANSLATE('notify.checked_right_wheel'), 'success')
                                    isChecking = false
                                    rWheelDone = true
                                    SendNUIMessage({action = 'updateTaskProgress', value = '50', id = 17})
                                end)
                            end
                        end
                    end
                    if not rWheelDone then
                        DrawMarker(0, lEngineOffset.x, lEngineOffset.y, groundPlane+0.35, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 19, 135, 23, 15, false, false, false, false, false, false, false)
                    elseif lWheelDone and rWheelDone and not lEngineDone and not rEngineDone then
                        DrawMarker(0, lEngineOffset.x, lEngineOffset.y, groundPlane+0.35, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 30, 205, 36, 120, false, false, false, false, false, false, false)
                        if #(myCoords - vec(lEngineOffset.x, lEngineOffset.y, groundPlane+1.0)) < 1.5 then
                            inRange = TRANSLATE('help.check_left_engine')
                            if Config.Core == "ESX" and not Config.Interact.Enabled then
                                ESX.ShowHelpNotification(inRange)
                            end
                            if not isChecking and IsControlJustPressed(0, 38) then
                                Citizen.CreateThread(function()
                                    isChecking = true
                                    Citizen.CreateThread(function()
                                        while isChecking do
                                            DrawText3D(myCoords, TRANSLATE('3dtext.checking_left_engine'), 0.35)
                                            Citizen.Wait(1)
                                        end
                                    end)
                                    TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_KNEEL', 0, true)
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    PlaySoundFrontend(-1, 'Team_Capture_Start', 'GTAO_Magnate_Yacht_Attack_Soundset', 0)
                                    Citizen.Wait(10000)
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    ClearPedTasks(PlayerPedId())
                                    Config.Notification(TRANSLATE('notify.checked_left_engine'), 'success')
                                    isChecking = false
                                    lEngineDone = true
                                    SendNUIMessage({action = 'updateTaskProgress', value = '75', id = 17})
                                end)
                            end
                        end
                    end
                    if not lEngineDone then
                        DrawMarker(0, rEngineOffset.x, rEngineOffset.y, groundPlane+0.35, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 19, 135, 23, 15, false, false, false, false, false, false, false)
                    elseif lWheelDone and rWheelDone and lEngineDone and not rEngineDone then
                        DrawMarker(0, rEngineOffset.x, rEngineOffset.y, groundPlane+0.35, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 30, 205, 36, 120, false, false, false, false, false, false, false)
                        if #(myCoords - vec(rEngineOffset.x, rEngineOffset.y, groundPlane+1.0)) < 1.5 then
                            inRange = TRANSLATE('help.check_right_engine')
                            if Config.Core == "ESX" and not Config.Interact.Enabled then
                                ESX.ShowHelpNotification(inRange)
                            end
                            if not isChecking and IsControlJustPressed(0, 38) then
                                Citizen.CreateThread(function()
                                    isChecking = true
                                    Citizen.CreateThread(function()
                                        while isChecking do
                                            DrawText3D(myCoords, TRANSLATE('3dtext.checking_right_engine'), 0.35)
                                            Citizen.Wait(1)
                                        end
                                    end)
                                    TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_KNEEL', 0, true)
                                    FreezeEntityPosition(PlayerPedId(), true)
                                    PlaySoundFrontend(-1, 'Team_Capture_Start', 'GTAO_Magnate_Yacht_Attack_Soundset', 0)
                                    Citizen.Wait(10000)
                                    FreezeEntityPosition(PlayerPedId(), false)
                                    isChecking = false
                                    if GetEntityHealth(currentDriveVehicle) < 1000 then
                                        ClearPedTasksImmediately(PlayerPedId())
                                        Config.Notification(TRANSLATE('notify.vehicle_is_damaged'), 'error')
                                        requestAnim("mini@repair", "fixing_a_ped", 10000, 0)
                                        Citizen.Wait(10000)
                                        SetEntityHealth(currentDriveVehicle, 1000)
                                        SetVehicleFixed(currentDriveVehicle)
                                    else
                                        ClearPedTasks(PlayerPedId())
                                        Config.Notification(TRANSLATE('notify.checked_right_engine'), 'success')
                                    end
                                    SendNUIMessage({action = 'updateTaskProgress', value = '100', id = 17})
                                    SendNUIMessage({action = 'updateTasks', done = 17, id = 8})
                                    rEngineDone = true
                                end)
                            end
                        end
                    end
                    if lWheelDone and rWheelDone and lEngineDone and rEngineDone then
                        break
                    end
                    if Config.Interact.Enabled then
                        if inRange and not shown then
                            shown = true
                            Config.Interact.Open(inRange)
                        elseif not inRange and shown then
                            shown = false
                            Config.Interact.Close()
                        end
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [18] = {
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_18.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local inRange = false
                local shown = false
                local isChecking = false
                local fuelOffset, fuelDone = GetOffsetFromEntityInWorldCoords(currentDriveVehicle, -3.55, -2.0, 0.0), false
                local _, groundPlane = GetGroundZFor_3dCoord(fuelOffset.x, fuelOffset.y, fuelOffset.z, true)
                local jerryCanProp = nil
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myPed = PlayerPedId()
                    local myCoords = GetEntityCoords(myPed)
                    DrawMarker(0, fuelOffset.x, fuelOffset.y, groundPlane+0.35, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 30, 205, 36, 120, false, false, false, false, false, false, false)
                    if #(myCoords - vec(fuelOffset.x, fuelOffset.y, groundPlane+1.0)) < 1.5 then
                        inRange = true
                        if Config.Core == "ESX" and not Config.Interact.Enabled then
                            ESX.ShowHelpNotification(TRANSLATE('help.refuel_the_plane'))
                        end
                        if not isChecking and IsControlJustPressed(0, 38) then
                            Citizen.CreateThread(function()
                                isChecking = true
                                Citizen.CreateThread(function()
                                    while isChecking do
                                        DrawText3D(myCoords, TRANSLATE('3dtext.refuelling_the_plane'), 0.35)
                                        Citizen.Wait(1)
                                    end
                                end)
                                if Config.UseJerryCanProp then
                                    jerryCanProp = CreateObject(Config.JerryCanObject, 1.0, 1.0, 1.0, true, true, false)
                                    local myHand = GetPedBoneIndex(myPed, 18905)
                                    AttachEntityToEntity(jerryCanProp, myPed, myHand, 0.11, 0.0, 0.25, 15.0, 170.0, 90.42, 0, 1, 0, 1, 0, 1)
                                end
                                requestAnim("weapon@w_sp_jerrycan", "fire", -1, 50)
                                FreezeEntityPosition(PlayerPedId(), true)
                                PlaySoundFrontend(-1, 'Team_Capture_Start', 'GTAO_Magnate_Yacht_Attack_Soundset', 0)
                                Citizen.Wait(10000)
                                FreezeEntityPosition(PlayerPedId(), false)
                                ClearPedTasks(PlayerPedId())
                                if Config.UseJerryCanProp then
                                    DeleteObject(jerryCanProp)
                                end
                                Config.Notification(TRANSLATE('notify.refuelled_the_plane'), 'success')
                                fuelDone = true
                                isChecking = false
                                FreezeEntityPosition(currentDriveVehicle, false)
                                SetVehicleDoorsLocked(currentDriveVehicle, 1)
                                setBlipToPoint(19)
                                SendNUIMessage({action = 'updateTasks', done = 18, id = 9})
                            end)
                            Citizen.Wait(10000)
                            break
                        end
                    end
                    if Config.Interact.Enabled then
                        if inRange and not shown then
                            shown = true
                            Config.Interact.Open(TRANSLATE('help.refuel_the_plane'))
                        elseif not inRange and shown then
                            shown = false
                            Config.Interact.Close()
                        end
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [19] = {
            coords = vector3(1718.04, 3254.28, 40.14),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_4.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][19]
                local nextpoint = Config.PracticalTest['PLANE'][20].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(20)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTasks', done = 19, id = 10})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [20] = {
            coords = vector3(1344.54, 3153.72, 39.41),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_5.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][20]
                local nextpoint = Config.PracticalTest['PLANE'][21].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(21)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTasks', done = 20, id = 11})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [21] = {
            coords = vector3(1118.35, 3093.09, 50.32),
            action = function()
                if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                    SendNUIMessage({action = 'audioTask', filename = ('helicopter.%s_3.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][21]
                local nextpoint = Config.PracticalTest['PLANE'][22].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(21)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '1', id = 21})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [22] = {
            coords = vector3(951.91, 3050.51, 69.14),
            action = function()
                local current = Config.PracticalTest['PLANE'][22]
                local nextpoint = Config.PracticalTest['PLANE'][23].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(23)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '2', id = 21})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [23] = {
            coords = vector3(621.67, 3137.65, 138.67),
            action = function()
                local current = Config.PracticalTest['PLANE'][23]
                local nextpoint = Config.PracticalTest['PLANE'][24].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(24)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '3', id = 21})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [24] = {
            coords = vector3(681.22, 3881.52, 216.49),
            action = function()
                local current = Config.PracticalTest['PLANE'][24]
                local nextpoint = Config.PracticalTest['PLANE'][25].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(25)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '4', id = 21})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [25] = {
            coords = vector3(1177.27, 4344.75, 185.0),
            action = function()
                local current = Config.PracticalTest['PLANE'][25]
                local nextpoint = Config.PracticalTest['PLANE'][26].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(26)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '5', id = 21})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [26] = {
            coords = vector3(1639.39, 4574.31, 90.0),
            action = function()
                local current = Config.PracticalTest['PLANE'][26]
                local nextpoint = Config.PracticalTest['PLANE'][27].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(27)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '6', id = 21})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [27] = {
            coords = vector3(1970.58, 4732.77, 44.0),
            action = function()
                local current = Config.PracticalTest['PLANE'][27]
                local nextpoint = Config.PracticalTest['PLANE'][28].coords
                if currentExam and driveErrors < Config.MaxDriveErrors then
                    currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
                end
                while currentExam and driveErrors < Config.MaxDriveErrors do
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local distance = #(myCoords - current.coords)
                    if distance < 10.0 then
                        setBlipToPoint(nil)
                        setBlipToSchool(true)
                        DeleteCheckpoint(currentCheckpoint)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTaskProgress', value = '7', id = 21})
                        SendNUIMessage({action = 'updateTasks', done = 21, id = 12})
                        break
                    end
                    Citizen.Wait(1)
                end
            end
        },
        [28] = {
            coords = vector3(2125.72, 4805.75, 40.2),
            action = function()
                local inRange = false
                local shown = false
                if Config.Examiner.SpokenCommands and currentExam and (driveErrors < Config.MaxDriveErrors) then
                    SendNUIMessage({action = 'audioTask', filename = ('plane.%s_28.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
                end
                local current = Config.PracticalTest['PLANE'][28]
                local returnTable = Config.Zones["return_vehicle"]['PLANE']
                while currentExam do
                    inRange = false
                    local sleep = true
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    if myVehicle then
                        local myCoords = GetEntityCoords(myVehicle)
                        local distance = #(myCoords - current.coords)
                        if distance < 350.0 then
                            sleep = false
                            DrawMarker(returnTable.marker.id, current.coords.x, current.coords.y, current.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, returnTable.marker.scale, returnTable.marker.color[1], returnTable.marker.color[2], returnTable.marker.color[3], returnTable.marker.color[4], returnTable.marker.bobUpAndDown, false, false, returnTable.marker.rotate, false, false, false)
                            if distance < returnTable.marker.scale.x then
                                inRange = true
                                if Config.Core == "ESX" and not Config.Interact.Enabled then
                                    ESX.ShowHelpNotification(TRANSLATE('complete_practical'))
                                end
                                if IsControlJustPressed(0, 38) then
                                    DeleteVehicle(myVehicle)
                                    if Config.Examiner.Enabled then
                                        DeletePed(examinerPed)
                                    end
                                    setBlipToSchool(false)
                                    if Config.TeleportPlayerAfterExam then
                                        SetEntityCoords(myPed, Config.Zones['menu'].coords)
                                    end
                                    SendNUIMessage({action = 'updateTasks', done = 28, id = 13})
                                    SendNUIMessage({action = 'closeTasks'})
                                    if Config.Interact.Enabled then
                                        Config.Interact.Close()
                                    end
                                    break
                                end
                            end
                        end
                        if Config.Interact.Enabled then
                            if inRange and not shown then
                                shown = true
                                Config.Interact.Open(TRANSLATE('complete_practical'))
                            elseif not inRange and shown then
                                shown = false
                                Config.Interact.Close()
                            end
                        end
                    end
                    Citizen.Wait(sleep and 1000 or 1)
                end
            end
        },
    }
}