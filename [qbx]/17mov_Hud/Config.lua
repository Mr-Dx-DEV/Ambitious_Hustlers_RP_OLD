-- { 17movement.net } --
Config = {}
Config.Autoinstall = false -- Automatic install to another scritps. WORKS ONLY IN OLDER VERSIONS OF SERVER ARTEFACTS! (Older than 11364 for Linux and 11353 for Windows)
Config.UseMPH = false
Config.CompassFollowGameCam = true
Config.SoundVolume = 1.0
Config.DefaultVoiceMode = 2
Config.MaxVoiceMode = 3
Config.EnableSpeedometer = true     -- If you want to disable speedometer for aby reason just set it to false
Config.MaxNotifyStack = 5           -- Max ammount of notifcations "per once". All notifications above this number wait until the old ones disappear
Config.ShowDateIfTimeIsReal = false -- If you set time type to "real" does should also display date?
Config.MaxUnderwaterTime = 40.0

Config.SeatBelts = {
    Enable = true,                                  -- You can just disable whole system
    Key = "B",                                      -- Fasten key
    AllowExit = false,                              -- If belts fasten player should be able to exit from vehicle?
    BlacklistedClasses = { 8, 13, 14 },             -- In this classes there is no seatbelts
    BlacklistedModels = {},                         -- Enter here models that doesn't have seatbelts. Example: BlacklistedModels = { `sultan`, `zentorno` },
    Warning = true,                                 -- Should play *beep* *beep* when player driving with not fasten belts
    WarningVolume = 30,                             -- Volume of warning sound Scale: <0-100>
    WarningSpeed = 15,                              -- Speed above you will hear a warning
    TogglingSound = true,                           -- Play soung if toggle betls
    TogglingSoundVolume = 30,                       -- Volume of toggling sound
    TogglingSoundIsGlobal = false,                  -- Every player in nearby should hear sound or only player that toggling?
    TogglingSoundIsGlobalDistance = 5.0,            -- If global function enabled then you can specify distance here
}

Config.DarkModeStartsAt = "21:00"
Config.DarkModeEndsAt = "6:00"

Config.SettingsKeybind = "I"

Config.BigRadarKey = nil        -- You can add possiblity to open big radar when holding key. Key is not a KeyMapping, but the control index from fivem docs.
Config.ShowRadarIfHidden = true -- If radar is hidden and you set Config.BigRadarKey then key also show radar

-- Stress system
Config.EnableStress = true           -- Use build-in stress system
Config.AddStressWhileShooting = false -- Should add stress while shooting?
Config.StressingSpeed = 100          -- Speed above which you start to get stressed
Config.MinimumStressForEffects = 50  -- Minimum Stress amount to start effects
Config.WhtielistedWeapons = {        -- Here you can add some weapon models that "bypassing" stress system (not adding stress while shooting)
    -- Just add weapons models like bellow:
    -- `weapon_pistol`,
}

Config.EnableRadarZoom = false       -- If your minimap is blurred, set this to true.
Config.RadarZoom = 1000              -- Radar Zoom

Config.ComponentsToHide = { 2, 6, 7, 8, 9, 22 }

-- Here you can add vehicle by models in which speedometer doesn't appear
Config.BlacklistedVehicleModels = {
    -- Just add as much as you want like bellow:
    -- `sultan`,
}

-- Here you can add vehicle classes in which speedometer doesn't appear
Config.BlacklistedVehicleClasses = {
    -- 0, -- Compacts
    -- 1, -- Sedans
    -- 2, -- SUVs
    -- 3, -- Coupes
    -- 4, -- Muscle
    -- 5, -- Sports Classics
    -- 6, -- Sports
    -- 7, -- Super
    -- 8, -- Motorcycles
    -- 9, -- Off-road
    -- 10, -- Industrial
    -- 11, -- Utility
    -- 12, -- Vans
    13, -- Cycles
    -- 14, -- Boats
    -- 15, -- Helicopters
    -- 16, -- Planes
    -- 17, -- Service
    -- 18, -- Emergency
    -- 19, -- Military
    -- 20, -- Commercial
    -- 21, -- Trains
    -- 22, -- Open Wheel
}

Config.StressEffects = {
    {
        Min = 50,
        Max = 60,
        Timeout = math.random(50000, 60000),
        Blur = 1500,
    },
    {
        Min = 60,
        Max = 70,
        Timeout = math.random(40000, 50000),
        Blur = 2000,
    },
    {
        Min = 70,
        Max = 80,
        Timeout = math.random(30000, 40000),
        Blur = 2500,
    },
    {
        Min = 80,
        Max = 90,
        Timeout = math.random(20000, 30000),
        Blur = 3000,
    },
    {
        Min = 90,
        Max = 100,
        Timeout = math.random(10000, 20000),
        Blur = 3500,
        RagdollTime = 2000,
    },
}

-- Here you can confugure some notifications when status if lower/bigger than the set value
Config.StatusNotifications = {
    -- {
    -- status (Status type): string["Health", "Vest", "Hunger", "Thirst", "Stress", "Oxygen", "Stamina"]
    -- lowerThan (Show notification when status is lower than): number<0, 100>
    -- biggerThan (Show notification when status is bigger than): number<0, 100>
    -- notifyTitle (Notify title): string
    -- notifyMessage (Notify message): string
    -- },
    {
        status = "Thirst",
        lowerThan = 10,
        notifyTitle = "Thirsty",
        notifyMessage = "You are feeling thirsty. Drink something",
    },
    {
        status = "Hunger",
        lowerThan = 10,
        notifyTitle = "Hungry",
        notifyMessage = "You are feeling hungry. Eat something",
    },
}

-- Default HUD colors. NOTE: colors must be specified as 8 character hex code (first 6 letters = color, 2 last letters = opacity)
Config.DefaultColors = {
    ['light'] = {
        ["--color-primary"] = "#679bffff",
        ["--color-secondary"] = "#ffffffff",
        ["--color-text-primary"] = "#ffffffff",
        ["--color-text-secondary"] = "#ffffffb0",
        ["--color-transparent"] = "#c2c2c24c",
    },
    ['dark'] = {
        ["--color-primary"] = "#679bffff",
        ["--color-secondary"] = "#ffffffff",
        ["--color-text-primary"] = "#ffffffff",
        ["--color-text-secondary"] = "#ffffffb0",
        ["--color-transparent"] = "#0000004c",
    }
}

-- Here you can disable some settings, or disable the whole command with keybind
Config.EnableSettings = true
Config.CommandString = "openHudSettings"
Config.Settings = {
    ["scale"] = true,
    ["positions"] = true,
    ["colors"] = true,
    ["theme"] = true,
    ["timeType"] = true,
    ["speed"] = true,
    ["minimap"] = true,
    ["cinematic"] = true,
    ["volume"] = true,
    ["healthAndVest"] = true,
    ["food"] = true,
    ["stress"] = true,
    ["oxygen"] = true,
    ["stamina"] = true,
    ["voice"] = true,
    ["location"] = true,
    ["radio"] = true,
    ["time"] = true,
    ["cash"] = true,
    ["dirt_money"] = true,
    ["society_money"] = true,
    ["bank"] = true,
    ["weapon"] = true,
    ["serverId"] = true,
    ["job"] = true,
}

-- Default HUD settings
Config.DefaultSettings = {
    ['AutoTheme'] = true,      -- Values: [true, false]. Enables that theme work in automatic mode (depends from time)
    ['DarkMode'] = false,      -- Values: [true, false]. If AutoTheme is false, then the hud theme will be set to this value
    ['Time'] = "server",       -- Values: ['server', 'real']. Should display server time or real time?
    ['SpeedUnits'] = "kmh",    -- Values: ['kmh', 'mph']. Default speed units. (NOTE: DO NO TOUCH! Sets automatically from Config.UseMPH)
    ['Map'] = "inCar",         -- Values: [true, false, 'inCar']. When radar should be displayed
    ['CinematicMode'] = false, -- Values: [true, false]. Is that CinematicMode enabled
    ['Scale'] = 50,     -- Values: <0, 100>. Default HUD scale
    ['NotifyVolume'] = 50,     -- Values: <0, 100>. Default notifications sounds volume
    ['healthAndVest'] = true,  -- Values: [true, <0,1>]. Displaying Health and Vest componenets. True - show always. Number - Show only is lower than
    ['food'] = true,           -- Values: [true, <0,1>]. Displaying Hunger and Thirt componenet. True - show always. Number - Show only is lower than
    ['stress'] = true,         -- Values: [true, <0,1>]. Displaying Stress componenet. True - show always. Number - Show only is lower than
    ['oxygen'] = true,         -- Values: [true, <0,1>]. Displaying Oxygen component. True - show always. Number - Show only is lower than
    ['stamina'] = true,        -- Values: [true, <0,1>]. Displaying Stamina component. True - show always. Number - Show only is lower than
    ['voice'] = true,          -- Values: [true, false]. Show Microphone component
    ['location'] = true,       -- Values: [true, false, 'inCar']. Show location component
    ['radio'] = true,          -- Values: [true, false]. Show radio component
    ['time'] = true,           -- Values: [true, false]. Show time component
    ['cash'] = true,           -- Values: [true, false]. Show cash component
    ['dirt_money'] = false,     -- Values: [true, false]. Show dirt_money component
    ['society_money'] = false,  -- Values: [true, false]. Show society_money component
    ['bank'] = true,           -- Values: [true, false]. Show bank component
    ['weapon'] = true,         -- Values: [true, false]. Show weapon component
    ['serverId'] = true,       -- Values: [true, false]. Show server id component
    ['job'] = true,            -- Values: [true, false]. Show job component
}

-- Default HUD components positions
Config.DefaultPositions = {
    -- Values: [false, { x = <0,1>, y = <0,1> }]
    -- False - default position. Table with numbers - percent of screen that component will be placed
    -- Ex. { x: 0.5, y: 0.5 } will place component at center of screen
    ["location"] = false,
    ["time"] = false,
    ["radio"] = false,
    ["bank"] = false,
    ["cash"] = false,
    ["dirt_money"] = false,
    ["society_money"] = false,
    ["weapon"] = false,
    ["healthAndVest"] = false,
    ["food"] = false,
    ["voice"] = false,
    ["stress"] = false,
    ["oxygen"] = false,
    ["stamina"] = false,
    ["vehicle"] = false,
    ["helpNotification"] = false,
    ["notifications"] = false,
    ["serverId"] = false,
    ["job"] = false,
}

-- Here you can absolutly remove some components from HUD. Values: [true, false]
Config.Components = {
    ["health"] = true,
    ["healthAndVest"] = true,
    ["oxygen"] = true,
    ["stamina"] = false,
    ["food"] = true,
    ["stress"] = true,
    ["radio"] = true,
    ["weapon"] = true,
    ["ammo"] = true,
    ["voice"] = true,
    ["cash"] = true,
    ["dirt_money"] = false,
    ["society_money"] = false,
    ["bank"] = true,
    ["time"] = true,
    ["location"] = true,
    ["serverId"] = false,
    ["job"] = false,
}

-- Your langugage
Config.Lang = {
    ["DefaultNotification"] = "Notification",
    ['DefaultProgressBar'] = "Progress bar",
    ['AddingStress'] = "You are feeling more stressed",
    ['RemovingStress'] = "You are feeling more relaxed",
    ["CancelProgressHint"] = "Press ~INPUT_VEH_DUCK~ to cancel",
    ["KeybindDescription"] = "Open hud settings",
    ["Location"] = "Location",
    ["NUI_SERVER_TIME"] = "Time",
    ["NUI_RADIO_FREQUENCY"] = "Radio MHz",
    ["NUI_BANK"] = "Bank",
    ["NUI_CASH"] = "Cash",
    ["NUI_DIRT_MONEY"] = "Dirt money",
    ["NUI_SOCIETY_MONEY"] = "Society money",
    ["NUI_MPH"] = "MPH",
    ["NUI_KMH"] = "KMH",
    ["NUI_SERVER_ID"] = "Server ID",
    ["NUI_DEFAULT_NOTIFICATION_TITLE"] = "Notification",
    ["NUI_DEFAULT_NOTIFICATION_MESSAGE"] = "This is example notification",
    ["NUI_DEFAULT_HELP_NOTIFICATION"] = "This is ~INPUT_CONTEXT~ example help notification",
    ["NUI_SETTINGS_HEADER"] = "Hud <strong>Settings</strong>",
    ["NUI_SETTINGS_HEADER_DESCRIPTION"] =
    "Here you can change some main hud features",
    ["NUI_SETTINGS_EXIT"] = 'Press <span class="button">ESC</span> to exit',
    ["NUI_SETTINGS_SCALE"] = "Adjust <strong>Scale</strong>",
    ["NUI_SETTINGS_SCALE_RESET_BTN"] = "Reset",
    ["NUI_SETTINGS_POSITIONS"] = "Change Icons <strong>Position</strong>",
    ["NUI_SETTINGS_POSITIONS_SELECT_BTN"] = "Adjust",
    ["NUI_SETTINGS_POSITIONS_RESET_BTN"] = "Reset",
    ["NUI_SETTINGS_POSITIONS_CANCEL"] = "Press <span>ESC</span> to cancel",
    ["NUI_SETTINGS_POSITIONS_SAVE"] = "Press <span>Enter</span> to save",
    ["NUI_SETTINGS_COLORS"] = "Hud <strong>Colors</strong>",
    ["NUI_SETTINGS_COLORS_SELECT_BTN"] = "Select Colors",
    ["NUI_SETTINGS_CHOOSE_THEME"] = "Choose <strong>Theme</strong>",
    ["NUI_SETTINGS_THEME_AUTO"] = "Auto",
    ["NUI_SETTINGS_THEME_LIGHT"] = "Light",
    ["NUI_SETTINGS_THEME_DARK"] = "Dark",
    ["NUI_SETTINGS_TIME"] = "Time Component",
    ["NUI_SETTINGS_SERVERTIME"] = "Game Time",
    ["NUI_SETTINGS_REALTIME"] = "Real Life Time",
    ["NUI_SETTINGS_SPPED_UNIT"] = "Speed Unit",
    ["NUI_SETTINGS_DISPLAY_MINIMAP"] = "Display Minimap",
    ["NUI_SETTINGS_SHOW"] = "Show",
    ["NUI_SETTINGS_HIDE"] = "Hide",
    ["NUI_SETTINGS_ONLY_IN_CAR"] = "Only in car",
    ["NUI_SETTINGS_SHOW_IF_UNDER"] = "Show if under",
    ["NUI_SETTINGS_SHOW_IF_ABOVE"] = "Show if above",
    ["NUI_SETTINGS_CINEMATIC_MODE"] = "Cinematic Mode",
    ["NUI_SETTINGS_VOLUME"] = "Notification Volume",
    ["NUI_SETTINGS_STATUS_HEADER"] = "Hud <strong>Status Elements</strong>",
    ["NUI_SETTINGS_STATUS_HEADER_DESCRIPTION"] =
    "Here you can change some display related settings",
    ["NUI_SETTINGS_HEALTH_AND_ARMOR"] = "Health and Armor",
    ["NUI_SETTINGS_HUNGER_AND_THIRST"] = "Hunger and Thirst",
    ["NUI_SETTINGS_STRESS"] = "Stress",
    ["NUI_SETTINGS_OXYGEN"] = "Oxygen",
    ["NUI_SETTINGS_STAMINA"] = "Stamina",
    ["NUI_SETTINGS_MICROPHONE"] = "Microphone",
    ["NUI_SETTINGS_STREET_NAMES"] = "Street names",
    ["NUI_SETTINGS_RADIO"] = "Radio",
    ["NUI_SETTINGS_GAME_TIME"] = "Game time",
    ["NUI_SETTINGS_CASH"] = "Cash",
    ["NUI_SETTINGS_DIRT_MONEY"] = "Dirt Money",
    ["NUI_SETTINGS_SOCIETY_MONEY"] = "Society Money",
    ["NUI_SETTINGS_BANK"] = "Bank money",
    ["NUI_SETTINGS_JOB"] = "Job",
    ["NUI_SETTINGS_SERVER_ID"] = "Server ID",
    ["NUI_SETTINGS_WEAPON"] = "Current Weapon",
    ["NUI_SETTINGS_WANT_TO_SAVE"] = "Do you want to save settings?",
    ["NUI_SETTINGS_SAVE"] = "Save",
    ["NUI_SETTINGS_CANCEL"] = "Cancel",
    ["NUI_SETTINGS_RESET"] = "Reset",
    ["NUI_COLORS_HEADER"] = "Hud <strong>Edit Colors</strong>",
    ["NUI_COLORS_HEADER_DESCRIPTION"] =
    "Here you can change colors for choosed theme",
    ["NUI_COLORS_CHOOSE_THEME"] = "Choose <strong>Theme</strong>",
    ["NUI_COLORS_SELECT_COLORS"] = "Select Colors",
    ["NUI_COLORS_WANT_TO_SAVE"] = "Do you want to save?",
}

-- List of weapons. You can edit names and ammo displaying
Config.Weapons = {
    [`weapon_dagger`] = {
        label = "Antique Cavalry Dagger",
        displayAmmo = false,
    },
    [`weapon_bat`] = {
        label = "Baseball Bat",
        displayAmmo = false,
    },
    [`weapon_bottle`] = {
        label = "Broken Bottle",
        displayAmmo = false,
    },
    [`weapon_crowbar`] = {
        label = "Crowbar",
        displayAmmo = false,
    },
    [`weapon_flashlight`] = {
        label = "Flashlight",
        displayAmmo = false,
    },
    [`weapon_golfclub`] = {
        label = "Golf Club",
        displayAmmo = false,
    },
    [`weapon_hammer`] = {
        label = "Hammer",
        displayAmmo = false,
    },
    [`weapon_hatchet`] = {
        label = "Hatchet",
        displayAmmo = false,
    },
    [`weapon_knuckle`] = {
        label = "Brass Knuckles",
        displayAmmo = false,
    },
    [`weapon_knife`] = {
        label = "Knife",
        displayAmmo = false,
    },
    [`weapon_machete`] = {
        label = "Machete",
        displayAmmo = false,
    },
    [`weapon_switchblade`] = {
        label = "Switchblade",
        displayAmmo = false,
    },
    [`weapon_nightstick`] = {
        label = "Nightstick",
        displayAmmo = false,
    },
    [`weapon_wrench`] = {
        label = "Pipe Wrench",
        displayAmmo = false,
    },
    [`weapon_battleaxe`] = {
        label = "Battle Axe",
        displayAmmo = false,
    },
    [`weapon_poolcue`] = {
        label = "Pool Cue",
        displayAmmo = false,
    },
    [`weapon_stone_hatchet`] = {
        label = "Stone Hatchet",
        displayAmmo = false,
    },
    [`weapon_candycane`] = {
        label = "Candy Cane",
        displayAmmo = false,
    },
    [`weapon_pistol`] = {
        label = "Pistol",
        displayAmmo = true,
    },
    [`weapon_pistol_mk2`] = {
        label = "Pistol Mk II",
        displayAmmo = true,
    },
    [`weapon_combatpistol`] = {
        label = "Combat Pistol",
        displayAmmo = true,
    },
    [`weapon_appistol`] = {
        label = "AP Pistol",
        displayAmmo = true,
    },
    [`weapon_stungun`] = {
        label = "Stun Gun",
        displayAmmo = false,
    },
    [`weapon_pistol50`] = {
        label = "Pistol .50",
        displayAmmo = true,
    },
    [`weapon_snspistol`] = {
        label = "SNS Pistol",
        displayAmmo = true,
    },
    [`weapon_snspistol_mk2`] = {
        label = "SNS Pistol Mk II",
        displayAmmo = true,
    },
    [`weapon_heavypistol`] = {
        label = "Heavy Pistol",
        displayAmmo = true,
    },
    [`weapon_vintagepistol`] = {
        label = "Vintage Pistol",
        displayAmmo = true,
    },
    [`weapon_flaregun`] = {
        label = "Flare Gun",
        displayAmmo = true,
    },
    [`weapon_marksmanpistol`] = {
        label = "Marksman Pistol",
        displayAmmo = true,
    },
    [`weapon_revolver`] = {
        label = "Heavy Revolver",
        displayAmmo = true,
    },
    [`weapon_revolver_mk2`] = {
        label = "Heavy Revolver Mk II",
        displayAmmo = true,
    },
    [`weapon_doubleaction`] = {
        label = "Double Action Revolver",
        displayAmmo = true,
    },
    [`weapon_raypistol`] = {
        label = "Up-n-Atomizer",
        displayAmmo = false,
    },
    [`weapon_ceramicpistol`] = {
        label = "Ceramic Pistol",
        displayAmmo = true,
    },
    [`weapon_navyrevolver`] = {
        label = "Navy Revolver",
        displayAmmo = true,
    },
    [`weapon_gadgetpistol`] = {
        label = "Perico Pistol",
        displayAmmo = true,
    },
    [`weapon_stungun_mp`] = {
        label = "Stun Gun",
        displayAmmo = false,
    },
    [`weapon_pistolxm3`] = {
        label = "WM 29 Pistol",
        displayAmmo = true,
    },
    [`weapon_microsmg`] = {
        label = "Micro SMG",
        displayAmmo = true,
    },
    [`weapon_smg`] = {
        label = "SMG",
        displayAmmo = true,
    },
    [`weapon_smg_mk2`] = {
        label = "SMG Mk II",
        displayAmmo = true,
    },
    [`weapon_assaultsmg`] = {
        label = "Assault SMG",
        displayAmmo = true,
    },
    [`weapon_combatpdw`] = {
        label = "Combat PDW",
        displayAmmo = true,
    },
    [`weapon_machinepistol`] = {
        label = "Machine Pistol",
        displayAmmo = true,
    },
    [`weapon_minismg`] = {
        label = "Mini SMG",
        displayAmmo = true,
    },
    [`weapon_raycarbine`] = {
        label = "Unholy Hellbringer",
        displayAmmo = true,
    },
    [`weapon_tecpistol`] = {
        label = "Tactical SMG",
        displayAmmo = true,
    },
    [`weapon_pumpshotgun`] = {
        label = "Pump Shotgun",
        displayAmmo = true,
    },
    [`weapon_pumpshotgun_mk2`] = {
        label = "Pump Shotgun Mk II",
        displayAmmo = true,
    },
    [`weapon_sawnoffshotgun`] = {
        label = "Sawed-Off Shotgun",
        displayAmmo = true,
    },
    [`weapon_assaultshotgun`] = {
        label = "Assault Shotgun",
        displayAmmo = true,
    },
    [`weapon_bullpupshotgun`] = {
        label = "Bullpup Shotgun",
        displayAmmo = true,
    },
    [`weapon_musket`] = {
        label = "Musket",
        displayAmmo = true,
    },
    [`weapon_heavyshotgun`] = {
        label = "Heavy Shotgun",
        displayAmmo = true,
    },
    [`weapon_dbshotgun`] = {
        label = "Double Barrel Shotgun",
        displayAmmo = true,
    },
    [`weapon_autoshotgun`] = {
        label = "Sweeper Shotgun",
        displayAmmo = true,
    },
    [`weapon_combatshotgun`] = {
        label = "Combat Shotgun",
        displayAmmo = true,
    },
    [`weapon_assaultrifle`] = {
        label = "Assault Rifle",
        displayAmmo = true,
    },
    [`weapon_assaultrifle_mk2`] = {
        label = "Assault Rifle Mk II",
        displayAmmo = true,
    },
    [`weapon_carbinerifle`] = {
        label = "Carbine Rifle",
        displayAmmo = true,
    },
    [`weapon_carbinerifle_mk2`] = {
        label = "Carbine Rifle Mk II",
        displayAmmo = true,
    },
    [`weapon_advancedrifle`] = {
        label = "Advanced Rifle",
        displayAmmo = true,
    },
    [`weapon_specialcarbine`] = {
        label = "Special Carbine",
        displayAmmo = true,
    },
    [`weapon_specialcarbine_mk2`] = {
        label = "Special Carbine Mk II",
        displayAmmo = true,
    },
    [`weapon_bullpuprifle`] = {
        label = "Bullpup Rifle",
        displayAmmo = true,
    },
    [`weapon_bullpuprifle_mk2`] = {
        label = "Bullpup Rifle Mk II",
        displayAmmo = true,
    },
    [`weapon_compactrifle`] = {
        label = "Compact Rifle",
        displayAmmo = true,
    },
    [`weapon_militaryrifle`] = {
        label = "Military Rifle",
        displayAmmo = true,
    },
    [`weapon_heavyrifle`] = {
        label = "Heavy Rifle",
        displayAmmo = true,
    },
    [`weapon_tacticalrifle`] = {
        label = "Tactical Rifle",
        displayAmmo = true,
    },
    [`weapon_mg`] = {
        label = "MG",
        displayAmmo = true,
    },
    [`weapon_combatmg`] = {
        label = "Combat MG",
        displayAmmo = true,
    },
    [`weapon_combatmg_mk2`] = {
        label = "Combat MG Mk II",
        displayAmmo = true,
    },
    [`weapon_gusenberg`] = {
        label = "Gusenberg Sweeper",
        displayAmmo = true,
    },
    [`weapon_sniperrifle`] = {
        label = "Sniper Rifle",
        displayAmmo = true,
    },
    [`weapon_heavysniper`] = {
        label = "Heavy Sniper",
        displayAmmo = true,
    },
    [`weapon_heavysniper_mk2`] = {
        label = "Heavy Sniper Mk II",
        displayAmmo = true,
    },
    [`weapon_marksmanrifle`] = {
        label = "Marksman Rifle",
        displayAmmo = true,
    },
    [`weapon_marksmanrifle_mk2`] = {
        label = "Marksman Rifle Mk II",
        displayAmmo = true,
    },
    [`weapon_precisionrifle`] = {
        label = "Precision Rifle",
        displayAmmo = true,
    },
    [`weapon_rpg`] = {
        label = "RPG",
        displayAmmo = true,
    },
    [`weapon_grenadelauncher`] = {
        label = "Grenade Launcher",
        displayAmmo = true,
    },
    [`weapon_grenadelauncher_smoke`] = {
        label = "Grenade Launcher Smoke",
        displayAmmo = true,
    },
    [`weapon_minigun`] = {
        label = "Minigun",
        displayAmmo = true,
    },
    [`weapon_firework`] = {
        label = "Firework Launcher",
        displayAmmo = true,
    },
    [`weapon_railgun`] = {
        label = "Railgun",
        displayAmmo = true,
    },
    [`weapon_hominglauncher`] = {
        label = "Homing Launcher",
        displayAmmo = true,
    },
    [`weapon_compactlauncher`] = {
        label = "Compact Grenade Launcher",
        displayAmmo = true,
    },
    [`weapon_rayminigun`] = {
        label = "Widowmaker",
        displayAmmo = true,
    },
    [`weapon_emplauncher`] = {
        label = "Compact EMP Launcher",
        displayAmmo = true,
    },
    [`weapon_railgunxm3`] = {
        label = "Railgun",
        displayAmmo = true,
    },
    [`weapon_grenade`] = {
        label = "Grenade",
        displayAmmo = true,
    },
    [`weapon_bzgas`] = {
        label = "BZ Gas",
        displayAmmo = true,
    },
    [`weapon_molotov`] = {
        label = "Molotov Cocktail",
        displayAmmo = true,
    },
    [`weapon_stickybomb`] = {
        label = "Sticky Bomb",
        displayAmmo = true,
    },
    [`weapon_proxmine`] = {
        label = "Proximity Mines",
        displayAmmo = true,
    },
    [`weapon_snowball`] = {
        label = "Snowballs",
        displayAmmo = true,
    },
    [`weapon_pipebomb`] = {
        label = "Pipe Bombs",
        displayAmmo = true,
    },
    [`weapon_ball`] = {
        label = "Baseball",
        displayAmmo = true,
    },
    [`weapon_smokegrenade`] = {
        label = "Tear Gas",
        displayAmmo = true,
    },
    [`weapon_flare`] = {
        label = "Flare",
        displayAmmo = true,
    },
    [`weapon_acidpackage`] = {
        label = "Acid Package",
        displayAmmo = true,
    },
    [`weapon_petrolcan`] = {
        label = "Jerry Can",
        displayAmmo = true,
    },
    [`weapon_fireextinguisher`] = {
        label = "Fire Extinguisher",
        displayAmmo = true,
    },
    [`weapon_hazardcan`] = {
        label = "Hazardous Jerry Can",
        displayAmmo = true,
    },
    [`weapon_fertilizercan`] = {
        label = "Fertilizer Can",
        displayAmmo = true,
    },
}
-- { 17movement.net } --
