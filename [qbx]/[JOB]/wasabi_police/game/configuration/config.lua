-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local seconds, minutes = 1000, 60000
Config = {}

-------------------------------------------------------------------
-- TO MODIFY NOTIFICATIONS TO YOUR OWN CUSTOM NOTIFICATIONS:-------
-------------- Navigate to wasabi_bridge/customize/ ---------------
-------------------------------------------------------------------
Config.CheckForUpdates = true -- Check for updates? Who would not want to know updates!?

-- Language Options are
-- 'en' (English)
-- 'fr' (French)
-- 'cn' (Chinese Simplified)
-- 'tw' (Chinese Traditional)
-- 'de' (German)
-- 'it' (Italian)
-- 'jp' (Japanese)
-- 'ko' (Korean)
-- 'pl' (Polish)
-- 'pt' (Portuguese)
-- 'es' (Spanish)
-- 'hi' (Hindi)
-- 'nl' (Dutch)
-- 'da' (Danish)
-- 'cs' (Czech)
-- If you would like us to add a language, join our discord and create a ticket!
-- All locale strings can be found in /game/configuration/locales/
Config.Language = 'en'
Config.UIColor = '#0390fc'     -- Can be 'red', 'blue', or a hex '#FF0000'
Config.JailUIColor = '#0390fc' -- Can be 'red', 'blue', or a hex '#FF0000'

Config.jobMenu = 'F6'          -- Default job menu key
Config.useTarget = true        -- Enable target for police functions (Supports ox_target / qb-target)
Config.MobileMenu = {          -- THIS WILL USE A REGULAR MENU RATHER THAN A CONTEXT STYLE MENU!
    enabled = false,           -- Use a mobile menu rather than context? (Use arrow keys to navigate menu rather than mouse)
    position =
    'bottom-right'             -- Choose where menu is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}
Config.UseRadialMenu = false   -- Enable use of radial menu built in to ox_lib? (REQUIRES OX_LIB - Editable in client/radial.lua)

Config.customCarlock = false   -- If you use wasabi_carlock OR qb-carlock set to true(Add your own carlock system in wasabi_bridge/customize/client/carlock.lua)
Config.billingSystem =
'default'                      -- Current options: false (Disabled) / 'default' (For built-in System)/'esx' (For esx_billing) / 'qb' (QBCore) / 'okok' (For okokBilling) (Easy to add more/fully customize in client/cl_customize.lua)

--ONLY IF USING 'default' BILLING SYSTEM
Config.billingData = {
    chargeAccount = 'bank', --Cash or bank (The default method to charge player)

    -- Credit police society for fines?
    -- (If true, fines will be credited to whichever police job sent the fine)
    -- (If false, fines will be deducted from the player but credited to no where)
    -- (Set to string of specific account if you wish for a singular account to receive all fine recoveries)
    creditSociety = true,

    fines = { --Fine presets
        { label = 'Attempt Robbery of Shop', amount = 1200 },
        { label = 'Attempt Robbery of Bank', amount = 2400 },
        { label = 'On-Duty Crime',           amount = 10000 },
        { label = 'Driving On Off-Road',     amount = 2200 },
        { label = 'Anti Gravity',            amount = 4200 },
    }
}

Config.OldQBManagement = false -- If you use older qb-management(Unrelated to ESX)

Config.AdvancedParking = false -- Delete vehicles with their exports(Script named advanced parking)

Config.Jail = {
    enabled = false,                          -- Enable jail feature?
    input = true,                            -- Enable input? Some needs it
    jail = 'rcore',                               -- Current options: 'qb' (For qb-prison) / 'r_prison' (For r_scripts prison: https://r-scripts.tebex.io/) / 'rcore' (For rcore-prison) / 'tk_jail' (For tk_jail) / 'hd_jail' (For hd_jail) / 'myPrison' (For myPrison) / 'qalle-jail' (For qalle-jail) / 'plouffe ' (For Plouffe Jail) / 'mx' (For mxJail) / 'custom' (For custom)
    BuiltInPrison = {
        enabled = false,                      -- Enable built-in prison system?
        persistentJail = true,               -- Persistent jail? (If false, jail will be reset on reload)
        coords = vec3(1845.0, 2585.0, 45.0), -- Coords of prison
        spawn = {
            { coords = vec4(1745.77, 2489.61, 50.41, 212.01) },
            { coords = vec4(1751.86, 2492.73, 50.44, 213.77) },
            { coords = vec4(1760.82, 2498.14, 50.42, 208.26) },
            { coords = vec4(1754.85, 2494.59, 45.82, 212.49) },
            { coords = vec4(1748.84, 2491.35, 45.80, 203.43) }
        },
        release = vec4(1845.0, 2585.0, 45.0, 0.0), -- Coords of released
        jailOutfit = {
            male = {                               -- Male variation
                clothing = {
                    -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                    -- https://docs.fivem.net/natives/?_0xD4F7B05C
                    { component = 11, drawable = 5,  texture = 2 }, -- Torso
                    { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                    { component = 4,  drawable = 6,  texture = 1 }, -- Pants
                    { component = 6,  drawable = 16, texture = 7 }, -- Shoes
                    { component = 3,  drawable = 5,  texture = 0 }, -- Arms
                },
                props = {
                    -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                    -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                    --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                }
            },
            female = {
                clothing = {
                    -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                    -- https://docs.fivem.net/natives/?_0xD4F7B05C
                    { component = 11, drawable = 4,  texture = 0 }, -- Torso
                    { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                    { component = 4,  drawable = 25, texture = 0 }, -- Pants
                    { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                    { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                },
                props = {
                    -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                    -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                    --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                }
            }
        },

    },
}
-- NOTE: If using qb-prison, you must make one small change to qb-prison.
-- SEE https://docs.wasabiscripts.com/scripts/wasabi_police/customizations#qb-prison-integration

Config.searchPlayers = true     -- Allow police jobs to search players for items (Must have inventory in bridge or one already supported in cl_customize.lua - or add your own!)
Config.weaponsAsItems = true     -- (If you're unsure leave as true!)This is typically for older ESX and inventories that still use weapons as weapons and not items

Config.spikeStripsEnabled = true -- Enable functionality of spike strips (Disable if you use difference script for spike strips)

--[[ These resources can trigger:
    wasabi_police:handcuffPlayer
    wasabi_police:escortPlayer
    wasabi_police:inVehiclePlayer
    wasabi_police:outVehiclePlayer
]]
Config.AllowedResources = {
    'qb-core',
    'qb-radialmenu', -- For civilians to be able to use radial menu features(Already had compatibility without edit)
}

Config.AllowedJobs = { -- THIS HAS NOTHING TO DO with Config.policeJobs, only with triggering events above
    --'bloods'
}

Config.GrantWeaponLicenses = {
    enabled = true,          -- If you want police to have option to grant/revoke weapons licenses
    license_name = 'weapon', -- Name of license
    minGrade = 0,            -- Min grade to use this function
    menuPosition =
    'bottom-right'           -- Choose where menu of player select is positioned. Options : 'top-left' or 'top-right' or 'bottom-left' or 'bottom-right'
}

Config.CCTVCameras = { -- CCTV Cameras
    enabled = true,     -- Enable CCTV Cameras?
    jobLock = 'police', -- Job lock? or access to all police jobs by using false
    saveToDatabase = true, -- Save CCTV data to database? (If false, data will be stored in server memory/reset on server restarts)

    jobs = {            -- Jobs & minimum ranks that can add/modify/delete CCTV Cameras
        -- Must be in Config.policeJobs as well
        police = 0,     -- Job 'police' with minimum rank 0
        bcso = 0,
        sahp = 0,
        rangers = 0,
        --        sheriff = 2,    -- Job 'sheriff' with minimum rank 2
    },
    destoryable = true, -- Can players destroy CCTV Cameras?
    blip = {
        enabled = false,      -- Enable blips for CCTV Cameras?
        label = 'CCTV Camera', -- Blip label
        sprite = 604,         -- Blip sprite
        color = 5,            -- Blip color
        scale = 0.5,          -- Blip scale
        short = false,        -- Short range blip?
    },

    EnabledKeys = {  --Enabled keys while in camera view
      --W A S D BackSpace 
        32, 34, 8, 9, 177
    },

    options = {
        {
            label = 'CCTV Camera #1', -- Label of CCTV Camera
            prop = 'prop_cctv_cam_01a', -- Prop name
        },
        {
            label = 'CCTV Camera #2',
            prop = 'prop_cctv_cam_01b',
        },
        {
            label = 'CCTV Camera #3',
            prop = 'prop_cctv_cam_06a',
        },
        {
            label = 'CCTV Camera #4',
            prop = 'prop_cctv_cam_05a',
        },
    },
    locations = { -- Locations of CCTV Cameras
        enabled = true, -- Enable locations of CCTV Cameras?
        data = {
        {
   
            name = 'Shop (Innocence Blvd)', -- Label of CCTV Camera
            prop = 'prop_cctv_cam_06a', -- Prop name
            coords = vector3(23.8389778137207, -1348.9283447265626, 31.53925323486328),  --coords":{"x":23.8389778137207,"y":-1348.9283447265626,"z":31.53925323486328}
            heading = 119.99991607666016, --heading
        },
        {
            name = 'Shop (Inseno Road)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(-3037.25, 584.399169921875, 9.89759731292724),
            heading = 224.99984741210938,
        },
        {
            name = 'Shop (Barbareno Road)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(-3240.68603515625, 999.1280517578125, 14.87293338775634),
            heading = 199.9998016357422,
        },
        {
            name = 'Shop (Great Ocean Highway)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(1726.5582275390626, 6414.02783203125, 37.07946395874023),
            heading = 94.99994659423828,
        },
        {
            name = 'Shop (Grape Seed Main Street)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(1706.2977294921876, 4926.40576171875, 44.10588836669922),
            heading = 239.99984741210938,
        },
        {
            name = 'Shop (Alhambra Drive)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(1960.42431640625, 3738.34716796875, 34.38598251342773),
            heading = 149.9998321533203,
        },
        {
            name = 'Shop (Route 68)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(549.0037841796875, 2672.68896484375, 43.89537048339844),
            heading = 304.99969482421877,
        },
        {
            name = 'Shop (Senora Freeway)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(2679.138671875, 3278.020263671875, 57.58337097167969),
            heading = 179.999755859375,
        },
        {
            name = 'Shop (Palomino Freeway)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(2558.8310546875, 380.1410827636719, 110.66519927978516),
            heading = 209.9998016357422,
        },
        {
            name = 'Shop (Clinton Avenue)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(371.39739990234377, 324.99755859375, 105.60862731933594),
            heading = 104.99993133544922,
        },
        {
            name = 'Shop (North Rockford Drive)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(-1827.2593994140626, 793.8814086914063, 140.25299072265626),
            heading = 44.99998092651367,
        },
        {
            name = 'Shop (Grove Street)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(-47.95944213867187, -1750.7666015625, 31.46323776245117),
            heading = 324.99945068359377,
        },
        {
            name = 'Shop (Ginger Street)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(-711.623779296875, -908.9114379882813, 21.25783157348632),
            heading = 0.0,
        },
        {
            name = 'Shop (Mirror Park Blvd)',
            prop = 'prop_cctv_cam_06a',
            coords = vector3(1158.4505615234376, -319.10296630859377, 71.24732971191406),
            heading = 14.99969005584716,
        },
    }
}

}


Config.RadarPosts = {           -- Radar posts for speed detection

    enabled = true,             -- Enable radar posts (Shows option in job menu for approved jobs)?
    saveToDatabase = true,      -- Save radar data to database? (If false, data will be stored in server memory/reset on server restarts)

    disableCameraFlash = false, -- Disable camera flash effect when player is caught speeding?

    measurement = 'mph',        -- Measurement of speed (Options: 'mph' / 'kmh')

    jobs = {                    -- Jobs & minimum ranks that can add/modify/delete radar posts
        -- Must be in Config.policeJobs as well
        police = 0,             -- Job 'police' with minimum rank 0
        bcso = 0,
        sahp = 0,
        rangers = 0,

       -- sheriff = 2,            -- Job 'sheriff' with minimum rank 2
    },

    whitelistJobs = { -- Jobs that do not get fined for speeding
        -- Do not worry about jobs from Config.policeJobs, they are automatically whitelisted
        'ambulance',

    },

    chargeAccount = 'bank',       -- Cash or bank (The default method to charge player
    allowNegativeBalance = false, -- Allow players to go into negative balance? (If false, player must have enough money to pay fine)

    -- Credit police society for fines?
    -- (If true, fines will be credited to whichever police job placed the radar post that detected speeding)
    -- (If false, fines will be deducted from the speeder but credited to no where)
    -- (Set to string of specific account if you wish for a singular account to receive all fine recoveries)
    creditSociety = true,
    detectionRadius = 5,  -- Radius within which the radar detects speeders
    thresholds = {   -- Speed thresholds for fines
        [5] = 50,    -- 5 over = $50 fine
        [10] = 100,  -- 10 over = $100 fine
        [20] = 500,  -- 20 over = $500 fine
        [30] = 1000, -- 30 over = $1000 fine
        [40] = 2000, -- 40 over = $2000 fine
        [50] = 5000, -- 50 over = $5000 fine
    },

    blip = {
        enabled = false,      -- Enable blips for radar posts?
        label = 'Radar Post', -- Blip label
        sprite = 184,         -- Blip sprite
        color = 5,            -- Blip color
        scale = 0.5,          -- Blip scale
        short = false,        -- Short range blip?
    },

    options = {
        {
            label = 'Radar Post #1',     -- Label of radar post
            prop = 'prop_cctv_pole_01a', -- Prop name
        },
        {
            label = 'Radar Post #2',
            prop = 'prop_cctv_pole_02',
        },
        {
            label = 'Radar Post #3',
            prop = 'prop_cctv_pole_03',
        },
        {
            label = 'Radar Post #4',
            prop = 'prop_cctv_pole_04',
        },
    }
}

Config.GSR = {                 -- Gunshot residue settings
    enabled = false,           -- Enabled?
    cleanInWater = true,       -- Can clean GSR while in water?
    timeToClean = 5 * seconds, -- How long to clean GSR in water if enabled
    autoClean = 600,           -- (IN SECONDS)How long before residue clears itself? Set to false if undesired to auto clean GSR
    command = 'gsr'            -- Command for testing for GSR? Set to false if undesired
}

Config.tackle = {
    enabled = true,    -- Enable tackle?
    policeOnly = true, -- Police jobs only use tackle?
    hotkey = 'G'       -- What key to press while sprinting to start tackle of target
}

Config.seizeCash = {  -- ONLY FOR QBCORE WITHOUT CASH AS ITEM
    enabled = false,  -- Enabled?
    item = 'moneybag' -- Item to add after seizedCash
}

Config.handcuff = {                             -- Config in regards to cuffing
    defaultCuff = 'hard',                       -- Default cuff type (Options: 'soft' / 'hard') Changing this will be the default hotkey cuff type
    persistentCuff = true,                      -- Verify player's cuffed status during login (Install '_EXTRA_ESX_INSTALL/ESX_PERSISTENT_CUFF.sql' if using ESX)
    timer = 20 * minutes,                       -- Time before player is automatically unrestrained(Set to false if not desired)
    hotkey = 'J',                               -- What key to press to handcuff people(Set to false for no hotkey)
    cuffDeadPlayers = false,                    -- Allow cuffing dead players?
    skilledEscape = {
        enabled = true,                         -- Allow criminal to simulate resisting by giving them a chance to break free from cuffs via skill check
        difficulty = { 'easy', 'easy', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    },
    cuffItem = {                                -- Have handcuffs as usable item? (ITEM NAME MUST BE IN ITEMS / YOU MUST ADD YOURSELF)
        enabled = true,                        -- Enable a handcuff usable item?? Must be in items table/database with name defined below
        required = true,                        -- Requires handcuff item to be in inventory when any handcuff function is used
        item = 'handcuffs'                      -- Item name (DONT FORGET to make sure its in your items)
    },
    lockpicking = {                             -- Lockpicking someone else out of handcuffs
        enabled = true,                        -- Enable handcuffs to be able to be lockpicked off(MUST HAVE LOCKPICK ITEM IN ITEMS)
        item = 'bobby_pin',
        breakChance = 50,                       -- Chance of lockpick breaking if failed (Set to 100 for 100% or 0 for never breaking)
        difficulty = { 'easy', 'easy', 'easy' } -- Options: 'easy' / 'medium' / 'hard' (Can be stringed along as they are in config)
    }
}

Config.TrackingBracelet = { -- Tracking Bracelet
    enabled = true,          -- Enable tracking bracelet?
    jobLock = false, -- Job lock? or access to all police jobs by using false
    jobs = {            -- Jobs & minimum ranks that can add/modify/delete CCTV Cameras
        -- Must be in Config.policeJobs as well
        police = 0,     -- Job 'police' with minimum rank 0
        bcso = 0,
        sahp = 0,
        rangers = 0,
        --        sheriff = 2,    -- Job 'sheriff' with minimum rank 2
    },
    blip = {
        enabled = true,      -- Enable blips for tracking bracelets?
        label = 'Tracking: %s', -- Blip label
        sprite = 304,         -- Blip sprite
        color = 5,            -- Blip color
        scale = 0.5,          -- Blip scale
    },
    item = 'tracking_bracelet', -- Item required to use tracking bracelet
    timer = 20 * minutes,    -- Time before player is automatically untracked(Set to false if not desired)
}

Config.policeJobs = { -- Police jobs
    'police',
    'bcso',
    'sahp',
    'rangers'
    --    'sheriff'
   -- 'reporter'
}

Config.GPSBlips = {
    enabled = true,     -- Enabled?
    item = false,        -- Item required? Note: You have to use it then
    sprites = {
        none = 443,      -- Blip for when not in a vehicle
        car = 672,       -- Blip for when in vehicles
        bike = 226,      -- Blip for when on bikes
        boat = 427,      -- Blip for when in boats
        helicopter = 43, -- Blip for when in helicopters
        plane = 307,     -- Blip for when in planes
    },
    settings = {
        color = {
            default = 1, -- Default blip color
            police = 3,  -- Blip color for police
            sahp = 5,
            bcso = 4,
            rangers = 7,
            
        },
        scale = 0.75,
        short = false,
        category = 7
    }
}

Config.Objects = { -- compatibility for the object spawner in qb-radialmenu
    cone = { model = `prop_roadcone02a`, freeze = false },
    barrier = { model = `prop_barrier_work06a`, freeze = true },
    roadsign = { model = `prop_snow_sign_road_06g`, freeze = true },
    tent = { model = `prop_gazebo_03`, freeze = true },
    light = { model = `prop_worklight_03b`, freeze = true },
    spikeStrip = { model = `p_ld_stinger_s`, freeze = true }
}

Config.Props = { -- What props are avaliable in the "Place Objects" section of the job menu

    {
        title = 'Barrier',             -- Label
        description = '',              -- Description (optional)
        model = `prop_barrier_work05`, -- Prop name within `
        freeze = true,                 -- Make prop unmovable
        groups = {                     -- ['job_name'] = min_rank
            ['police'] = 0,
            ['bcso'] = 0,
            ['sahp'] = 0,
            ['rangers'] = 0,
            
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Barricade',
        description = '',
        model = `prop_mp_barrier_01`,
        freeze = true, -- Make prop unmovable
        groups = {
            ['police'] = 0,
            ['bcso'] = 0,
            ['sahp'] = 0,
            ['rangers'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Traffic Cones',
        description = '',
        model = `prop_roadcone02a`,
        freeze = false, -- Make prop unmovable
        groups = {
            ['police'] = 0,
            ['bcso'] = 0,
            ['sahp'] = 0,
            ['rangers'] = 0,
            --            ['sheriff'] = 0,
        }
    },
    {
        title = 'Spike Strip',
        description = '',
        model = `p_ld_stinger_s`,
        freeze = true, -- Make prop unmovable
        groups = {
            ['police'] = 0,
            ['bcso'] = 0,
            ['sahp'] = 0,
            ['rangers'] = 0,
            --            ['sheriff'] = 0,
        }
    },

}

Config.Locations = {
    LSPD = {
        blip = {
            enabled = true,
            coords = vec3(446.59, -985.69, 30.71),
            sprite = 60,
            color = 29,
            scale = 1.0,
            string = 'Mission Row PD'
        },

        clockInAndOut = {
            enabled = true,                        -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for each e.x. offpolice for police offsheriff for sheriff AND have grades for each pd grade - QBCORE REQUIRES NOTHING)
            jobLock = 'police',                    -- This must be set to which job will be utilizing (ESX MUST HAVE OFF DUTY JOB / GRADES FOR THIS - ex. offpolice or offsheriff)
            coords = vec3(446.11, -985.79, 30.75), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = true,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(446.11, -985.79, 30.75),
                heading = 88.52,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 31.69 + 0.9
            }
        },

        bossMenu = {
            enabled = true,                        -- Enable boss menu?
            jobLock = 'police',                    -- Lock to specific police job? Set to false if not desired
            coords = vec3(434.726, -999.039, 35.684), -- Location of boss menu (If not using target)
            label = '[E] - Access Boss Menu',      -- Text UI label string (If not using target)
            distance = 3.0,                        -- Distance to allow access/prompt with text UI (If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Boss Menu',
                coords = vec3(460.64, -985.64, 30.73),
                heading = 269.85,
                distance = 2.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            }
        },

        armoury = {
            enabled = false,                                                                              -- Set to false if you don't want to use
            coords = vec3(480.32, -996.67, 30.69 - 0.9),                                                 -- Coords of armoury
            heading = 86.95,                                                                             -- Heading of armoury NPC
            ped = 's_f_y_cop_01',                                                                        -- Ped model or false for no ped
            label = '[E] - Access Armoury',                                                              -- String of text ui
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Armoury',
                coords = vec3(480.32, -996.67, 30.69 - 0.9), 
                heading = 24.95,
                distance = 4.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            },
            jobLock = 'police',                                                                          -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            weapons = {
                [0] = {                                                                                  -- Grade number will be the name of each table(this would be grade 0)
                    { name = 'WEAPON_PISTOL',     label = 'Pistol',      multiple = false, price = 75 }, -- Set price to false if undesired
                    { name = 'WEAPON_NIGHTSTICK', label = 'Night Stick', multiple = false, price = 50 },
                    --  { name = 'ammo-9' , label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example

                },
                [1] = { -- This would be grade 1
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [2] = { -- This would be grade 2
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [3] = { -- This would be grade 3
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
            }
        },

        cloakroom = {
            enabled = false,                        -- WILL NOT SHOW IN QBCORE INSTEAD USE QB-CLOTHING CONFIG! Set to false if you don't want to use (Compatible with esx_skin & wasabi fivem-appearance fork)
            jobLock = 'police',                    -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            coords = vec3(462.36, -999.62, 30.69), -- Coords of cloakroom
            label = '[E] - Change Clothes',        -- String of text ui of cloakroom
            range = 2.0,                           -- Range away from coords you can use.
            uniforms = {                           -- Uniform choices
                [1] = {                            -- Order it will display
                    label = 'Patrol',              -- Name of outfit that will display in menu
                    minGrade = 0,                  -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {                       -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 5,  texture = 2 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 6,  texture = 1 }, -- Pants
                            { component = 6,  drawable = 16, texture = 7 }, -- Shoes
                            { component = 3,  drawable = 5,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [2] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [3] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
            }
        },

        -- Personal Locker. Supports inventories: ox_inventory, qb-inventory, and qs-inventory
        --        Custom inventories can easily be added in wasabi_bridge/inventories/
        personalLocker = {
            enabled = false,                       -- Enable personal locker for this station?
            jobLock = 'police',                    -- Job lock?
            coords = vec3(462.64, -995.88, 30.69), -- Area to prompt personal locker
            range = 2.0,                           -- Range it will prompt from coords above
            label = '[E] - Access Personal Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Personal Locker',
                coords = vec3(462.64, -995.88, 30.69),
                heading = 354.94,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        evidenceLocker = {
            enabled = false,                      -- Enable evidence locker for this station?
            jobLock = 'police',                   -- Job lock?
            coords = vec3(472.5, -991.21, 26.27), -- Area to prompt personal locker
            range = 2.0,                          -- Range it will prompt from coords above
            label = '[E] - Access Evidence Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Evidence Locker',
                coords = vec3(472.5, -991.21, 26.27),
                heading = 266.23,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 26.27 - 0.9,
                maxZ = 26.27 + 0.9
            }
        },


        vehicles = {                                   -- Vehicle Garage
            enabled = false,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            jobLock = 'police',                        -- Job lock? or access to all police jobs by using false
            zone = {
                coords = vec3(463.69, -1019.72, 28.1), -- Area to prompt vehicle garage
                range = 5.5,                           -- Range it will prompt from coords above
                label = '[E] - Access Garage',
                return_label = '[E] - Return Vehicle'
            },
            spawn = {
                land = {
                    coords = vec3(449.37, -1025.46, 28.59), -- Coords of where land vehicle spawn/return
                    heading = 3.68
                },
                air = {
                    coords = vec3(449.29, -981.76, 43.69), -- Coords of where air vehicles spawn/return
                    heading = 0.01
                }
            },
            options = {

                [0] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [1] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [2] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [3] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
            }
        }
    },
    SAHP1 = {
        blip = {
            enabled = true,
            coords = vec3(2806.79, 4740.31, 47.89),
            sprite = 60,
            color = 29,
            scale = 1.0,
            string = 'SAHP'
        },

        clockInAndOut = {
            enabled = true,                        -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for each e.x. offpolice for police offsheriff for sheriff AND have grades for each pd grade - QBCORE REQUIRES NOTHING)
            jobLock = 'police',                    -- This must be set to which job will be utilizing (ESX MUST HAVE OFF DUTY JOB / GRADES FOR THIS - ex. offpolice or offsheriff)
            coords = vec3(2808.88, 4752.83, 48.22), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = true,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(2808.88, 4752.83, 48.22),
                heading = 99.02,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 47.02 - 0.9,
                maxZ = 48.99 + 0.9
            }
        },

        bossMenu = {
            enabled = true,                        -- Enable boss menu?
            jobLock = 'police',                    -- Lock to specific police job? Set to false if not desired
            coords = vec3(2824.05, 4724.14, 47.89), -- Location of boss menu (If not using target)
            label = '[E] - Access Boss Menu',      -- Text UI label string (If not using target)
            distance = 3.0,                        -- Distance to allow access/prompt with text UI (If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Boss Menu',
                coords = vec3(460.64, -985.64, 30.73),
                heading = 269.85,
                distance = 2.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            }
        },

        armoury = {
            enabled = false,                                                                              -- Set to false if you don't want to use
            coords = vec3(480.32, -996.67, 30.69 - 0.9),                                                 -- Coords of armoury
            heading = 86.95,                                                                             -- Heading of armoury NPC
            ped = 's_f_y_cop_01',                                                                        -- Ped model or false for no ped
            label = '[E] - Access Armoury',                                                              -- String of text ui
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Armoury',
                coords = vec3(480.32, -996.67, 30.69 - 0.9), 
                heading = 24.95,
                distance = 4.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            },
            jobLock = 'police',                                                                          -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            weapons = {
                [0] = {                                                                                  -- Grade number will be the name of each table(this would be grade 0)
                    { name = 'WEAPON_PISTOL',     label = 'Pistol',      multiple = false, price = 75 }, -- Set price to false if undesired
                    { name = 'WEAPON_NIGHTSTICK', label = 'Night Stick', multiple = false, price = 50 },
                    --  { name = 'ammo-9' , label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example

                },
                [1] = { -- This would be grade 1
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [2] = { -- This would be grade 2
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [3] = { -- This would be grade 3
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
            }
        },

        cloakroom = {
            enabled = false,                        -- WILL NOT SHOW IN QBCORE INSTEAD USE QB-CLOTHING CONFIG! Set to false if you don't want to use (Compatible with esx_skin & wasabi fivem-appearance fork)
            jobLock = 'police',                    -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            coords = vec3(462.36, -999.62, 30.69), -- Coords of cloakroom
            label = '[E] - Change Clothes',        -- String of text ui of cloakroom
            range = 2.0,                           -- Range away from coords you can use.
            uniforms = {                           -- Uniform choices
                [1] = {                            -- Order it will display
                    label = 'Patrol',              -- Name of outfit that will display in menu
                    minGrade = 0,                  -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {                       -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 5,  texture = 2 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 6,  texture = 1 }, -- Pants
                            { component = 6,  drawable = 16, texture = 7 }, -- Shoes
                            { component = 3,  drawable = 5,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [2] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [3] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
            }
        },

        -- Personal Locker. Supports inventories: ox_inventory, qb-inventory, and qs-inventory
        --        Custom inventories can easily be added in wasabi_bridge/inventories/
        personalLocker = {
            enabled = false,                       -- Enable personal locker for this station?
            jobLock = 'police',                    -- Job lock?
            coords = vec3(462.64, -995.88, 30.69), -- Area to prompt personal locker
            range = 2.0,                           -- Range it will prompt from coords above
            label = '[E] - Access Personal Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Personal Locker',
                coords = vec3(462.64, -995.88, 30.69),
                heading = 354.94,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        evidenceLocker = {
            enabled = false,                      -- Enable evidence locker for this station?
            jobLock = 'police',                   -- Job lock?
            coords = vec3(472.5, -991.21, 26.27), -- Area to prompt personal locker
            range = 2.0,                          -- Range it will prompt from coords above
            label = '[E] - Access Evidence Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Evidence Locker',
                coords = vec3(472.5, -991.21, 26.27),
                heading = 266.23,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 26.27 - 0.9,
                maxZ = 26.27 + 0.9
            }
        },


        vehicles = {                                   -- Vehicle Garage
            enabled = false,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            jobLock = 'police',                        -- Job lock? or access to all police jobs by using false
            zone = {
                coords = vec3(463.69, -1019.72, 28.1), -- Area to prompt vehicle garage
                range = 5.5,                           -- Range it will prompt from coords above
                label = '[E] - Access Garage',
                return_label = '[E] - Return Vehicle'
            },
            spawn = {
                land = {
                    coords = vec3(449.37, -1025.46, 28.59), -- Coords of where land vehicle spawn/return
                    heading = 3.68
                },
                air = {
                    coords = vec3(449.29, -981.76, 43.69), -- Coords of where air vehicles spawn/return
                    heading = 0.01
                }
            },
            options = {

                [0] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [1] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [2] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [3] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
            }
        }
    },
    SAHP2 = {
        blip = {
            enabled = true,
            coords = vec3(-3142.16, 1388.11, 21.14),
            sprite = 60,
            color = 29,
            scale = 1.0,
            string = 'SAHP'
        },

        clockInAndOut = {
            enabled = true,                        -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for each e.x. offpolice for police offsheriff for sheriff AND have grades for each pd grade - QBCORE REQUIRES NOTHING)
            jobLock = 'police',                    -- This must be set to which job will be utilizing (ESX MUST HAVE OFF DUTY JOB / GRADES FOR THIS - ex. offpolice or offsheriff)
            coords = vec3(-3142.16, 1388.11, 21.14), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = true,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(-3142.16, 1388.11, 21.14),
                heading = 51.76,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 19.02 - 0.9,
                maxZ = 21.99 + 0.9
            }
        },

        bossMenu = {
            enabled = true,                        -- Enable boss menu?
            jobLock = 'police',                    -- Lock to specific police job? Set to false if not desired
            coords = vec3(-3155.30, 1358.48, 20.85), -- Location of boss menu (If not using target)
            label = '[E] - Access Boss Menu',      -- Text UI label string (If not using target)
            distance = 3.0,                        -- Distance to allow access/prompt with text UI (If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Boss Menu',
                coords = vec3(460.64, -985.64, 30.73),
                heading = 269.85,
                distance = 2.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            }
        },

        armoury = {
            enabled = false,                                                                              -- Set to false if you don't want to use
            coords = vec3(480.32, -996.67, 30.69 - 0.9),                                                 -- Coords of armoury
            heading = 86.95,                                                                             -- Heading of armoury NPC
            ped = 's_f_y_cop_01',                                                                        -- Ped model or false for no ped
            label = '[E] - Access Armoury',                                                              -- String of text ui
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Armoury',
                coords = vec3(480.32, -996.67, 30.69 - 0.9), 
                heading = 24.95,
                distance = 4.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            },
            jobLock = 'police',                                                                          -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            weapons = {
                [0] = {                                                                                  -- Grade number will be the name of each table(this would be grade 0)
                    { name = 'WEAPON_PISTOL',     label = 'Pistol',      multiple = false, price = 75 }, -- Set price to false if undesired
                    { name = 'WEAPON_NIGHTSTICK', label = 'Night Stick', multiple = false, price = 50 },
                    --  { name = 'ammo-9' , label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example

                },
                [1] = { -- This would be grade 1
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [2] = { -- This would be grade 2
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [3] = { -- This would be grade 3
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
            }
        },

        cloakroom = {
            enabled = false,                        -- WILL NOT SHOW IN QBCORE INSTEAD USE QB-CLOTHING CONFIG! Set to false if you don't want to use (Compatible with esx_skin & wasabi fivem-appearance fork)
            jobLock = 'police',                    -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            coords = vec3(462.36, -999.62, 30.69), -- Coords of cloakroom
            label = '[E] - Change Clothes',        -- String of text ui of cloakroom
            range = 2.0,                           -- Range away from coords you can use.
            uniforms = {                           -- Uniform choices
                [1] = {                            -- Order it will display
                    label = 'Patrol',              -- Name of outfit that will display in menu
                    minGrade = 0,                  -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {                       -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 5,  texture = 2 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 6,  texture = 1 }, -- Pants
                            { component = 6,  drawable = 16, texture = 7 }, -- Shoes
                            { component = 3,  drawable = 5,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [2] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [3] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
            }
        },

        -- Personal Locker. Supports inventories: ox_inventory, qb-inventory, and qs-inventory
        --        Custom inventories can easily be added in wasabi_bridge/inventories/
        personalLocker = {
            enabled = false,                       -- Enable personal locker for this station?
            jobLock = 'police',                    -- Job lock?
            coords = vec3(462.64, -995.88, 30.69), -- Area to prompt personal locker
            range = 2.0,                           -- Range it will prompt from coords above
            label = '[E] - Access Personal Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Personal Locker',
                coords = vec3(462.64, -995.88, 30.69),
                heading = 354.94,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        evidenceLocker = {
            enabled = false,                      -- Enable evidence locker for this station?
            jobLock = 'police',                   -- Job lock?
            coords = vec3(472.5, -991.21, 26.27), -- Area to prompt personal locker
            range = 2.0,                          -- Range it will prompt from coords above
            label = '[E] - Access Evidence Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Evidence Locker',
                coords = vec3(472.5, -991.21, 26.27),
                heading = 266.23,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 26.27 - 0.9,
                maxZ = 26.27 + 0.9
            }
        },


        vehicles = {                                   -- Vehicle Garage
            enabled = false,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            jobLock = 'police',                        -- Job lock? or access to all police jobs by using false
            zone = {
                coords = vec3(463.69, -1019.72, 28.1), -- Area to prompt vehicle garage
                range = 5.5,                           -- Range it will prompt from coords above
                label = '[E] - Access Garage',
                return_label = '[E] - Return Vehicle'
            },
            spawn = {
                land = {
                    coords = vec3(449.37, -1025.46, 28.59), -- Coords of where land vehicle spawn/return
                    heading = 3.68
                },
                air = {
                    coords = vec3(449.29, -981.76, 43.69), -- Coords of where air vehicles spawn/return
                    heading = 0.01
                }
            },
            options = {

                [0] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [1] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [2] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [3] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
            }
        }
    },
    Rangers = {
        blip = {
            enabled = true,
            coords = vec3(-814.63, 5391.19, 35.91),
            sprite = 60,
            color = 29,
            scale = 1.0,
            string = 'Rangers'
        },

        clockInAndOut = {
            enabled = true,                        -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for each e.x. offpolice for police offsheriff for sheriff AND have grades for each pd grade - QBCORE REQUIRES NOTHING)
            jobLock = 'police',                    -- This must be set to which job will be utilizing (ESX MUST HAVE OFF DUTY JOB / GRADES FOR THIS - ex. offpolice or offsheriff)
            coords = vec3(-814.63, 5391.19, 35.91), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = true,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(-814.63, 5391.19, 35.91),
                heading = 276.89,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 25.02 - 0.9,
                maxZ = 26.99 + 0.9
            }
        },

        bossMenu = {
            enabled = true,                        -- Enable boss menu?
            jobLock = 'police',                    -- Lock to specific police job? Set to false if not desired
            coords = vec3(-797.14, 5398.65, 35.87), -- Location of boss menu (If not using target)
            label = '[E] - Access Boss Menu',      -- Text UI label string (If not using target)
            distance = 3.0,                        -- Distance to allow access/prompt with text UI (If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Boss Menu',
                coords = vec3(460.64, -985.64, 30.73),
                heading = 269.85,
                distance = 2.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            }
        },

        armoury = {
            enabled = false,                                                                              -- Set to false if you don't want to use
            coords = vec3(480.32, -996.67, 30.69 - 0.9),                                                 -- Coords of armoury
            heading = 86.95,                                                                             -- Heading of armoury NPC
            ped = 's_f_y_cop_01',                                                                        -- Ped model or false for no ped
            label = '[E] - Access Armoury',                                                              -- String of text ui
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Armoury',
                coords = vec3(480.32, -996.67, 30.69 - 0.9), 
                heading = 24.95,
                distance = 4.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            },
            jobLock = 'police',                                                                          -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            weapons = {
                [0] = {                                                                                  -- Grade number will be the name of each table(this would be grade 0)
                    { name = 'WEAPON_PISTOL',     label = 'Pistol',      multiple = false, price = 75 }, -- Set price to false if undesired
                    { name = 'WEAPON_NIGHTSTICK', label = 'Night Stick', multiple = false, price = 50 },
                    --  { name = 'ammo-9' , label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example

                },
                [1] = { -- This would be grade 1
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [2] = { -- This would be grade 2
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [3] = { -- This would be grade 3
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
            }
        },

        cloakroom = {
            enabled = false,                        -- WILL NOT SHOW IN QBCORE INSTEAD USE QB-CLOTHING CONFIG! Set to false if you don't want to use (Compatible with esx_skin & wasabi fivem-appearance fork)
            jobLock = 'police',                    -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            coords = vec3(462.36, -999.62, 30.69), -- Coords of cloakroom
            label = '[E] - Change Clothes',        -- String of text ui of cloakroom
            range = 2.0,                           -- Range away from coords you can use.
            uniforms = {                           -- Uniform choices
                [1] = {                            -- Order it will display
                    label = 'Patrol',              -- Name of outfit that will display in menu
                    minGrade = 0,                  -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {                       -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 5,  texture = 2 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 6,  texture = 1 }, -- Pants
                            { component = 6,  drawable = 16, texture = 7 }, -- Shoes
                            { component = 3,  drawable = 5,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [2] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [3] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
            }
        },

        -- Personal Locker. Supports inventories: ox_inventory, qb-inventory, and qs-inventory
        --        Custom inventories can easily be added in wasabi_bridge/inventories/
        personalLocker = {
            enabled = false,                       -- Enable personal locker for this station?
            jobLock = 'police',                    -- Job lock?
            coords = vec3(462.64, -995.88, 30.69), -- Area to prompt personal locker
            range = 2.0,                           -- Range it will prompt from coords above
            label = '[E] - Access Personal Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Personal Locker',
                coords = vec3(462.64, -995.88, 30.69),
                heading = 354.94,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        evidenceLocker = {
            enabled = false,                      -- Enable evidence locker for this station?
            jobLock = 'police',                   -- Job lock?
            coords = vec3(472.5, -991.21, 26.27), -- Area to prompt personal locker
            range = 2.0,                          -- Range it will prompt from coords above
            label = '[E] - Access Evidence Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Evidence Locker',
                coords = vec3(472.5, -991.21, 26.27),
                heading = 266.23,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 26.27 - 0.9,
                maxZ = 26.27 + 0.9
            }
        },


        vehicles = {                                   -- Vehicle Garage
            enabled = false,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            jobLock = 'police',                        -- Job lock? or access to all police jobs by using false
            zone = {
                coords = vec3(463.69, -1019.72, 28.1), -- Area to prompt vehicle garage
                range = 5.5,                           -- Range it will prompt from coords above
                label = '[E] - Access Garage',
                return_label = '[E] - Return Vehicle'
            },
            spawn = {
                land = {
                    coords = vec3(449.37, -1025.46, 28.59), -- Coords of where land vehicle spawn/return
                    heading = 3.68
                },
                air = {
                    coords = vec3(449.29, -981.76, 43.69), -- Coords of where air vehicles spawn/return
                    heading = 0.01
                }
            },
            options = {

                [0] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [1] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [2] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [3] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
            }
        }
    },
    BCSO = {
        blip = {
            enabled = true,
            coords = vec3(1817.81, 3671.94, 34.93),
            sprite = 60,
            color = 29,
            scale = 1.0,
            string = 'BCSO'
        },

        clockInAndOut = {
            enabled = true,                        -- Enable clocking in and out at a set location? (If using ESX you must have a off duty job for each e.x. offpolice for police offsheriff for sheriff AND have grades for each pd grade - QBCORE REQUIRES NOTHING)
            jobLock = 'police',                    -- This must be set to which job will be utilizing (ESX MUST HAVE OFF DUTY JOB / GRADES FOR THIS - ex. offpolice or offsheriff)
            coords = vec3(1817.81, 3671.94, 34.93), -- Location of where to go on and off duty(If not using target)
            label = '[E] - Go On/Off Duty',        -- Text to display(If not using target)
            distance = 3.0,                        -- Distance to display text UI(If not using target)
            target = {
                enabled = true,                   -- If enabled, the location and distance above will be obsolete
                label = 'Go On/Off Duty',
                coords = vec3(1817.81, 3671.94, 34.93),
                heading = 21.15,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 34.02 - 0.9,
                maxZ = 35.99 + 0.9
            }
        },

        bossMenu = {
            enabled = true,                        -- Enable boss menu?
            jobLock = 'police',                    -- Lock to specific police job? Set to false if not desired
            coords = vec3(1824.60, 3689.30, 39.13), -- Location of boss menu (If not using target)
            label = '[E] - Access Boss Menu',      -- Text UI label string (If not using target)
            distance = 3.0,                        -- Distance to allow access/prompt with text UI (If not using target)
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Boss Menu',
                coords = vec3(460.64, -985.64, 30.73),
                heading = 269.85,
                distance = 2.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            }
        },

        armoury = {
            enabled = false,                                                                              -- Set to false if you don't want to use
            coords = vec3(480.32, -996.67, 30.69 - 0.9),                                                 -- Coords of armoury
            heading = 86.95,                                                                             -- Heading of armoury NPC
            ped = 's_f_y_cop_01',                                                                        -- Ped model or false for no ped
            label = '[E] - Access Armoury',                                                              -- String of text ui
            target = {
                enabled = false,                   -- If enabled, the location and distance above will be obsolete
                label = 'Access Armoury',
                coords = vec3(480.32, -996.67, 30.69 - 0.9), 
                heading = 24.95,
                distance = 4.0,
                width = 2.0,
                length = 1.0,
                minZ = 30.73 - 0.9,
                maxZ = 30.73 + 0.9
            },
            jobLock = 'police',                                                                          -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            weapons = {
                [0] = {                                                                                  -- Grade number will be the name of each table(this would be grade 0)
                    { name = 'WEAPON_PISTOL',     label = 'Pistol',      multiple = false, price = 75 }, -- Set price to false if undesired
                    { name = 'WEAPON_NIGHTSTICK', label = 'Night Stick', multiple = false, price = 50 },
                    --  { name = 'ammo-9' , label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example

                },
                [1] = { -- This would be grade 1
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [2] = { -- This would be grade 2
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
                [3] = { -- This would be grade 3
                    { name = 'WEAPON_COMBATPISTOL', label = 'Combat Pistol', multiple = false, price = 150 },
                    { name = 'WEAPON_NIGHTSTICK',   label = 'Night Stick',   multiple = false, price = 50 },
                    { name = 'WEAPON_ASSAULTRIFLE', label = 'Assault Rifle', multiple = false, price = 1100 },
                    --  { name = 'ammo-9', label = '9mm Ammo', multiple = true, price = 10 }, -- Set multiple to true if you want ability to purchase more than one at a time
                    --  { name = ammo-rifle, label = '5.56 Ammo', multiple = true, price = 20 }, -- Example
                    --  { name = 'armour', label = 'Bulletproof Vest', multiple = false, price = 100 }, -- Example
                },
            }
        },

        cloakroom = {
            enabled = false,                        -- WILL NOT SHOW IN QBCORE INSTEAD USE QB-CLOTHING CONFIG! Set to false if you don't want to use (Compatible with esx_skin & wasabi fivem-appearance fork)
            jobLock = 'police',                    -- Allow only one of Config.policeJob listings / Set to false if allow all Config.policeJobs
            coords = vec3(462.36, -999.62, 30.69), -- Coords of cloakroom
            label = '[E] - Change Clothes',        -- String of text ui of cloakroom
            range = 2.0,                           -- Range away from coords you can use.
            uniforms = {                           -- Uniform choices
                [1] = {                            -- Order it will display
                    label = 'Patrol',              -- Name of outfit that will display in menu
                    minGrade = 0,                  -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {                       -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 5,  texture = 2 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 6,  texture = 1 }, -- Pants
                            { component = 6,  drawable = 16, texture = 7 }, -- Shoes
                            { component = 3,  drawable = 5,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [2] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
                [3] = {              -- Order it will display
                    label = 'Chief', -- Name of outfit that will display in menu
                    minGrade = 0,    -- Min grade level that can access? Set to 0 or false for everyone to use
                    male = {         -- Male variation
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 15, texture = 0 }, -- Torso
                            { component = 8,  drawable = 58, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 35, texture = 0 }, -- Pants
                            { component = 6,  drawable = 24, texture = 0 }, -- Shoes
                            { component = 3,  drawable = 15, texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    },
                    female = {
                        clothing = {
                            -- Components / 0: Face 1: Mask 2: Hair 3: Torso 4: Leg 5: Parachute / bag 6: Shoes 7: Accessory 8: Undershirt 9: Kevlar 10: Badge 11: Torso 2
                            -- https://docs.fivem.net/natives/?_0xD4F7B05C
                            { component = 11, drawable = 4,  texture = 0 }, -- Torso
                            { component = 8,  drawable = 15, texture = 0 }, -- Shirt
                            { component = 4,  drawable = 25, texture = 0 }, -- Pants
                            { component = 6,  drawable = 16, texture = 4 }, -- Shoes
                            { component = 3,  drawable = 4,  texture = 0 }, -- Arms
                        },
                        props = {
                            -- Components / 0: Hats 1: Glasses 2: Ears 6: Watches 7: Bracelets
                            -- https://docs.fivem.net/natives/?_0x93376B65A266EB5F

                            --    { component = 0, drawable = 0, texture = 0 }, -- Hats
                        }
                    }
                },
            }
        },

        -- Personal Locker. Supports inventories: ox_inventory, qb-inventory, and qs-inventory
        --        Custom inventories can easily be added in wasabi_bridge/inventories/
        personalLocker = {
            enabled = false,                       -- Enable personal locker for this station?
            jobLock = 'police',                    -- Job lock?
            coords = vec3(462.64, -995.88, 30.69), -- Area to prompt personal locker
            range = 2.0,                           -- Range it will prompt from coords above
            label = '[E] - Access Personal Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Personal Locker',
                coords = vec3(462.64, -995.88, 30.69),
                heading = 354.94,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 30.69 - 0.9,
                maxZ = 30.69 + 0.9
            }
        },

        evidenceLocker = {
            enabled = false,                      -- Enable evidence locker for this station?
            jobLock = 'police',                   -- Job lock?
            coords = vec3(472.5, -991.21, 26.27), -- Area to prompt personal locker
            range = 2.0,                          -- Range it will prompt from coords above
            label = '[E] - Access Evidence Locker',
            target = {
                enabled = false, -- If enabled, the location above will be obsolete
                label = 'Access Evidence Locker',
                coords = vec3(472.5, -991.21, 26.27),
                heading = 266.23,
                distance = 2.5,
                width = 2.0,
                length = 1.0,
                minZ = 26.27 - 0.9,
                maxZ = 26.27 + 0.9
            }
        },


        vehicles = {                                   -- Vehicle Garage
            enabled = false,                            -- Enable? False if you have you're own way for medics to obtain vehicles.
            jobLock = 'police',                        -- Job lock? or access to all police jobs by using false
            zone = {
                coords = vec3(463.69, -1019.72, 28.1), -- Area to prompt vehicle garage
                range = 5.5,                           -- Range it will prompt from coords above
                label = '[E] - Access Garage',
                return_label = '[E] - Return Vehicle'
            },
            spawn = {
                land = {
                    coords = vec3(449.37, -1025.46, 28.59), -- Coords of where land vehicle spawn/return
                    heading = 3.68
                },
                air = {
                    coords = vec3(449.29, -981.76, 43.69), -- Coords of where air vehicles spawn/return
                    heading = 0.01
                }
            },
            options = {

                [0] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [1] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [2] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },

                [3] = {                    -- Job grade as table name
                    ['police'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['police2'] = {        -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Police Cruiser #2',
                        category = 'land', -- Options are 'land' and 'air'
                    },
                    ['polmav'] = {         -- Car/Helicopter/Vehicle Spawn Code/Model Name
                        label = 'Maverick',
                        category = 'air',  -- Options are 'land' and 'air'
                    },
                },
            }
        }
    },
}
