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
            exports["vms_notify"]:Notification("FLIGHT SCHOOL", message, 5000, "#32a852", "fa-solid fa-circle-check")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'success', 5000)
        end
    elseif type == "error" then
        if GetResourceState("vms_notify") == 'started' then
            exports["vms_notify"]:Notification("FLIGHT SCHOOL", message, 5000, "#eb4034", "fa fa-exclamation-circle")
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
                name = 'flightschoolv2',
                event = 'vms_flightschoolv2:openMenu',
                icon = 'fa-regular fa-file-lines',
                label = "Flight School"
            }
        }
    })
end


---@field UseVMSCityHall boolean: 
Config.UseVMSCityHall = GetResourceState('vms_cityhall') == 'started'

---@field UseSoundsUI boolean: Do you want to use interaction sounds in the UI?
Config.UseSoundsUI = true

---@field EnableBlur boolean: Do you want to blur the background in the game when you have the UI running?
Config.EnableBlur = true

---@field PossibleChargeByBank boolean: if you set it true, when the player does not have enough cash, it will try to take it from his bank account
Config.PossibleChargeByBank = true

---@field MaxDriveErrors number: How many maximum errors a player can receive for damaging a vehicle, after this number of errors the exam will be aborted
Config.MaxDriveErrors = 8

---@field CheckIsStartAreaIsOccupied boolean: If the maneuvering area is occupied, the practical exam will not start and the player will receive notification about it
Config.CheckIsStartAreaIsOccupied = true

Config.UseJerryCanProp = true
Config.JerryCanObject = joaat('w_am_jerrycan')

Config.TeleportPlayerAfterExam = true
Config.TeleportPlayerAfterFailExam = true

Config.Examiner = {
    Enabled = true, -- Do you want to use a ped as an examiner who sits with the player in the vehicle?
    SpokenCommands = true,
    SpokenLanguage = "EN", -- "EN", "DE", "FR", "ES", "PG"
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

---@field AddLicenseItem boolean: Do you use your license as an item on the server
Config.AddLicenseItem = false
Config.LicenseItem = "pilot_license"

Config.MenuIcon = ''
Config.Licenses = {
    Theory = {
        ['HELICOPTER'] = {name = 'theory_helicopter', price = 5000, menuIcon = 'far fa-file-alt', enabled = true},
        ['PLANE'] = {name = 'theory_plane', price = 6500, menuIcon = 'far fa-file-alt', enabled = true},
    },
    Practical = {
        ['HELICOPTER'] = {name = Config.LicensesResource == "buty-license" and 'helicopter' or 'practical_helicopter', price = 25000, menuIcon = 'fas fa-helicopter', enabled = true},
        ['PLANE'] = {name = Config.LicensesResource == "buty-license" and 'plane' or 'practical_plane', price = 45000, menuIcon = 'fas fa-plane', enabled = true},
    }
}


Config.Questions = {
    ['HELICOPTER'] = {
        QuestionsCount = 16, -- Number of all questions for the draw pool
        QuestionToAnswer = 16, -- Questions the player will have to answer
        NeedAnswersToPass = 12, -- Number of questions a player must answer correctly to pass the theory exam
    },
    ['PLANE'] = {
        QuestionsCount = 11,
        QuestionToAnswer = 11,
        NeedAnswersToPass = 9,
    },
}

Config.Tasks = {
    ['HELICOPTER'] = {
        {label = "Start the engine", id = 1}, 
        -- DE: Starte den Motor
        -- FR: Démarre le moteur
        -- ES: Enciende el motor
        -- PT: Liga o motor
    
        {label = "Take off to an altitude <span>0m</span>/200m", id = 2}, 
        -- DE: Steige auf eine Höhe von <span>0m</span>/200m
        -- FR: Décollage avec une altitude de <span>0m</span>/200m
        -- ES: Despega a una altitud <span>0m</span>/200m
        -- PT: Descola com uma altitude de <span>0m</span>/200m
    
        {label = "Collect checkpoints <span>0</span>/3", id = 3}, 
        -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/3
        -- FR: Collecte les points de contrôle <span>0</span>/3
        -- ES: Recolecta los puntos <span>0</span>/3
        -- PT: Colete os pontos de controlo <span>0</span>/3
    
        {label = "Perform a safe landing", id = 6},
        -- DE: Führe eine sichere Landung durch
        -- FR: Performer un atterrissage sûr
        -- ES: Realiza un aterrizaje seguro
        -- PT: Performa uma aterragem segura
    
        {label = "Take off to an altitude <span>0m</span>/175m", id = 7}, 
        -- DE: Steige auf eine Höhe von <span>0m</span>/175m
        -- FR: Décollage avec une altitude de <span>0m</span>/175m
        -- ES: Despega a una altitud <span>0m</span>/175m
        -- PT: Descola com uma altitude de <span>0m</span>/175m
        
        {label = "Collect checkpoints <span>0</span>/4", id = 8}, 
        -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/4
        -- FR: Collecte les points de contrôle <span>0</span>/4
        -- ES: Recolecta los puntos <span>0</span>/4
        -- PT: Colete os pontos de controlo <span>0</span>/4
        
        {label = "Perform an emergency landing", id = 12}, 
        -- DE: Führe eine Notlandung durch
        -- FR: Performez un atterrissage d'urgence
        -- ES: Realiza un aterrizaje de emergencia
        -- PT: Realiza uma aterragem de emergência
        
        {label = "Collect checkpoints <span>0</span>/10", id = 13}, 
        -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/10
        -- FR: Collecte les points de contrôle <span>0</span>/10
        -- ES: Recolecta los puntos <span>0</span>/10
        -- PT: Colete os pontos de controlo <span>0</span>/10
        
        {label = "Return the helicopter to the hangar", id = 23}, 
        -- DE: Bringe den Hubschrauber zurück in den Hangar
        -- FR: Ramène l'hélicoptère au hangar
        -- ES: Devuelve el helicóptero al hangar.
        -- PT: Devolve o helicóptero au hangar
    },
    ['PLANE'] = {
        {label = 'Start the engine', id = 1},
        -- DE: Starte den Motor
        -- FR: Démarre le moteur
        -- ES: Enciende el motor
        -- PT: Liga o motor

        {label = 'Exit the hangar', id = 2},
        -- DE: Verlasse den Hangar
        -- FR: Sors de l'hangar
        -- ES: Sal del hangar
        -- PT: Saia do hangar
        
        {label = 'Get to the point', id = 3},
        -- DE: Begib dich zu dem Punkt
        -- FR: Va au point
        -- ES: Dirígete al punto.
        -- PT: Vai ao ponto
        
        {label = 'Proceed to the runway', id = 4},
        -- DE: Begib dich zur Startbahn
        -- FR: Dirige-toi vers la piste de décollage.
        -- ES: Procede a la pista de aterrizaje
        -- PT: Siga para a pista
        
        {label = 'Take off with the airplane', id = 5},
        -- DE: Starte mit dem Flugzeug
        -- FR: Décolle avec l'avion
        -- ES: Despega con el avión
        -- PT: Descola com o avião
        
        {label = 'Collect checkpoints <span>0</span>/10', id = 6},
        -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/10
        -- FR: Collecte les points de contrôle <span>0</span>/10
        -- ES: Recolecta los puntos <span>0</span>/10
        -- PT: Colete os pontos de controlo <span>0</span>/7
        
        {label = 'Parking in reverse in the hangar', id = 16},
        -- DE: Parke rückwärts in den Hangar ein
        -- FR: Gare-toi en marche arrière dans le hangar.
        -- ES: Estacionate de reversa en el hangar
        -- PT: Estaciona em marcha atrás
        
        {label = 'Check the aircraft condition <span>0</span>%', id = 17},
        -- DE: Überprüfe den Zustand des Flugzeugs <span>0</span>%
        -- FR: Vérifie les conditions de aéronef à <span>0</span>%
        -- ES: Verifica el estado del avión <span>0</span>%
        -- PT: Verifique as condições do avião <span>0</span>%
        
        {label = 'Refuel the airplane', id = 18},
        -- DE: Betanke das Flugzeug
        -- FR: Ravitaille l'avion
        -- ES: Hechale gasolina el avión
        -- PT: Reabastece o avião
        
        {label = 'Proceed to the runway', id = 19},
        -- DE: Begib dich zur Startbahn
        -- FR: Dirige-toi vers la piste de décollage.
        -- ES: Procede a la pista de aterrizaje
        -- PT: Siga para a pista
        
        {label = 'Take off with the airplane', id = 20},
        -- DE: Starte mit dem Flugzeug
        -- FR: Décolle avec l'avion
        -- ES: Despega con el avión
        -- PT: Descola com o avião
        
        {label = 'Collect checkpoints <span>0</span>/7', id = 21},
        -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/7
        -- FR: Collecte les points de contrôle <span>0</span>/7
        -- ES: Recolecta los puntos <span>0</span>/7
        -- PT: Colete os pontos de controlo <span>0</span>/7
        
        {label = 'Return the airplane', id = 28},
        -- DE: Bringe das Flugzeug zurück
        -- FR: Ramène l'avion
        -- ES: Devuelve el avión al hangar
        -- PT: Devolve o avião
    }
}

Config.Zones = {
    ["menu"] = {
        menuType = "ox_lib", -- "esx_menu_default" / "esx_context" / "qb-menu" / "ox_lib"
        menuPosition = 'left', -- only for esx_menu_default and esx_context
        coords = vector3(-1155.18, -2716.58, 19.89),
        marker = {
            id = 34, -- https://docs.fivem.net/docs/game-references/markers/
            color = {115, 255, 115, 120}, -- R(ed), G(reen), B(lue), A(lpha)
            scale = vec(0.65, 0.65, 0.65),
            bobUpAndDown = false, -- jumping marker
            rotate = true -- rotating marker
        },
        blip = { -- https://docs.fivem.net/docs/game-references/blips/
            sprite = 359,
            display = 4,
            scale = 1.0,
            color = 43,
            name = "Flight School"
        }
    },
    ["return_vehicle"] = {
        ['HELICOPTER'] = {
            marker = {
                id = 1, -- https://docs.fivem.net/docs/game-references/markers/
                color = {255, 25, 25, 120}, -- R(ed), G(reen), B(lue), A(lpha)
                scale = vec(7.5, 7.5, 3.5),
                bobUpAndDown = false, -- jumping marker
                rotate = true -- rotating marker
            },
            blip = { -- https://docs.fivem.net/docs/game-references/blips/
                sprite = 467,
                display = 4,
                scale = 1.0,
                color = 2,
                name = "Return Helicopter"
            }
        },
        ['PLANE'] = {
            marker = {
                id = 1, -- https://docs.fivem.net/docs/game-references/markers/
                color = {255, 25, 25, 120}, -- R(ed), G(reen), B(lue), A(lpha)
                scale = vec(10.5, 10.5, 3.5),
                bobUpAndDown = false, -- jumping marker
                rotate = true -- rotating marker
            },
            blip = { -- https://docs.fivem.net/docs/game-references/blips/
                sprite = 467,
                display = 4,
                scale = 1.0,
                color = 2,
                name = "Return Plane"
            }
        },
    }
}

Config.Practical = {
    ['Vehicles'] = { -- https://docs.fivem.net/docs/game-references/vehicle-models/
        HELICOPTER = 'frogger',
        PLANE = 'vestra',
    },
    ['Marker'] = { -- https://docs.fivem.net/docs/game-references/markers/
        id = 25, 
        size = vec(0.35, 0.35, 0.35),
        rotate = {0.0, 180.0, 0.0},
        rgba = {255, 255, 0, 140},
        rotataing = false
    },
    ['Checkpoint'] = {
        id = 13,
        id_ground = 48,
        diameter = 20.0,
        diameter_ground = 11.0,
        rgba = {0, 255, 0, 175}
    },
    ['Blip'] = { -- https://docs.fivem.net/docs/game-references/blips/
        sprite = 270,
        display = 4,
        scale = 1.0,
        color = 43,
        name = "Point"
    },
    ['SpawnPoints'] = {
        ['HELICOPTER'] = vector4(-1178.32, -2845.85, 12.95, 329.7),
        ['PLANE'] = vector4(-1650.12, -3139.33, 12.99, 335.32),
    }
}