Config = {}

-- 3.0.0 UPDATE NOTES-- 
-- IMPORTANT: Make sure the resource is named `envi-chopshop` (not envi-chopshop-v2 or any other name) for error-free use!
-- PRO TIP: Search for "NEW FOR 3.0.0!!" to find new changes!

-- MAJOR NEW FEATURES:
-- 1. WORKER MANAGEMENT SYSTEM
--    • CanRecruit: Shop owners can now recruit workers to help run their chopshop!
--    • MaxWorkers: Set maximum number of workers per shop (default: 10)
--    • Worker Permissions:  Control what workers can do:
--      - Generate contracts
--      - Use machines for parts breakdown (Optional!)
--      - Manage business funds
--      - Hire/fire other workers
--      - Manage worker permissions

-- 2. CHOPSHOP ACCESS CONTROL
--    • ChopshopWorkersOnly (Optional!): Restrict vehicle chopping to shop owners and workers only
--    • Promotes RP if ran as a legal/ illegal business
--    • Configurable per shop - set to true/false

-- 3. PARTS BREAKDOWN SYSTEM
--    • New machine-based recycling system for vehicle parts with advanced sync anims!
--    • Three machine types: Vertical Mill, Tire Lathe, Drill Press
--    • WorkerLocked (Optional!): Restrict machine usage to shop owners and workers with machine permissions
--    • RoleLocked (Optional!): Alternative restriction based on player jobs [[ NOW SUPPORTS GANG NAMES (NEW IN 3.0.1!!) ]]
--    • Purchasable machines (Optional!): Owners must buy machines with funds made via the business before workers can use them
--    • Cinematic cameras when using the recycle machines (Optional!)


-- 4. CONTRACT SYSTEM IMPROVEMENTS
--    • WorkersCanCompleteContracts: Control whether workers can complete contracts at their own shop
--    • Enhanced cooldown system with time remaining notifys
--    • Better error handling for contract generation

-- 5. MACHINE PERMISSIONS
--    • Machine access now requires specific "machines" permission for workers
--    • Shop owners always have full access!

-- 3.0.1 NEW FEATURES:
-- PRO TIP: Search for "NEW FOR 3.0.1!!" to find new changes!
--    • Added Gang support for job locks
--    • NOTE: Many things related to jobs have changed name from "Job" to "Role" in this config - Example: AllowedRolesOnly, BlacklistedRoles, Roles, JobRoleLocked, RoleLocked 
--      Be careful when updating!

-- 3.0.5 NEW FEATURES:
-- PRO TIP: Search for "NEW FOR 3.0.5!!" to find new changes!
--    • Added Envi-Addictions to add crime addiction when we notify police - editable in client_edit.lua
--    • Added a default key to drop the tools - This saves into keybinds, players who already have it saved will need to change it in the pause menu

--- NEW FOR 3.0.5!! ---
-- Get Envi-Addictions here: https://envi-scripts.tebex.io/package/6882797
Config.EnviAddictions = false -- If true, we will use Envi-Addictions to add crime addiction when we notify police - editable in client_edit.lua   -- NEW FOR 3.0.5!!
----------------------------------------------------

Config.Debug = false -- Set to true to enable debug mode

Config.UseTarget = true -- Set to false for new 'Press E' Interaction System!  -- Target is more optimized, Press E feels nicer to use      -- NEW FOR 3.0.0!!


Config.OpenAllDoorsOnStart = true -- Set to true to open all doors on the vehicle when starting the chop

Config.AdvancedParking = false -- Set to true if you use AdvancedParking 

Config.PartsDeleteTimer =  60 -- Time in seconds before the parts are deleted from the drop-off location
Config.DeleteVehicleTime = 10 -- Time in seconds before the vehicle when finishing the chop

Config.InteractionKey = 38 -- Change the key for interactions for Start Chop Vehicle and Manage Chop Shop [Default: E]

-- Config.DropToolsKey = 73 -- Key to drop the tools [Default: X]
-- Removed in V3 for new X Key Mapping (Changeable key in keybind menu - default changeable below)
Config.DefaultDropToolsKey = 'X' -- Default key to drop the tools - This saves into keybinds, players who already have it saved will need to change it in the pause menu  -- NEW FOR 3.0.5!!


-- Cool Down Time
Config.CooldownTime = 2 -- Time in minutes before you can chop another vehicle
Config.ShowTimeRemaining = true -- Shows a notification with the time remaining until you can chop another vehicle

-- Contract Settings
Config.SpecialContractCooldown = 60 -- Time in minutes before you can generate another contract
Config.ContractItem = 'chop_contract' -- Item to receive when generating a contract
Config.ContractCompleteBonus = 5000 -- Bonus for completing a contract

-- NEW IN 3.0.0
Config.WorkersCanCompleteContracts = false -- If true, workers can complete contracts at their own workplace, if false, they must had them to other citizens (like the owner did in v1/v2)

------------------------------------------

-- Location Settings

Config.ChopShops = { -- Add as many as you need
    ['LS Customs'] = {   -- Name of the Chop Shop - [MUST BE UNIQUE]
        ChopLocation = vec3(732.99, -1088.95, 22.16),               -- Center of the ChopShop Area
        DropPartsLocation = vector3(728.43, -1072.27, 20.39),
        FinishChopLocation = vec3(725.7445, -1071.1239, 27.31),
        ChopZoneRadius = 30.0,                  -- Radius of the zone of the shop, for spawning props etc
        ChoppingAreaRadius = 10.0,         -- Radius of the area where you can chop the vehicle (MUST be smaller than ChopZoneRadius)

        -- Tool Locations
        ImpactDriverLocation = vec3(737.2314, -1078.6794, 22.1687),
        SawLocation = vec3(731.1500, -1077.4465, 22.1688),

        -- Job Settings
        AllowedRolesOnly = {enabled = false, roles = {'police', 'ambulance', 'ballas', 'vagos'}},  -- NEW FOR 3.0.1!! -- NOW ALSO SUPPORTS GANG NAMES
        BlacklistedRoles = {enabled = true, roles = {'police', 'ambulance'}},  -- NEW FOR 3.0.1!! -- BLACKLISTED JOBS - NOW ALSO SUPPORTS GANG NAMES

        ChopshopWorkersOnly = false, -- Set to true to only allow workers to use the chopshop    -- NEW FOR 3.0.0!!

        -- Management Settings
        Ownable = true,
        ManagementLocation = vec3(727.8610, -1067.2437, 27.31),
        Price = 100000,
        Percentage = 10,   -- Owner will recieve 10% of the total chop value into management fund
        CanSell = true,    -- Can sell the business to get back % of the original price
        SellPercentage = 50, -- % of the original price you get back when selling the business
        CanTransfer = true, -- Can transfer ownership of the business to another player

        CanRecruit = true, -- Can recruit workers to do "off the books" work at the shop, these workers can create contracts for the shop          -- NEW FOR 3.0.0!!
        MaxWorkers = 10, -- Maximum number of workers that can be recruited                                                                        -- NEW FOR 3.0.0!!

        -- Ped Settings (Optional)

        Ped = { -- Handy to use as a place to add FinishChopLocation if there is no desk
            Enabled = false,
            PedHash = 'a_m_m_hillbilly_01',
            PedCoords = vector4(727.5610, -1067.5437, 28.31, 180.0),
            PedHeading = 180.0,
            PedAnimation = 'WORLD_HUMAN_AA_SMOKE',
        },

        -- Dispatch  
        Dispatch = false, -- Set to true to enable police alerts when chopping a vehicle  - TRUE FOR ILLEGAL CHOPSHOP / FALSE FOR LEGAL CHOPSHOP BUSINESS -- edit in client_edit.lua

        -- NEW FOR 3.0.0!! -- Parts Breakdown
        PartsBreakdown = {  -- note to self, add level sysem and level multipliers for the machines returns
            Enabled = true,
            WorkerLocked = true, -- Set to true to lock the parts breakdown to shop owner and recruited workers / false to allow any player to use the machines at any time
            RoleLocked = false, -- Set to true to lock the parts breakdown to certain jobs [[ NOW SUPPORTS GANG NAMES (NEW IN 3.0.1!!) ]]
            Roles = {'mechanic', 'mechanic2', 'ballas', 'vagos'}, -- List of jobs [[ NOW SUPPORTS GANG NAMES (NEW IN 3.0.1!!) ]] that can use the parts breakdown if RoleLocked is set to true
            Locations = {  -- Add as many as you need, they will be individually purchased by the shop owner
                ['Vertical Mill'] = {
                    machineType = 'mill',
                    Location = vector4(726.8505, -1079.5952, 21.1689, 349.8620),
                    Purchase = {
                        mustPurchase = true,   -- if true, it will not be avaible until the chopshop owner purchases it, if false, its always available
                        price = 10000,
                    },
                    inUse = false, -- DONT TOUCH THIS, leave it as false
                },
                ['Vertical Mill 2'] = {  -- suports multiple machines of the same type
                    machineType = 'mill',
                    Location = vector4(726.3066, -1065.9735, 21.1688, 210.8573),
                    Purchase = {
                        mustPurchase = true,   -- if true, it will not be avaible until the chopshop owner purchases it, if false, its always available
                        price = 10000,
                    },
                    inUse = false, -- DONT TOUCH THIS, leave it as false
                },
                ['Tire Lathe'] = {
                    machineType = 'lathe',
                    Location = vector4(729.3940, -1065.1014, 21.1687, 179.4133),
                    Purchase = {
                        mustPurchase = true,   -- if true, it will not be avaible until the chopshop owner purchases it, if false, its always available
                        price = 25000,
                    },
                    inUse = false, -- DONT TOUCH THIS, leave it as false
                },
                ['Drill Press'] = {
                    machineType = 'drill',
                    Location = vector4(728.5805, -1083.7155, 21.1690, 271.5276),
                    Purchase = {
                        mustPurchase = true,   -- if true, it will not be avaible until the chopshop owner purchases it, if false, its always available
                        price = 50000,
                    },
                    inUse = false, -- DONT TOUCH THIS, leave it as false
                },
            }
        },
    },

    ['Sandy Shores'] = {   -- Name of the Chop Shop - [MUST BE UNIQUE]
        ChopLocation = vector3(2052.68, 3176.29, 45.17),
        DropPartsLocation = vector3(2048.24, 3196.82, 45.49),
        FinishChopLocation = vec3(2041.43, 3187.44, 45.18),
        ChopZoneRadius = 60.0,
        ChoppingAreaRadius = 30.0,

        -- Tool Locations
        ImpactDriverLocation = vector3(2059.96, 3192.56, 45.19),
        SawLocation = vector3(2048.34, 3200.37, 45.19),

        -- Job Settings
        AllowedRolesOnly = {enabled = false, roles = {'police', 'ambulance', 'ballas', 'vagos'}},  -- NEW FOR 3.0.1!! -- NOW ALSO SUPPORTS GANG NAMES
        BlacklistedRoles = {enabled = true, roles = {'hobo', 'ambulance'}},   -- NEW FOR 3.0.1!! -- NOW ALSO SUPPORTS GANG NAMES
        ChopshopWorkersOnly = false, -- Set to true to only allow workers to use the chopshop    -- NEW FOR 3.0.0!!

        -- Management Settings
        Ownable = true,
        ManagementLocation = vector3(2041.43, 3187.44, 45.18),
        Price = 250000,
        Percentage = 10,   -- Owner will recieve 10% of the total chop value into management fund
        CanSell = true,    -- Can sell the business to get back % of the original price
        SellPercentage = 50, -- % of the original price you get back when selling the business
        CanTransfer = true, -- Can transfer ownership of the business to another player

        CanRecruit = true, -- Can recruit workers to do "off the books" work at the shop, these workers can create contracts for the shop          -- NEW FOR 3.0.0!!
        MaxWorkers = 10, -- Maximum number of workers that can be recruited                                                                        -- NEW FOR 3.0.0!!

        -- Ped Settings (Optional)

        Ped = { -- Handy to use as a place to add FinishChopLocation/ Management if there is no desk
            Enabled = true,
            PedHash = 'a_m_m_hillbilly_01',
            PedCoords = vector3(2041.43, 3187.44, 45.18),
            PedHeading = 250.0,
            PedAnimation = 'WORLD_HUMAN_AA_SMOKE',
        },

        -- Dispatch 
        Dispatch = false, -- Set to true to enable police alerts when chopping a vehicle  - TRUE FOR ILLEGAL CHOPSHOP / FALSE FOR LEGAL CHOPSHOP BUSINESS -- edit in client_edit.lua

        -- NEW FOR 3.0.0!! -- Parts Breakdown (Optional!)
        PartsBreakdown = {
            Enabled = true,
            WorkerLocked = true, -- Set to true to lock the parts breakdown to shop owner and recruited workers
            RoleLocked = false, -- Set to true to lock the parts breakdown to certain jobs [[ NOW SUPPORTS GANG NAMES (NEW IN 3.0.1!!) ]]
            Roles = {'mechanic', 'mechanic2', 'ballas', 'vagos'}, -- List of jobs [[ NOW SUPPORTS GANG NAMES (NEW IN 3.0.1!!) ]] that can use the parts breakdown if RoleLocked is set to true
            Locations = {  -- Add as many as you need, they will be individually purchased by the shop owner
                ['Vertical Mill'] = {
                    machineType = 'mill',
                    Location = vector4(2051.8599, 3161.9563, 44.1034, 18.4916),
                    Purchase = {
                        mustPurchase = true,   -- if true, it will not be avaible until the chopshop owner purchases it, if false, its always available
                        price = 10000,
                    },
                    inUse = false, -- DONT TOUCH THIS, leave it as false
                },
                ['Tire Lathe'] = {
                    machineType = 'lathe',
                    Location = vector4(2059.5842, 3174.6968, 44.1689, 68.9670),
                    Purchase = {
                        mustPurchase = true,   -- if true, it will not be avaible until the chopshop owner purchases it, if false, its always available
                        price = 25000,
                    },
                    inUse = false, -- DONT TOUCH THIS, leave it as false
                },
                ['Drill Press'] = {
                    machineType = 'drill',
                    Location = vector4(2050.2698, 3172.6611, 44.1690, 332.8776),
                    Purchase = {
                        mustPurchase = true,   -- if true, it will not be avaible until the chopshop owner purchases it, if false, its always available
                        price = 50000,
                    },
                    inUse = false, -- DONT TOUCH THIS, leave it as false
                },
            }
        },
    },
}

Config.TargetDistance = 1.2 -- Distance to show the target options

Config.HardcoreMode = true -- Set to true to enable PLAYER OWNED VEHICLE CHOPPING
-- [IMPORTANT - PLEASE READ] -- 
-- [IF NOT USING QB/QBOX OR ESX THIS WILL REQUIRE YOU TO CODE YOUR OWN LOGIC IN THE SERVER_EDIT.LUA FILE FOR CHECKING OWNERSHIP AND IF YOU WANT TO DELETE, OR RETURN THE VEHICLE TO THE IMPOUND ETC ]
-- EDIT envi-chopshop:isVehOwned AND HardcoreChopComplete()

Config.CheckPoliceOnline = false -- Set to true to check if law enforcement are online before chopping a vehicle
Config.JobsToCheck = {'police', 'sheriff'} -- Jobs to check if online (multiple jobs supported - counts all players with ANY of these jobs)
Config.AmountOnline = 1 -- Minimum total amount of players with any of the jobs online before you can chop a vehicle


-- Sound Settings          -- You must have the sound files in your Interact-Sound folder for this to work!
Config.SawVolume = 0.7    -- [0.1 = 10% volume, 1.0 = 100% volume]
Config.ImpactDriverVolume = 0.5
Config.NativeSounds = true

function SoundEvent(coords, soundFile, volume) -- Change this to your own sound system if you want
    if Config.NativeSounds then
        DoSound(soundFile)
    else
        TriggerServerEvent('InteractSound_SV:PlayOnSource', soundFile, volume)
    end
end

-------------------------------------------------------------------------------------

-- Rewards 
Config.ClassMultipliers = {  -- Reward Multiplier for each vehicle class
    [0] = 0.8, -- Compacts
    [1] = 0.8, -- Sedans
    [2] = 0.8, -- SUVs
    [3] = 0.8, -- Coupes
    [4] = 0.8, -- Muscle
    [5] = 0.8, -- Sports Classics
    [6] = 0.8, -- Sports
    [7] = 0.8, -- Super
    [8] = 0.8, -- Motorcycles
    [9] = 0.8, -- Off-road
    [10] = 0.8, -- Industrial
    [11] = 0.8, -- Utility
    [12] = 0.8, -- Vans
    [13] = 0.8, -- Cycles
    [14] = 0.8, -- Boats
    [15] = 0.8, -- Helicopters
    [16] = 0.8, -- Planes
    [17] = 0.8, -- Service
    [18] = 0.8, -- Emergency
    [19] = 0.8, -- Military
    [20] = 0.8  -- Commercial
}


Config.RewardsAccount = 'cash' -- [QB] - 'cash' or 'bank' or 'crypto' // [ESX] - 'cash' or 'bank' or 'black_money'   -- Go to Server/server_edit.lua to edit the reward functions to your liking if you want to use something else.
Config.Rewards = 30000 -- Base reward for each vehicle - (please keep above 10 for the multiplier to work)
Config.AdditionalRewardsItem = 'cryptostick' -- Item to receive when using item rewards, set to false to disable
Config.AdditionalRewardsAmount = math.random(1,3) -- Amount of item to receive when using item rewards

-- Item Rewards
Config.LootItems = { -- These are recieved when removing batter, scrap, gearboxes and radiators
    'steel',
    'copper',
    'aluminum',
    'metalscrap',
    'plastic',
    'rubber',
    'iron',
    'glass',
    'metalscrap',
}

Config.LootMin = 1 -- Min amount of items to receive
Config.LootMax = 3 -- Max amount of items to receive


-- Advanced Rewards Per Chopping Stage (Used in new Parts Breakdown)
Config.CarPartsItems = {
    Enabled = true, -- Set to false to disable
    Door = 'car_door',   -- 'item_name' - IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsRecycle
    Wheels = 'car_wheel', -- 'item_name' - IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsRecycle
    Battery = 'car_battery', -- 'item_name' - IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsRecycle
    GearBox = 'car_gearbox', -- 'item_name' - IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsRecycle
    Radiator = 'car_radiator', -- 'item_name' - IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsRecycle
    Scrap = 'car_scrap', -- 'item_name' - IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsRecycle
    Hood = 'car_hood', -- 'item_name' - IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsRecycle
    Trunk = 'car_trunk', -- 'item_name' - IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsRecycle
}

Config.CinematicRecycle = true -- Set to true to enable cinematic cameras when using the recycle machines -- NEW FOR 3.0.0!!

Config.CarPartsRecycle = {  -- NEW FOR 3.0.0!!
    drill = {
        ['car_door'] = { -- 'item_name', IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsItems
            label = 'Car Door',
            prop = 'prop_car_door_04',
            animationTime = 21, -- in seconds
            recieves = {
                ['steel'] = {min = 1, max = 2},
                ['plastic'] = {min = 1, max = 2},
                ['rubber'] = {min = 1, max = 2},
            },
            offset = vec3(0.0, 0.1, 1.05),
            rotation = vec3(90.0, 180.0, 180.0),
        },
        ['car_scrap'] = { -- 'item_name', IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsItems
            label = 'Car Scrap',
            prop = 'imp_prop_impexp_exhaust_01',
            animationTime = 21, -- in seconds
            recieves = {
                ['metalscrap'] = {min = 1, max = 5},
                ['plastic'] = {min = 1, max = 2},
            },
            offset = vec3(0.0, 0.0, 1.05),
            rotation = vec3(0.0, 0.0, 180.0),
        },
        ['car_hood'] = { -- 'item_name', IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsItems
            label = 'Car Hood',
            prop = 'imp_prop_impexp_bonnet_04a',
            animationTime = 21, -- in seconds
            recieves = {
                ['steel'] = {min = 1, max = 3},
                ['plastic'] = {min = 1, max = 3},
            },
            offset = vec3(0.0, 0.0, 1.12),
            rotation = vec3(0.0, 0.0, 180.0),
        },
        ['car_trunk'] = { -- 'item_name', IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsItems
            label = 'Car Trunk',
            prop = 'imp_prop_impexp_trunk_01a',
            animationTime = 21, -- in seconds
            recieves = {
                ['steel'] = {min = 1, max = 3},
                ['plastic'] = {min = 1, max = 3},
            },
            offset = vec3(0.0, 0.0, 1.12),
            rotation = vec3(0.0, 0.0, 0.0),
        },
    },

    lathe = {
        ['car_wheel'] = { -- 'item_name', IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsItems
            label = 'Wheel',
            prop = 'imp_prop_impexp_tyre_02a',
            animationTime = 18, -- in seconds
            recieves = {
                ['aluminium'] = {min = 1, max = 3},
                ['rubber'] = {min = 2, max = 5},
            },
            offset = vec3(-0.5, 0.0, 1.0),
            rotation = vec3(0.0, 0.0, 0.0),
        },
    },

    mill = {
        ['car_gearbox'] = { -- 'item_name', IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsItems   
            label = 'Gearbox',
            prop = 'imp_prop_impexp_gearbox_01',
            animationTime = 45, -- in seconds
            recieves = {
                ['steel'] = {min = 1, max = 3},
                ['plastic'] = {min = 1, max = 3},
                ['metalscrap'] = {min = 1, max = 3},
            },
            offset = vec3(0.0, -0.2, 1.0),
            rotation = vec3(0.0, 0.0, 180.0),
        },
        ['car_battery'] = { -- 'item_name', IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsItems
            label = 'Car Battery',
            prop = 'prop_battery_02',
            animationTime = 45, -- in seconds
            recieves = {
                ['lithium'] = {min = 1, max = 2},
                ['steel'] = {min = 1, max = 3},
                ['copper'] = {min = 1, max = 3},
            },
            offset = vec3(0.0, -0.4, 1.1),
            rotation = vec3(0.0, 0.0, 180.0),
        },
        ['car_radiator'] = { -- 'item_name', IF YOU CHANGE THE NAME HERE - ALSO CHANGE IN CarPartsItems
            label = 'Car Radiator',
            prop = 'imp_prop_impexp_radiator_01',
            animationTime = 45, -- in seconds
            recieves = {
                ['iron'] = {min = 1, max = 3},
                ['plastic'] = {min = 1, max = 3},
                ['metalscrap'] = {min = 1, max = 3},
            },
            offset = vec3(0.0, -0.25, 1.0),
            rotation = vec3(0.0, 0.0, 180.0),
        },
    },
}

-- Tool Prop Settings
Config.Tools = {
    ImpactDriverProp = { prop = `sf_prop_impact_driver_01a`, offsets = {0.14, -0.14, -0.1, 82.0, -94.0, 155.0} }, -- Impact Driver Prop - (must be in backticks like `prop_name`)
    SawProp = { prop = `prop_tool_consaw`, offsets = {0.09, 0.03, -0.01, -100.64, -158.35, -64.21}}  -- Saw Prop - (must be in backticks like `prop_name`)
}

Config.BlacklistedVehicles = {   -- Add as many as you need (must be in backticks like `spawn_name`)
    `police`,
    `police2`,
    `police3`,
    `taxi`,
    `taxi2`,
    `ambulance`,
    `ambulance2`,
    `firetruk`,
    `sheriff`,
    `sheriff2`,

}

Config.SpecialContractVehicles = {
    -- SUVs
    { model = 'baller', display = 'Gallivanter Baller' },
    { model = 'cavalcade', display = 'Albany Cavalcade' },
    { model = 'dubsta', display = 'Benefactor Dubsta' },
    { model = 'fq2', display = 'Fathom FQ 2' },
    { model = 'granger', display = 'Declasse Granger' },
    { model = 'landstalker', display = 'Dundreary Landstalker' },
    { model = 'rocoto', display = 'Obey Rocoto' },
    { model = 'seminole', display = 'Canis Seminole' },
    { model = 'serrano', display = 'Benefactor Serrano' },

    -- Sports Cars
    { model = 'banshee', display = 'Bravado Banshee' },
    { model = 'buffalo', display = 'Bravado Buffalo' },
    { model = 'carbonizzare', display = 'Grotti Carbonizzare' },
    { model = 'comet', display = 'Pfister Comet' },
    { model = 'coquette', display = 'Invetero Coquette' },
    { model = 'feltzer', display = 'Benefactor Feltzer' },
    { model = 'fusilade', display = 'Schyster Fusilade' },
    { model = 'ninef', display = 'Obey 9F' },
    { model = 'rapidgt', display = 'Dewbauchee Rapid GT' },
    { model = 'schwarzer', display = 'Benefactor Schwartzer' },
    { model = 'sultan', display = 'Karin Sultan' },

    -- Supercars and High-End Cars
    { model = 'baller2', display = 'Gallivanter Baller Sport' },
    { model = 'cheetah', display = 'Grotti Cheetah' },
    { model = 'entityxf', display = 'Overflod Entity XF' },
    { model = 'feltzer2', display = 'Benefactor Feltzer' },
    { model = 'infernus', display = 'Pegassi Infernus' },
    { model = 'vacca', display = 'Pegassi Vacca' },
    { model = 'voltic', display = 'Coil Voltic' }
}

Config.DamagePenalty = true -- Set to true to enable a damage penalty for the vehicle

Config.DamageDividers = { -- if DamagePenalty = true - The total payout amount will be divided by the dividedBy value if the vehicle is below the percentHealth health value
    {percentHealth = 30, dividedBy = 2.0},   -- make sure they go in assending order like seen here
    {percentHealth = 40, dividedBy = 1.8},
    {percentHealth = 50, dividedBy = 1.6},
    {percentHealth = 60, dividedBy = 1.4},
    {percentHealth = 70, dividedBy = 1.2},
    {percentHealth = 80, dividedBy = 1.1}
}


Config.FrontBones = {  -- (Used on battery, gearboxes and radiators stages - only need to edit if you have vehicles with missing bones)
    'engine',
    'bumper_f',
}

Config.BackBones = {  -- (Used on scrap/exhaust stage - only need to edit if you have vehicles with missing bones)
    'engine',
    'bumper_r',
}

-- Language
Config.Lang = {
    -- Marker and Notifications                                                     
    ['chop_vehicle'] = '[E] - Chop Vehicle',
    ['door_stage'] = 'Nice find! First - you\'ll need to remove the doors!',
    ['tire_stage'] = 'Let\'s get started on the tires!',
    ['battery_stage'] = 'Now we need to disconnect the battery!',
    ['gear_box_stage'] = 'Now go ahead and remove the gear box',
    ['rad_stage'] = 'Let\'s get that radiator out!',
    ['scrap_stage'] = 'You think there\'s anything left in there?',
    ['drop_part'] = 'Go drop the parts over there on the trolley!',
    ['cooldown_error'] = 'You need to wait before you can chop another vehicle!',
    ['need_saw'] = 'You need something to chop the door!',
    ['need_impact_driver'] = 'You can\'t unscrew these bolts by hand..',
    ['sell_chop'] = 'Job Done! Head up to the desk and collect your pay!',
    ['owned_vehicle_error'] = 'You can\'t chop an owned vehicle!',
    -- Cooldown Remaining (if ShowTimeRemaining is set to true)
    ['cooldown_left'] = 'Come back in ',
    ['minutes'] = 'minutes',
    -- Rewards
    ['reward_message'] = 'You successfully chopped the vehicle and recieved a payment of $',
    -- Door Names
    ['driver_door'] = 'Driver Door',
    ['passenger_door'] = 'Passenger Door',
    ['back_driver_door'] = 'Back Driver Door',
    ['back_passenger_door'] = 'Back Passenger Door',
    ['hood'] = 'Hood',
    ['trunk'] = 'Trunk',
    -- Tire stage
    ['remove_wheel'] = 'Remove Wheel',
    ['tires_removed'] = 'Tires removed: ',
    ['all_tires_removed'] = 'All tires removed, proceed to the next stage',
    -- Target labels
    ['chop_target'] = 'Chop ',
    ['impact_driver'] = 'Impact Driver',
    ['buzz_saw'] = 'Buzz Saw',
    ['drop_parts'] = 'Drop Parts',
    ['remove_battery'] = 'Remove Battery',
    ['remove_radiator'] = 'Remove Radiator',
    ['remove_scrap'] = 'Remove Scrap',
    ['remove_gear_box'] = 'Remove Gear Box',
    ['sell_chopped_vehicle'] = 'Sell Chopped Vehicle',
    -- Debug Mode
    ['adding_door_target_zones'] = 'Adding door target zones...',
    ['adding_gear_box_target_zone'] = 'Adding gear box target zone...',
    ['adding_rad_target_zone'] = 'Adding raditator target zone...',
    ['adding_battery_target_zones'] = 'Adding battery target zone...',
    ['adding_tire_target_zones'] = 'Adding tire target zones...',
    ['adding_scrap_target_zone'] = 'Adding scrap target zone...',
    ['not_holding_driver'] = 'Not holding impact driver so won\'t check tires removed',
    ['chop_abandoned'] = 'You abandoned the chop!',
    ['own_vehicle_error'] = 'You can\'t chop your own vehicle!',
    ['blacklisted_vehicle'] = 'We can\'t accept this vehicle, sorry!',
    ['not_allowed_job'] = 'Workers only!',
    ['blacklisted_job'] = 'You\'re not allowed to do this!',
    ['no_police'] = 'Not enough Police activity to do this right now!',
    ['manage_shop'] = '[E] - Manage Chop Shop',
    ['not_shop_owner'] = 'This business is owned by somebody else!',
    ['purchase_success'] = 'Congratulations! You are the new owner of ',
    ['purchase_fail'] = 'Purchase Failed!',
    ['withdraw_success'] = 'You have successfully withdrawn $',
    ['withdraw_fail'] = 'Withdrawal Failed!',
    ['sell_success'] = 'Sale Confirmed! You are no longer the owner of ',
    ['sell_fail'] = 'Sale Failed!',
    ['transfer_success'] = 'Successfully transfered ownership of ',
    ['transfer_fail'] = 'Transfer Failed!',
    ['recieved'] =  'You have received $',
    ['from_funds'] = ' from the shop funds.',
    ['completed_contract'] = 'You have completed a contract for ',
    ['recieved_extra'] = ' and received an extra $',
    ['cannot_claim_own'] = 'You cannot claim your own vehicle contracts!',
    ['cannot_claim_worker'] = 'Workers cannot claim contracts for their workplace - Hand them out to other citizens!',
    ['no_contract_permission'] = 'You do not have permission to generate contracts for this shop.',
    ['damaged_vehicle'] = 'The total pay-out has been reduced due to vehicle damage!',
    ['not_allowed_error'] = 'You are not allowed to do this!',
    -- Management Menu
    ['title'] = 'Chop Shop - ',
    ['forsale'] = ' - [FOR SALE]',
    ['management'] = ' - [MANAGEMENT]',
    ['purchase'] = 'Purchase Business',
    ['price'] = 'Price: $',
    ['withdraw'] = "Withdraw Funds",
    ['funds'] = 'Avaliable Balance: $',
    ['register'] = 'Cash Register',
    ['how_much'] = 'How much would you like to withdraw?',
    ['generate'] = 'Generate Special Contract',
    ['create'] = 'Create a special contract for a specific random vehicle',
    ['contract_generated'] = 'Contract generated successfully!',
    ['contract_failed'] = 'Failed to generate contract!',
    ['sell'] = "Sell Business",
    ['value'] = 'Value: $',
    ['transfer'] = 'Transfer Business',
    ['transfer_desc'] = 'Transfer ownership of this business to another citizen',
    ['transfer_id'] = 'Enter the ID of the player you would like to transfer this business to.',
    ['cannot_generate'] = 'You cannot generate a special contract for another ',
    ['min_cooldown'] = ' minutes',
    ['put_away_weapon'] = 'You cannot pick up an item while holding a weapon!',

    -- New for 3.0.0
    ['use_machine'] = 'Use Machine',
    ['parts_breakdown'] = 'Parts Breakdown',
    ['break_down'] = 'Break Down',
    ['cancel'] = 'Leave Machine',
    ['break_description'] = 'Recycle a scrapped %s into materials!',
    ['cancelled_machine'] = 'You abandoned the machine!',
    ['machine_in_use'] = 'This machine is already in use!',
    ['purchase_delivery_pending'] = 'Congratulations on your new purchase. Your new machine will be delivered after the next storm!',
    -- Machine Purchase System
    ['purchase_machines'] = 'Purchase Machines',
    ['purchase_machines_desc'] = 'Buy machines for your chop shop',
    ['machine_purchased'] = 'Machine purchased successfully!',
    ['machine_purchase_failed'] = 'Failed to purchase machine!',
    ['machine_purchase_insufficient_funds'] = 'Business does not have enough funds to purchase this machine!',
    ['machine_purchase_already_purchased'] = 'This machine has already been purchased!',
    ['machine_purchase_database_error'] = 'Database error occurred during purchase!',
    ['business_funds_display'] = 'Business Funds: $%s',
    ['insufficient_funds_display'] = '❌ Insufficient Funds',
    ['already_purchased'] = 'Already Purchased',
    ['no_machines_available'] = 'No machines available for purchase',
    ['vertical_mill'] = 'Vertical Mill',
    ['tire_lathe'] = 'Tire Lathe',
    ['drill_press'] = 'Drill Press',
    -- Worker Management System
    ['recruit_worker'] = 'Recruit Worker',
    ['recruit_worker_desc'] = 'Recruit the nearest player as a worker',
    ['fire_workers'] = 'Fire Workers',
    ['fire_workers_desc'] = 'Remove workers from the business',
    ['manage_worker_access'] = 'Manage Worker Access',
    ['manage_worker_access_desc'] = 'View and manage worker permissions',
    ['business_logs'] = 'Business Logs',
    ['business_logs_desc'] = 'View recent business activity',
    -- Worker Recruitment
    ['no_players_nearby'] = 'Nobody is nearby to recruit',
    ['recruit_worker_header'] = 'Recruit Worker',
    ['recruit_worker_confirm'] = 'Do you want to recruit %s (ID: %s) as a worker?',
    ['worker_recruited_success'] = 'Worker recruited successfully!',
    ['worker_recruit_failed'] = 'Failed to recruit worker!',
    ['recruitment_disabled'] = 'Worker recruitment is disabled for this shop!',
    ['max_workers_reached'] = 'Maximum number of workers has been reached for this shop!',
    ['worker_recruited_notification'] = 'You have been recruited as a worker at %s by %s',
    -- Worker Management
    ['no_workers_found'] = 'No workers found',
    ['no_workers_to_fire'] = 'No workers to fire',
    ['workers_menu_title'] = 'Workers - %s',
    ['fire_workers_menu_title'] = 'Fire Workers - %s',
    ['edit_worker_title'] = 'Edit Worker - %s',
    ['access_denied'] = 'Access denied',
    ['no_management_access'] = 'You don\'t have access to any management functions',
    -- Worker Access Types
    ['access_contracts'] = 'Contracts',
    ['access_machines'] = 'Machines', 
    ['access_funds'] = 'Funds',
    ['access_hiring'] = 'Hiring',
    ['access_firing'] = 'Firing',
    ['access_permissions'] = 'Permissions',
    ['no_access'] = 'No Access',
    -- Worker Access
    ['contracts_enabled'] = '📋 Can generate special vehicle contracts',
    ['contracts_disabled'] = '❌ Cannot generate contracts',
    ['contracts_warning'] = 'This will allow the worker to generate special contracts for high-demand vehicles.',
    ['machines_enabled'] = '🔧 Can use breakdown machines and equipment',
    ['machines_disabled'] = '❌ Cannot use machines',
    ['machines_warning'] = 'This will allow the worker to use all breakdown machines in the shop.',
    ['funds_enabled'] = '💰 Can withdraw money and purchase equipment',
    ['funds_disabled'] = '❌ Cannot manage finances',
    ['funds_warning'] = 'This will allow the worker to withdraw funds and make purchases for the business.',
    ['hiring_enabled'] = '👥 Can recruit new workers',
    ['hiring_disabled'] = '❌ Cannot hire workers',
    ['hiring_warning'] = 'This will allow the worker to recruit new team members.',
    ['firing_enabled'] = '🚫 Can fire other workers',
    ['firing_disabled'] = '❌ Cannot fire workers',
    ['firing_warning'] = 'This will allow the worker to permanently remove other workers from the business.',
    ['permissions_enabled'] = '🔑 Can manage other workers\' permissions',
    ['permissions_disabled'] = '❌ Cannot manage permissions',
    ['permissions_warning'] = 'This will allow the worker to grant or revoke access for other workers.',
    -- Worker Actions
    ['fire_worker'] = 'Fire Worker',
    ['fire_worker_confirm'] = 'Are you sure you want to fire %s?  \\n\\n⚠️ This action cannot be undone!',
    ['fire_worker_detailed_confirm'] = 'Are you sure you want to fire %s?  \\n\\nThis action cannot be undone. They will lose all access immediately and will need to be re-recruited if you want them back.',
    ['fire_worker_success'] = 'Worker fired successfully!',
    ['fire_worker_failed'] = 'Failed to fire worker!',
    ['fire_worker_no_permission'] = 'You don\'t have permission to fire workers',
    ['fire_worker_no_permission_desc'] = '❌ You don\'t have permission to fire workers',
    ['fire_worker_desc'] = '⚠️ Permanently remove %s from the business',
    ['fire_worker_menu_desc'] = 'Permanently remove this worker from the business',
    -- Access Management
    ['confirm_access_change'] = 'Confirm Access Change',
    ['confirm_access_change_content_warning'] = 'Are you sure you want to %s %s access for %s?  \\n\\n⚠️ %s',
    ['confirm_access_change_content'] = 'Are you sure you want to %s %s access for %s?  \\n\\n%s',
    ['access_change_confirm'] = 'Are you sure you want to %s %s access for %s?\\n\\n  ⚠️ %s',
    ['access_updated_success'] = 'Access updated successfully!',
    ['access_update_failed'] = 'Failed to update access!',
    ['grant_access'] = 'Grant',
    ['remove_access'] = 'Remove',
    -- Business Logs
    ['no_business_logs'] = 'No business logs found',
    ['business_logs_title'] = '📊 Business Logs - %s',
    ['log_time'] = '⏰ Time',
    ['log_user'] = '👤 User', 
    ['log_action'] = '📋 Action',
    ['log_details'] = '📝 Details',
    ['log_no_details'] = 'No additional details',
    ['log_worker_label'] = '👤 Worker:',
    ['log_access_label'] = '🔑 Access:',
    ['log_machine_label'] = '🔧 Machine:',
    ['log_price_label'] = '💰 Price:',
    -- Business Log Actions
    ['log_action_purchased_machine'] = 'Purchased Machine',
    ['log_action_recruited_worker'] = 'Recruited Worker',
    ['log_action_added_access'] = 'Added Worker Access',
    ['log_action_removed_access'] = 'Removed Worker Access',
    ['log_action_fired_worker'] = 'Fired Worker',

    -- Business Log Detail Templates
    ['log_machine_purchase_details'] = 'Machine: %s, Price: $%s',
    ['log_worker_recruit_details'] = 'Worker: %s',
    ['log_access_change_details'] = 'Worker: %s, Access: %s',
    ['log_worker_fire_details'] = 'Worker: %s',

    ['access_type_contracts'] = 'Contracts',
    ['access_type_machines'] = 'Machines',
    ['access_type_funds'] = 'Funds',
    ['access_type_hiring'] = 'Hiring',
    ['access_type_firing'] = 'Firing',
    ['access_type_permissions'] = 'Permission Management',

    ['webhook_chop_log_title'] = '**Chop Shop Log**',
    ['webhook_chop_log_footer'] = 'Chop Shop Logs',
    ['webhook_vehicle_chopped'] = ':car: %s has chopped a %s at %s and recieved %s - Identifier: %s',
    ['webhook_contract_completed'] = ':moneybag: %s has completed a contract for %s and recieved an extra $%s - Vehicle: %s- Identifier: %s',
    ['chop_only_worker'] = 'Only trained workers can use this chop shop!',
    ['only_worker'] = 'You must be trained to use this machine!',
    ['cooldown_time_remaining'] = 'Please wait %s seconds before generating another contract.',
    ['already_owns_shop'] = 'You already own a chop shop!',
    ['shop_already_owned'] = 'This shop has already been purchased by someone else!',
    ['insufficient_funds'] = 'You do not have enough money!',
    ['missing_part'] = 'You do not have the required part!',
}