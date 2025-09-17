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
            exports["vms_notify"]:Notification("BOAT SCHOOL", message, 5000, "#32a852", "fa-solid fa-circle-check")
        else
            TriggerEvent('esx:showNotification', message)
            TriggerEvent('QBCore:Notify', message, 'success', 5000)
        end
    elseif type == "error" then
        if GetResourceState("vms_notify") == 'started' then
            exports["vms_notify"]:Notification("BOAT SCHOOL", message, 5000, "#eb4034", "fa fa-exclamation-circle")
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
                name = 'boatschoolv2',
                event = 'vms_boatschoolv2:openMenu',
                icon = 'fa-regular fa-file-lines',
                label = "Boat School"
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

Config.TeleportPlayerAfterExam = false
Config.TeleportPlayerAfterFailExam = true

Config.Examiner = {
    Enabled = true, -- Do you want to use a ped as an examiner who sits with the player in the vehicle?
    SpokenCommands = true,
    SpokenLanguage = "EN", -- "EN", "DE", "FR", "ES", "PT"
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
Config.LicenseItem = "boater_card"

Config.MenuIcon = ''
Config.Licenses = {
    Theory = {name = 'theory_boat', price = 3500, menuIcon = 'far fa-file-alt', enabled = true},
    Practical = {name = Config.LicensesResource == "buty-license" and 'boat' or 'practical_boat', price = 17500, menuIcon = 'fas fa-ship', enabled = true},
}

Config.Questions = {
    QuestionsCount = 10, -- Number of all questions for the draw pool
    QuestionToAnswer = 10, -- Questions the player will have to answer
    NeedAnswersToPass = 1, -- Number of questions a player must answer correctly to pass the theory exam
}

Config.Tasks = {
    {label = "Start the engine", id = 1}, 
    -- DE: Starte den Motor
    -- FR: Démarre le moteur
    -- ES: Enciende el motor
    -- PT: Liga o motor

    {label = "Collect checkpoints <span>0</span>/5", id = 2}, 
    -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/5
    -- FR: Collecte les points de contrôle <span>0</span>/5
    -- ES: Recolecta los puntos <span>0</span>/5
    -- PT: Coleta os pontos de controlo <span>0</span>/5

    {label = "Avoid obstacles <span>0</span>/6", id = 7}, 
    -- DE: Umfahre die Hindernisse <span>0</span>/6
    -- FR: Évite les obstacles <span>0</span>/6
    -- ES: Evita Los Obstaculos <span>0</span>/6
    -- PT: Esquiva os obstáculos <span>0</span>/6

    {label = "Collect checkpoints <span>0</span>/12", id = 13}, 
    -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/12
    -- FR: Collecte les points de contrôle <span>0</span>/12
    -- ES: Recolecta los puntos <span>0</span>/12
    -- PT: Coleta os pontos de controlo <span>0</span>/12

    {label = "Park the boat", id = 25}, 
    -- DE: Parke das Boot
    -- FR: Gare le bateau
    -- ES: Parquea el Bote
    -- PT: Estaciona o barco

    {label = "Collect checkpoints <span>0</span>/47", id = 26}, 
    -- DE: Sammle alle Kontrollpunkte ein <span>0</span>/47
    -- FR: Collecte les points de contrôle <span>0</span>/47
    -- ES: Recolecta los puntos <span>0</span>/47
    -- PT: Coleta os pontos de controlo <span>0</span>/47
    
    {label = "Park the boat", id = 73}, 
    -- DE: Parke das Boot
    -- FR: Gare le bateau
    -- ES: Parquea el Bote
    -- PT: Estaciona o barco

    {label = "Moor the boat", id = 74}, 
    -- DE: Mache das Boot fest
    -- FR: Amarre le bateau
    -- ES: Amarra el Bote
    -- PT: Amarre o barco
}

Config.Zones = {
    ["menu"] = {
        menuType = "esx_context", -- "esx_menu_default" / "esx_context" / "qb-menu" / "ox_lib"
        menuPosition = 'left', -- only for esx_menu_default and esx_context
        coords = vector3(-332.47, -2792.8, 5.0),
        marker = {
            id = 35, -- https://docs.fivem.net/docs/game-references/markers/
            color = {115, 255, 115, 120}, -- R(ed), G(reen), B(lue), A(lpha)
            scale = vec(0.65, 0.65, 0.65),
            bobUpAndDown = false, -- jumping marker
            rotate = true -- rotating marker
        },
        blip = { -- https://docs.fivem.net/docs/game-references/blips/
            sprite = 356,
            display = 4,
            scale = 1.0,
            color = 43,
            name = "Boat School"
        }
    },
    ["return_vehicle"] = {
        marker = {
            coords = vector3(1317.16, 4233.76, 30.65),
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
            name = "Return Boat"
        }
    }
}

Config.Practical = {
    ['Vehicle'] = 'tropic2', -- https://docs.fivem.net/docs/game-references/vehicle-models/
    ['Marker'] = { -- https://docs.fivem.net/docs/game-references/markers/
        id = 25, 
        size = vec(0.35, 0.35, 0.35),
        rotate = {0.0, 180.0, 0.0},
        rgba = {255, 255, 0, 140},
        rotataing = false
    },
    ['Checkpoint'] = {
        id = 0,
        diameter = 7.0,
        rgba = {0, 255, 0, 175}
    },
    ['Blip'] = { -- https://docs.fivem.net/docs/game-references/blips/
        sprite = 270,
        display = 4,
        scale = 1.0,
        color = 43,
        name = "Point"
    },
    ['SpawnPoint'] = vector4(-327.73, -2802.06, 0.79, 270.23),
}