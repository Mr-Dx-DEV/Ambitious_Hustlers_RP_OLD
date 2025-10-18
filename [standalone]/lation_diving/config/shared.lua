return {

    -- ⚠️ WARNING: When you are working with this script, never do "restart lation_diving"
    -- ⚠️ This will cause issues, data loss & more! You must restart the script like this:
    -- ⚠️ "stop lation_diving" ..wait a couple seconds.. then "ensure lation_diving"

    ----------------------------------------------
    --        🛠️ Setup the basics below
    ----------------------------------------------

    setup = {
        -- Use only if needed, directed by support or know what you're doing
        -- Notice: enabling debug features will significantly increase resmon
        -- And should always be disabled in production
        debug = false,
        -- Set your interaction system below
        -- Available options are: 'ox_target', 'qb-target', 'interact' & 'custom'
        -- 'custom' needs to be added to client/functions.lua
        -- We also provide support for various textUI: ox_lib, jg-textui, okokTextUI & qbcore
        -- Go to client/functions.lua line 3 to choose which textUI to use
        interact = 'ox_target',
        -- Set your notification system below
        -- Available options are: 'lation_ui', 'ox_lib', 'esx', 'qb', 'okok', 'sd-notify', 'wasabi_notify' & 'custom'
        -- 'custom' needs to be added to client/functions.lua
        notify = 'ox_lib',
        -- Set your progress bar system below
        -- Available options are: 'lation_ui', 'ox_lib', 'qbcore' & 'custom'
        -- 'custom' needs to be added to client/functions.lua
        -- Any custom progress bar must also support animations
        progress = 'ox_lib',
        -- Set your context menu system below
        -- Available options are: 'lation_ui', 'ox_lib' & 'custom'
        menu = 'ox_lib',
        -- Set your alert & input dialog system below
        -- Available options are: 'lation_ui', 'ox_lib' & 'custom'
        dialogs = 'ox_lib',
        -- Do you want to hide player names in the group menu?
        -- If true, names will instead be replaced with their Player IDs
        -- If false it will display their character names as normal
        hideNames = false,
        -- Do you want to be notified via server console if an update is available?
        -- True if yes, false if no
        version = true,
        -- You have the option to set a job requirement to Scuba Dive if you wish
        -- Just change the false below to your job name, e.g. job = 'job_name'
        job = false,
        -- When a player is diving, they can see their current depth underwater.
        -- Do you want to show this depth in meters or feet?
        -- If meteres, set metric to true. If feet, set metric to false.
        metric = false,
        -- ⚠️ WARNING: Do not alter the number below unless directed by support
        -- ⚠️ And/or understand what you are doing - "SetPedMaxTimeUnderWater" value
        max = 1800.0
    },

    ----------------------------------------------
    --       📍 Activity start settings
    ----------------------------------------------

    start = {
        -- Where to spawn the main ped to start diving
        -- If you wish to disable the starting ped, set coords = false
        coords = vec4(-289.3029, -2770.0029, 2.1953, 48.9145),
        -- The ped model used
        -- More models: https://docs.fivem.net/docs/game-references/ped-models/
        model = 's_m_y_shop_mask',
        -- The scenario assigned to the ped (or scenario = false for no scenario)
        -- More scenarios: https://github.com/DioneB/gtav-scenarios
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        -- You can limit the hours at which the ped is available here
        -- By default, this ped is available 24/7
        -- Min is the earliest the ped is available (in 24hr format)
        -- Max is the latest the ped is available (in 24hr format)
        -- For example, if you want the ped only available during daytime set min = 6 & max = 21
        hours = { min = 0, max = 24 },
        -- When a group owner selects "Start Diving", this is how long it takes
        -- (in seconds) to receive an assigned location on the map.
        cooldown = { min = 15, max = 30 },
        -- When a diving job is completed, do you want to display the "Continue Diving?"
        -- Dialog to the group owner? True if yes, false if no
        continue = true,
    },

    ----------------------------------------------
    --       📈 Customize the XP system
    ----------------------------------------------

    experience = {
        -- The number in these [brackets] are the level
        -- The number after = is the exp required to reach that level
        -- Be sure levels *always* start at level 1 with 0 exp
        [1] = 0,
        [2] = 2500,
        [3] = 10000,
        [4] = 20000,
        [5] = 50000,
        -- You can add or remove levels as you wish
    },

    ----------------------------------------------
    --       🤿 Setup your Scuba Gear
    ----------------------------------------------

    gear = {
        -- Customize the various Scuba Gear tanks available
        tanks = {
            -- The number in [brackets] is the level required to use this tank
            -- item: is the actual scuba tank item spawn name
            -- degrade: is how much the tank degrades every 10 seconds underwater
            -- Level 1 lasts roughly a total of 5 minutes underwater before needing a refill
            [1] = { item = 'ls_scuba_gear_1', degrade = 3.34 },
            -- Level 2 lasts roughly a total of 10 minutes underwater before needing a refill
            [2] = { item = 'ls_scuba_gear_2', degrade = 1.67 },
            -- Level 3 lasts roughly a total of 15 minutes underwater before needing a refill
            [3] = { item = 'ls_scuba_gear_3', degrade = 1.11 },
            -- Level 4 lasts roughly a total of 20 minutes underwater before needing a refill
            [4] = { item = 'ls_scuba_gear_4', degrade = 0.84 },
            -- Level 5 lasts roughly a total of 25 minutes underwater before needing a refill
            [5] = { item = 'ls_scuba_gear_5', degrade = 0.66 },
            -- The formula to get degradation value based on total time is:
            -- 100 ÷ (Total time in seconds desired ÷ 10) = degrade
        },
        -- The item spawn name for oxygen refill tanks
        refill = 'ls_oxygen_tank',
        -- The mask is an object, object spawn name:
        mask = 'p_d_scuba_mask_s',
        -- The tank is an object, object spawn name:
        tank = 'p_s_scuba_tank_s',
        -- Optional clothing to be worn when scuba diving
        -- Don't want to change clothes? Set all drawableId's to 0!
        -- ⚠️ Do not alter componentId
        clothes = {
            mask = {
                -- The compononent id you want to set
                componentId = 1,
                -- The drawableId and textureId for males
                male = { drawableId = 0, textureId = 0 },
                -- The drawableId and textureId for females
                female = { drawableId = 0, textureId = 0 }
            },
            upperBody = {
                componentId = 3,
                male = { drawableId = 8, textureId = 0 },
                female = { drawableId = 3, textureId = 0 }
            },
            lowerBody = {
                componentId = 4,
                male = { drawableId = 94, textureId = 0 },
                female = { drawableId = 97, textureId = 0 }
            },
            bags = {
                componentId = 5,
                male = { drawableId = 0, textureId = 0 },
                female = { drawableId = 0, textureId = 0 }
            },
            shoes = {
                componentId = 6,
                male = { drawableId = 67, textureId = 0 },
                female = { drawableId = 70, textureId = 0 }
            },
            shirt = {
                componentId = 8,
                male = { drawableId = 15, textureId = 0 },
                female = { drawableId = 15, textureId = 0 }
            },
            bodyArmor = {
                componentId = 9,
                male = { drawableId = 0, textureId = 0 },
                female = { drawableId = 0, textureId = 0 }
            },
            decals = {
                componentId = 10,
                male = { drawableId = 0, textureId = 0 },
                female = { drawableId = 0, textureId = 0 }
            },
            jackets = {
                componentId = 11,
                male = { drawableId = 243, textureId = 0 },
                female = { drawableId = 251, textureId = 0 }
            }
        }
    },

    ----------------------------------------------
    --          🛒 Setup your shops
    ----------------------------------------------

    shop = {
        gear = {
            -- Do you want to enable the scuba gear shop?
            -- This shop is added to the main diving menu
            enable = true,
            -- The account that will be used for purchases
            -- Available options are: 'cash' or 'bank'
            account = 'cash',
            -- The shop items available for purchase
            items = {
                -- item: item spawn name
                -- price: price of item
                -- icon: icon for item
                -- level: optional player level requirement to purchase item
                -- metadata: optional durability level assigned at purchase
                -- metadata: ⚠️ remove this option if selling non-metadata items
                [1] = { item = 'ls_oxygen_tank', price = 100, icon = 'fas fa-repeat', metadata = 100 },
                [2] = { item = 'ls_scuba_gear_1', price = 250, icon = 'fas fa-lungs', level = 1, metadata = 100 },
                [3] = { item = 'ls_scuba_gear_2', price = 500, icon = 'fas fa-lungs', level = 2, metadata = 100 },
                [4] = { item = 'ls_scuba_gear_3', price = 1000, icon = 'fas fa-lungs', level = 3, metadata = 100 },
                [5] = { item = 'ls_scuba_gear_4', price = 2000, icon = 'fas fa-lungs', level = 4, metadata = 100 },
                [6] = { item = 'ls_scuba_gear_5', price = 5000, icon = 'fas fa-lungs', level = 5, metadata = 100 },
                [7] = { item = 'burger', price = 5, icon = 'fas fa-burger' },
                [8] = { item = 'water', price = 5, icon = 'fas fa-glass-water' },
                -- You can add or remove items as you wish
            }
        },
        pawn = {
            -- Do you want to enable the scuba gear pawn/sell shop?
            -- This shop is added to the main diving menu
            enable = true,
            -- The account that will be used to pay the player
            -- Available options are 'cash' or 'bank'
            account = 'cash',
            -- The shop items available to sell
            items = {
                -- item: item spawn name
                -- price: how much item sells for
                -- icon: icon for item
                [1] = { item = 'ls_old_boot', price = 5, icon = 'fas fa-hand-holding-dollar' },
                [2] = { item = 'ls_wood_plank', price = 5, icon = 'fas fa-hand-holding-dollar' },
                [3] = { item = 'ls_rusted_padlock', price = 5, icon = 'fas fa-hand-holding-dollar' },
                [4] = { item = 'ls_rusted_key', price = 5, icon = 'fas fa-hand-holding-dollar' },
                [5] = { item = 'ls_rusted_gear', price = 5, icon = 'fas fa-hand-holding-dollar' },
                [6] = { item = 'ls_seashell', price = 15, icon = 'fas fa-hand-holding-dollar' },
                [7] = { item = 'ls_seaweed', price = 15, icon = 'fas fa-hand-holding-dollar' },
                [8] = { item = 'ls_rusted_muffler', price = 15, icon = 'fas fa-hand-holding-dollar' },
                [9] = { item = 'ls_broken_cd', price = 15, icon = 'fas fa-hand-holding-dollar' },
                [10] = { item = 'ls_diving_goggles', price = 15, icon = 'fas fa-hand-holding-dollar' },
                [11] = { item = 'ls_fishing_net', price = 25, icon = 'fas fa-hand-holding-dollar' },
                [12] = { item = 'ls_old_camera', price = 25, icon = 'fas fa-hand-holding-dollar' },
                [13] = { item = 'ls_military_helmet', price = 25, icon = 'fas fa-hand-holding-dollar' },
                [14] = { item = 'ls_old_compass', price = 50, icon = 'fas fa-hand-holding-dollar' },
                [15] = { item = 'ls_old_watch', price = 50, icon = 'fas fa-hand-holding-dollar' },
                [16] = { item = 'ls_conch_shell', price = 50, icon = 'fas fa-hand-holding-dollar' },
                -- You can add or remove items as you wish
            }
        }
    },

    ----------------------------------------------
    --       🛥️ Customize boat rentals
    ----------------------------------------------

    rental = {
        -- Do you want to offer boat rentals?
        enable = true,
        -- The account that will be used for rentals
        -- Available options are: 'cash' or 'bank'
        account = 'cash',
        -- Do you want to require payment for boat rentals?
        -- If not, set deposit = 0
        deposit = 500,
        -- Do you want to refund some money when the boat is returned?
        -- If not, set returnDeposit = 0
        returnDeposit = 250,
        -- The script will spawn a random boat from the list below
        -- If you only want one boat, leave just one in the list
        models = { 'dinghy' },
        -- When a boat is rented, do you want to teleport the player into it?
        teleport = false,
        -- Where to spawn the rental boat?
        coords = vec4(-291.7570, -2766.1208, 0.6787, 267.4251),
        -- Do you want to add a boat anchor option?
        anchor = true,
    },

    ----------------------------------------------
    --       ⛏️ Build the diving zones
    ----------------------------------------------

    zones = {
        [1] = {
            -- The center location of this zone
            location = vec3(1086.9691, -3575.9382, -50.1214),
            -- Models selected at random for each crate spawned here
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            -- The radius of this zone
            radius = 150.0,
            -- Optional highlighting on crates when a player is nearby
            -- enable: true/false - enable or disable highlighting when nearby
            -- distance: how close the player must be for the highlight to be visible
            -- color: the color of the highlight (https://rgbacolorpicker.com/) 
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            -- How many crates can be spawned in this zone?
            crates = { min = 2, max = 6 },
            -- How much XP is rewarded for crates found in this zone?
            xp = { min = 1, max = 5 },
            -- The exact coords the crates will spawn inside this zone
            coords = {
                vec3(1094.7655, -3577.4995, -52.5339),
                vec3(1086.7635, -3537.7588, -43.1057),
                vec3(1106.2019, -3583.6062, -17.5417),
                vec3(1091.3970, -3618.1091, -44.4066),
                vec3(974.6331, -3567.4514, -47.2678),
                vec3(1161.8893, -3630.9204, -22.7693),
                vec3(1066.5341, -3559.0664, -20.8264),
                vec3(1138.0339, -3581.6411, -39.0230),
                vec3(1203.7281, -3524.0046, -33.9104),
                vec3(1191.8622, -3531.3965, -24.0956),
                vec3(1066.8358, -3485.3047, -32.4555),
                vec3(1034.0037, -3651.6384, -49.3254),
                vec3(1108.3530, -3662.9187, -41.3706),
                vec3(1180.6683, -3558.5405, -38.9220),
                vec3(1035.1763, -3586.1721, -45.7417),
                -- Add or remove spawns from this zone
            }
        },
        [2] = {
            location = vec3(3085.2043, -1853.3246, -14.3668),
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            radius = 150.0,
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            crates = { min = 2, max = 6 },
            xp = { min = 1, max = 5 },
            coords = {
                vec3(3085.2043, -1853.3246, -16.0565),
                vec3(3029.1843, -1820.8015, -24.6999),
                vec3(2993.0427, -1818.4943, -34.2077),
                vec3(2997.8711, -1753.7402, -11.0640),
                vec3(2982.0010, -1912.0287, -28.9325),
                vec3(3051.9775, -1926.9736, -54.6551),
                vec3(3011.4712, -1866.9753, -48.1732),
                vec3(3056.2656, -1761.5493, -43.3554),
                vec3(2950.1038, -1839.1633, -35.2352),
                vec3(3019.7561, -1913.2930, -32.4005),
                vec3(3061.5286, -1866.6348, -35.7668),
                vec3(3040.8525, -1879.8348, -57.6607),
                vec3(2974.8582, -1785.8473, -13.5562),
            }
        },
        [3] = {
            location = vec3(1818.7792, -2984.2068, -41.2811),
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            radius = 150.0,
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            crates = { min = 2, max = 6 },
            xp = { min = 1, max = 5 },
            coords = {
                vec3(1815.4813, -2981.9314, -42.1416),
                vec3(1820.6042, -2943.6421, -39.3650),
                vec3(1738.9772, -2948.8298, -23.5561),
                vec3(1732.7568, -3042.6794, -58.3799),
                vec3(1902.0460, -3026.5271, -45.4950),
                vec3(1760.1697, -2977.9131, -47.1564),
                vec3(1760.2402, -3093.1196, -66.6896),
                vec3(1820.7825, -3068.2268, -39.7288),
                vec3(1929.2610, -2969.8464, -36.5976),
                vec3(1777.1892, -2915.6821, -30.6168),
                vec3(1709.7538, -2952.2861, -24.4798),
                vec3(1849.2987, -2965.3936, -52.7471),
                vec3(1891.3480, -2918.0266, -22.7276),
            }
        },
        [4] = {
            location = vec3(3150.8074, -973.6499, -26.9572),
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            radius = 150.0,
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            crates = { min = 2, max = 6 },
            xp = { min = 1, max = 5 },
            coords = {
                vec3(3150.8074, -973.6499, -26.9572),
                vec3(3132.8245, -1026.0867, -42.3399),
                vec3(3085.2126, -970.5078, -17.9598),
                vec3(3088.5186, -859.4744, -36.9759),
                vec3(3129.6709, -944.6890, -39.5992),
                vec3(3191.7087, -984.1827, -21.3900),
                vec3(3112.4922, -1061.3378, -47.8674),
                vec3(3089.1252, -1030.5328, -43.6450),
                vec3(3050.0190, -946.1809, -23.7141),
                vec3(3184.7986, -870.0077, -65.7725),
                vec3(3125.7749, -890.1265, -43.6622),
                vec3(3075.5540, -898.0163, -22.6175),
            }
        },
        [5] = {
            location = vec3(2383.6611, -2451.3289, -32.9255),
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            radius = 150.0,
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            crates = { min = 2, max = 6 },
            xp = { min = 1, max = 5 },
            coords = {
                vec3(2383.6611, -2451.3289, -32.9255),
                vec3(2437.7466, -2411.5706, -32.8800),
                vec3(2385.5486, -2347.8923, -16.6751),
                vec3(2313.7725, -2344.6472, -8.4371),
                vec3(2270.5879, -2393.7388, -26.9309),
                vec3(2299.5146, -2433.6165, -19.7982),
                vec3(2301.1694, -2404.3206, -25.4087),
                vec3(2393.1316, -2410.4976, -32.1512),
                vec3(2353.0732, -2517.1201, -29.7120),
                vec3(2442.2646, -2456.6064, -7.9306),

            }
        },
        [6] = {
            location = vec3(280.3442, -3492.5969, -29.2227),
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            radius = 150.0,
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            crates = { min = 2, max = 6 },
            xp = { min = 1, max = 5 },
            coords = {
                vec3(280.3442, -3492.5969, -29.2227),
                vec3(361.8796, -3468.6265, -26.7427),
                vec3(313.8169, -3376.5999, -24.5615),
                vec3(214.2739, -3467.3735, -14.0912),
                vec3(230.4904, -3558.5493, -50.8256),
                vec3(229.1392, -3405.6541, -19.9491),
                vec3(263.5007, -3446.9626, -25.7515),
                vec3(332.7290, -3455.4980, -28.1874),
                vec3(260.9624, -3362.8247, -18.8871),
                vec3(183.2011, -3419.6165, -18.7913),
            }
        },
        [7] = {
            location = vec3(-2080.0508, -876.7839, -38.1838),
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            radius = 150.0,
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            crates = { min = 2, max = 6 },
            xp = { min = 1, max = 5 },
            coords = {
                vec3(-2080.0508, -876.7839, -38.1838),
                vec3(-2013.5044, -984.5208, -15.5007),
                vec3(-2169.8203, -962.9402, -70.6583),
                vec3(-2081.6479, -939.0807, -40.9644),
                vec3(-2142.8997, -880.9988, -38.1233),
                vec3(-2051.6763, -874.8913, -4.9137),
                vec3(-2060.8647, -843.3949, -24.2824),
                vec3(-2101.0276, -856.7371, -32.4969),
                vec3(-2187.1812, -831.8537, -36.8464),
                vec3(-2090.7273, -1001.5419, -43.5531),
                vec3(-2000.4624, -917.0707, -14.9745),
                vec3(-2035.0875, -833.5734, -14.8460),
                vec3(-2041.9478, -818.1243, -5.5512),
                vec3(-2161.8516, -776.5375, -22.6451),
                vec3(-2142.2932, -839.6798, -32.2059),
                vec3(-2049.0518, -920.3878, -32.7276),
            }
        },
        [8] = {
            location = vec3(-2837.9504, -494.8672, -45.7883),
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            radius = 150.0,
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            crates = { min = 2, max = 6 },
            xp = { min = 1, max = 5 },
            coords = {
                vec3(-2837.9504, -494.8672, -45.7883),
                vec3(-2789.4587, -623.3177, -47.6618),
                vec3(-2854.2878, -578.2092, -75.3579),
                vec3(-2836.2771, -528.2178, -66.3296),
                vec3(-2814.6587, -561.5555, -71.3785),
                vec3(-2749.4819, -543.8317, -46.9659),
                vec3(-2749.5925, -462.8193, -37.6869),
                vec3(-2833.0474, -462.1175, -18.8996),
                vec3(-2921.6694, -434.5992, -37.3384),
                vec3(-2819.7563, -591.3509, -58.2769),
                vec3(-2760.0801, -581.4194, -47.1628),
                vec3(-2808.8740, -409.1779, -38.3897),
                vec3(-2847.6389, -380.1435, -40.4797),
                vec3(-2881.4072, -439.8226, -38.2622),
                vec3(-2785.4697, -524.0317, -54.6307),
            }
        },
        [9] = {
            location = vec3(-3550.5359, 646.9001, -66.3281),
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            radius = 150.0,
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            crates = { min = 2, max = 6 },
            xp = { min = 1, max = 5 },
            coords = {
                vec3(-3550.5359, 646.9001, -66.3281),
                vec3(-3562.6257, 622.5925, -31.0750),
                vec3(-3514.4497, 629.0671, -31.9019),
                vec3(-3464.5229, 618.9487, -39.9314),
                vec3(-3468.6663, 546.3879, -46.4398),
                vec3(-3532.4519, 540.3656, -55.3767),
                vec3(-3576.2854, 742.5957, -47.0631),
                vec3(-3530.5144, 767.2094, -36.7547),
                vec3(-3489.9067, 699.1218, -50.1850),
                vec3(-3503.2341, 591.9188, -46.4599),
                vec3(-3589.1309, 596.7454, -61.6465),
                vec3(-3594.2913, 689.3352, -64.4904),
            }
        },
        [10] = {
            location = vec3(-3416.8613, 1701.7200, -61.6626),
            models = { 'xm3_prop_xm3_crate_supp_01a' },
            radius = 150.0,
            highlight = { enable = true, distance = 30, color = { r = 106, g = 226, b = 119 } },
            crates = { min = 2, max = 6 },
            xp = { min = 1, max = 5 },
            coords = {
                vec3(-3416.8613, 1701.7200, -61.6626),
                vec3(-3417.9424, 1653.9034, -42.2417),
                vec3(-3410.1980, 1589.5227, -42.9441),
                vec3(-3303.7632, 1705.6891, -23.4423),
                vec3(-3494.1262, 1706.0807, -65.6907),
                vec3(-3465.9348, 1698.5503, -45.7951),
                vec3(-3372.7073, 1669.8127, -45.0799),
                vec3(-3331.2153, 1686.3544, -42.6237),
                vec3(-3406.0732, 1780.2509, -37.4121),
                vec3(-3450.4163, 1663.0955, -40.5404),
                vec3(-3336.1089, 1611.4885, -40.8837),
            }
        }
    },

    ----------------------------------------------
    --       📦 Customize your crates
    ----------------------------------------------

    crates = {
        -- The item spawn name for the crate
        item = 'ls_diving_crate',
        -- The quantity of crates given to the player when picked up
        quantity = { min = 1, max = 1 },
        -- The loot table when opening crates
        -- ⚠️ The way this loot table works is pretty unique - please read :)
        -- ⚠️ Each number in [brackets] is the level required to get a chance at that loot
        -- ⚠️ Each item is rolled individually, so you can get multiple items from one crate
        -- ⚠️ If you are level 1 in Diving, you only get a chance at items from section [1]
        -- ⚠️ If you are level 3 in Diving, you get a chance at items from sections [1] to [3]
        -- ⚠️ This gives you the ability to scale rewards based on the players diving experience
        -- ⚠️ This section is intended to be built by YOU for your specific server and item(s)
        -- ⚠️ We only provide a base loot table to help get you started with some filler items
        loot = {
            [1] = {
                -- These item(s) are only rolled for players level 1 and above
                -- item: spawn name | quantity = min/max | chance = 1-100 | metadata (optional): {key = value}
                { item = 'ls_old_boot', quantity = { min = 1, max = 1 }, chance = 100 },
                { item = 'ls_wood_plank', quantity = { min = 1, max = 1 }, chance = 80 },
                { item = 'ls_rusted_padlock', quantity = { min = 1, max = 1 }, chance = 60 },
                { item = 'ls_rusted_key', quantity = { min = 1, max = 1 }, chance = 40 },
                { item = 'ls_rusted_gear', quantity = { min = 1, max = 1 }, chance = 30 },
                { item = 'ls_seashell', quantity = { min = 1, max = 1 }, chance = 30 },
                { item = 'ls_seaweed', quantity = { min = 1, max = 1 }, chance = 25 },
                { item = 'ls_rusted_muffler', quantity = { min = 1, max = 1 }, chance = 25 },
                { item = 'ls_broken_cd', quantity = { min = 1, max = 1 }, chance = 20 },
                { item = 'ls_diving_goggles', quantity = { min = 1, max = 1 }, chance = 20 },
                { item = 'ls_fishing_net', quantity = { min = 1, max = 1 }, chance = 15 },
                { item = 'ls_old_camera', quantity = { min = 1, max = 1 }, chance = 15 },
                { item = 'ls_military_helmet', quantity = { min = 1, max = 1 }, chance = 10 },
                { item = 'ls_old_compass', quantity = { min = 1, max = 1 }, chance = 10 },
                { item = 'ls_old_watch', quantity = { min = 1, max = 1 }, chance = 5 },
                { item = 'ls_conch_shell', quantity = { min = 1, max = 1 }, chance = 5 },
                -- Add or remove items as you wish
            },
            [2] = {
                -- These item(s) are only rolled for players level 2 and above
                { item = 'ls_bottle_of_rum', quantity = { min = 1, max = 1 }, chance = 50 },
            },
            [3] = {
                -- These item(s) are only rolled for players level 3 and above
                { item = 'ls_treasure_map', quantity = { min = 1, max = 1 }, chance = 50 },
            },
            [4] = {
                -- These item(s) are only rolled for players level 4 and above
                { item = 'ls_silver_bracelet', quantity = { min = 1, max = 1 }, chance = 50 },
            },
            [5] = {
                -- These item(s) are only rolled for players level 5 and above
                { item = 'ls_ancient_artifact', quantity = { min = 1, max = 1 }, chance = 50 },
            }
        }
    }

}