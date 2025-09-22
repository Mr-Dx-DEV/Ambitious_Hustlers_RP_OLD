Config = {}

-- █▀ █▀▄ ▄▀▄ █▄ ▄█ ██▀ █   █ ▄▀▄ █▀▄ █▄▀
-- █▀ █▀▄ █▀█ █ ▀ █ █▄▄ ▀▄▀▄▀ ▀▄▀ █▀▄ █ █
local frameworkAutoFind = function()
    if GetResourceState('es_extended') == 'started' then
        return "ESX"
    elseif GetResourceState('qb-core') == 'started' then
        return "QB-Core"
    end
end

Config.Core = frameworkAutoFind()
Config.CoreExport = function()
    if Config.Core == "ESX" then
        return exports['es_extended']:getSharedObject()
    elseif Config.Core == "QB-Core" then
        return exports['qb-core']:GetCoreObject()
    end
end

---@field PlayerLoaded string: ESX: "esx:playerLoaded" / QB-Core: "QBCore:Client:OnPlayerLoaded"
Config.PlayerLoaded = Config.Core == "ESX" and "esx:playerLoaded" or "QBCore:Client:OnPlayerLoaded"

---@field PlayerDropped string: ESX: "esx:playerDropped" / QB-Core: "playerDropped"
Config.PlayerDropped = Config.Core == "ESX" and "esx:playerDropped" or "playerDropped"


Config.Notification = function(message, type)
    if type == "success" then
        if GetResourceState("vms_notify") == 'started' then
            exports['vms_notify']:Notification("DRIVE SCHOOL", message, 5000, "#32a852", "fa-solid fa-graduation-cap")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'success', 5000)
        end
    elseif type == "error" then
        if GetResourceState("vms_notify") == 'started' then
            exports['vms_notify']:Notification("DRIVE SCHOOL", message, 5000, "#eb4034", "fa-solid fa-graduation-cap")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'error', 5000)
        end
    end
end

Config.Interact = {
    Enabled = false,
    Open = function(message)
        exports["interact"]:Open("E", message) -- Here you can use your TextUI or use my free one - https://github.com/vames-dev/interact
        -- exports['qb-core']:DrawText(message, 'right')
    end,
    Close = function()
        exports["interact"]:Close() -- Here you can use your TextUI or use my free one - https://github.com/vames-dev/interact
        -- exports['qb-core']:HideText()
    end,
}


-- █▄ ▄█ ▄▀▄ █ █▄ █   ▄▀▀ ██▀ ▀█▀ ▀█▀ █ █▄ █ ▄▀  ▄▀▀
-- █ ▀ █ █▀█ █ █ ▀█   ▄██ █▄▄  █   █  █ █ ▀█ ▀▄█ ▄██
---@field AccessOnMarker boolean: Do you want to use access to the exam selection menu as E in marker?
Config.AccessOnMarker = true
Config.UseTarget = true
Config.TargetResource = 'ox_target'
Config.Target = function()
    exports[Config.TargetResource]:addBoxZone({
        coords = vec(Config.Zones["menu"].coords.x, Config.Zones["menu"].coords.y, Config.Zones["menu"].coords.z+0.35),
        size = vec(4.0, 4.0, 4.0),
        debug = false,
        useZ = true,
        rotation = 60,
        distance = 9.0,
        options = {
            {
                name = 'driveschoolv2',
                event = 'vms_driveschoolv2:openMenu',
                icon = 'fa-regular fa-file-lines',
                label = "Drive School"
            }
        }
    })
end

---@field UseVMSCityHall boolean: 
Config.UseVMSCityHall = GetResourceState('vms_cithall') == 'started'

---@field UseSoundsUI boolean: Do you want to use interaction sounds in the UI?
Config.UseSoundsUI = true

---@field EnableBlur boolean: Do you want to blur the background in the game when you have the UI running?
Config.EnableBlur = true 

---@field PossibleChargeByBank boolean: if you set it true, when the player does not have enough cash, it will try to take it from his bank account
Config.PossibleChargeByBank = true

---@field MaxSpeedLoopTimeout number: if Config.EnableMaxSpeedLoop = true and exceeds the maximum speed, will have 1 second (1000 milliseconds) to reduce the speed, otherwise another error will be charged
Config.MaxSpeedLoopTimeout = 1000
Config.EnableMaxSpeedLoop = true

---@field MaxSpeed number or nil: maximum speed / if you dont want a speed limit set nil
Config.MaxSpeed = 50
Config.SpeedMultiplier = 3.6 -- kmh = 3.6 / mph = 2.236936

---@field MaxDriveErrors number: How much maximum a player can get bugs for vehicle damage, on 5 will require going back to driving school and failing the test
Config.MaxDriveErrors = 5

---@field CheckIsManeuveringAreaIsOccupied boolean: If the maneuvering area is occupied, the practical exam will not start and the player will receive notification about it
Config.CheckIsManeuveringAreaIsOccupied = true
Config.ManeuveringAreaCoords = {
    {coords = vector3(-720.33, -2212.69, 5.0), radius = 5.0},
    {coords = vector3(-725.85, -2208.24, 5.0), radius = 7.0},
    {coords = vector3(-733.66, -2201.88, 6.0), radius = 9.0},
    {coords = vector3(-743.1, -2193.75, 5.01), radius = 7.0},
    {coords = vector3(-751.14, -2188.25, 5.0), radius = 6.0},
    {coords = vector3(-757.61, -2191.97, 5.0), radius = 8.0},
    {coords = vector3(-763.69, -2199.19, 5.0), radius = 6.5},
    {coords = vector3(-771.38, -2208.22, 5.0), radius = 6.5},
    {coords = vector3(-762.01, -2205.41, 5.0), radius = 5.0},
    {coords = vector3(-777.68, -2216.09, 5.0), radius = 7.0},
    {coords = vector3(-782.92, -2222.06, 5.0), radius = 5.0},
}

Config.Examiner = {
    Enabled = true, -- Do you want to use a ped as an examiner who sits with the player in the vehicle?
    SpokenCommands = true,
    SpokenLanguage = "EN", -- "EN", "DE", "BG", "ES", "FR", "PT"
    PedModel = 'ig_fbisuit_01' -- https://wiki.rage.mp/index.php?title=Peds
}

local licensesResourceAutoFind = function()
    if GetResourceState('Buty-license') == 'started' then
        return "buty-license"
    else
        return "default"
    end
end
--[[
    Supported Licenses script:
    - Buty-license
    - esx_license (default)
    - qb-core metadata (default)
]]
Config.LicensesResource = licensesResourceAutoFind()

---@field AddLicenseItem boolean: Do you use your drivers license as an item on the server
Config.AddLicenseItem = false
Config.LicenseItem = "driving_license"

Config.MenuIcon = ''
Config.Licenses = {
    Theory = {
        ['A'] = {name = 'theory_a', price = 150, menuIcon = 'far fa-file-alt', enabled = true},
        ['B'] = {name = 'theory_b', price = 300, menuIcon = 'far fa-file-alt', enabled = true},
        ['C'] = {name = 'theory_c', price = 450, menuIcon = 'far fa-file-alt', enabled = true}
    },
    Practical = {
        ['A'] = {name = Config.LicensesResource == "buty-license" and 'motorcycle' or 'drive_a', price = 2500, menuIcon = 'fas fa-motorcycle', enabled = true},
        ['B'] = {name = Config.LicensesResource == "buty-license" and 'car' or 'drive_b', price = 4500, menuIcon = 'fas fa-car-side', enabled = true},
        ['C'] = {name = Config.LicensesResource == "buty-license" and 'truck' or 'drive_c', price = 6500, menuIcon = 'fas fa-truck', enabled = true}
    }
}

Config.Questions = {
    ['A'] = {
        QuestionsCount = 18, -- Number of all questions for the draw pool
        QuestionToAnswer = 18, -- Questions the player will have to answer
        NeedAnswersToPass = 16, -- Number of questions a player must answer correctly to pass the theory exam
    },
    ['B'] = {
        QuestionsCount = 17,
        QuestionToAnswer = 17,
        NeedAnswersToPass = 15,
    },
    ['C'] = {
        QuestionsCount = 5,
        QuestionToAnswer = 5,
        NeedAnswersToPass = 4,
    },
}

Config.Tasks = {
    {label = "Start the engine", id = 1}, 
    -- DE: Starte den Motor
    -- BG: Стартирайте двигателя
    -- ES: Encender el motor
    -- FR: Démarre le moteur
    -- PT: Ligue o Motor
    -- PL: Uruchom silnik

    {label = "Turn on the lights", id = 2}, 
    -- DE: Schalte die Scheinwerfer ein
    -- BG: Включете светлените на автомобила
    -- ES: Enciende las luces
    -- FR: Allume les phares
    -- PT: Ligue as luzes
    -- PL: Włącz światła

    {label = "Get on the elevation", id = 3}, 
    -- DE: Fahre die Rampe hoch
    -- BG: Качете се на височината
    -- ES: Sube a la elevación
    -- FR: Monte sur la plateforme
    -- PT: Dirija-se para a rampa
    -- PL: Wjedź na wzniesienie

    {label = "Park at the rear slant", id = 4}, 
    -- DE: Parke in die Parklücke ein
    -- BG: Паркирайте на задния наклон
    -- ES: Parquea en la inclinación trasera
    -- FR: Gare toi en biais arrière
    -- PT: Estacione de marcha-atrás
    -- PL: Zaparkuj pod skosem tyłem
    
    {label = "Park parallel in front", id = 5}, 
    -- DE: Parke dort in Fahrtrichtung ein
    -- BG: Паркирайте успоредно отпред
    -- ES: Parquea paralelo en el frente
    -- FR: Gare toi en parallèle à l'avant
    -- PT: Estacione paralelamente de frente
    -- PL: Zaparkuj równolegle przodem
    
    -- {label = "ID 6 HAVE NO SPECIAL MANEUVERS", id = 6},
    
    {label = "Park parallel backwards", id = 7}, 
    -- DE: Parke rückwärts ein
    -- BG: Паркирайте успоредно отзад
    -- ES: Parquea paralelo al revés
    -- FR: Gare toi en parallèle à l'arrière
    -- PT: Estacione paralelamente de marcha-atrás
    -- PL: Zaparkuj równolegle tyłem
    
    {label = "Leave the maneuvering area", id = 8}, 
    -- DE: Verlasse den Verkehrsübungsplatz
    -- BG: Напуснете зоната за маневриране
    -- ES: Deja el área de maniobra
    -- FR: Quitte la zone de manœuvre
    -- PT: Saia da zona de manobras
    -- PL: Opuść plac manewrowy
    
    {label = "Get on a public road", id = 9}, 
    -- DE: Fahre auf die Straße
    -- BG: Поставете се на обществен път
    -- ES: Sube a una carretera pública
    -- FR: Emprunte une route publique
    -- PT: Entre na estrada
    -- PL: Wyjedź na drogę publiczną
    
    {label = "Stop before the lanes", id = 10}, 
    -- DE: Halte am Stoppschild
    -- BG: Спрете преди лентaтa за движение
    -- ES: Detente antes de los carriles
    -- FR: Arrête-toi avant le passage piéton
    -- PT: Pare antes da linha
    -- PL: Zatrzymaj się przed pasami
    
    {label = "Free ride <span>0.00</span>km / 2.00km", id = 11},
    
    {label = "Go back to driving school", id = 12}, 
    -- DE: Fahre zurück zur Fahrschule
    -- BG: Върнете се в автошколата
    -- ES: Volver a la escuela de conducción
    -- FR: Retourne à l'école de conduite
    -- PT: Volte para a escola de condução
    -- PL: Wróć do szkoły jazdy
}

Config.Zones = {
    ["menu"] = {
        menuType = "qb-menu", -- "esx_menu_default" / "esx_context" / "qb-menu" / "ox_lib"
        menuPosition = 'left', -- only for esx_menu_default and esx_context
        coords = vector3(240.87, -1379.16, 33.74),
        marker = {
            id = 36, -- https://docs.fivem.net/docs/game-references/markers/
            color = {115, 255, 115, 120}, -- R(ed), G(reen), B(lue), A(lpha)
            scale = vec(0.65, 0.65, 0.65),
            bobUpAndDown = false, -- jumping marker
            rotate = true -- rotating marker
        },
        blip = { -- https://docs.fivem.net/docs/game-references/blips/
            sprite = 778,
            display = 4,
            scale = 0.5,
            color = 43,
            name = "Driving School"
        }
    },
    ["return_vehicle"] = {
        coords = vector3(-890.08, -2377.37, 12.94),
        marker = {
            id = 1, -- https://docs.fivem.net/docs/game-references/markers/
            color = {255, 0, 0, 120}, -- R(ed), G(reen), B(lue), A(lpha)
            scale = vec(1.5, 1.5, 0.75),
            bobUpAndDown = false, -- jumping marker
            rotate = true -- rotating marker
        },
        blip = { -- https://docs.fivem.net/docs/game-references/blips/
            sprite = 467,
            display = 4,
            scale = 1.0,
            color = 2,
            routeColor = 2,
            name = "Return to Drive School"
        }
    }
}

Config.Practical = {
    ['Vehicles'] = { -- https://docs.fivem.net/docs/game-references/vehicle-models/
        A = 'pcj',
        B = 'premier',
        C = 'boxville_vms',
    },
    ['Marker'] = { -- https://docs.fivem.net/docs/game-references/markers/
        id = 20, 
        size = vec(0.35, 0.35, 0.35),
        rotate = {0.0, 180.0, 0.0},
        rgba = {255, 255, 0, 140},
        rotataing = true
    },
    ['Blip'] = { -- https://docs.fivem.net/docs/game-references/blips/
        sprite = 270,
        display = 4,
        scale = 0.8,
        color = 28,
        routeColor = 28,
        name = "Point"
    },
    ['SpawnPoint'] = vector4(-723.38, -2210.23, 4.9, 49.79),
}

Config.PracticalTest = { -- if you don't know what each action does, don't touch it to avoid spoiling the exam route
    [1] = {
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_1.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    if GetIsVehicleEngineRunning(myVehicle) then
                        SetVehicleLightsMode(myVehicle, 1)
                        SendNUIMessage({action = 'updateTasks', done = 1})
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [2] = {
        action = function()
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local _, lights, highbeams = GetVehicleLightsState(myVehicle)
                    if lights then
                        setBlipToPoint(3)
                        SendNUIMessage({action = 'updateTasks', done = 2})
                        FreezeEntityPosition(myVehicle, false)
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [3] = {
        coords = vector3(-732.03, -2202.92, 6.49),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_3.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local current = Config.PracticalTest[3]
                    local distance = #(myCoords - current.coords)
                    DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.35), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    if distance < 1.5 then
                        setBlipToPoint(4)
                        FreezeEntityPosition(myVehicle, true)
                        Citizen.Wait(2000)
                        FreezeEntityPosition(myVehicle, false)
                        SendNUIMessage({action = 'updateTasks', done = 3})
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [4] = {
        coords = vector3(-763.08, -2205.39, 5.2),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_4.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local current = Config.PracticalTest[4]
                    local distance = #(myCoords - current.coords)
                    DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    if distance < 1.5 then
                        setBlipToPoint(5)
                        SendNUIMessage({action = 'updateTasks', done = 4})
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [5] = {
        coords = vector4(-774.34, -2215.93, 5.2, 141.49),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_5.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local current = Config.PracticalTest[5]
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    if distance < 1.5 then
                        setBlipToPoint(6)
                        SetEntityCoords(myVehicle, current.coords.x, current.coords.y, current.coords.z)
                        SetEntityHeading(myVehicle, current.coords.w)
                        SendNUIMessage({action = 'updateTasks', done = 5})
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [6] = {
        coords = vector3(-782.78, -2221.99, 5.2),
        action = function()
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local current = Config.PracticalTest[6]
                    local distance = #(myCoords - current.coords)
                    DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    if distance < 1.5 then
                        setBlipToPoint(7)
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [7] = {
        coords = vector4(-775.85, -2217.02, 5.2, 138.45),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_7.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myPed = PlayerPedId()
                    local myVehicle = GetVehiclePedIsIn(myPed, false)
                    local myCoords = GetEntityCoords(myVehicle)
                    local current = Config.PracticalTest[7]
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    if distance < 1.5 then
                        setBlipToPoint(8)
                        SetEntityCoords(myVehicle, current.coords.x, current.coords.y, current.coords.z)
                        SetEntityHeading(myVehicle, current.coords.w)
                        SendNUIMessage({action = 'updateTasks', done = 7})
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [8] = {
        coords = vector3(-713.93, -2224.48, 5.1),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_8.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local current = Config.PracticalTest[8]
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.25), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    if distance < 1.5 then
                        setBlipToPoint(9)
                        SendNUIMessage({action = 'updateTasks', done = 8})
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [9] = {
        coords = vector3(-688.92, -2219.61, 5.24),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_9.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local current = Config.PracticalTest[9]
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.4), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    if distance < 1.5 then
                        setBlipToPoint(10)
                        SendNUIMessage({action = 'updateTasks', done = 9})
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [10] = {
        coords = vector3(-624.89, -2258.02, 5.23),
        action = function()
            if Config.Examiner.SpokenCommands and driveErrors < Config.MaxDriveErrors then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_10.mp3'})
            end
            while currentExam and driveErrors < Config.MaxDriveErrors do
                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                    local myCoords = GetEntityCoords(PlayerPedId())
                    local current = Config.PracticalTest[10]
                    local distance = #(myCoords - vec(current.coords.x, current.coords.y, current.coords.z))
                    DrawMarker(Config.Practical['Marker'].id, vec(current.coords.x, current.coords.y, current.coords.z+2.0), 0.0, 0.0, 0.0, Config.Practical['Marker'].rotate[1], Config.Practical['Marker'].rotate[2], Config.Practical['Marker'].rotate[3],  Config.Practical['Marker'].size, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    DrawMarker(1, vec(current.coords.x, current.coords.y, current.coords.z-0.4), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.Practical['Marker'].size*1.5, Config.Practical['Marker'].rgba[1], Config.Practical['Marker'].rgba[2], Config.Practical['Marker'].rgba[3], Config.Practical['Marker'].rgba[4], false, false, false, Config.Practical['Marker'].rotataing, false, false, false)
                    if distance < 1.5 then
                        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
                        RequestModel(GetHashKey('a_m_m_polynesian_01'))
                        while not HasModelLoaded(GetHashKey('a_m_m_polynesian_01')) do
                            Wait(1)
                        end
                        local npc = CreatePed(4, GetHashKey('a_m_m_polynesian_01'), vector3(-624.91, -2268.52, 4.95), 321.79, false, true)
                        TaskPedSlideToCoord(npc, vector3(-610.01, -2248.67, 5.1), 321.79, 1.0)
                        FreezeEntityPosition(veh, true)
                        Citizen.Wait(11500)
                        FreezeEntityPosition(veh, false)
                        setBlipToPoint(11)
                        SendNUIMessage({action = 'updateTasks', done = 10})
                        Citizen.Wait(2500)
                        DeletePed(npc)
                        break
                    end
                end
                Citizen.Wait(1)
            end
        end
    },
    [11] = {
        action = function()
            local hasKM = 0
            while currentExam and driveErrors < Config.MaxDriveErrors do
                Citizen.Wait(50)
                if not ((IsControlPressed(0,71) and IsControlPressed(0,63)) or (IsControlPressed(0,71) and IsControlPressed(0,64))) then
                    if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
                        if veh == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                            Citizen.Wait(1)
                            showKM = math.floor(hasKM * 1.33)/1000
                            local oldPos = GetEntityCoords(PlayerPedId())
                            Citizen.Wait(1000)
                            local curPos = GetEntityCoords(PlayerPedId())
                            if IsVehicleOnAllWheels(veh) then
                                dist = GetDistanceBetweenCoords(oldPos.x, oldPos.y, oldPos.z, curPos.x, curPos.y, curPos.z, true)
                            else
                                dist = 0
                            end
                            hasKM = hasKM + dist/1000
                            SendNUIMessage({action = 'updateDriveProgress', count =  hasKM, id = 11})
                            if hasKM > 2.00 then
                                SendNUIMessage({action = 'updateDriveProgress', count = 2.00, id = 11})
                                SendNUIMessage({action = 'updateTasks', done = 11})
                                setBlipToSchool(true)
                                break
                            end
                        end
                    end
                end
            end
        end
    },
    [12] = {
        action = function()
            local inRange = false
            local shown = false
            if Config.Examiner.SpokenCommands and currentExam and (driveErrors < Config.MaxDriveErrors or driveErrors >= Config.MaxDriveErrors) then
                SendNUIMessage({action = 'audioTask', filename = string.lower(Config.Examiner.SpokenLanguage)..'_12.mp3'})
            end
            while currentExam do
                inRange = false
                local sleep = true
                local myPed = PlayerPedId()
                local myVehicle = GetVehiclePedIsIn(myPed, false)
                if myVehicle and myVehicle == currentDriveVehicle then
                    local myCoords = GetEntityCoords(myVehicle)
                    local returnTable = Config.Zones["return_vehicle"]
                    local distance = #(myCoords - returnTable.coords)
                    if distance < 25.0 then
                        sleep = false
                        DrawMarker(returnTable.marker.id, returnTable.coords.x, returnTable.coords.y, returnTable.coords.z, 0, 0, 0, 0, 0, 0, returnTable.marker.scale, returnTable.marker.color[1], returnTable.marker.color[2], returnTable.marker.color[3], returnTable.marker.color[4], returnTable.marker.bobUpAndDown, false, false, returnTable.marker.rotate, false, false, false)
                        if distance < 1.5 then
                            inRange = true
                            if Config.Core == "ESX" and not Config.Interact.Enabled then
                                ESX.ShowHelpNotification(TRANSLATE('complete_theory'))
                            end
                            if IsControlJustPressed(0, 38) then
                                if GetVehiclePedIsIn(PlayerPedId()) == currentDriveVehicle and GetPedInVehicleSeat(currentDriveVehicle, -1) == PlayerPedId() then
                                    local plate = GetVehicleNumberPlateText(myVehicle)
                                    Config.OnVehicleDelete(myVehicle, plate)
                                    if Config.Examiner.Enabled then
                                        DeletePed(examinerPed)
                                    end
                                    setBlipToSchool(false)
                                    SendNUIMessage({action = 'updateTasks', done = 12})
                                    SendNUIMessage({action = 'closeTasks'})
                                    if Config.Interact.Enabled then
                                        Config.Interact.Close()
                                    end
                                    break
                                end
                            end
                        end
                    end
                    if Config.Interact.Enabled then
                        if inRange and not shown then
                            shown = true
                            Config.Interact.Open(TRANSLATE('complete_theory'))
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