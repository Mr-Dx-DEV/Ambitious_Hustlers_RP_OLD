Config = {}

-- ███████╗██████╗  █████╗ ███╗   ███╗███████╗██╗    ██╗ ██████╗ ██████╗ ██╗  ██╗
-- ██╔════╝██╔══██╗██╔══██╗████╗ ████║██╔════╝██║    ██║██╔═══██╗██╔══██╗██║ ██╔╝
-- █████╗  ██████╔╝███████║██╔████╔██║█████╗  ██║ █╗ ██║██║   ██║██████╔╝█████╔╝ 
-- ██╔══╝  ██╔══██╗██╔══██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║   ██║██╔══██╗██╔═██╗ 
-- ██║     ██║  ██║██║  ██║██║ ╚═╝ ██║███████╗╚███╔███╔╝╚██████╔╝██║  ██║██║  ██╗
-- ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝
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

---@field PlayerSetJob string: ESX: "esx:setJob" / QB-Core: "QBCore:Client:OnJobUpdate"
Config.PlayerSetJob = Config.Core == "ESX" and "esx:setJob" or "QBCore:Client:OnJobUpdate"



-- ███╗   ███╗ █████╗ ██╗███╗   ██╗    ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
-- ████╗ ████║██╔══██╗██║████╗  ██║    ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
-- ██╔████╔██║███████║██║██╔██╗ ██║    ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
-- ██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
-- ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
---@field AutoExecuteQuery boolean: Automatic creation of tables required for vms_documentsv2
Config.AutoExecuteQuery = true

---@field Debug boolean: 
Config.Debug = true

Config.UseMarkers = true -- Using a marker to display points
Config.UseText3D = false -- Using a 3D Text to display points
Config.UseHelpNotify = true -- Using a ESX.ShowHelpNotification (only for esx)

---@field UseTarget boolean: Do you want to use target system
Config.UseTarget = true
Config.TargetResource = 'ox_target' -- 'ox_target' / 'qb-target'

---@field DistanceToStartPhotosProcess number: Minimum distance of the player from the coordinates in which he will take pictures (Config.Photographers.camera.playerCoords)
Config.DistanceToStartPhotosProcess = 1.8

---@field MaxTimeWalkIn number: Maximum time in milliseconds that a player can walk to where he is supposed to stand while taking pictures at the photographer place (Config.Photographers.camera.playerCoords)
Config.MaxTimeWalkIn = 5000 -- 5 seconds

---@field MaxTimeWalkOut number: Maximum time in milliseconds that the player has to return to the point of interaction with the photographer NPC to take a picture
Config.MaxTimeWalkOut = 5000 -- 5 seconds

---@field UseDocumentsOnlyInCityhall boolean: Will disable all Config.Documents items
Config.UseDocumentsOnlyInCityhall = false

---@field PhotosPrices number: The price for taking pictures with a photographer
Config.PhotosPrices = 200

---@field CountOfPhotos number: Number of images taken per session with the photographer
Config.CountOfPhotos = 3

---@field ActivePhotosLimitPerPlayer number: Maximum number of images possible to have at one time (it is recommended to leave the default, in order not to load the .json file with a large number of images)
Config.ActivePhotosLimitPerPlayer = 6

---@field RequiredClothing boolean: Currently this option only supports esx_skin (Possible customization in CL.GetPlayerClothesParts)
Config.RequiredClothing = false
Config.RequiredClothingParts = {
    ['mask'] = {
        ['m'] = 0,
        ['f'] = 0
    },
    ['sunglasses'] = {
        ['m'] = {0, 34, 35, 39},
        ['f'] = {},
    },
    ['hat'] = {
        ['m'] = -1,
        ['f'] = -1,
    }
}

Config.CheckDocumentBySerial = {
    enabled = true,

    command = 'checkdocument',
    description = 'Check Document by Serial Number',

    key = nil,

    useRequiredJob = true,
    requiredJob = {
        ['clerk'] = true, -- All grades
        ['police'] = true, -- All grades
        ['sheriff'] = true, -- All grades
        ['ambulance'] = true, -- All grades
        -- ['ambulance2'] = {1, 2, 3, 4}
    }
}

---@field ShowDocumentMode number: 
--[[
    1 = Menu to select a player
    2 = Show to first closest person
    3 = Show to all players on distance
]]
Config.ShowDocumentMode = 1

Config.ShowDocumentDistance = 3.0


---@field ViewDocumentAlways boolean: Do you want that every time you present a document, the player presenting it should also see it
Config.ViewDocumentAlways = true


---@class Marker Below you can configure the markers for each point
Config.Marker = {
    ['photographer'] = {
        type = 20,
        color = {168, 168, 168, 175},
        rotation = vec(0.0, 180.0, 0.0),
        scale = vec(0.1, 0.1, 0.1),
        bobUpAndDown = true,
        rotate = true,
        textureDict = nil,
        textureName = nil,
        drawOnEnts = false,
    },
    ['selecting_player'] = {
        type = 20,
        color = {55, 168, 25, 175},
        rotation = vec(0.0, 180.0, 0.0),
        scale = vec(0.1, 0.1, 0.1),
        bobUpAndDown = false,
        rotate = true,
        textureDict = nil,
        textureName = nil,
        drawOnEnts = false,
    },
    ['documents_menu'] = {
        type = 20,
        color = {168, 168, 168, 175},
        rotation = vec(0.0, 180.0, 0.0),
        scale = vec(0.1, 0.1, 0.1),
        bobUpAndDown = true,
        rotate = true,
        textureDict = nil,
        textureName = nil,
        drawOnEnts = false,
    },
}

---@class Blips Below you can configure blips
Config.Blips = {
    ['documents_menu'] = {
        sprite = 826,
        display = 4,
        scale = 0.9,
        color = 62,
        name = "Documents Office"
    },
}

---@class Controls 
Config.Controls = {
    ['hide_document'] = 202,

    ['selecting_menu.change_player'] = 38,
    ['selecting_menu.show_document'] = 201,
    ['selecting_menu.cancel'] = 202,
}

------ ▄▀▀ ▄▀▄ █▄ █ █▀ █ ▄▀  █ █ █▀▄ ▄▀▄ ▀█▀ █ ▄▀▄ █▄ █
------ ▀▄▄ ▀▄▀ █ ▀█ █▀ █ ▀▄█ ▀▄█ █▀▄ █▀█  █  █ ▀▄▀ █ ▀█
Config.Documents = {
    ['id_card'] = { -- Do not change this name
        type = 'document',
    
        itemName = 'id_card',
        identificationIdPrefix = 'ID-',
        image = 'id_card.png',

        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"random@atmrobberygen", "a_atm_mugging", 3000, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
        },
        prop = 'prop_franklin_dl',
        
        data = {
            'firstName',
            'lastName',
            'dateOfBirth',
            'height',
            'nationality',
            'ssn',
        },
        
    },
    ['driving_license'] = { -- Do not change this name
        type = 'document',
        
        itemName = 'driving_license',
        identificationIdPrefix = 'DL-',
        image = 'driving_license.png',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"random@atmrobberygen", "a_atm_mugging", 3000, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
        },
        prop = 'prop_franklin_dl',
        
        data = {
            'firstName',
            'lastName',
        },

        needAnyLicenseToGetDocument = true,
        licenses = {
            'drive_a',
            'drive_b',
            'drive_c',
        },
    },
    ['flying_license'] = { -- Do not change this name
        type = 'document',
        
        itemName = 'flying_license',
        identificationIdPrefix = 'FL-',
        image = 'flight_license.png',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"random@atmrobberygen", "a_atm_mugging", 3000, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
        },
        prop = 'prop_franklin_dl',
        
        data = {
            'firstName',
            'lastName',
        },

        needAnyLicenseToGetDocument = true,
        licenses = {
            'practical_plane',
            'practical_helicopter',
        },
    },
    ['boat_license'] = { -- Do not change this name
        type = 'document',

        itemName = 'boat_license',
        identificationIdPrefix = 'BT-',
        image = 'boat_license.png',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"random@atmrobberygen", "a_atm_mugging", 3000, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
        },
        prop = 'prop_franklin_dl',
        
        data = {
            'firstName',
            'lastName',
        },
        
        needAnyLicenseToGetDocument = true,
        licenses = {
            'practical_boat',
        },
    },

    ['police_badge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'police_badge',
        identificationIdPrefix = 'PD-',
        badgeImage = 'lspd.webp',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"paper_1_rcm_alt1-9", "player_one_dual-9", 3000, 51, 57005, {0.119000, 0.035000, -0.029000, 72.579994, 19.379997, 126.270287}},
        },
        prop = 'prop_fib_badge',
        
        data = {
            'firstName',
            'lastName',
            'badgeNumber',
            'jobGrade',
        },
    },
    ['sheriff_badge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'sheriff_badge',
        identificationIdPrefix = 'SH-',
        badgeImage = 'lssd.webp',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"paper_1_rcm_alt1-9", "player_one_dual-9", 3000, 51, 57005, {0.119000, 0.035000, -0.029000, 72.579994, 19.379997, 126.270287}},
        },
        prop = 'prop_fib_badge',

        data = {
            'firstName',
            'lastName',
            'badgeNumber',
            'jobGrade',
        },
    },
    ['fib_badge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'fib_badge',
        identificationIdPrefix = 'FI-',
        badgeImage = 'fib.webp',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"paper_1_rcm_alt1-9", "player_one_dual-9", 3000, 51, 57005, {0.119000, 0.035000, -0.029000, 72.579994, 19.379997, 126.270287}},
        },
        prop = 'prop_fib_badge',
        
        data = {
            'firstName',
            'lastName',
            'badgeNumber',
            'jobGrade',
        },
    },
}


---@class Photographers _____________
Config.Photographers = {
    {
        -- blip = Config.Blips['name'],
        -- blipCoords = vector3(-530.22, -173.02, 39.1),

        markerData = Config.Marker['photographer'],
        distanceSee = 10.0,
        distanceAccess = 1.6,
        accessCoords = vector3(-530.22, -173.02, 39.15),
        targetCoords = vec4(-530.22, -173.02, 38.4, 36.47),
        targetSize = vec3(0.9, 0.9, 2.2),

        ped = {
            model = 'ig_jimmyboston_02',
            coords = vector4(-530.22, -173.02, 37.22, 207.64),
            animation = {'rcmnigel1a', 'base'}
        },

        camera = {
            coords = vector4(-531.39, -172.61, 39.0, 228.51),
            playerCoords = vector4(-528.92, -175.09, 37.22, 29.57)
        }

    }
}


---@class DocumentsMenu _____________
Config.DocumentsMenu = {
    {
        blip = Config.Blips['documents_menu'],
        blipCoords = vector3(-552.66, -190.8, 37.22),

        markerData = Config.Marker['documents_menu'],
        distanceSee = 10.0,
        distanceAccess = 1.8,
        
        menuCoords = vector3(-532.67, -190.12, 38.22),
        targetCoords = vector4(-531.9, -189.72, 38.0, 300.73),
        targetSize = vec3(2.4, 1.5, 2.2),

        ped = {
            model = 'ig_drfriedlander',
            coords = vector4(-531.72, -189.51, 37.22, 116.64),
            animation = {'switch@michael@sitting', 'idle'}
        },

        documentsList = {
            {label = "ID Card", name = "id_card", price = 300},
            {label = "Driving License", name = "driving_license", price = 450},
            {label = "Boat License", name = "boat_license", price = 560},
            {label = "Flying License", name = "flying_license", price = 900},
        },
    },

    {
        markerData = Config.Marker['documents_menu'],
        distanceSee = 10.0,
        distanceAccess = 1.8,
        
        requiredJob = 'police',

        menuCoords = vector3(-532.75, -193.02, 38.22),
        targetCoords = vector4(-532.01, -192.56, 38.0, 300.73),
        targetSize = vec3(2.3, 1.5, 2.2),

        ped = {
            model = 'ig_drfriedlander',
            coords = vector4(-531.34, -191.73, 37.22, 20.86),
            animation = {'switch@michael@sitting', 'idle'}
        },

        documentsList = {
            {label = "Police Badge", name = "police_badge", price = 100},
            {label = "Sheriff Badge", name = "sheriff_badge", price = 100},
            {label = "FIB Badge", name = "fib_badge", price = 100},
        },
    }
}