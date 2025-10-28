Config = Config or {}

Config.Crafting = {
    enable = false,                  -- Set to true to enable item crafting features

    Stores = true, 				    -- Set true to turn on shop store features

    craftCam = true,                -- Enable this to have custom camera angles when modifying/crafting
                                    -- Disable this to not use any custom cameras
                                    -- This is more general than just crafting

    StashCraft = true,  		    -- When crafting, use the mechanics stashes to craft


    MultiCraft = true,              -- Enable this to allow players to craft more than of an item at once

    showItemBox = true,				-- toggle itemBox for adding/removing items, helpful if using a inventory with them forced on already

    SingleProgress = false,          -- If crafting multiple items, this will make it into 1 long progressbar
}

Config.PlateChange = {
    UseItem = true,                 -- Can the users change plates with an item
    ItemToUse = "newplate",         -- The name of the item to allow changes

    ItemRequiresJob = true,         -- Only allow set jobs to change plates
    ItemJobRestrictions = {         -- List of job roles that can change plates (if enabled)
        "mechanic",
        "kittys",
    },
    CommandRequiresJob = true,      -- Only allow set jobs to change plates with a command
    CommandJobRestrictions = {      -- List of job roles that can change plates (if enabled)
        "mechanic",
        "kittys",
    },
    UseCommand = true,              -- Set "true" if you want to use "/" commands.
    Command = "setplate",           -- the command to be used (if enabled)

    Filter = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ", 	-- Allowed letters/numbers. Symbols don't work
                                                        -- Don't touch unless you want to limit certain letters

    BlacklistPhrases = {            -- Blaclist phrases for plates
        "JIMATHY",
    },
}

Config.Harness = {
    HarnessControl = true,			-- Enable harness AND seatbelt features of the script, requires edits to smallresources and hud scripts
                                    -- Disable to
    JobOnly = true,					-- Only allow job roles to add a Harness to vehicle, otherwise any one can add them

    oldPreventLeave = true,         -- If this is enabled, then disable the F button from being used while in a car
                                    -- If disabled, check for if the player is leaving the car and put them back in
                                        -- old system is more of a client strain, but more effective
                                        -- new system is less strain, but looks less pretty


    seatbeltEasyLeave = true,		-- if true players can exit vehicle before removing SEATBELT
    harnessEasyLeave = true,		-- if true players can exit vehicles before removing HARNESS

    progOn = true,					-- if true add a progressBar to buckle harness
    progOff = true,					-- if true add a progressBar to unbuckle harness

    seatbeltNotify = false,			-- if true, show a notification when seatbelt is put on or off

    timeOn = 3000,					-- Time for the progress bar to put on harness
    timeOff = 2000,					-- Time for the progress bar to put on harness

    disableCrashEjection = false,    -- If true, disable crash ejection

    minimumSpeed = 22.5,			-- Minimum speed for crash logic to be triggered - Default: 20.0 (50 mph)
    minimumSeatBeltSpeed = 45.0, 	-- Minimuim speed for ejecting with a seatbelt attached Default: 160.0 (100 mph)
    minimumDamage = 15.0, 			-- Minimum body damage for ejecting a player (default 15 = .15%)

    harnessEjection = false,        -- Set this to true to allow ejection with a harness on
    harnessSpeed = 67.5,            -- Minimum speed to eject with harness on Default: 200.0 (150 mph)

    crashKill = false,				-- Set to true if you want ejecting when crashing to kill/injure

    AltEjection = true,			    -- Enabling this may make some varibles above not be used
                                    -- Attempts to use in game engine logic for crashes and its more optimizied
                                    -- If any issues just disable this

    seatbeltSounds = true,          -- Disable seatbelt and harness sounds

}

Config.vehFailure = {
    -- Enabling these will make allow you to no longer need qb-vehiclefailure/qb-mechanicjob
    -- ONLY ENABLE IF NOT USING VEHICLEFAILURE OR ANOTHER SCRIPT TO REPLACE THESE FEATURES

    repairKits = true,				    -- Takes control of repairkit and advancedrepairkit
    fixCommand = true,				    -- takes control of /fix command
    PreventRoll = false,			    -- takes control of preventing rolling your car back over when upside down

    extraDamage = {
        enable = true,
        randomDamageRange = { min = 160, max = 320 },  -- Smaller values → higher damage (randomize the damage given)
        engineDamageMultiplier = 2,                   -- Multiplier for engine damage based on crash damage
        bodyDamageMultiplier = 3,                     -- Multiplier for body damage based on crash damage
    },

    damageLimits = {        -- These are specifically set, only change them if you need to
        petrolTank = 750.0,			        -- Prevents tankHealth ever going below this, if it does the car is undriveable
        engine = 150.0,				        -- Prevents engine Damage ever going below | default 15%
        engineUndriveable = true,	        -- If engine is at the below level, make it undriveable
        body = 100.0,				        -- Prevent body damage going below 10%
    }
}

Config.CarLifts = {
    enable = true,					-- Disable this if using a different carlift script
    Sound = true,					-- Enable/Disable carlift movement noises
    CarLiftModelReplace = {			-- if Enable is true, this table will be used to replace previous models that are in the way of set locations
        `tr_prop_tr_car_lift_01a`,
        `v_45_carlift`,
        `v_71_carlift`,
        `imp_prop_impexp_carrack`,
        `imp_prop_impexp_postlift`,
        `imp_prop_impexp_postlift_up`,
        `denis3d_carlift_03`,
        `denis3d_carlift_02`,
        `denis3d_carlift_01`,
        `gabz_bennys_prop_carlift_03`,
        `gabz_bennys_prop_carlift_02`,
        `gabz_bennys_prop_carlift_01`,
        `rfc_los_santos_customs_lift`,
        `rfc_los_santos_customs_lift2`,
        `rfc_los_santos_customs_lift3`
    },
}

Config.Repairs = {	--Repair Related
    FreeRepair = false,  		-- Are repairs going to be free? True means yes
    StashRepair = true, 		-- Enable so repair materials to be removed from a job stash (disabled if RequiresJob = false)

    ExtraDamages = true,		-- When enabled, it will use the built in extra damage systems (Like qb-mechanicjobs functions)
                                -- If disabled it will only be engine and body damage to repair

    EffectLevels = {			-- What percentage level the extra damage parts need to be below before the effects kick in when crashing
        oil = 35,
        axle = 30,
        spark = 40,
        battery = 40,
        fuel = 30,
    },

    DamagePercentages = {
        -- These are for the extra damages included with jim-mechanic
        -- They allow to increase or decrease the damage per hit per item

        oil     = 0,    -- 0% change (no extra damage)
        axle    = 20,   -- 20% extra damage
        battery = -20,  -- 20% less damage
        spark   = 10,   -- 10% extra damage
        fuel    = 0     -- no change
    },

    --Vehicle Part Repair Costs
    Parts = {  --- Part repair item and its MAX cost
        ["engine"] 		= { { part = "steel", cost = 1 }, { part = "iron", cost = 1 }, }, -- Example of multiple materials being used
        ["body"] 		= { part = "plastic", cost = 1  },
        ["oil"] 		= { part = "newoil", 	cost = 1 },
        ["axle"] 		= { part = "axleparts", cost = 1 },
        ["spark"] 		= { part = "sparkplugs", cost = 1 },
        ["battery"] 	= { part = "carbattery", cost = 1 },
        ["fuel"] 		= { part = "steel", cost = 1 },
        ["wheels"] 		= { part = "sparetire" }, -- Has no cost, 1 per damaged wheel
    },

    RepairWheelsWithEngine = false,		-- When repairing the vehicles engine, wheels will be repaired
    RepairWheelsWithBody = false,		-- When repairing the vehicles body, wheels will be repaired
}

Config.Previews = {
    PreviewPhone = false, 		-- Enable this is preview menu generates an email, False if you want to give an item
    PreviewJob = true, 			-- Enable this if you want /preview to require a Job Role
    PreviewLocation = true, 	-- Enable this if you want to lock /preview to a job location (ignored if LocationRequired is false)

    PhoneItems = {
        -- list of phones/items that are needed to get emails.
        -- Some phone scripts use more items than "phone"
        -- IF you don't have any you will get a clipboard with the list on instead
        "phone",
        "classic_phone",
        "black_phone",
        "blue_phone",
        "gold_phone",
        "red_phone",
        "green_phone",
        "greenlight_phone",
        "pink_phone",
        "white_phone"
    },

    oldOxLibMenu = true,		-- Set to true to use normal ox_lib menus
                                -- Setting to false will use keyboard controlled ox_lib menus but this isn't recommended
}

Config.antiLag = {
    antiLagDis = 30.0,			-- Max distance players can hear antiLag explosions
    maxAudio = 0.4,				-- This is adjusted by distance to enchance the effect, this is the max volume

    coolDownReset = 30,         -- This is the timer for how often antilag can be triggered on a vehicle
                                -- Setting this higher increase the delay between it being triggered
}

Config.NOS = {
    enable = true,				-- Disable this if you wish to use a separate script to handle all nitrous related things

    JobOnly = false,			-- Only allow job roles to add NOS to vehicles

    NosRefillCharge = 1000, 	-- amount in cash required to refill a nos can

    NosBoostPower = { 			-- NOS boost acceleration power
        20.0, -- Level 1
        35.0, -- Level 2
        50.0, -- Level 3
    },

    nosNotifications = false,   -- Set to true if you want notifications for changing purge strength or boost power

    useExternalHud = false,     -- If this is true it will use a helper function to show nos on other huds
                                -- If false, you only need to use the built in speedometer

    useExternalHudForNos = true,    -- Enables nos showing in external huds (add the functions for yours in Helper.updateHudNitrous)

    NitrousUseRate = 0.4, 		-- How fast the nitrous drains (halved for level1, doubled for level3)
                                -- 0.4 seems reasonable for a standard setting

    NitrousCoolDown = 7, 		-- 7 Seconds for nitrous cooldown, set to 0 to disable
    CooldownConfirm = true, 	-- Will play a confirmation beep when cooldown is done

    nosDamage = true, 			-- This enables NOS causing damage to engine while boosting
                                -- it will incrementally damage the engine from "overheating"

    boostExplode = true, 		-- If boosting too long at level 3 boost, tank will explode.

    -- Effects
    EnableFlame = true, 		-- True adds exhaut flame effects while boosting

    EnableTrails = true, 		-- True adds taillight effects while boosting

    EnableScreen = true, 		-- True adds screen effects while boosting

    explosiveFail = true, 		-- Better not fail that skill check. (1 in 10 chance of explosion)
    explosiveFailJob = true, 	-- if true, mechanics can trigger an explosion on failure to add nos
                                -- if false, mechanics will never trigger an explosion

    HandlingChange = false,		-- Changes handling during nos boost, Disable this if affecting other scripts (recommended off)
}

Config.DuctTape = {
    DuctSimpleMode = true, 		-- This will repair the engine to the max amount (set below)
                                -- false will add the DuctAmount* on per use until it reaches the max amount

    MaxDuctEngine = 450.0, 		-- 450.0 is 45% health, this will be the max amount that it can be repaired to
    DuctAmountEngine = 100.0, 	-- Repairs the engine by 10% each use

    DuctTapeBody = true,  		--Enable if you want duct tape to repair body at the same time as engine
    MaxDuctBody = 450.0,
    DuctAmountBody = 100.0, 	-- Repairs the engine by 10% each use

    RemoveDuctTape = true, 		--If Enabled it will remove 1 duct after use. If false it will be constantly reusable
}

Config.Stancer = {
    enable = true,				-- Enable or disable Stancerkits
    HandlingChange = false,		-- Enable or disable handling changes (may help with other scripts that change similar things)

    stancerTable = {
        [1] = { space = 0.02, camber = 0.05, width = 0.05, size = 0.02 },
        [2] = { space = 0.04, camber = 0.08, width = 0.1, size = 0.05 },
        [3] = { space = 0.06, camber = 0.11, width = 0.15, size = 0.08 },
        --[4] = { space = 0.08, camber = 0.14, width = 0.20, size = 0.11 },
        --[5] = { space = 0.10, camber = 0.17, width = 0.25, size = 0.14 },
    }
}

Config.VehiclePush = {
    enable = true,                      -- Enable vehicle pushing system

    useTarget = true,                   -- Enable vehicle model targets
    useCommand = true,                  -- Enable /pushvehicle command

    engineNeedsToBeUnderLimit = false,  -- Enable this to only allow if a vehicles engine is damaged enough
    fuelNeedToBeUnderLimit = false,     -- Enable this to only allow if the fuel level is low enough

    classBlackList = {                  -- Black list of vehicles that can or can't be pushed
        --    0, --Compacts
        --    1, --Sedans
        --    2, --SUVs
        --    3, --Coupes
        --    4, --Muscle
        --    5, --Sports Classics
        --    6, --Sports
        --    7, --Super
        --    8, --Motorcycles
        --    9, --Off-road
        --    10, --Industrial
        --    11, --Utility
        --    12, --Vans
            13, --Cycles
            14, --Boats
            15, --Helicopters
            16, --Planes
        --    17, --Service
        --    18, --Emergency
        --    19, --Military
        --    20, --Commercial
            21, --Trains
        --    22, --Open Wheel
    }

}