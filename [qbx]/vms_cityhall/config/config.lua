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

---@field PlayerLogoutServer string: ESX: "esx:playerDropped" / QB-Core: "QBCore:Server:OnPlayerUnload"
Config.PlayerLogoutServer = Config.Core == "ESX" and "esx:playerDropped" or "QBCore:Server:OnPlayerUnload"

---@field PlayerSetJob string: ESX: "esx:setJob" / QB-Core: "QBCore:Client:OnJobUpdate"
Config.PlayerSetJob = Config.Core == "ESX" and "esx:setJob" or "QBCore:Client:OnJobUpdate"



-- ███╗   ███╗ █████╗ ██╗███╗   ██╗    ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
-- ████╗ ████║██╔══██╗██║████╗  ██║    ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
-- ██╔████╔██║███████║██║██╔██╗ ██║    ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
-- ██║╚██╔╝██║██╔══██║██║██║╚██╗██║    ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
-- ██║ ╚═╝ ██║██║  ██║██║██║ ╚████║    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
-- ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝    ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
---@field AutoExecuteQuery boolean: Automatic creation of tables required for vms_cityhall
Config.AutoExecuteQuery = true

---@field Debug boolean: By running debugging, you will receive prints at various activities, in case of any problems, this will be able to help you find the cause of the misconfiguration.
Config.Debug = true

Config.UseMarkers = true -- Using a marker to display points
Config.UseText3D = false -- Using a 3D Text to display points
Config.UseHelpNotify = true -- Using a ESX.ShowHelpNotification (only for esx)

---@field UseTarget boolean: Do you want to use target system
Config.UseTarget = true
Config.TargetResource = 'ox_target' -- 'ox_target' / 'qb-target'

---@class Marker Below you can configure the markers for each point
Config.Marker = {
    ['main_menu'] = {
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
    ['empty_papers_point'] = {
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
    ['cityhall'] = {
        sprite = 826,
        display = 4,
        scale = 0.9,
        color = 62,
        name = "City Hall"
    },
}

------ ▄▀▀ ▄▀▄ █▄ █ █▀ █ ▄▀  █ █ █▀▄ ▄▀▄ ▀█▀ █ ▄▀▄ █▄ █
------ ▀▄▄ ▀▄▀ █ ▀█ █▀ █ ▀▄█ ▀▄█ █▀▄ █▀█  █  █ ▀▄▀ █ ▀█
---@class CityHallPoints
-- Defines a list of City Hall locations on the map.
-- Each entry in this table represents a City Hall with specific properties such as blips, markers, and interaction settings.
Config.CityHallPoints = {
    {
        blip = Config.Blips['cityhall'], -- Blip settings for the City Hall location (defined in Config.Blips)
        blipCoords = vector3(-552.66, -190.8, 37.22), -- Coordinates where the blip will be displayed on the map

        markerData = Config.Marker['main_menu'], -- Marker settings for the City Hall interaction point (defined in Config.Marker)
        distanceSee = 10.0, -- The distance from which players can see the City Hall marker
        distanceAccess = 1.8, -- The required distance for a player to interact with the City Hall

        menuCoords = vec3(-552.66, -190.8, 38.22), -- Coordinates where the main menu interface opens
        targetCoords = vec4(-553.24, -190.03, 38.15, 27.32), -- Position of the interaction target for third-party targeting systems
        targetSize = vec3(4.0, 1.6, 1.8), -- Defines the interaction target size (length, width, height)

        interactionText = 'City Hall', -- The label that appears when interacting with the location

        ped = { -- Configuration for an NPC (ped) at the City Hall
            model = 'ig_drfriedlander', -- The ped model to be spawned at the City Hall
            coords = vec4(-553.68, -189.38, 37.26, 216.61), -- Spawn location and heading for the NPC
            animation = {'switch@michael@sitting', 'idle'} -- The animation sequence the ped will use
        },

        menusAvailable = { -- List of available menus that can be accessed at this City Hall
            main = true, -- Enable the main menu
            jobs = true, -- Enable the job selection menu
            insurance = true, -- Enable the insurance menu
            licenses = true, -- Enable the licenses menu
            fines = true, -- Enable the fines menu
            taxes = true, -- Enable the taxes menu
        },
    }
}


---@class EmptyPapersPoints
-- Defines locations where players can purchase empty legal documents (papers).
-- These documents can be used for vehicle sales, contracts, or other in-game agreements.
Config.EmptyPapersPoints = {
    {
        blip = nil, -- No blip will be shown on the map for this location
        blipCoords = nil, -- No blip coordinates (since blip is disabled)

        markerData = Config.Marker['empty_papers_point'], -- Marker settings for interaction
        distanceSee = 10.0, -- The distance from which players can see the marker
        distanceAccess = 1.8, -- The required distance for a player to interact with the point

        menuCoords = vector3(-563.41, -193.39, 38.22), -- Coordinates where the purchase menu will open
        targetCoords = vector4(-563.67, -192.68, 38.5, 30.88), -- Target position for interaction (for third-party targeting systems)
        targetSize = vec3(2.8, 1.4, 1.8), -- Size of the interaction area (length, width, height)

        interactionText = 'Buy papers', -- Interaction label shown to players

        ped = { -- Configuration for an NPC (ped) that sells papers
            model = 'cs_paper', -- The ped model that represents a document seller
            coords = vector4(-563.87, -192.68, 37.26, 220.23), -- Spawn position and rotation for the ped
            animation = {'switch@michael@sitting', 'idle'} -- The animation the ped will use
        },

        papersAvailable = { -- List of purchasable papers at this location
            ['vehicle_sale_agreement'] = { -- Unique key identifier for the document type
                name = "vehicle_sale_agreement", -- Internal name of the document
                label = 'Sale Agreement', -- Display name for the document
                description = "Vehicle purchase and sale agreement", -- Short description of the document's purpose
                icon = "vehicle_sale_agreement.png", -- Icon file (used in UI if applicable)
                price = 0 -- The cost of this document (set to 0 if free)
            }
        },
    }
}


---@class CustomVehicleLabels
-- A table defining custom display names for vehicles.
-- This is useful for replacing generic or hash-based vehicle names with customized labels.
-- The key should be the vehicle's hash (using GetHashKey), and the value should be the custom label.
Config.CustomVehicleLabels = {
    [GetHashKey('c63s')] = 'Mercedes-Benz C 63 S', -- Custom label for this specific vehicle
    -- Add more vehicles here if needed
}


---@class LicensesLabels
-- A table defining display names for different types of licenses.
-- This helps provide a user-friendly name for each license type in the system.
Config.LicensesLabels = {
    -- Driving School Licenses (vms_driveschoolV2)
    ['theory_a'] = 'Theory Motorcycle',
    ['theory_b'] = 'Theory Car',
    ['theory_c'] = 'Theory Truck',
    ['drive_a'] = 'Motorcycle',
    ['drive_b'] = 'Car',
    ['drive_c'] = 'Truck',

    -- Boat School Licenses (vms_boatschoolV2)
    ['theory_boat'] = 'Theory Boat',
    ['practical_boat'] = 'Boat',
    
    -- Flight School Licenses (vms_flightschoolV2)
    ['theory_helicopter'] = 'Theory Helicopter',
    ['theory_plane'] = 'Theory Plane',
    ['practical_helicopter'] = 'Helicopter',
    ['practical_plane'] = 'Plane',
}



-- ██████╗  █████╗ ██╗   ██╗ ██████╗██╗  ██╗███████╗ ██████╗██╗  ██╗███████╗
-- ██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██║  ██║██╔════╝██╔════╝██║ ██╔╝██╔════╝
-- ██████╔╝███████║ ╚████╔╝ ██║     ███████║█████╗  ██║     █████╔╝ ███████╗
-- ██╔═══╝ ██╔══██║  ╚██╔╝  ██║     ██╔══██║██╔══╝  ██║     ██╔═██╗ ╚════██║
-- ██║     ██║  ██║   ██║   ╚██████╗██║  ██║███████╗╚██████╗██║  ██╗███████║
-- ╚═╝     ╚═╝  ╚═╝   ╚═╝    ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝
---@field UsePaychecks boolean
-- Enables or disables the paycheck system.
-- If you set to true, players will receive their paychecks to the City Hall menu.
-- If you set to false, players will use the old method from ESX / QB-Core to receive paychecks
-- You need to read it if you want to use it: https://docs.vames-store.com/assets/vms_cityhall/guides/paychecks
Config.UsePaychecks = true -- Enable automated paycheck system



--      ██╗ ██████╗ ██████╗      ██████╗███████╗███╗   ██╗████████╗███████╗██████╗ 
--      ██║██╔═══██╗██╔══██╗    ██╔════╝██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗
--      ██║██║   ██║██████╔╝    ██║     █████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝
-- ██   ██║██║   ██║██╔══██╗    ██║     ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗
-- ╚█████╔╝╚██████╔╝██████╔╝    ╚██████╗███████╗██║ ╚████║   ██║   ███████╗██║  ██║
--  ╚════╝  ╚═════╝ ╚═════╝      ╚═════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
---@field UseJobCenter boolean
-- Enables or disables the job center system.
-- If set to true, players will be able to access a job center to find and switch jobs.
-- If set to false, players will need to be assigned jobs manually or through other means (e.g., roleplay).
Config.UseJobCenter = true -- Enable job center for job selection

---@class JobsList
Config.JobsList = {
    {type = " ", label = "Unemployed", name = "unemployed", grade = 0, requiredResume = false},
    
    {icon = "fa-solid fa-building-shield", type = "Law Enforcement", label = "LSPD", address = "Mission Row", name = "police", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-hospital", type = "Law Enforcement", label = "EMS", address = "Pillbox Hill", name = "ambulance", grade = 0, requiredResume = true},

    -- vms_tuning:
    {icon = "fa-solid fa-wrench", type = "Mechanic", label = "Benny's", address = "Alta St. Strawberry", image = "https://i.ibb.co/w47x9Rk/qfAt1fx.png", name = "mechanic", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-wrench", type = "Mechanic", label = "Beeckers Garage", address = "", name = "beeckers", grade = 0, requiredResume = true},
    
    -- vms_stores:
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Twenty Four Seven 1", address = "Innocence Blvd. Elgin Ave, Strawberry", name = "twentyfourseven1", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Twenty Four Seven 2", address = "Innocence Blvd. Elgin Ave, Strawberry", image = "jobs-twentyfourseven2.png", name = "twentyfourseven2", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Twenty Four Seven 3", address = "Inseno Road - Great Ocean Hwy, Banham Canyon", name = "twentyfourseven3", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Twenty Four Seven 4", address = "Barbareno Rd, Chumash", name = "twentyfourseven4", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Twenty Four Seven 5", address = "Palomino Fwy, Tataviam Mountains", name = "twentyfourseven5", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Twenty Four Seven 6", address = "Route 68 Harmony", name = "twentyfourseven6", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Twenty Four Seven 7", address = "Senora Fwy, Grand Senora Desert", name = "twentyfourseven7", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Twenty Four Seven 8", address = "Alhambra Dr. Niland Ave, Sandy Shores", name = "twentyfourseven8", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Twenty Four Seven 9", address = "Senora Fwy, Mount Chilliad", name = "twentyfourseven9", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Robs Liquor 1", address = "San Andreas Ave - Vespucci Canals", name = "robsliquor1", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Robs Liquor 2", address = "Prosperity St. Morningwood", name = "robsliquor2", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Robs Liquor 3", address = "El Rancho Blvd. Vespucci Blvd, Murrieta Heights", name = "robsliquor3", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-basket-shopping", type = "Shop", label = "Robs Liquor 4", address = "Great Ocean Hwy, Banham Canyon", name = "robsliquor4", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-gas-pump", type = "Gas Station", label = "LTD Gasoline 1", address = "Grove St. Davis Ave, Davis", name = "ltd1", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-gas-pump", type = "Gas Station", label = "LTD Gasoline 2", address = "Ginger St. Palomino Avem Little Seoul", name = "ltd2", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-gas-pump", type = "Gas Station", label = "LTD Gasoline 3", address = "West Mirror Drive, Mirror Park", name = "ltd3", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-gas-pump", type = "Gas Station", label = "LTD Gasoline 4", address = "Banham Canyon Dr. North Rockford Dr, Richman Glen", name = "ltd4", grade = 0, requiredResume = true},
    {icon = "fa-solid fa-gas-pump", type = "Gas Station", label = "LTD Gasoline 5", address = "Grapeseed Main St. Grapeseed", name = "ltd5", grade = 0, requiredResume = true},

    -- vms_jobs:
    {icon = "fa-solid fa-suitcase", type = "Public works", label = "Vignery", address = "Buen Vino Rd, Tongva Hills", name = "vignery", grade = 0, requiredResume = false},
    {icon = "fa-solid fa-suitcase", type = "Public works", label = "Orchardist", address = "Great Ocean Hwy, Paleto Bay", name = "orchardist", grade = 0, requiredResume = false},
    
}



-- ██████╗ ███████╗███████╗██╗   ██╗███╗   ███╗███████╗███████╗
-- ██╔══██╗██╔════╝██╔════╝██║   ██║████╗ ████║██╔════╝██╔════╝
-- ██████╔╝█████╗  ███████╗██║   ██║██╔████╔██║█████╗  ███████╗
-- ██╔══██╗██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  ╚════██║
-- ██║  ██║███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗███████║
-- ╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝
---@field UseResumes boolean
-- Enables or disables the resume/job application system.
-- If set to true, players can submit resumes to apply for jobs.
-- If set to false, job applications via resumes will not be available.
Config.UseResumes = true -- Enable the resume/job application system


---@class JobsResumes
-- Defines which jobs allow players to submit resumes for applications.
-- Players can only apply for jobs listed here.
-- The resume system is only compatible with the following resources:
--   - vms_bossmenu (a general job management system that can be linked to any job, such as police, ambulance, etc.)
--   - Dedicated job-specific resources:
--     - `vms_tuning` (mechanic/tuning shops)
--     - `vms_vehicleshopV2` (vehicle dealership jobs)
--     - `vms_stores` (general store jobs like 24/7, LTD, Rob's Liquor)
--     - `vms_barber` (barber shop jobs)
--     - `vms_tattooshop` (tattoo shop jobs)
--     - `vms_gym` (fitness trainer or gym-related jobs)
Config.JobsResumes = {
    -- Emergency & essential services
    ['police'] = true, -- Police force
    ['ambulance'] = true, -- Medical services
    ['mechanic'] = true, -- Mechanics (linked to vms_tuning)
    ['pdm'] = true, -- Car dealership (linked to vms_vehicleshopV2)

    -- General store jobs (linked to vms_stores)
    ['twentyfourseven1'] = true,
    ['twentyfourseven2'] = true,
    ['twentyfourseven3'] = true,
    ['twentyfourseven4'] = true,
    ['twentyfourseven5'] = true,
    ['twentyfourseven6'] = true,
    ['twentyfourseven7'] = true,
    ['twentyfourseven8'] = true,
    ['twentyfourseven9'] = true,
    ['robsliquor1'] = true,
    ['robsliquor2'] = true,
    ['robsliquor3'] = true,
    ['robsliquor4'] = true,
    ['ltd1'] = true,
    ['ltd2'] = true,
    ['ltd3'] = true,
    ['ltd4'] = true,
    ['ltd5'] = true,
}


---@field SendPhoneMessageAboutResume boolean:
--[[
    Supported Phones:
        * qb-phone
        * qs-smartphone-pro (No required export for offline players - only online players will receive an email)
        * yseries
        * lb-phone
        * okokPhone (No required export for offline players - only online players will receive an email)
    
    If there is no phone listed, adjust your function in config.server.lua - SV.sendPhoneMessage
    * We do not introduce custom compatibility, if you want it introduced, use /suggestion on our discord - if you have compatibility for another phone, we would appreciate you sharing the code.
]]
Config.SendPhoneMessageAboutResume = true



-- ██████╗  ██████╗  ██████╗██╗   ██╗███╗   ███╗███████╗███╗   ██╗████████╗███████╗
-- ██╔══██╗██╔═══██╗██╔════╝██║   ██║████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔════╝
-- ██║  ██║██║   ██║██║     ██║   ██║██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ███████╗
-- ██║  ██║██║   ██║██║     ██║   ██║██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ╚════██║
-- ██████╔╝╚██████╔╝╚██████╗╚██████╔╝██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ███████║
-- ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝
---@field UseDocuments boolean
-- Enables or disables the document system within the script.
-- If set to true, players will have access to the document functionality.
-- If set to false, all document-related features will be disabled.
Config.UseDocuments = true -- Enable document system


---@field UseVMSDocumentsV2 boolean
-- Checks if 'vms_documentsv2' is installed and active.
-- If the resource exists, it will be used; otherwise, the feature is disabled.
-- This allows the script to work dynamically with or without the 'vms_documentsv2' resource.
Config.UseVMSDocumentsV2 = GetResourceState('vms_documentsv2') ~= 'missing' -- Auto-detect document system


---@field ChangePlateAfterReregistration boolean
-- Determines whether a vehicle's plate should change after re-registration.
-- If set to true, players can choose a new plate during the re-registration process.
-- If set to false, the plate remains the same after re-registration.
Config.ChangePlateAfterRerergistration = true -- Allow plate change on re-registration


---@field ReregistrationPlateModes table
-- Defines available options when re-registering a vehicle.
-- Players can select one of the following modes:
-- ['current'] - Keep the current plate (free of charge)
-- ['random'] - Get a randomly generated plate (costs 1000)
-- ['custom'] - Choose a custom plate (costs 8000)
Config.ReregistrationPlateModes = {
    ['current'] = {allow = true, price = 0},     -- Keep current plate (free)
    ['random'] = {allow = true, price = 1000},   -- Generate a random plate for 1000
    ['custom'] = {allow = true, price = 8000},   -- Choose a custom plate for 8000
}


---@field AllowToChangePlate boolean
-- Determines whether players can manually change their vehicle plate at any time.
-- If set to true, the option to change plates will be available outside of re-registration.
-- If set to false, players will only be able to change plates during re-registration.
Config.AllowToChangePlate = true -- Allow manual plate changes


---@field ChangePlatesModes table
-- Defines available options when changing a vehicle's plate.
-- Players can choose between:
-- ['random'] - Receive a randomly generated plate for 2000
-- ['custom'] - Choose a custom plate for 12000
Config.ChangePlatesModes = {
    ['random'] = {allow = true, price = 2000},   -- Random plate for 2000
    ['custom'] = {allow = true, price = 12000},  -- Custom plate for 12000
}


---@field PlateFormat string: Set up your license plate generation format, set any way you want, when you set a letter, it will generate a random letter, when you set a number, it will generate a random number, below are sample formats.
--[[
    Examples:
        'ABC 1234'
        '1234 ABC'
        'ABCD1234'
]]
Config.PlateFormat = 'ABC 1234'

---@class Documents 
Config.Documents = {
    {label = "ID Card", name = "id_card", price = 300, needToOrder = true, deliveryTime = 10},
    {label = "Driving License", name = "driving_license", price = 450, needToOrder = false},
    {label = "Boat License", name = "boat_license", price = 560, needToOrder = true, deliveryTime = 172800},
    {label = "Flying License", name = "flying_license", price = 900, needToOrder = true, deliveryTime = 115200},
    {label = "Weapon License", name = "weapon_license", price = 1800, needToOrder = true, deliveryTime = 259200},
    
    {label = "Police Badge", name = "police_badge", price = 100, requiredJob = 'police', needToOrder = false},
    {label = "Sheriff Badge", name = "sheriff_badge", price = 100, requiredJob = 'police', needToOrder = false},
    {label = "FIB Badge", name = "fib_badge", price = 100, requiredJob = 'police', needToOrder = false},

    {label = 'Application for re-registration vehicle', name = 'reregistration_vehicle', price = 0, needToOrder = false}, -- Builded-in document
    {label = 'Application for change of registration numbers', name = 'change_plate', price = 0, needToOrder = false, visible = Config.AllowToChangePlate}, -- Builded-in document
}



-- ██╗███╗   ██╗███████╗██╗   ██╗██████╗  █████╗ ███╗   ██╗ ██████╗███████╗███████╗
-- ██║████╗  ██║██╔════╝██║   ██║██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝██╔════╝
-- ██║██╔██╗ ██║███████╗██║   ██║██████╔╝███████║██╔██╗ ██║██║     █████╗  ███████╗
-- ██║██║╚██╗██║╚════██║██║   ██║██╔══██╗██╔══██║██║╚██╗██║██║     ██╔══╝  ╚════██║
-- ██║██║ ╚████║███████║╚██████╔╝██║  ██║██║  ██║██║ ╚████║╚██████╗███████╗███████║
-- ╚═╝╚═╝  ╚═══╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚══════╝
---@field UseInsurances boolean: Enable or disable the health insurance system
Config.UseInsurances = true


-- █▄█ ██▀ ▄▀▄ █   ▀█▀ █▄█   █ █▄ █ ▄▀▀ █ █ █▀▄ ▄▀▄ █▄ █ ▄▀▀ ██▀
-- █ █ █▄▄ █▀█ █▄▄  █  █ █   █ █ ▀█ ▄██ ▀▄█ █▀▄ █▀█ █ ▀█ ▀▄▄ █▄▄
---@field HealthInsurancesPricePerDay number: The cost of health insurance per day (in game currency)
Config.HealthInsurancesPricePerDay = 4000

---@class HealthInsurances # Available durations for health insurance in days
Config.HealthInsurancesDays = {1, 14, 30}

---@field HealthInsurancerSociety string | nil: The society that receives health insurance payments (e.g., hospital fund)
Config.HealthInsurancerSociety = 'society_ambulance'

---@field HealthInsuranceMoneyToSocietyPercent number: The percentage of the insurance payment that goes to the specified society
Config.HealthInsuranceMoneyToSocietyPercent = 20

------ ▄▀▀ █▄█ ██▀ ▄▀▀ █▄▀   █▄█ ██▀ ▄▀▄ █   ▀█▀ █▄█   █ █▄ █ ▄▀▀ █ █ █▀▄ ▄▀▄ █▄ █ ▄▀▀ ██▀
------ ▀▄▄ █ █ █▄▄ ▀▄▄ █ █   █ █ █▄▄ █▀█ █▄▄  █  █ █   █ █ ▀█ ▄██ ▀▄█ █▀▄ █▀█ █ ▀█ ▀▄▄ █▄▄
---@class CheckHealthInsurance 
Config.CheckHealthInsurance = {
    enabled = true, -- Enable or disable the ability to check player insurance

    command = 'checkinsurance', -- The command players can use to check insurance status
    description = 'Check Player Insurance', -- The description of the command shown in suggestions

    key = nil, -- If set, a specific key can be used to check insurance (nil means no keybind)

    informations = {
        ownerName = true, -- Whether to display the name of the insurance owner
    },

    useRequiredJob = true, -- If true, only specific jobs can check insurance
    requiredJob = {
        ['ambulance'] = true, -- Allowed job(s) to check insurance (all grades)
        -- ['ambulance2'] = {1, 2, 3, 4} -- Uncomment to restrict by job grades
    }
}


-- █ █ ██▀ █▄█ █ ▄▀▀ █   ██▀   █ █▄ █ ▄▀▀ █ █ █▀▄ ▄▀▄ █▄ █ ▄▀▀ ██▀
-- ▀▄▀ █▄▄ █ █ █ ▀▄▄ █▄▄ █▄▄   █ █ ▀█ ▄██ ▀▄█ █▀▄ █▀█ █ ▀█ ▀▄▄ █▄▄
---@class VehiclesInsurancesDays
-- List of available durations for vehicle insurance in days.
-- Players can choose from these options when purchasing insurance
Config.VehiclesInsurancesDays = {1, 14, 30} -- 1-day, 14-day, and 30-day insurance options


---@field VehiclesInsurancesPercentageFromPrice number
-- Determines the percentage of the vehicle's price that will be used as the insurance cost.
-- For example, if the vehicle price is $100,000 and this value is set to 0.15 (15%), the insurance cost will be $15,000.
Config.VehiclesInsurancesPercentageFromPrice = 0.15 -- 15% of the vehicle's price


---@class InsurancePricesBasedOnDatabasePrices
-- If set to true, the script will dynamically fetch vehicle prices from the database using the function SV.fetchVehiclesPrices.
-- This ensures that the insurance price is always calculated based on real-time market values stored in the server database.
-- If set to false, it will only use the manually configured prices in Config.VehiclePrices.
Config.InsurancePricesBasedOnDatabasePrices = true


---@field VehiclesInsurancerSociety string | nil
-- Defines the society that will manage vehicle insurance payments.
-- When a player purchases vehicle insurance, a portion of the money will go to this organization.
-- Example: 'insurancer' represents an insurance company that can accumulate funds.
-- Set to nil if no society should benefit from vehicle insurance purchases.
Config.VehiclesInsurancerSociety = 'insurancer'


---@field VehiclesInsurancesMoneyToSocietyPercent number
-- Determines what percentage of the insurance payment will be transferred to the specified society (Config.VehiclesInsurancerSociety).
-- Example: If this value is set to 40, then 40% of the paid insurance fee will go to the insurance company.
Config.VehiclesInsurancesMoneyToSocietyPercent = 40


---@class VehiclePrices
-- A list of manually set vehicle prices for insurance calculations.
-- If Config.InsurancePricesBasedOnDatabasePrices is set to false, the script will rely on this table instead of fetching prices from the database.
-- The price is set using the vehicle's hash key.
Config.VehiclePrices = {
    -- [GetHashKey('prototipo')] = 9000000,
}



-- ██████╗ ██╗██╗     ██╗     ██╗███╗   ██╗ ██████╗ ███████╗
-- ██╔══██╗██║██║     ██║     ██║████╗  ██║██╔════╝ ██╔════╝
-- ██████╔╝██║██║     ██║     ██║██╔██╗ ██║██║  ███╗███████╗
-- ██╔══██╗██║██║     ██║     ██║██║╚██╗██║██║   ██║╚════██║
-- ██████╔╝██║███████╗███████╗██║██║ ╚████║╚██████╔╝███████║
-- ╚═════╝ ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
---@field UseBillings boolean  
-- Enables or disables the billing system.
-- If set to true, companies and players can issue invoices, fines, and other charges.
-- If set to false, the billing system will be disabled.
Config.UseBillings = true -- Enable the billing system


---@field ShowCanceledBillings boolean  
-- Determines whether canceled billings should be visible in the Fines section.
-- If set to true, previously canceled invoices and fines will be shown in the Fines section.
-- If set to false, canceled bills will be hidden.
Config.ShowCanceledBillings = false -- Hide canceled bills


---@field ShowPaidBillings boolean  
-- Determines whether paid billings should be visible in the Fines section.
-- If set to true, players can view a history of their paid bills.
-- If set to false, only unpaid bills will be shown.
Config.ShowPaidBillings = true -- Show paid bills


---@field BillingsRequiredConfirm boolean  
-- If enabled (true), all issued bills will require confirmation before being finalized.
-- This adds an extra step to prevent accidental billing.
Config.BillingsRequiredConfirm = false -- Require confirmation before issuing a bill


---@class BillingPayments  
-- Defines the available payment methods for billings.
-- Players can pay their bills in different locations using different payment methods.
Config.BillingPayments = {
    inCityHall = { -- Payments made at the City Hall
        ['cash'] = true, -- Allow paying in cash
        ['bank'] = true -- Allow paying via bank transfer
    },
    withItem = { -- Payments made with an item (e.g., payment terminals)
        ['cash'] = false, -- Disable cash payments for this method
        ['bank'] = true -- Allow bank payments
    },
}


---@class BillingItems  
-- Defines the items required for issuing different types of billings.
-- This ensures that specific documents (tickets, invoices, receipts) require appropriate items.
Config.BillingItems = {
    ['ticket'] = { -- Ticket system (e.g., fines)
        emptyItemName = 'empty_ticket', -- Item required to write out a ticket (set to nil if not required)
        removeOnIssue = true, -- Remove the empty ticket when issued

        itemName = 'ticket', -- The actual ticket item given to the receiver
        addForReceiver = true, -- The recipient will receive the ticket item in their inventory
    },
    ['invoice'] = { -- Invoice system (e.g., company-issued bills)
        emptyItemName = 'empty_invoice', -- Item required to write out an invoice (set to nil if not required)
        removeOnIssue = true, -- Remove the empty invoice when issued

        itemName = 'invoice', -- The actual invoice item given to the receiver
        addForReceiver = true, -- The recipient will receive the invoice item
    },
    ['receipt'] = { -- Receipt system (e.g., proof of purchase)
        requiredItem = 'payment_terminal', -- A payment terminal is required to issue a receipt (set to nil if not required)
        emptyItemName = 'thermal_paper', -- Thermal paper is required to print a receipt (set to nil if not required)
        removeOnIssue = true, -- The thermal paper will be consumed when issuing a receipt

        itemName = 'receipt', -- The actual receipt item given to the receiver
        addForReceiver = true, -- The recipient will receive the receipt item
    },
}

---@class CompanyBillings  
-- Defines settings for company billing commands.
-- This allows companies to check billings history and manage using a dedicated command.
Config.CompanyBillings = {
    command = 'billings', -- The command used to access the company billing menu
    description = 'Company Billings', -- Description of the command
    key = nil -- Optional keybinding for accessing the billing menu (set to a key if needed)
}

---@class AllowedJobBillings 'traffic-ticket', 'ticket', 'invoice', 'receipt'
Config.AllowedJobBillings = {
    ['police'] = {
        label = "LSPD",

        society = 'society_police',
        percentageForSociety = 85,
        percentageForIssuer = 15,

        types = {
            ['traffic-ticket'] = true,
            ['ticket'] = true,
        },

        amountLimits = {
            ['traffic-ticket'] = {min = 1, max = 12000},
            ['ticket'] = {min = 1, max = 50000},
        },

        dueDates = {-1, 1, 2, 3, 4, 5, 6, 7, 14, 30},

        allowLicenseRevocation = true,
        licenseRevocationList = {
            ['drive_a'] = Config.LicensesLabels['drive_a'],
            ['drive_b'] = Config.LicensesLabels['drive_b'],
            ['drive_c'] = Config.LicensesLabels['drive_c'],
        },

        allowLicenseSuspension = true,
        licenseSuspensionDays = {3, 4, 5, 6, 7, 14},

        allowPenaltyPoints = true,
    },
    ['ambulance'] = {
        label = "EMS",

        society = 'society_ambulance',
        percentageForSociety = 90,
        percentageForIssuer = 10,

        types = {
            ['invoice'] = true,
        },

        amountLimits = {
            ['invoice'] = {min = 1, max = 100000},
        },

        dueDates = {-1, 1, 2, 3, 4, 5, 6, 7, 14, 30},

        taxFromInvoice = 4.5,
    },
    ['mechanic'] = {
        label = 'MECHANIC',
        
        society = 'society_mechanic',
        percentageForSociety = 90,
        percentageForIssuer = 10,
        types = {
            ['receipt'] = true,
        },

        amountLimits = {
            ['receipt'] = {min = 1, max = 10000},
        },

        taxFromReceipt = 2.3
    },
}

-- █▀▄ ██▀ █▄ █ ▄▀▄ █   ▀█▀ ▀▄▀   █▀▄ ▄▀▄ █ █▄ █ ▀█▀ ▄▀▀
-- █▀  █▄▄ █ ▀█ █▀█ █▄▄  █   █    █▀  ▀▄▀ █ █ ▀█  █  ▄██
---@field UsePenaltyPoints: Do you want penalty points available on the server
Config.UsePenaltyPoints = true

---@field PenaltyPointsLimit: Penalty points limit, when reached, licenses should be removed if you set - Config.PenaltyPointsRemoveLicenses = true
Config.PenaltyPointsLimit = 24

---@field RemovePenaltyPointsAfter: After what time penalty points are to be removed from the date of posting. This means that they will systematically drop every specified period of time after they are assigned.
--[[
    Given time must be in seconds.
        0 = Never remove points
]]
Config.RemovePenaltyPointsAfter = 30 * (24 * 60 * 60) -- By default 30 days after points are assigned

---@field PenaltyPointsRemoveLicenses: Player will lose license after exceeding the penalty points limit (Config.PenaltyPointsLimit)
Config.PenaltyPointsRemoveLicenses = true

---@field PenaltyPointsLicenses List of driver licenses that a player will lose after exceeding the penalty point limit.
Config.PenaltyPointsLicenses = {
    'drive_a', 'drive_b', 'drive_c',
}



-- ██╗   ██╗███████╗██╗  ██╗██╗ ██████╗██╗     ███████╗    ██╗   ██╗██╗███╗   ██╗
-- ██║   ██║██╔════╝██║  ██║██║██╔════╝██║     ██╔════╝    ██║   ██║██║████╗  ██║
-- ██║   ██║█████╗  ███████║██║██║     ██║     █████╗      ██║   ██║██║██╔██╗ ██║
-- ╚██╗ ██╔╝██╔══╝  ██╔══██║██║██║     ██║     ██╔══╝      ╚██╗ ██╔╝██║██║╚██╗██║
--  ╚████╔╝ ███████╗██║  ██║██║╚██████╗███████╗███████╗     ╚████╔╝ ██║██║ ╚████║
--   ╚═══╝  ╚══════╝╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝╚══════╝      ╚═══╝  ╚═╝╚═╝  ╚═══╝

------ █ █ █ █▄ █   █ █▄ █ █▀ ▄▀▄
------ ▀▄▀ █ █ ▀█   █ █ ▀█ █▀ ▀▄▀
---@class InfoVIN Vehicle information through a special menu
Config.InfoVIN = {
    enabled = true,

    command = 'vininfo',
    description = 'VIN Informations',

    key = nil,

    useOnTarget = Config.UseTarget,

    informations = {
        model = true,
        ownerName = true,
        plate = true,
        insuranceStartTime = true,
        insuranceEndTime = true,
    },

    useRequiredJob = true,
    requiredJob = {
        ['sheriff'] = true, -- All grades
        ['police'] = {1,2,3,4,5},
    }
}

------ █ █ █ █▄ █   ▄▀▀ █▄█ ██▀ ▄▀▀ █▄▀
------ ▀▄▀ █ █ ▀█   ▀▄▄ █ █ █▄▄ ▀▄▄ █ █
---@class CheckVIN
Config.CheckVIN = {
    enabled = true,

    timeoutBetweenUses = 8, -- 8 seconds

    command = 'checkvin',
    description = 'Check VIN',

    key = nil,

    allowCopy = true,

    useOnTarget = Config.UseTarget, 

    useNotification = true,
    use3dText = true,
    
    visibleTime3dText = 50000 -- miliseconds
}

------ █ █ █ █▄ █   █▄█ █ █▀▄ ██▀
------ ▀▄▀ █ █ ▀█   █ █ █ █▄▀ █▄▄
---@class HideVIN Hiding VIN number, no one will be able to see it using /checkvin
Config.HideVIN = {
    enabled = true,

    timeoutBetweenUses = 8, -- 8 seconds

    command = 'hidevin',
    description = 'Hide VIN (inside vehicle)',

    key = nil,
}



-- ███████╗ █████╗ ██╗     ███████╗     █████╗  ██████╗ ██████╗ ███████╗███████╗███╗   ███╗███████╗███╗   ██╗████████╗
-- ██╔════╝██╔══██╗██║     ██╔════╝    ██╔══██╗██╔════╝ ██╔══██╗██╔════╝██╔════╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
-- ███████╗███████║██║     █████╗      ███████║██║  ███╗██████╔╝█████╗  █████╗  ██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
-- ╚════██║██╔══██║██║     ██╔══╝      ██╔══██║██║   ██║██╔══██╗██╔══╝  ██╔══╝  ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
-- ███████║██║  ██║███████╗███████╗    ██║  ██║╚██████╔╝██║  ██║███████╗███████╗██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
-- ╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
---@class VehicleSaleAgreement Do you want to use the script built-in option to sell your vehicle
--[[
    Remember, if you are using vms_garagesV2, go to vms_garagesv2/config/config.lua, find Config.UseSaleAgreement and change that to false.
]]
Config.VehicleSaleAgreement = {
    Use = true,

    UseOnItem = true,
    ItemName = 'vehicle_sale_agreement',
    
    GiveSignedItemToSeller = true, -- The seller will receive a copy of the signed vehicle sales document
    GiveSignedItemToBuyer = true, -- The buyer will receive a copy of the signed vehicle sales document
    SignedItemName = 'signed_vehicle_sale_agreement',

    UseOnCommand = false,
    CommandName = 'sellvehicle',

    PaymentMethods = {'cash', 'bank'},

    AllowSellForCompany = GetResourceState('vms_garagesv2') ~= 'missing',
    CompaniesList = {
        ['police'] = {
            grades = {4},
            allowedModels = {
                [GetHashKey('police')] = true,
                [GetHashKey('police2')] = true,
                [GetHashKey('police3')] = true,
            }
        },
        ['ambulance'] = {
            grades = {5,6},
            allowedModels = {
                [GetHashKey('ambulance')] = true,
            }
        },
        ['taxi'] = {
            grades = {3,4},
            allowedModels = {
                [GetHashKey('taxi')] = true,
                [GetHashKey('baller')] = true,
            }
        },
    },

    BlacklistVehicles = {
        [GetHashKey('rhino')] = true,
        [GetHashKey('police')] = true,
        [GetHashKey('police2')] = true,
        [GetHashKey('police3')] = true,
    }
}

---@field UseVehicleType boolean: Do you have a `type` column in your owned_vehicles / player_vehicles, if yes, you can set true, if no, you must set false.
Config.UseVehicleType = false