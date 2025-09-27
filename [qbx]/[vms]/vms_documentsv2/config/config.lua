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
Config.UseHelpNotify = false -- Using a ESX.ShowHelpNotification (only for esx)

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
        ['sadoc'] = true,
        ['ss'] = true,
        ['dhs'] = true,
        ['usms'] = true,
        ['doj'] = true,
        ['safw'] = true,
        ['bcso'] = true,
        ['salsa'] = true,
        ['fbi'] = true,
        ['lsso'] = true,
        ['lspd'] = true,
        ['sahp'] = true,
        ['ambulance'] = true,
        ['ambulance'] = true,
        ['ems'] = {1, 2, 3, 4},
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
        scale = 0.5,
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
    ['weapon_license'] = { -- Do not change this name
        type = 'document',
        
        itemName = 'weapon_license',
        identificationIdPrefix = 'DL-',
        image = 'weapon_license.png',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"random@atmrobberygen", "a_atm_mugging", 3000, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
        },
        prop = 'prop_franklin_dl',
        
        data = {
            'firstName',
            'lastName',
        },
    },
   --[[ ['weapon_license3"'] = { -- Do not change this name
        type = 'document',
        
        itemName = 'weapon_license3',
        identificationIdPrefix = 'DL-',
        image = 'weapon_license.png',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"random@atmrobberygen", "a_atm_mugging", 3000, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
        },
        prop = 'prop_franklin_dl',
        
        data = {
            'firstName',
            'lastName',
        },
    },]
        --[['cdl_license"'] = { -- Do not change this name
        type = 'document',
        
        itemName = 'cdl_license',
        identificationIdPrefix = 'DL-',
        image = 'weapon_license.png',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"random@atmrobberygen", "a_atm_mugging", 3000, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
        },
        prop = 'prop_franklin_dl',
        
        data = {
            'firstName',
            'lastName',
        },
    },]]

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
['hunting_license'] = { -- Do not change this name
        type = 'document',
        
        itemName = 'hunting_license',
        identificationIdPrefix = 'FL-',
        image = 'hunting_license.png',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"random@atmrobberygen", "a_atm_mugging", 3000, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
        },
        prop = 'prop_franklin_dl',
        
        data = {
            'firstName',
            'lastName',
        },

    },
    ['waterslicense'] = { -- Do not change this name
        type = 'document',

        itemName = 'waterslicense',
        identificationIdPrefix = 'BT-',
        image = 'waterslicense.png',
        
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

    ['lspdbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'lspdbadge',
        identificationIdPrefix = 'PD-',
        badgeImage = 'lspdbadge.png',
        
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
    ['sdbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'sdbadge',
        identificationIdPrefix = 'BS-',
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
    ['policebadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'policebadge',
        identificationIdPrefix = 'LS-',
        badgeImage = 'policebadge.png',
        
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
    ['salsabadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'salsabadge',
        identificationIdPrefix = 'SL-',
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
     ['sahpbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'sahpbadge',
        identificationIdPrefix = 'SL-',
        badgeImage = 'sahpbadge.png',
        
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
     ['sadocbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'sadocbadge',
        identificationIdPrefix = 'SL-',
        badgeImage = 'sadocbadge.png',
        
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
        ['ssbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'ssbadge',
        identificationIdPrefix = 'SL-',
        badgeImage = 'ssbadge.png',
        
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
     ['dhsbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'dhsbadge',
        identificationIdPrefix = 'SL-',
        badgeImage = 'dhsbadge.png',
        
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
         ['usmsbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'usmsbadge',
        identificationIdPrefix = 'US-',
        badgeImage = 'usmsbadge.png',
        
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
     ['dojbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'dojbadge',
        identificationIdPrefix = 'DOJ-',
        badgeImage = 'dojbadge.png',
        
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
    ['safwbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'safwbadge',
        identificationIdPrefix = 'SAFW-',
        badgeImage = 'safwbadge.png',
        
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
    ['bcsobadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'bcsobadge',
        identificationIdPrefix = 'BCSO-',
        badgeImage = 'bcsobadge.png',
        
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
    ['fbibadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'fbibadge',
        identificationIdPrefix = 'FBI-',
        badgeImage = 'fbibadge.png',
        
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
    ['lssobadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'lssobadge',
        identificationIdPrefix = 'lsso-',
        badgeImage = 'lssobadge.png',
        
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
    ['emsbadge'] = { -- Do not change this name
        type = 'badge',

        itemName = 'emsbadge',
        identificationIdPrefix = 'EM-',
        badgeImage = 'fib.webp',
        
        animations = {
            view = {"cellphone@", "cellphone_text_read_base", -1, 51, 28422, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0}},
            show = {"paper_1_rcm_alt1-9", "player_one_dual-9", 3000, 51, 57005, {0.119000, 0.035000, -0.029000, 72.579994, 19.379997, 126.270287}},
        },
        prop = 'prop_fib_badge',
        
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
        accessCoords = vector3(-247.5329, -923.4187, 32.3122),
        targetCoords = vec4(-247.5329, -923.4187, 33.3122, 247.3178),
        targetSize = vec3(0.9, 0.9, 2.2),

        ped = {
            model = 'ig_jimmyboston_02',
            coords = vector4(-247.5329, -923.4187, 31.3122, 247.3178),
            animation = {'rcmnigel1a', 'base'}
        },

        camera = {
            coords = vector4(-246.4720, -923.8730, 33.3122, 256.0013),
            playerCoords = vector4(-244.6912, -924.4287, 32.3122, 68.8179)
        }

    }
}


---@class DocumentsMenu _____________
Config.DocumentsMenu = {
    {
        blip = Config.Blips['documents_menu'],
        blipCoords = vector3(-247.4867, -911.6836, 32.3775),

        markerData = Config.Marker['documents_menu'],
        distanceSee = 10.0,
        distanceAccess = 1.8,
        
        menuCoords = vector3(-247.4867, -911.6836, 32.3775),
        targetCoords = vector4(-247.4867, -911.6836, 32.3775, 154.2047),
        targetSize = vec3(2.4, 1.5, 2.2),

        ped = {
            model = 'ig_drfriedlander',
            coords = vector4(-247.4867, -911.6836, 31.3775, 154.2047),
            animation = {'switch@michael@sitting', 'idle'}
        },

        documentsList = {
          {label = "ID Card", name = "id_card", price = 50, needToOrder = true, deliveryTime = 10},
    {label = "Driving License", name = "driving_license", price = 50, needToOrder = false},
    --{label = "Class III weapons License", name = "weapon_license3", price = 50, needToOrder = true, deliveryTime = 120},
    --{label = "CDL License", name = "cdllicense", price = 50, needToOrder = true, deliveryTime = 30},
    {label = "Weapon License", name = "weapon_license", price = 50, needToOrder = true, deliveryTime = 60},
    {label = "Waters License", name = "waterslicense", price = 2500, needToOrder = false},
    {label = "Flying License", name = "flying_license", price = 350, needToOrder = true, deliveryTime = 60},
    {label = "Hunting License", name = "hunting_license", price = 850, needToOrder = true, deliveryTime = 60},
    --{label = "Airplane License", name = "airplane", price = 350, needToOrder = true, deliveryTime = 60},
    --{label = "Helicopter License", name = "helicopterlicense", price = 350, needToOrder = true, deliveryTime = 60},

    {label = 'Application for re-registration vehicle', name = 'reregistration_vehicle', price = 0, needToOrder = false}, -- Builded-in document
    {label = 'Application for change of registration numbers', name = 'change_plate', price = 0, needToOrder = false, visible = Config.AllowToChangePlate}, -- Builded-in document
        },
    },

    {
        markerData = Config.Marker['documents_menu'],
        distanceSee = 10.0,
        distanceAccess = 1.8,
        
        requiredJobs = {
    'sahp',
    'sadoc',
    'ss',
    'dhs',
    'usms',
    'doj',
    'safw',
    'bcso',
    'salsa',
    'fbi',
    'lsso',
    'lspd',
    'police'
},


        menuCoords = vector3(-251.7703, -923.8633, 32.3855),
        targetCoords = vector4(-251.7703, -923.8633, 32.3855, 346.9165),
        targetSize = vec3(2.3, 1.5, 2.2),

        ped = {
            model = 'ig_drfriedlander',
            coords = vector4(-251.7703, -923.8633, 31.3855, 346.9165),
            animation = {'switch@michael@sitting', 'idle'}
        },

        documentsList = {
            {label = "Police Badge", name = "policebadge", price = 100},
            --{label = "Sheriff Badge", name = "sheriff_badge", price = 100},
            --{label = "FIB Badge", name = "fib_badge", price = 100},
            {label = "BCSO Badge", name = "bcsobadge", price = 100},
            {label = "LSPD Badge", name = "lspdbadge", price = 100},
            {label = "Salsa Badge", name = "salsabadge", price = 100},
            {label = "EMS Badge", name = "emsbadge", price = 100}, 
            {label = "SAHP Badge", name = "sahpbadge", price = 100},
            {label = "SADOC Badge", name = "sadocbadge", price = 100},
            {label = "S.S Badge", name = "ssbadge", price = 100},
            {label = "USMS Badge", name = "usmsbadge", price = 100},  
            {label = "DOJ Badge", name = "dojbadge", price = 100}, 
            {label = "SAFW Badge", name = "safwbadge", price = 100},
            {label = "FBI Badge", name = "fbibadge", price = 100},
            {label = "LSSO Badge", name = "lssobadge", price = 100},
        },
    }
}