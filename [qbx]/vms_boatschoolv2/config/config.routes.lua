Config.PracticalTest = { -- if you don't know what each action does, don't touch it to avoid spoiling the exam route
    [1] = {
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = ('%s_1.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
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
        coords = vector3(-259.23, -2809.54, 0.11),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = ('%s_2.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
            end
            local current = Config.PracticalTest[2]
            local nextpoint = Config.PracticalTest[3].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(3)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '1', id = 2})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [3] = {
        coords = vector3(-144.05, -2886.66, 1.42),
        action = function()
            local current = Config.PracticalTest[3]
            local nextpoint = Config.PracticalTest[4].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(4)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '2', id = 2})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [4] = {
        coords = vector3(-153.88, -3071.06, 0.42),
        action = function()
            local current = Config.PracticalTest[4]
            local nextpoint = Config.PracticalTest[5].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(5)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '3', id = 2})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [5] = {
        coords = vector3(-310.62, -3289.48, 0.74),
        action = function()
            local current = Config.PracticalTest[5]
            local nextpoint = Config.PracticalTest[6].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(6)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '4', id = 2})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [6] = {
        coords = vector3(-543.76, -3358.36, 1.11),
        action = function()
            local current = Config.PracticalTest[6]
            local nextpoint = Config.PracticalTest[7].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(7)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '5', id = 2})
                    SendNUIMessage({action = 'updateTasks', done = 2, id = 2})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [7] = {
        coords = vector3(-626.24, -3357.77, 0.23),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = ('%s_7.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
            end
            local current = Config.PracticalTest[7]
            local nextpoint = Config.PracticalTest[8].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(8)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '1', id = 7})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [8] = {
        coords = vector3(-739.58, -3486.69, 0.18),
        action = function()
            local current = Config.PracticalTest[8]
            local nextpoint = Config.PracticalTest[9].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(9)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '2', id = 7})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [9] = {
        coords = vector3(-791.01, -3458.63, -0.03),
        action = function()
            local current = Config.PracticalTest[9]
            local nextpoint = Config.PracticalTest[10].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(10)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '3', id = 7})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [10] = {
        coords = vector3(-683.81, -3325.99, 0.65),
        action = function()
            local current = Config.PracticalTest[10]
            local nextpoint = Config.PracticalTest[11].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(11)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '4', id = 7})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [11] = {
        coords = vector3(-735.33, -3296.89, 0.76),
        action = function()
            local current = Config.PracticalTest[11]
            local nextpoint = Config.PracticalTest[12].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(12)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '5', id = 7})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [12] = {
        coords = vector3(-816.9, -3442.8, -0.03),
        action = function()
            local current = Config.PracticalTest[12]
            local nextpoint = Config.PracticalTest[13].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(13)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '6', id = 7})
                    SendNUIMessage({action = 'updateTasks', done = 7, id = 3})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [13] = {
        coords = vector3(-905.4, -3596.0, 0.07),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = ('%s_2.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
            end
            local current = Config.PracticalTest[13]
            local nextpoint = Config.PracticalTest[14].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(14)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '1', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [14] = {
        coords = vector3(-1047.36, -3732.67, 0.01),
        action = function()
            local current = Config.PracticalTest[14]
            local nextpoint = Config.PracticalTest[15].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(15)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '2', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [15] = {
        coords = vector3(-1289.62, -3706.73, 0.06),
        action = function()
            local current = Config.PracticalTest[15]
            local nextpoint = Config.PracticalTest[16].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(16)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '3', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [16] = {
        coords = vector3(-1564.15, -3579.65, 0.62),
        action = function()
            local current = Config.PracticalTest[16]
            local nextpoint = Config.PracticalTest[17].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(17)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '4', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [17] = {
        coords = vector3(-1921.46, -3388.83, 0.79),
        action = function()
            local current = Config.PracticalTest[17]
            local nextpoint = Config.PracticalTest[18].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(18)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '5', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [18] = {
        coords = vector3(-2099.53, -3125.16, 1.12),
        action = function()
            local current = Config.PracticalTest[18]
            local nextpoint = Config.PracticalTest[19].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(19)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '6', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [19] = {
        coords = vector3(-1968.61, -2780.43, 0.46),
        action = function()
            local current = Config.PracticalTest[19]
            local nextpoint = Config.PracticalTest[20].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(20)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '7', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [20] = {
        coords = vector3(-1880.1, -2634.65, 0.62),
        action = function()
            local current = Config.PracticalTest[20]
            local nextpoint = Config.PracticalTest[21].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(21)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '8', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [21] = {
        coords = vector3(-1699.43, -2332.16, 0.28),
        action = function()
            local current = Config.PracticalTest[21]
            local nextpoint = Config.PracticalTest[22].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(22)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '9', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [22] = {
        coords = vector3(-1537.7, -2132.03, -0.01),
        action = function()
            local current = Config.PracticalTest[22]
            local nextpoint = Config.PracticalTest[23].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(23)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '10', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [23] = {
        coords = vector3(-1265.72, -1961.36, -0.19),
        action = function()
            local current = Config.PracticalTest[23]
            local nextpoint = Config.PracticalTest[24].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(24)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '11', id = 13})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [24] = {
        coords = vector3(-848.19, -1550.08, -0.49),
        action = function()
            local current = Config.PracticalTest[24]
            local nextpoint = Config.PracticalTest[25].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(25)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '12', id = 13})
                    SendNUIMessage({action = 'updateTasks', done = 13, id = 4})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [25] = {
        coords = vector3(-791.52, -1406.0, -0.69),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = ('%s_25.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
            end
            local current = Config.PracticalTest[25]
            local nextpoint = Config.PracticalTest[26].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 4.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(26)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTasks', done = 25, id = 5})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [26] = {
        coords = vector3(-811.47, -1442.4, -0.68),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = ('%s_2.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
            end
            local current = Config.PracticalTest[26]
            local nextpoint = Config.PracticalTest[27].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(27)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '1', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [27] = {
        coords = vector3(-853.31, -1411.82, -0.68),
        action = function()
            local current = Config.PracticalTest[27]
            local nextpoint = Config.PracticalTest[28].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(28)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '2', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [28] = {
        coords = vector3(-913.15, -1352.6, -0.68),
        action = function()
            local current = Config.PracticalTest[28]
            local nextpoint = Config.PracticalTest[29].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(29)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '3', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [29] = {
        coords = vector3(-989.52, -1352.79, -0.69),
        action = function()
            local current = Config.PracticalTest[29]
            local nextpoint = Config.PracticalTest[30].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(30)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '4', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [30] = {
        coords = vector3(-1054.43, -1241.37, -1.15),
        action = function()
            local current = Config.PracticalTest[30]
            local nextpoint = Config.PracticalTest[31].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(31)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '5', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [31] = {
        coords = vector3(-1199.41, -989.37, -1.32),
        action = function()
            local current = Config.PracticalTest[31]
            local nextpoint = Config.PracticalTest[32].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(32)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '6', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [32] = {
        coords = vector3(-1236.32, -925.54, -0.88),
        action = function()
            local current = Config.PracticalTest[32]
            local nextpoint = Config.PracticalTest[33].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(33)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '7', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [33] = {
        coords = vector3(-1360.5, -824.64, -0.63),
        action = function()
            local current = Config.PracticalTest[33]
            local nextpoint = Config.PracticalTest[34].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(34)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '8', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [34] = {
        coords = vector3(-1628.55, -908.78, -0.69),
        action = function()
            local current = Config.PracticalTest[34]
            local nextpoint = Config.PracticalTest[35].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(35)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '9', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [35] = {
        coords = vector3(-1797.73, -980.99, -0.75),
        action = function()
            local current = Config.PracticalTest[35]
            local nextpoint = Config.PracticalTest[36].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(36)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '10', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [36] = {
        coords = vector3(-1882.88, -1009.82, -0.48),
        action = function()
            local current = Config.PracticalTest[36]
            local nextpoint = Config.PracticalTest[37].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(37)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '11', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [37] = {
        coords = vector3(-2097.94, -927.49, -0.6),
        action = function()
            local current = Config.PracticalTest[37]
            local nextpoint = Config.PracticalTest[38].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(38)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '12', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [38] = {
        coords = vector3(-2369.44, -741.48, -0.15),
        action = function()
            local current = Config.PracticalTest[38]
            local nextpoint = Config.PracticalTest[39].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(39)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '13', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [39] = {
        coords = vector3(-2716.04, -469.13, 0.3),
        action = function()
            local current = Config.PracticalTest[39]
            local nextpoint = Config.PracticalTest[40].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(40)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '14', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [40] = {
        coords = vector3(-3093.81, -140.18, 0.67),
        action = function()
            local current = Config.PracticalTest[40]
            local nextpoint = Config.PracticalTest[41].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(41)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '15', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [41] = {
        coords = vector3(-3246.5, 145.11, 0.21),
        action = function()
            local current = Config.PracticalTest[41]
            local nextpoint = Config.PracticalTest[42].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(42)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '16', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [42] = {
        coords = vector3(-3318.91, 416.74, 0.74),
        action = function()
            local current = Config.PracticalTest[42]
            local nextpoint = Config.PracticalTest[43].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(43)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '17', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [43] = {
        coords = vector3(-3415.59, 794.16, 0.6),
        action = function()
            local current = Config.PracticalTest[43]
            local nextpoint = Config.PracticalTest[44].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(44)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '18', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [44] = {
        coords = vector3(-3461.05, 1006.31, 0.24),
        action = function()
            local current = Config.PracticalTest[44]
            local nextpoint = Config.PracticalTest[45].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(45)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '19', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [45] = {
        coords = vector3(-3374.37, 1488.44, 0.03),
        action = function()
            local current = Config.PracticalTest[45]
            local nextpoint = Config.PracticalTest[46].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(46)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '20', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [46] = {
        coords = vector3(-3291.54, 1835.92, 0.08),
        action = function()
            local current = Config.PracticalTest[46]
            local nextpoint = Config.PracticalTest[47].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(47)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '21', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [47] = {
        coords = vector3(-3154.97, 2249.11, 0.12),
        action = function()
            local current = Config.PracticalTest[47]
            local nextpoint = Config.PracticalTest[48].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(48)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '22', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [48] = {
        coords = vector3(-2924.49, 2514.64, 0.55),
        action = function()
            local current = Config.PracticalTest[48]
            local nextpoint = Config.PracticalTest[49].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(49)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '23', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [49] = {
        coords = vector3(-2827.11, 2572.84, -0.2),
        action = function()
            local current = Config.PracticalTest[49]
            local nextpoint = Config.PracticalTest[50].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(50)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '24', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [50] = {
        coords = vector3(-2670.43, 2596.56, -0.01),
        action = function()
            local current = Config.PracticalTest[50]
            local nextpoint = Config.PracticalTest[51].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(51)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '25', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [51] = {
        coords = vector3(-2414.35, 2588.1, -0.4),
        action = function()
            local current = Config.PracticalTest[51]
            local nextpoint = Config.PracticalTest[52].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(52)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '26', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [52] = {
        coords = vector3(-2126.94, 2593.89, -0.59),
        action = function()
            local current = Config.PracticalTest[52]
            local nextpoint = Config.PracticalTest[53].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(53)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '27', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [53] = {
        coords = vector3(-1954.69, 2559.75, -0.65),
        action = function()
            local current = Config.PracticalTest[53]
            local nextpoint = Config.PracticalTest[54].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(54)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '28', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [54] = {
        coords = vector3(-1694.96, 2598.23, -0.66),
        action = function()
            local current = Config.PracticalTest[54]
            local nextpoint = Config.PracticalTest[55].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(55)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '29', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [55] = {
        coords = vector3(-1458.45, 2621.88, -0.93),
        action = function()
            local current = Config.PracticalTest[55]
            local nextpoint = Config.PracticalTest[56].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(56)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '30', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [56] = {
        coords = vector3(-1199.75, 2718.97, -0.94),
        action = function()
            local current = Config.PracticalTest[56]
            local nextpoint = Config.PracticalTest[57].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(57)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '31', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [57] = {
        coords = vector3(-1063.63, 2821.28, 2.32),
        action = function()
            local current = Config.PracticalTest[57]
            local nextpoint = Config.PracticalTest[58].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(58)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '32', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [58] = {
        coords = vector3(-928.06, 2810.08, 8.52),
        action = function()
            local current = Config.PracticalTest[58]
            local nextpoint = Config.PracticalTest[59].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(59)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '33', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [59] = {
        coords = vector3(-799.1, 2827.16, 8.94),
        action = function()
            local current = Config.PracticalTest[59]
            local nextpoint = Config.PracticalTest[60].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(60)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '34', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [60] = {
        coords = vector3(-582.86, 2942.02, 11.6),
        action = function()
            local current = Config.PracticalTest[60]
            local nextpoint = Config.PracticalTest[61].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(61)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '35', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [61] = {
        coords = vector3(-469.84, 2910.68, 12.52),
        action = function()
            local current = Config.PracticalTest[61]
            local nextpoint = Config.PracticalTest[62].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(62)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '36', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [62] = {
        coords = vector3(-369.24, 3015.29, 12.34),
        action = function()
            local current = Config.PracticalTest[62]
            local nextpoint = Config.PracticalTest[63].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(63)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '37', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [63] = {
        coords = vector3(-265.85, 3004.12, 17.81),
        action = function()
            local current = Config.PracticalTest[63]
            local nextpoint = Config.PracticalTest[64].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(64)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '38', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [64] = {
        coords = vector3(-166.0, 3070.14, 17.5),
        action = function()
            local current = Config.PracticalTest[64]
            local nextpoint = Config.PracticalTest[65].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(65)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '39', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [65] = {
        coords = vector3(-79.15, 3108.85, 24.26),
        action = function()
            local current = Config.PracticalTest[65]
            local nextpoint = Config.PracticalTest[66].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(66)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '40', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [66] = {
        coords = vector3(56.06, 3168.33, 24.79),
        action = function()
            local current = Config.PracticalTest[66]
            local nextpoint = Config.PracticalTest[67].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(67)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '41', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [67] = {
        coords = vector3(114.84, 3310.98, 28.67),
        action = function()
            local current = Config.PracticalTest[67]
            local nextpoint = Config.PracticalTest[68].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(68)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '42', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [68] = {
        coords = vector3(203.28, 3616.97, 28.82),
        action = function()
            local current = Config.PracticalTest[68]
            local nextpoint = Config.PracticalTest[69].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(69)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '43', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [69] = {
        coords = vector3(436.42, 3849.11, 29.25),
        action = function()
            local current = Config.PracticalTest[69]
            local nextpoint = Config.PracticalTest[70].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(70)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '44', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [70] = {
        coords = vector3(834.38, 3902.88, 29.39),
        action = function()
            local current = Config.PracticalTest[70]
            local nextpoint = Config.PracticalTest[71].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(71)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '45', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [71] = {
        coords = vector3(1287.87, 3993.82, 29.57),
        action = function()
            local current = Config.PracticalTest[71]
            local nextpoint = Config.PracticalTest[72].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(72)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '46', id = 26})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [72] = {
        coords = vector3(1465.94, 4195.53, 29.77),
        action = function()
            local current = Config.PracticalTest[72]
            local nextpoint = Config.PracticalTest[73].coords
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nextpoint.x, nextpoint.y, nextpoint.z, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 8.0 then
                    DeleteCheckpoint(currentCheckpoint)
                    setBlipToPoint(nil)
                    setBlipToSchool(true)
                    PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                    SendNUIMessage({action = 'updateTaskProgress', value = '47', id = 26})
                    SendNUIMessage({action = 'updateTasks', done = 26, id = 6})
                    break
                end
                Citizen.Wait(1)
            end
        end
    },
    [73] = {
        coords = vector3(1317.16, 4233.76, 30.65),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = ('%s_25.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
            end
            local inRange = false
            local shown = false
            local current = Config.PracticalTest[73]
            if currentExam and driveErrors < Config.MaxDriveErrors then
                currentCheckpoint = CreateCheckpoint(Config.Practical['Checkpoint'].id, current.coords.x, current.coords.y, current.coords.z, nil, nil, nil, Config.Practical['Checkpoint'].diameter, Config.Practical['Checkpoint'].rgba[1], Config.Practical['Checkpoint'].rgba[2], Config.Practical['Checkpoint'].rgba[3], Config.Practical['Checkpoint'].rgba[4], false)
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                local myCoords = GetEntityCoords(myVehicle)
                local distance = #(myCoords - current.coords)
                if distance < 4.0 then
                    inRange = TRANSLATE('help.disable_engine')
                    if Config.Core == "ESX" and not Config.Interact.Enabled then
                        ESX.ShowHelpNotification(inRange)
                    end
                    if not GetIsVehicleEngineRunning(currentDriveVehicle) then
                        DeleteCheckpoint(currentCheckpoint)
                        FreezeEntityPosition(currentDriveVehicle, true)
                        TaskLeaveVehicle(myPed, myVehicle, 64)
                        SetVehicleDoorsLocked(myVehicle, 2)
                        ClearArea(1338.48, 4268.74, 30.5, 12.0, true, false, false, false)
                        PlaySoundFrontend(-1, 'CHECKPOINT_NORMAL', 'HUD_MINI_GAME_SOUNDSET', false)
                        SendNUIMessage({action = 'updateTasks', done = 73, id = 7})
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
                end
                Citizen.Wait(1)
            end
        end
    },
    [74] = {
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = ('%s_74.mp3'):format(string.lower(Config.Examiner.SpokenLanguage))})
            end
            local inRange = false
            local shown = false
            local isMooring = false
            local rope = nil
            local mooringOffset, mooringDone = GetOffsetFromEntityInWorldCoords(currentDriveVehicle, -0.35, -3.5, 0.0), false
            local portCoords, portDone = vector3(1319.7, 4230.75, 32.92), false
            local lineMooringProp = nil
            while currentExam do
                local myPed = PlayerPedId()
                local myCoords = GetEntityCoords(myPed)
                if not mooringDone and not portDone then
                    DrawMarker(1, mooringOffset.x, mooringOffset.y, mooringOffset.z-0.35, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 30, 205, 36, 120, false, false, false, false, false, false, false)
                    if  #(myCoords - vec(mooringOffset.x, mooringOffset.y, mooringOffset.z + 0.5)) < 1.25 then
                        inRange = TRANSLATE('help.attach_rope_to_the_boat')
                        if Config.Core == "ESX" and not Config.Interact.Enabled then
                            ESX.ShowHelpNotification(inRange)
                        end
                        if not isMooring and IsControlJustPressed(0, 38) then
                            isMooring = true
                            Citizen.CreateThread(function()
                                requestAnim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", -1, 1)
                                FreezeEntityPosition(PlayerPedId(), true)
                                PlaySoundFrontend(-1, 'Team_Capture_Start', 'GTAO_Magnate_Yacht_Attack_Soundset', 0)
                                Citizen.Wait(10000)
                                FreezeEntityPosition(PlayerPedId(), false)
                                ClearPedTasks(PlayerPedId())
                                rope = AddRope(mooringOffset.x, mooringOffset.y, mooringOffset.z, 0, 0, 0, 8.0, 1, 8.0, 0.1, 0.0, false, false, false, 5.0, false, 0)
                                local myHandPosition = GetWorldPositionOfEntityBone(myPed, GetPedBoneIndex(myPed, 0x49D9))
                                AttachEntitiesToRope(rope, currentDriveVehicle, myPed, mooringOffset.x, mooringOffset.y, mooringOffset.z, myHandPosition.x, myHandPosition.y, myHandPosition.z, #(mooringOffset - portCoords)+1.0, false, false, nil, nil)
                                -- AttachEntitiesToRope(rope, currentDriveVehicle, GetPedBoneIndex(myPed, 18905), mooringOffset.x, mooringOffset.y, mooringOffset.z, myHandPosition.x, myHandPosition.y, myHandPosition.z, #(mooringOffset - portCoords)+1.0, false, false, nil, nil)
                                mooringDone = true
                                isMooring = false
                            end)
                        end
                    end
                end
                if mooringDone and not portDone then
                    DrawMarker(1, portCoords.x, portCoords.y, portCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.85, 0.85, 0.85, 30, 205, 36, 120, false, false, false, false, false, false, false)
                    if #(myCoords - vec(portCoords.x, portCoords.y, portCoords.z + 0.5)) < 1.55 then
                        inRange = TRANSLATE('help.moor_the_boat')
                        if Config.Core == "ESX" and not Config.Interact.Enabled then
                            ESX.ShowHelpNotification(inRange)
                        end
                        if not isMooring and IsControlJustPressed(0, 38) then
                            isMooring = true
                            StopRopeUnwindingFront(rope)
                            StartRopeWinding(rope)
                            RopeForceLength(rope, #(mooringOffset - portCoords))
                            requestAnim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", -1, 1)
                            FreezeEntityPosition(PlayerPedId(), true)
                            PlaySoundFrontend(-1, 'Team_Capture_Start', 'GTAO_Magnate_Yacht_Attack_Soundset', 0)
                            Citizen.Wait(10000)
                            DetachRopeFromEntity(rope, myPed)
                            FreezeEntityPosition(PlayerPedId(), false)
                            ClearPedTasks(PlayerPedId())
                            Citizen.Wait(1250)
                            DetachRopeFromEntity(rope, myPed)
                            DetachRopeFromEntity(rope, currentDriveVehicle)
                            StopRopeUnwindingFront(rope)
                            StopRopeWinding(rope)
                            RopeConvertToSimple(rope)
                            DeleteRope(rope)
                            DeleteVehicle(currentDriveVehicle)
                            if Config.Examiner.Enabled then
                                DeletePed(examinerPed)
                            end
                            setBlipToSchool(false)
                            if Config.TeleportPlayerAfterExam then
                                SetEntityCoords(myPed, Config.Zones['menu'].coords)
                            end
                            SendNUIMessage({action = 'updateTasks', done = 74, id = 8})
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
}