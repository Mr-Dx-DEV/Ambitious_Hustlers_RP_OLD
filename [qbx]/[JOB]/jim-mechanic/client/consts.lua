-- Rim wheel types
wheelType = {
    [0]  = locale("rimsMod", "sportRims"),
    [1]  = locale("rimsMod", "muscleRims"),
    [2]  = locale("rimsMod", "lowriderRims"),
    [3]  = locale("rimsMod", "suvRims"),
    [4]  = locale("rimsMod", "offroadRims"),
    [5]  = locale("rimsMod", "tunerRims"),
    [6]  = locale("rimsMod", "motorcycleRims"),
    [7]  = locale("rimsMod", "highendRims"),
    [8]  = locale("rimsMod", "bennysOriginals"),
    [9]  = locale("rimsMod", "bennysBespoke"),
    [10] = locale("rimsMod", "openWheel"),
    [11] = locale("rimsMod", "streetRims"),
    [12] = locale("rimsMod", "trackRims"),
}

local Enable = Config.Emergency.CosmeticTable
-- EMS/PD bench cosmetic table
emergencyCosmeticTable = { -- Don't touch if you don't know what this does
    { id = 48, header = locale("liveryMod", "menuHeader"),   enable = Enable["Liverys"] },
    { header = locale("liveryMod", "menuHeader"),            oldLiv = Enable["OldLiverys"] },
    { header = locale("liveryMod", "menuOldHeader"),         roofLiv = Enable["RoofLiverys"] },
    { header = locale("hornsMod", "menuHeader"),             horn = Enable["Horn"] },
    { id = 7,  header = locale("hoodMod", "menuHeader"),     enable = Enable["Hood"] },
    { id = 4,  header = locale("exhaustMod", "menuHeader"),  enable = Enable["Exhaust"] },
    { id = 5,  header = locale("rollCageMod", "menuHeader"), enable = Enable["RollCage"] },
    { id = 10, header = locale("roofMod", "menuHeader"),     enable = Enable["Roof"] },
    { id = 0,  header = locale("spoilersMod", "menuHeader"), enable = Enable["Spoiler"] },
    { id = 32, header = locale("seatMod", "menuHeader"),     enable = Enable["Seats"] },
    { id = 25, header = locale("plates", "plateHolder"),       enable = Enable["PlateHolder"] },
    { id = 26, header = locale("plates", "vanityPlates"),       enable = Enable["VanityPlate"] },
    { header = locale("plates", "customPlates"),                plate = Enable["CustomPlate"] },
    { id = 3,  header = locale("checkDetails", "skirtsLabel"),    enable = Enable["Skirts"] },
    { id = 9,  header = locale("checkDetails", "rightFenderLabel"),       enable = Enable["RightFender"] },
    { id = 8,  header = locale("checkDetails", "leftFenderLabel"),       enable = Enable["LeftFender"] },
    { id = 6,  header = locale("bumpers", "grilleMenu"),  enable = Enable["Grille"] },
    { id = 1,  header = locale("bumpers", "frontBumperMenu"), enable = Enable["FrontBumper"] },
    { id = 2,  header = locale("bumpers", "backBumperMenu"), enable = Enable["BackBumper"] },
    { id = 27, header = locale("checkDetails", "trimALabel"),     enable = Enable["TrimA"] },
    { id = 44, header = locale("checkDetails", "trimBLabel"),     enable = Enable["TrimB"] },
    { id = 37, header = locale("checkDetails", "trunksLabel"),     enable = Enable["Trunk"] },
    { id = 39, header = locale("checkDetails", "engineBlocksLabel"),     enable = Enable["EngineBlock"] },
    { id = 40, header = locale("checkDetails", "airFiltersLabel"),     enable = Enable["Filter"] },
    { id = 41, header = locale("checkDetails", "engineStrutLabel"),     enable = Enable["Struts"] },
    { id = 38, header = locale("checkDetails", "hydraulicsLabel"),     enable = Enable["Hydraulics"] },
    { id = 42, header = locale("checkDetails", "archCoversLabel"),     enable = Enable["ArchCovers"] },
    { id = 45, header = locale("checkDetails", "fuelTanksLabel"),     enable = Enable["FuelTank"] },
    { id = 43, header = locale("checkDetails", "aerialsLabel"),    enable = Enable["Aerials"] },
    { id = 28, header = locale("checkDetails", "ornamentsLabel"),     enable = Enable["Ornaments"] },
    { id = 29, header = locale("checkDetails", "dashboardsLabel"),     enable = Enable["DashBoard"] },
    { id = 30, header = locale("checkDetails", "dialsLabel"),     enable = Enable["Dials"] },
    { id = 31, header = locale("interiorMod", "doorSpeakers"),     enable = Enable["DoorSpeakers"] },
    { id = 33, header = locale("checkDetails", "steeringWheelsLabel"),     enable = Enable["SteeringWheels"] },
    { id = 34, header = locale("checkDetails", "shifterLeversLabel"),     enable = Enable["ShifterLeavers"] },
    { id = 35, header = locale("checkDetails", "plaquesLabel"),     enable = Enable["Plaques"] },
    { id = 36, header = locale("checkDetails", "speakersLabel"),     enable = Enable["Speakers"] },
    { header = locale("policeMenu", "extrasOption"),                extra = Enable["Extras"] },
    { header = locale("windowTints", "menuHeader"),           window = Enable["WindowTints"] },
}

-- main cosmetic table, used for handling what items can do what
cosmeticTable = {
    ["tint_supplies"] = { { header = locale("windowTints", "menuHeader"), window = true } },
    ["horn"] = { { header = locale("hornsMod", "menuHeader"), horn = true } },
    ["hood"] = { { id = 7, header = locale("hoodMod", "menuHeader") }, },
    ["exhaust"] = { { id = 4, header = locale("exhaustMod", "menuHeader") }, },
    ["rollcage"] = { { id = 5, header = locale("rollCageMod", "menuHeader") }, },
    ["roof"] = { { id = 10, header = locale("rollCageMod", "menuHeader") }, },
    ["spoiler"] = { { id = 0, header = locale("rollCageMod", "menuHeader") }, },
    ["seat"] = { { id = 32, header = locale("rollCageMod", "menuHeader") }, },
    ["customplate"] = {
        { id = 25, header = locale("plates", "plateHolder") },
        { id = 26, header = locale("plates", "vanityPlates") },
        { header = locale("plates", "customPlates"), plate = true },
    },
    ["skirts"] = {
        { id = 3, header = locale("checkDetails", "skirtsLabel") },
        { id = 9, header = locale("checkDetails", "rightFenderLabel") },
        { id = 8, header = locale("checkDetails", "leftFenderLabel") },
    },
    ["livery"] = {
        { id = 48, header = locale("liveryMod", "menuHeader") },
        { header = locale("liveryMod", "menuHeader"), oldLiv = true },
        { header = locale("liveryMod", "menuOldHeader"), roofLiv = true },
    },
    ["bumper"] = {
        { id = 6, header = locale("bumpers", "grilleMenu") },
        { id = 1, header = locale("bumpers", "frontBumperMenu") },
        { id = 2, header = locale("bumpers", "backBumperMenu") },
    },
    ["externals"] = {
        { id = 27, header = locale("checkDetails", "trimALabel") },
        { id = 44, header = locale("checkDetails", "trimBLabel") },
        { id = 37, header = locale("checkDetails", "trunksLabel") },
        { id = 39, header = locale("checkDetails", "engineBlocksLabel") },
        { id = 40, header = locale("checkDetails", "airFiltersLabel") },
        { id = 41, header = locale("checkDetails", "engineStrutLabel") },
        { id = 38, header = locale("checkDetails", "hydraulicsLabel") },
        { id = 42, header = locale("checkDetails", "archCoversLabel") },
        { id = 45, header = locale("checkDetails", "fuelTanksLabel") },
        { id = 43, header = locale("checkDetails", "aerialsLabel") },
        { header = locale("policeMenu", "extrasOption"), extra = true },
    },
    ["internals"] = {
        { id = 28, header = locale("checkDetails", "ornamentsLabel") },
        { id = 29, header = locale("checkDetails", "dashboardsLabel") },
        { id = 30, header = locale("checkDetails", "dialsLabel") },
        { id = 31, header = locale("interiorMod", "doorSpeakers") },
        { id = 33, header = locale("checkDetails", "steeringWheelsLabel") },
        { id = 34, header = locale("checkDetails", "shifterLeversLabel") },
        { id = 35, header = locale("checkDetails", "plaquesLabel") },
        { id = 36, header = locale("checkDetails", "speakersLabel") },
    },
}

-- Admin customs table
adminCosmeticTable = { -- Don't touch if you don't know what this does
    { id = 48, header = locale("liveryMod", "menuHeader"),              icon = "livery", enable = true },
    { header = locale("liveryMod", "menuHeader"),                       icon = "livery", oldLiv = true },
    { header = locale("liveryMod", "menuOldHeader"),                    icon = "livery", roofLiv = true },
    { header = locale("hornsMod", "menuHeader"),                        icon = "horn", horn = true },
    { id = 7,  header = locale("hoodMod", "menuHeader"),                icon = "hood", enable = true },
    { id = 4,  header = locale("exhaustMod", "menuHeader"),             icon = "exhaust", enable = true },
    { id = 5,  header = locale("rollCageMod", "menuHeader"),            icon = "rollcage", enable = true },
    { id = 10, header = locale("roofMod", "menuHeader"),                icon = "roof", enable = true },
    { id = 0,  header = locale("spoilersMod", "menuHeader"),            icon = "spoiler", enable = true },
    { id = 32, header = locale("seatMod", "menuHeader"),                icon = "seat", enable = true },
    { id = 25, header = locale("plates", "plateHolder"),                icon = "customplate", enable = true },
    { id = 26, header = locale("plates", "vanityPlates"),               icon = "customplate", enable =true },
    { header = locale("plates", "customPlates"),                        icon = "customplate", plate = true },
    { id = 3,  header = locale("checkDetails", "skirtsLabel"),          icon = "skirts", enable = true },
    { id = 9,  header = locale("checkDetails", "rightFenderLabel"),     icon = "skirts", enable = true },
    { id = 8,  header = locale("checkDetails", "leftFenderLabel"),      icon = "skirts", enable = true },
    { id = 6,  header = locale("bumpers", "grilleMenu"),                icon = "bumper", enable = true },
    { id = 1,  header = locale("bumpers", "frontBumperMenu"),           icon = "bumper", enable = true },
    { id = 2,  header = locale("bumpers", "backBumperMenu"),            icon = "bumper", enable = true },
    { id = 27, header = locale("checkDetails", "trimALabel"),           icon = "externals", enable = true },
    { id = 44, header = locale("checkDetails", "trimBLabel"),           icon = "externals", enable = true },
    { id = 37, header = locale("checkDetails", "trunksLabel"),          icon = "externals", enable = true },
    { id = 39, header = locale("checkDetails", "engineBlocksLabel"),    icon = "externals", enable = true },
    { id = 40, header = locale("checkDetails", "airFiltersLabel"),      icon = "externals", enable = true },
    { id = 41, header = locale("checkDetails", "engineStrutLabel"),     icon = "externals", enable = true },
    { id = 38, header = locale("checkDetails", "hydraulicsLabel"),      icon = "externals", enable = true },
    { id = 42, header = locale("checkDetails", "archCoversLabel"),      icon = "externals", enable = true },
    { id = 45, header = locale("checkDetails", "fuelTanksLabel"),       icon = "externals", enable = true },
    { id = 43, header = locale("checkDetails", "aerialsLabel"),         icon = "externals", enable = true },
    { id = 28, header = locale("checkDetails", "ornamentsLabel"),       icon = "internals", enable = true },
    { id = 29, header = locale("checkDetails", "dashboardsLabel"),      icon = "internals", enable = true },
    { id = 30, header = locale("checkDetails", "dialsLabel"),           icon = "internals", enable = true },
    { id = 31, header = locale("interiorMod", "doorSpeakers"),          icon = "internals", enable = true },
    { id = 33, header = locale("checkDetails", "steeringWheelsLabel"),  icon = "internals", enable = true },
    { id = 34, header = locale("checkDetails", "shifterLeversLabel"),   icon = "internals", enable = true },
    { id = 35, header = locale("checkDetails", "plaquesLabel"),         icon = "internals", enable = true },
    { id = 36, header = locale("checkDetails", "speakersLabel"),        icon = "internals", enable = true },
    { header = locale("policeMenu", "extrasOption"),                    icon = "externals", extra = true },
    { header = locale("windowTints", "menuHeader"),                     icon = "tint_supplies", window = true },
}

-- Add vehicles here that as supposed to survive being in water
amphibiousVehicles = {
    [`stromberg`] = true,
    [`toreador`] = true,
    [`apc`] = true,
    [`technical2`] = true,
    [`blazer5`] = true,
    [`avisa`] = true,
    -- Add any other amphibious or submersible vehicles here
}

-- List of vehicles that won't be get an odometer + speedometer
odometerBlacklist = {
    [`iak_wheelchair`],
}

-- The list of vehicle models that should be marked as "electric" (this doesn't effect fuel scripts, just the speedometer)
electricCarModels = {
    [`surge`],
    [`voltic`],
    [`voltic2`],
    [`caddy`],
    [`caddy2`],
    [`caddy3`],
    [`airtug`],
}

-- Purge smoke locations that need/can be manually set
manualPurgeLoc = {
    --SUPER CARS--
    [`autarch`] = {
        { 0.25, -0.6, -0.2, 40.0, -80.0, 90.0 }, --Left
        { -0.25, -0.6, -0.2, 40.0, 80.0, -90.0 }, --Right
    },
    [`bullet`] = {
        { 0.60, -1, 0.25, 40.0, 20.0, 0.0 }, --Left
        { -0.60, -1, 0.25, 40.0, -20.0, 0.0 }, --Right
    },
    [`banshee2`] = {
        { 0.40, 0.15, 0.25, 75.0, 20.0, 0.0 }, --Left
        { -0.40, 0.15, 0.25, 75.0, -20.0, 0.0 }, --Right
    },
    [`cheetah`] = {
        { 0.40, 0.15, 0.25, 75.0, 20.0, 0.0 }, --Left
        { -0.40, 0.15, 0.25, 75.0, -20.0, 0.0 }, --Right
    },
    [`cyclone`] = {
        { 0.40, -0.55, 0.05, 75.0, 20.0, 0.0 }, --Left
        { -0.40, -0.55, 0.05, 75.0, -20.0, 0.0 }, --Right
    },
    [`deveste`] = {
        { 0.20, 0.0, 0.19, 75.0, 20.0, 0.0 }, --Left
        { 0.17, -0.15, 0.17, 75.0, 20.0, 0.0 }, --Left
        { 0.15, -0.30, 0.15, 75.0, 20.0, 0.0 }, --Left
        { -0.20, 0.0, 0.19, 75.0, -20.0, 0.0 }, --Right
        { -0.17, -0.15, 0.17, 75.0, -20.0, 0.0 }, --Right
        { -0.15, -0.30, 0.15, 75.0, -20.0, 0.0 }, --Right
    },
    [`emerus`] = {
        { 0.50, 0, 0.19, 60.0, 20.0, 0.0 }, --Left
        { -0.50, 0, 0.19, 60.0, -20.0, 0.0 }, --Right
    },
    [`entity2`] = {
        { 0.60, 0.2, 0.10, 75.0, 20.0, 0.0 }, --Left
        { -0.60, 0.2, 0.10, 75.0, -20.0, 0.0 }, --Right
    },
    [`entityxf`] = {
        { 0.60, 0.2, 0.20, 40.0, 20.0, 0.0 }, --Left
        { -0.60, 0.2, 0.20, 40.0, -20.0, 0.0 }, --Right
    },
    [`fmj`] = {
        { 0.25, -0.6, 0.15, 75.0, 20.0, 0.0 }, --Left
        { -0.25, -0.6, 0.15, 75.0, -20.0, 0.0 }, --Right
    },
    [`furia`] = {
        { 0.40, -0.55, 0.05, 75.0, 20.0, 0.0 }, --Left
        { -0.40, -0.55, 0.05, 75.0, -20.0, 0.0 }, --Right
    },
    [`gp1`] = {
        { 0.25, -0.70, 0.25, 20.0, 20.0, 0.0 }, --Left
        { 0.25, -0.80, 0.25, 20.0, 20.0, 0.0 }, --Left
        { 0.25, -0.90, 0.25, 20.0, 20.0, 0.0 }, --Left

        { -0.25, -0.70, 0.25, 20.0, -20.0, 0.0 }, --Right
        { -0.25, -0.80, 0.25, 20.0, -20.0, 0.0 }, --Right
        { -0.25, -0.90, 0.25, 20.0, -20.0, 0.0 }, --Right
    },
    [`ignus`] = {
        { 0.80, 0.45, 0.15, 75.0, 20.0, 0.0 }, --Left
        { -0.80, 0.45, 0.15, 75.0, -20.0, 0.0 }, --Right
    },
    [`infernus`] = {
        { 0.50, 0.3, 0.45, 50.0, 20.0, 0.0 }, --Left
        { -0.50, 0.3, 0.45, 50.0, -20.0, 0.0 }, --Right
    },
    [`italigtb`] = {
        { 0.30, 2.3, 0.05, 40.0, 30.0, 0.0 }, --Left
        { -0.30, 2.3, 0.05, 40.0, -30.0, 0.0 }, --Right
    },
    [`italigtb2`] = {
        { 0.30, 2.3, 0.05, 40.0, 30.0, 0.0 }, --Left
        { -0.30, 2.3, 0.05, 40.0, -30.0, 0.0 }, --Right
    },
    [`krieger`] = {
        { 0.30, 2.3, 0.05, 40.0, 30.0, 0.0 }, --Left
        { -0.30, 2.3, 0.05, 40.0, -30.0, 0.0 }, --Right
    },
    [`le7b`] = {
        { 0.30, 2.3, 0.05, 40.0, 30.0, 0.0 }, --Left
        { -0.30, 2.3, 0.05, 40.0, -30.0, 0.0 }, --Right
    },
    [`nero`] = {
        { 0.30, 2.2, 0.0, 40.0, 30.0, 0.0 }, --Left
        { -0.30, 2.2, 0.0, 40.0, -30.0, 0.0 }, --Right
    },
    [`nero2`] = {
        { 0.40, -0.5, 0.16, 60.0, 20.0, 0.0 }, --Left
        { -0.40, -0.5, 0.16, 60.0, -20.0, 0.0 }, --Right
    },
    [`osiris`] = {
        { 0.35, -0.4, 0.12, 60.0, 20.0, 0.0 }, --Left
        { -0.35, -0.4, 0.12, 60.0, -20.0, 0.0 }, --Right
    },
    [`penetrator`] = {
        { 0.35, -0.6, 0.12, 60.0, 20.0, 0.0 }, --Left
        { -0.35, -0.6, 0.12, 60.0, -20.0, 0.0 }, --Right
    },
    [`pfister811`] = {
        { 0.0, 0.35, 0.28, 0.0, 0.0, 0.0 },
        { 0.0, 0.15, 0.25, 10.0, 0.0, 0.0 },
        { 0.0, -0.05, 0.20, 20.0, 0.0, 0.0 },
        { 0.0, -0.25, 0.15, 30.0, 0.0, 0.0 },
        { 0.0, -0.50, 0.11, 40.0, 0.0, 0.0 },
    },
    [`prototipo`] = {
        { 0.30, -0, 0.05, 40.0, 30.0, 0.0 }, --Left
        { -0.30, -0, 0.05, 40.0, -30.0, 0.0 }, --Right
    },
    [`sc1`] = {
        { 0.30, -0.65, 0.05, 40.0, 30.0, 0.0 }, --Left
        { -0.30, -0.65, 0.05, 40.0, -30.0, 0.0 }, --Right
    },
    [`t20`] = {
        { 0.25, -0.65, 0.10, 40.0, 10.0, 0.0 }, --Left
        { -0.25, -0.65, 0.10, 40.0, -10.0, 0.0 }, --Right
    },
    [`taipan`] = {
        { 0.32, 2.3, 0.00, 40.0, 30.0, 0.0 }, --Left
        { -0.32, 2.3, 0.00, 40.0, -30.0, 0.0 }, --Right
    },
    [`tempesta`] = {
        { 0.50, -0.65, 0.60, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.65, 0.60, 40.0, -10.0, 0.0 }, --Right
    },
    [`tezeract`] = {
        { 0.50, -0.65, 0.60, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.65, 0.60, 40.0, -10.0, 0.0 }, --Right
    },
    [`thrax`] = {
        { 0.50, -0.65, 0.10, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.65, 0.10, 40.0, -10.0, 0.0 }, --Right
    },
    [`tigon`] = {
        { 0.50, -0.65, 0.20, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.65, 0.20, 40.0, -10.0, 0.0 }, --Right
    },
    [`turismor`] = {
        { 0.50, -0.65, 0.17, 90.0, 10.0, 0.0 }, --Left
        { -0.50, -0.65, 0.17, 90.0, -10.0, 0.0 }, --Right
    },
    [`tyrant`] = {
        { 0.32, 2.8, 0.25, 40.0, 30.0, 0.0 }, --Left
        { -0.32, 2.8, 0.25, 40.0, -30.0, 0.0 }, --Right
    },
    [`vagner`] = {
        { 0.50, -0.65, 0.10, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.65, 0.10, 40.0, -10.0, 0.0 }, --Right
    },
    [`voltic`] = {
        { 0.50, -0.65, 0.10, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.65, 0.10, 40.0, -10.0, 0.0 }, --Right
    },
    [`voltic2`] = {
        { 0.50, -0.65, 0.10, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.65, 0.10, 40.0, -10.0, 0.0 }, --Right
    },
    [`xa21`] = {
        { 0.50, -0.55, 0.00, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.55, 0.00, 40.0, -10.0, 0.0 }, --Right
    },
    [`zentorno`] = {
        --Left
        { -0.12, 0.28, 0.28, 0.0, -10.0, 0.0 },
        { -0.12, 0.05, 0.25, 10.0, -10.0, 0.0 },
        { -0.12, -0.18, 0.20, 20.0, -10.0, 0.0 },
        { -0.12, -0.40, 0.15, 30.0, -10.0, 0.0 },
        { -0.12, -0.60, 0.11, 40.0, -10.0, 0.0 },
        { -0.12, -0.82, 0.05, 50.0, -10.0, 0.0 },
        --Right
        { 0.12, 0.28, 0.28, 0.0, 10.0, 0.0 },
        { 0.12, 0.05, 0.25, 10.0, 10.0, 0.0 },
        { 0.12, -0.18, 0.20, 20.0, 10.0, 0.0 },
        { 0.12, -0.40, 0.15, 30.0, 10.0, 0.0 },
        { 0.12, -0.60, 0.11, 40.0, 10.0, 0.0 },
        { 0.12, -0.82, 0.05, 50.0, 10.0, 0.0 },
    },
    [`zorrusso`] = {
        --Left
        { -0.20, -0.2, 0.0, 40.0, -20.0, 0.0 },
        { -0.20, 0.0, 0.0, 10.0, -20.0, 0.0 },
        --Right
        { 0.20, -0.2, 0.0, 40.0, 20.0, 0.0 },
        { 0.20, 0.0, 0.0, 10.0, 20.0, 0.0 },
    },
    ---DLC 2699
    [`brioso3`] = {
        { 0.50, -0.30, -0.10, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.30, -0.10, 40.0, -10.0, 0.0 }, --Right
    },
    [`corsita`] = {
        { 0.30, 2.3, 0.05, 40.0, 30.0, 0.0 }, --Left
        { -0.30, 2.3, 0.05, 40.0, -30.0, 0.0 }, --Right
    },
    [`draugur`] = {
        { 0.50, -0.55, 0.30, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.55, 0.30, 40.0, -10.0, 0.0 }, --Right
    },
    [`kanjosj`] = {
        { 0.30, -0.50, 0.15, 40.0, 30.0, 0.0 }, --Left
        { -0.30, -0.50, 0.15, 40.0, -30.0, 0.0 }, --Right
    },
    [`lm87`] = {
        { 0.30, 2.3, -0.15, 40.0, 30.0, 0.0 }, --Left
        { -0.30, 2.3, -0.15, 40.0, -30.0, 0.0 }, --Right
    },
    [`postlude`] = {
        { 0.60, -0.35, 0.20, 40.0, 10.0, 0.0 }, --Left
        { -0.60, -0.35, 0.20, 40.0, -10.0, 0.0 }, --Right
    },
    [`sentinel4`] = {
        { 0.50, -0.55, 0.20, 40.0, 10.0, 0.0 }, --Left
        { -0.50, -0.55, 0.20, 40.0, -10.0, 0.0 }, --Right
    },
    [`sm722`] = {
        { 0.50, -0.55, 0.15, 40.0, 30.0, 0.0 }, --Left
        { -0.50, -0.55, 0.15, 40.0, -30.0, 0.0 }, --Right
    },
    [`tenf2`] = {
        { 0.30, -0.80, 0.15, 40.0, 30.0, 0.0 }, --Left
        { -0.30, -0.80, 0.15, 40.0, -30.0, 0.0 }, --Right
    },
    [`torero2`] = {
        { 0.30, -0.80, 0.15, 40.0, 30.0, 0.0 }, --Left
        { -0.30, -0.80, 0.15, 40.0, -30.0, 0.0 }, --Right
    },
    [`weevil2`] = {
        { 0.50, -0.25, 0.20, 40.0, 40.0, 0.0 }, --Left
        { -0.50, -0.25, 0.20, 40.0, -40.0, 0.0 }, --Right
    },
}