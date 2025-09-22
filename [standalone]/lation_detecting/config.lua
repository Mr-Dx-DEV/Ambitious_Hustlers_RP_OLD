Config = {} -- Do not alter

----------------------------------------------
--        🛠️ Setup the basics below
----------------------------------------------

Config.Setup = {
    -- Use only if needed, directed by support or know what you're doing
    -- Notice: enabling debug features will significantly increase resmon
    -- And should ALWAYS be disabled in production
    -- When debug is enabled you get access to a new command: /simulate
    -- For example: /simulate 1 500 will print results of 500 finds with the level 1 detector
    -- Can be used to test and refine your "chance" settings on each item for each level
    debug = false,
    -- Set your interaction system below
    -- Available options are: 'ox_target', 'qb-target', 'interact', 'textui' & 'custom'
    -- 'custom' needs to be added to client/functions.lua
    interact = 'ox_target',
    -- Set your notification system below
    -- Available options are: 'lation_ui', 'ox_lib', 'esx', 'qb', 'okok', 'sd-notify', 'wasabi_notify' & 'custom'
    -- 'custom' needs to be added to client/functions.lua
    notify = 'ox_lib',
    -- Set your context menu system below
    -- Available options are: 'lation_ui', 'ox_lib' & 'custom'
    menu = 'ox_lib',
    -- Set your alert & input dialog system below
    -- Available options are: 'lation_ui', 'ox_lib' & 'custom'
    dialogs = 'ox_lib',
    -- Do you want to be notified via server console if an update is available?
    -- True if yes, false if no
    version = true,
    -- The below is only used if interact = 'textui'
    -- This will be the key used for interactions, default is E
    -- More options here: https://docs.fivem.net/docs/game-references/controls/
    control = 38,
    -- The command used to open the metal detecting statistics menu
    command = 'metaldetecting'
}

----------------------------------------------
--     ⚙️ Setup your detecting options
----------------------------------------------

Config.Detecting = {
    -- Do you want to require the player have a specific job for metal detecting?
    -- If so then set require = true and set the job to the job name
    job = { require = false, job = 'metal_detector' },
    -- Do you want to verify the players level when they "use" a detector?
    -- If true this will ensure the player is the level required (or higher)
    -- For the specific metal detecting model they used. If false it will
    -- Allow them to use any metal detector, ignoring their level
    verify_level = true,
    -- Do you want to allow the player to run while metal detecting?
    running = false,
    -- By default the script only allows detecting on certain soil type(s)
    -- You can add or remove more soil types as you wish below in soil_types
    -- To get the soil type, enable the debug option in Config.Setup and go
    -- Detecting on any soil and it'll print the soil type in F8 client console
    soil_check = true,
    -- The type(s) of soil that allow metal detecting if soil_check is true
    -- Want to metal detect on any soil type? Set soil_check to false above
    soil_type = {
        [-1595148316] = true, -- Sand/beach
    },
    -- Create specific zones/areas in which a player cannot metal detect
    -- Even if that area has the approved soil type or not
    restricted_areas = {
        [1] = { coords = vec3(0, 0, 0), radius = 20 },
        -- Add more restricted zones following the same format as above
        -- Be sure to increment the number, [2], [3], etc
    },
    -- If you do not want to allow players to metal detect everywhere and/or
    -- Anywhere the soil type matches the soil_type list, you can set enabled to true
    -- And players will only be able to metal detect in these designed areas
    designated_areas = {
        enabled = false,
        areas = {
            [1] = { coords = vec3(0, 0, 0), radius = 50 },
            -- Add more designated areas following the same format as above
            -- Be sure to increment the number, [2], [3], etc
        }
    },
    -- Got pesky players? Ban them from the activity altogether!
    -- Simply add their identifier to the list like the example below
    -- ESX: use default identifier: char1:abcdefghijklmnopqrstuv123456789
    -- QBCore: use citizen ID: ABC12345
    bans = {
        ['identifier'] = true,
        -- Add player banned players here following the format above
    },
    -- When a player starts metal detecting, the controls (keys) below
    -- Will be disabled until they are done metal detecting
    disable = {
        200, -- ESC
        22, -- Spacebar
        24, -- Left click / attack
        140, -- R / attack
        36, -- Left CTRL / duck
        44, -- Q / cover
        -- Add or remove as needed or desired
    },
    -- The amount of XP required to reach each level
    -- [level] = experience
    -- Currently, 5 is the maximum level and cannot be increased
    levels = {
        [1] = 0,
        [2] = 12500,
        [3] = 25000,
        [4] = 50000,
        [5] = 100000
    },
    -- Customize sound related settings
    sound = {
        -- Do you want to play audio during metal detecting?
        enable = true,
        -- If enabled, this is the audio that is used
        audio = { bank = 'DLC_HEIST_HACKING_SNAKE_SOUNDS', name = 'Beep_Red' }
    }
}

----------------------------------------------
--          🛒 Setup your shops
----------------------------------------------

Config.Shops = {
    detectors = {
        -- You can disable this shop by setting to false
        enabled = true,
        -- The ped model used for the shopkeeper
        ped = 'a_m_y_beach_02',
        -- The location this shop exists at
        coords = vec4(-1234.3484, -1476.9872, 3.3116, 79.8191),
        -- The account used to purchase detectors ('cash' or 'bank')
        account = 'cash',
        -- Customize the blip settings below
        blip = {
            enabled = true, -- Enable or disable this blip
            sprite = 103, -- Blip sprite ID (https://docs.fivem.net/docs/game-references/blips/)
            color = 0, -- Blip color (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
            scale = 0.8, -- Size of blip
            label = 'Metal Detectors' -- Label
        }
    },
    sellShop = {
        -- You can disable this shop by setting to false
        enabled = true,
        -- The ped model used for the shopkeeper
        ped = 'a_m_o_genstreet_01',
        -- The location this shop exists at
        coords = vec4(412.6790, 314.3495, 102.0208, 207.4230),
        -- The account used at this shop ('cash' or 'bank')
        -- The money the player receives when selling items
        -- And the money used when purchasing shovel (if enabled)
        account = 'cash',
        -- An option to "Sell All", to make it easy instead of selling each item individually
        -- However, if you wish to disable the "Sell All" option, just set sellAll to false
        sellAll = true,
        -- The items that can be sold here & the price
        -- Don't want an item to be sold at the shop? Remove it from the list below
        items = {
            ['md_bottlecap'] = 5,
            ['md_brokenjunk'] = 5,
            ['md_crushedcan'] = 5,
            ['md_lighter'] = 5,
            ['md_metalcan'] = 5,
            ['md_nails'] = 10,
            ['md_needle'] = 10,
            ['md_nut'] = 10,
            ['md_oldshotgunshell'] = 10,
            ['md_paperclip'] = 10,
            ['md_pulltab'] = 15,
            ['md_rustyball'] = 15,
            ['md_rustyironball'] = 15,
            ['md_rustyjunk'] = 15,
            ['md_rustynails'] = 15,
            ['md_rustypliers'] = 20,
            ['md_rustyring'] = 20,
            ['md_rustyscissors'] = 20,
            ['md_rustyscrewdriver'] = 20,
            ['md_rustyspring'] = 30,
            ['md_screw'] = 30,
            ['md_wheatpenny'] = 30,
            ['md_nickle'] = 40,
            ['md_silverdime'] = 40,
            ['md_quarter'] = 50,
            ['md_halfdollar'] = 75,
            ['md_blackwatch'] = 125,
            ['md_coppernugget'] = 150,
            ['md_ironnugget'] = 175,
            ['md_earpod'] = 200,
            ['md_relicrevolver'] = 250,
            ['md_silverearings'] = 500,
            ['md_silverring'] = 500,
            ['md_silverounce'] = 750,
            ['md_ancientcoin'] = 1000,
            ['md_golddollar'] = 1250,
            ['md_goldearings'] = 1500,
            ['md_goldnecklace'] = 1750,
            ['md_goldnugget'] = 2000,
            ['md_goldounce'] = 2250,
            ['md_goldring'] = 2500,
            ['md_diamondearings'] = 3000,
            ['md_diamondnecklace'] = 3250,
            ['md_diamondring'] = 3500,
            ['md_platinumnugget'] = 4000,
            ['md_presidentialwatch'] = 5000
        },
        blip = {
            enabled = true,
            sprite = 207,
            color = 2,
            scale = 0.8,
            label = 'Detectors Sell Shop'
        }
    }
}

----------------------------------------------
--       🔎 Setup metal detectors
----------------------------------------------

Config.Detectors = {
    [1] = { -- Level required to purchase this detector
        requiredXP = 0, -- The XP required to reach this level
        price = 2750, -- How much this metal detector costs in shop
        prop = 'blue_metaldetector', -- Prop
        item = 'blue_metaldetector', -- Item name
        radius = 15, -- How far it can detect items
        cooldown = math.random(10000, 20000), -- How often an item can be found
        loot = { -- All loot available with this detector
            -- ['item']: Item name of possible loot with this detector
            -- chance: The percentage chance to find this item
            -- quantity min/max: The quantity of this item to reward
            -- addXP: How much XP is rewarded for finding this item
            ['md_bottlecap'] = {chance = 60, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_brokenjunk'] = {chance = 60, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_crushedcan'] = {chance = 60, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_lighter'] = {chance = 55, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_metalcan'] = {chance = 55, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_nails'] = {chance = 55, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_needle'] = {chance = 55, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_nut'] = {chance = 55, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_oldshotgunshell'] = {chance = 55, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_paperclip'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_pulltab'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_rustyball'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_rustyironball'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_rustyjunk'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_rustynails'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_rustypliers'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_rustyring'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_rustyscissors'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_rustyscrewdriver'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_rustyspring'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_screw'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_wheatpenny'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 100},
            ['md_nickle'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 100},
            ['md_silverdime'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 125},
            ['md_quarter'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 150},
            ['md_halfdollar'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 200},
            ['md_blackwatch'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 250},
            ['md_coppernugget'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 300},
            ['md_ironnugget'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 300},
            ['md_earpod'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 400},
            ['md_relicrevolver'] = {chance = 5, quantity = { min = 1, max = 1 }, addXP = 450},
            ['md_silverearings'] = {chance = 4, quantity = { min = 1, max = 1 }, addXP = 500},
            ['md_silverring'] = {chance = 4, quantity = { min = 1, max = 1 }, addXP = 500},
            ['md_silverounce'] = {chance = 4, quantity = { min = 1, max = 1 }, addXP = 500},
            ['md_ancientcoin'] = {chance = 3, quantity = { min = 1, max = 1 }, addXP = 600},
            ['md_golddollar'] = {chance = 3, quantity = { min = 1, max = 1 }, addXP = 600},
            ['md_goldearings'] = {chance = 2, quantity = { min = 1, max = 1 }, addXP = 750},
            ['md_goldnecklace'] = {chance = 2, quantity = { min = 1, max = 1 }, addXP = 750},
            ['md_goldnugget'] = {chance = 2, quantity = { min = 1, max = 1 }, addXP = 750},
            ['md_goldounce'] = {chance = 2, quantity = { min = 1, max = 1 }, addXP = 750},
            ['md_goldring'] = {chance = 2, quantity = { min = 1, max = 1 }, addXP = 750},
            ['md_diamondearings'] = {chance = 1, quantity = { min = 1, max = 1 }, addXP = 1200},
            ['md_diamondnecklace'] = {chance = 1, quantity = { min = 1, max = 1 }, addXP = 1200},
            ['md_diamondring'] = {chance = 1, quantity = { min = 1, max = 1 }, addXP = 1200},
            ['md_platinumnugget'] = {chance = 1, quantity = { min = 1, max = 1 }, addXP = 1200},
            ['md_presidentialwatch'] = {chance = 1, quantity = { min = 1, max = 1 }, addXP = 1200}
        }
    },
    [2] = { -- Level 2
        requiredXP = 12500,
        price = 5250,
        prop = 'green_metaldetector',
        item = 'green_metaldetector',
        radius = 25,
        cooldown = math.random(15000, 30000),
        loot = {
            ['md_bottlecap'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_brokenjunk'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_crushedcan'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_lighter'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_metalcan'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_nails'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_needle'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_nut'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_oldshotgunshell'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_paperclip'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_pulltab'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_rustyball'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_rustyironball'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_rustyjunk'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_rustynails'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_rustypliers'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_rustyring'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_rustyscissors'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_rustyscrewdriver'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_rustyspring'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_screw'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_wheatpenny'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_nickle'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_silverdime'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_quarter'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_halfdollar'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_blackwatch'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_coppernugget'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 55},
            ['md_ironnugget'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 55},
            ['md_earpod'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 55},
            ['md_relicrevolver'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 60},
            ['md_silverearings'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_silverring'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_silverounce'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 100},
            ['md_ancientcoin'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 100},
            ['md_golddollar'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 200},
            ['md_goldearings'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 200},
            ['md_goldnecklace'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 300},
            ['md_goldnugget'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 300},
            ['md_goldounce'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 300},
            ['md_goldring'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 300},
            ['md_diamondearings'] = {chance = 5, quantity = { min = 1, max = 1 }, addXP = 400},
            ['md_diamondnecklace'] = {chance = 5, quantity = { min = 1, max = 1 }, addXP = 400},
            ['md_diamondring'] = {chance = 5, quantity = { min = 1, max = 1 }, addXP = 400},
            ['md_platinumnugget'] = {chance = 3, quantity = { min = 1, max = 1 }, addXP = 480},
            ['md_presidentialwatch'] = {chance = 1, quantity = { min = 1, max = 1 }, addXP = 600}
        }
    },
    [3] = { -- Level 3
        requiredXP = 25000,
        price = 8825,
        prop = 'red_metaldetector',
        item = 'red_metaldetector',
        radius = 35,
        cooldown = math.random(20000, 40000),
        loot = {
            ['md_bottlecap'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 10},
            ['md_brokenjunk'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 10},
            ['md_crushedcan'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 10},
            ['md_lighter'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_metalcan'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_nails'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_needle'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_nut'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_oldshotgunshell'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_paperclip'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 30},
            ['md_pulltab'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 30},
            ['md_rustyball'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 30},
            ['md_rustyironball'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_rustyjunk'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_rustynails'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_rustypliers'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_rustyring'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_rustyscissors'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_rustyscrewdriver'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_rustyspring'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_screw'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_wheatpenny'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_nickle'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_silverdime'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_quarter'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_halfdollar'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_blackwatch'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_coppernugget'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_ironnugget'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_earpod'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 45},
            ['md_relicrevolver'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_silverearings'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_silverring'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_silverounce'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 55},
            ['md_ancientcoin'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 55},
            ['md_golddollar'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 65},
            ['md_goldearings'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 65},
            ['md_goldnecklace'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 65},
            ['md_goldnugget'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_goldounce'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_goldring'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_diamondearings'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 100},
            ['md_diamondnecklace'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 100},
            ['md_diamondring'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 100},
            ['md_platinumnugget'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 200},
            ['md_presidentialwatch'] = {chance = 5, quantity = { min = 1, max = 1 }, addXP = 300}
        }
    },
    [4] = { -- Level 4
        requiredXP = 50000,
        price = 13250,
        prop = 'orange_metaldetector',
        item = 'orange_metaldetector',
        radius = 45,
        cooldown = math.random(25000, 50000),
        loot = {
            ['md_bottlecap'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_brokenjunk'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_crushedcan'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_lighter'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_metalcan'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_nails'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_needle'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_nut'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_oldshotgunshell'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_paperclip'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 10},
            ['md_pulltab'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 10},
            ['md_rustyball'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 10},
            ['md_rustyironball'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_rustyjunk'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_rustynails'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_rustypliers'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_rustyring'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_rustyscissors'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_rustyscrewdriver'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_rustyspring'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_screw'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_wheatpenny'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_nickle'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_silverdime'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_quarter'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_halfdollar'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_blackwatch'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_coppernugget'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 30},
            ['md_ironnugget'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 30},
            ['md_earpod'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 30},
            ['md_relicrevolver'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 30},
            ['md_silverearings'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_silverring'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_silverounce'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_ancientcoin'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_golddollar'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 55},
            ['md_goldearings'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 55},
            ['md_goldnecklace'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 55},
            ['md_goldnugget'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 65},
            ['md_goldounce'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 65},
            ['md_goldring'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 65},
            ['md_diamondearings'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_diamondnecklace'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_diamondring'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 75},
            ['md_platinumnugget'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 100},
            ['md_presidentialwatch'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 150}
        }
    },
    [5] = { -- Level 5
        requiredXP = 100000,
        price = 19575,
        prop = 'black_metaldetector',
        item = 'black_metaldetector',
        radius = 60,
        cooldown = math.random(30000, 60000),
        loot = {
            ['md_bottlecap'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 2},
            ['md_brokenjunk'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 2},
            ['md_crushedcan'] = {chance = 10, quantity = { min = 1, max = 1 }, addXP = 2},
            ['md_lighter'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 3},
            ['md_metalcan'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 3},
            ['md_nails'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 3},
            ['md_needle'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 4},
            ['md_nut'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 4},
            ['md_oldshotgunshell'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 4},
            ['md_paperclip'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_pulltab'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_rustyball'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 5},
            ['md_rustyironball'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 6},
            ['md_rustyjunk'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 6},
            ['md_rustynails'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 6},
            ['md_rustypliers'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 7},
            ['md_rustyring'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 7},
            ['md_rustyscissors'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 7},
            ['md_rustyscrewdriver'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 8},
            ['md_rustyspring'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 8},
            ['md_screw'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 8},
            ['md_wheatpenny'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 9},
            ['md_nickle'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 9},
            ['md_silverdime'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 9},
            ['md_quarter'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 10},
            ['md_halfdollar'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 10},
            ['md_blackwatch'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 10},
            ['md_coppernugget'] = {chance = 55, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_ironnugget'] = {chance = 55, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_earpod'] = {chance = 55, quantity = { min = 1, max = 1 }, addXP = 15},
            ['md_relicrevolver'] = {chance = 50, quantity = { min = 1, max = 1 }, addXP = 20},
            ['md_silverearings'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_silverring'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_silverounce'] = {chance = 45, quantity = { min = 1, max = 1 }, addXP = 25},
            ['md_ancientcoin'] = {chance = 40, quantity = { min = 1, max = 1 }, addXP = 30},
            ['md_golddollar'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_goldearings'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_goldnecklace'] = {chance = 35, quantity = { min = 1, max = 1 }, addXP = 35},
            ['md_goldnugget'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_goldounce'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_goldring'] = {chance = 30, quantity = { min = 1, max = 1 }, addXP = 40},
            ['md_diamondearings'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_diamondnecklace'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_diamondring'] = {chance = 25, quantity = { min = 1, max = 1 }, addXP = 50},
            ['md_platinumnugget'] = {chance = 20, quantity = { min = 1, max = 1 }, addXP = 60},
            ['md_presidentialwatch'] = {chance = 15, quantity = { min = 1, max = 1 }, addXP = 75}
        }
    }
}

----------------------------------------------
--     🤷‍♂️ Miscellaneous shovel options
----------------------------------------------

Config.Shovel = {
    -- The item name of the shovel
    item = 'md_shovel',
    -- Do you want to offer this shovel for sale in one of the shops?
    -- If so, set addToShop to: 'sellShop' or 'detectors'
    -- If you don't want it to be sold, set addToShop to nil or false
    addToShop = 'sellShop',
    -- How much the shovel costs if purchasable from a shop above
    price = 250,
    -- Do you want to require a shovel to dig when metal detecting?
    required = true,
}

----------------------------------------------
--    💃 Customize animations and props
----------------------------------------------

Config.Animations = {
    detecting = {
        anim = { dict = 'mini@golfai', clip = 'wood_idle_a' },
        prop = { pos = vec3(0.849, 0.050, 0.059), rot = vec3(-176.460, 86.093, 5.054) }
    },
    shovel = {
        duration = 7250,
        anim = { dict = 'random@burial', clip = 'a_burial' },
        prop = { model = 'prop_tool_shovel', pos = vec3(0.0, 0.0, 0.240), rot = vec3(0.0, 0.0, 0.0) }
    }
}