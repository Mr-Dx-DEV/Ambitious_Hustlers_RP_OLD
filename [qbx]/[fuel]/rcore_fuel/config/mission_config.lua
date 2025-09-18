-- setting this to true will result in guide showing always to every player doing the mission
Config.AlwaysShowGuideMission = false

-- will we hide the hud?
Config.HideHud = true

-- type of fuel types that wont require missions for example EV doesn't make sense to pump it into barrel :D
Config.SkipMissionForFuelType = {
    FuelType.EV,
}

-- possible bones to attach the barrel at (the maximum barrels is equals to maximum bones)
Config.AttachableBonesTipTruck = {
    [1] = "chassis",
    [2] = "suspension_lr",
    [3] = "suspension_rr",
    [4] = "exhaust"
}

-- this is where the player see the blip so he can knows where to go
Config.BlipForPlayerToFollowToParkNearOilBuilding = vector3(1061.9, -1947.46, 31.01)

-- will we help player to see where he have to go?
Config.UseTutorialForNewPlayers = true

Config.Clues = {
    {
        pos = vec3(1091.274414, -1972.551758, 31.773928),
        rot = vec3(-0.134557, 0.061549, 109.175606),

        text = _U("entrance_oil_fac"),

        -- how long player will have time to read the text above
        sleepTime = 5000,
    },
    {
        pos = vec3(1082.510376, -1976.212891, 30.876530),
        rot = vec3(10.808925, 0.060328, 55.085869),

        text = _U("equip_clothes_tut"),

        -- how long player will have time to read the text above
        sleepTime = 5000,
    },
    {
        pos = vec3(1087.380493, -2005.717896, 33.018024),
        rot = vec3(-14.571701, 0.060847, 100.927330),

        text = _U("pick_up_oil_barrel"),

        -- how long player will have time to read the text above
        sleepTime = 5000,
    },
    {
        pos = vec3(1101.661133, -2003.245361, 33.017193),
        rot = vec3(-12.595520, 0.061418, -48.768398),

        text = _U("fill_barrel_here"),

        -- how long player will have time to read the text above
        sleepTime = 5000,
    },
    {
        pos = vec3(1029.627686, -1957.460327, 83.272751),
        rot = vec3(-54.974560, 0.035794, -114.650787),

        text = _U("then_take_the_barrel"),

        -- how long player will have time to read the text above
        sleepTime = 5000,
    },
}

-- list of possible parking places
Config.TipTruckPossibleParkingSpots = {
    vector3(1074.81, -1947.03, 31.01),
    vector3(1077.58, -1949.74, 31.01),
    vector3(1075.56, -1965.2, 31.01),
    vector3(1064.74, -1977.39, 31.01),
}

-- location of marker where player will have to change his looks so he doesn't wear pink shirt + pants in highly dangerous area
-- where orange helmet + working clothes are required
Config.ChangeOutfitLocation = vector3(1078.76, -1973.21, 31.47)

-- should we disable the part where player wear the working outfit?
-- ( might be disabled by script if there is no skinchanger that is supported, at the moment only skinchanger, cui_char, qb_clothing, fivem_appearance, illenium_appearance is supported )
Config.DisableOutfit = false

-- skin that player will wear
Config.Skin = {
    ["male"] = {
        glasses_1 = 24,
        helmet_1 = 145,
        pants_1 = 98,
        tshirt_1 = 181,
        torso_1 = 251,
        shoes_1 = 15,
    },
    ["female"] = {
        glasses_1 = 26, --
        helmet_1 = 144, --
        pants_1 = 61, --
        pants_2 = 8, --
        tshirt_1 = 6, --
        torso_1 = 259,
        torso_2 = 2,
        shoes_1 = 24,
    },
}

-- help markers to help player navigate a bit more better
Config.UseHelpMarkers = true

Config.MissionHelpMarkers = {
    {
        pos = vector3(1077.08, -2007.76, 29.2),
        size = vector3(6.0, 6.0, 1.0),
        color = { r = 255, g = 153, b = 51, a = 255 },

        workingClothes = true,

        type = 1,

        bobUpAndDown = false,
        rotate = false,
        faceCamera = false,

        render = true,

        rangeTorRender = 40.0,
    },

    {
        pos = vector3(1110.24, -1997.62, 29.2),
        size = vector3(8.0, 8.0, 1.0),
        color = { r = 255, g = 153, b = 51, a = 255 },

        workingClothes = true,

        type = 1,

        bobUpAndDown = false,
        rotate = false,
        faceCamera = false,

        render = true,

        rangeTorRender = 40.0,
    },


    -- parking phantom truck
    [5] = {
        pos = vector3(-374.62, -2665.71, 4.5),
        size = vector3(8.0, 8.0, 1.0),
        color = { r = 255, g = 153, b = 51, a = 255 },

        workingClothes = true,

        type = 1,

        bobUpAndDown = false,
        rotate = false,
        faceCamera = false,

        render = true,

        rangeTorRender = 40.0,
    },

    -- parking tip truck ( deleting the vehicle )
    [6] = {
        pos = vector3(-304.8, -2700.82, 4.5),
        size = vector3(5.0, 5.0, 1.0),
        color = { r = 255, g = 153, b = 51, a = 255 },

        workingClothes = true,

        type = 1,

        bobUpAndDown = false,
        rotate = false,
        faceCamera = false,

        render = true,

        rangeTorRender = 40.0,
    },

    {
        pos = vector3(-224.35, -2666.5, 3.5),
        size = vector3(15.8, 2.9, 2.0),
        color = { r = 255, g = 153, b = 51, a = 255 },

        workingClothes = true,

        type = 43,

        bobUpAndDown = true,
        rotate = false,
        faceCamera = false,

        render = true,

        rangeTorRender = 40.0,
    },

    -- parking tip truck for loading with barrels
    [99] = {
        -- dont change position the script will edit it on its own.
        pos = vector3(0, 0, 0),
        size = vector3(5.0, 5.0, 1.0),
        color = { r = 255, g = 153, b = 51, a = 255 },

        workingClothes = false,

        type = 1,

        bobUpAndDown = false,
        rotate = false,
        faceCamera = false,

        render = true,

        rangeTorRender = 40.0,
    },
}

-- disable the lighting?
Config.UseLights = true

-- which spots are suppose to have light?
Config.LightSpots = {
    {
        pos = vector3(1079.38, -2007.78, 32.0),
        intensity = 1.0,
        shadow = 1.0,
        lightRange = 10.0,
        rangeTorRender = 40.0,
    },
    {
        pos = vector3(1108.42, -1995.96, 32.22),
        intensity = 1.0,
        shadow = 1.0,
        lightRange = 10.0,
        rangeTorRender = 40.0,
    },
}

-- box zone coords for target
Config.BarrelSpawnLocationsTarget = {
    pos = vector3(1077.51, -2007.24, 31.4),
    length = 4.0,
    width = 3.0,
    heading = 55.0,
}

-- barrel spawn locations
Config.BarrelSpawnLocations = {
    { pos = vector3(1077.85, -2007.58, 30.43), },
    { pos = vector3(1078.9, -2008.13, 30.43), },
    { pos = vector3(1078.5, -2007.29, 30.43), },

    { pos = vec3(1077.014526, -2006.721436, 30.405205), },
    { pos = vec3(1077.978760, -2006.462402, 30.403305), },
    { pos = vec3(1078.043457, -2008.394165, 30.407036), },
    { pos = vec3(1077.097900, -2007.628662, 30.406818), },
    { pos = vec3(1076.272949, -2007.055542, 30.406864), },
    { pos = vec3(1076.963989, -2005.947876, 30.403708), },
}

-- how long the process barrel will take (60 000 = 60 seconds)
Config.TimeToProcessBarrel = 60000

-- Location of filling the barrel with fuel
Config.ProcessingLocationForBarrel = {
    {
        pos = vector3(1111.2157, -1996.63843, 29.8487186),
        model = "prop_oil_wellhead_05",
        heading = 55.0,
    },
    {
        pos = vector3(1110.40918, -1997.79028, 29.8487186),
        model = "prop_oil_wellhead_05",
        heading = 55.0,
    },
    {
        pos = vector3(1109.62878, -1998.90491, 29.8487186),
        model = "prop_oil_wellhead_05",
        heading = 55.0,
    },
}

-- camera facing barrels
Config.PutBarrelsLocationCamera = {
    pos = vec3(-236.077240, -2660.655029, 5.705282),
    rot = vec3(2.358112, 0.058840, -123.297424),
}

-- this camera will face player + the NPC talking to each other
Config.CameraFacingNPC = {
    pos = vec3(-327.889496, -2697.233643, 9.112531),
    rot = vec3(-20.560162, 0.054830, 171.260651),
}

-- blip on map where player have to go
Config.DriveLocationForBarrelDropOut = vector3(-226.68, -2660.22, 6.0)

-- box zone coords for target
Config.DropFilledBarrelsLocationTarget = {
    pos = vector3(-224.69, -2667.03, 6),
    length = 1.3,
    width = 15.0,
    heading = 0.0,
}


-- just points where player can drop all the barrels he have in the truck
-- (the point is invisible the player have to go to the walls of barrels and press E to drop them, there is also in-game hint with camera for that!)
Config.DropFilledBarrelsLocation = {
    vector3(-220, -2665, 6),
    vector3(-222, -2665, 6),
    vector3(-224, -2665, 6),
    vector3(-226, -2665, 6),
    vector3(-228, -2665, 6),
    vector3(-230, -2665, 6),
}

-- guy need to park somewhere
Config.WhereToParkTheTipTruck = vector3(-304.8, -2700.82, 6)

-- Position where player need to go to pick up his truck
Config.PositionWhereToPickUpFuelTruck = vector3(-328.82, -2700.17, 7.55)

-- camera that will just look at the NPC so player know who to speak with
Config.CameraNPCSmoothLookPosition = {
    {
        pos = vec3(-300.119995, -2681.056396, 18.878489),
        rot = vec3(-20.826218, 0.053938, 129.778305),
        time = 2500,
    },
    {
        pos = vec3(-336.814728, -2677.274170, 18.880011),
        rot = vec3(-26.608118, 0.048430, -157.119049),
        time = 2500,
    },
    {
        pos = vec3(-329.951691, -2698.888184, 8.354785),
        rot = vec3(-12.372405, 0.052944, -134.625076),
        time = 2500,

        text = _U("talk_to_npc"),
    },
}

-- self explanatory
Config.FuelTruckModel = GetHashKey("phantom3")

-- self explanatory
Config.FuelTruckTrailerModel = GetHashKey("tanker")

-- Position spawn list for the truck
Config.FuelTruckSpawnList = {
    {
        pos = vector3(-332.59, -2734.76, 6.09),
        heading = 45.0,
    },
    {
        pos = vector3(-304.26, -2712.62, 6.09),
        heading = 313.0,
    },
    {
        pos = vector3(-296.78, -2718.2, 6.09),
        heading = 330.0,
    },
    {
        pos = vector3(-300.3, -2686.88, 6.09),
        heading = 44.0,
    },
    {
        pos = vector3(-358.22, -2757.59, 6.09),
        heading = 314.0,
    },
}

-- after player will pickup his truck with fuel trailer he need to drive to the
-- point where he will fill the tanker and then finally drive to the gas station
Config.BlipOnMapAfterPickingUpTruck = vector3(-237.42, -2677.34, 6)

-- this is for hose connection from phantom tanker
Config.MissionFuelPipe = {
    model = "prop_roofpipe_01",
    pos = vector3(-238.8, -2674.0, 4.9),
    heading = 270.0,
    renderDistance = 50.0,
}

-- to fill player phantom with trailer tanker it will take 2 minutes
Config.FuelingTankerTime = 1000 * 60 * 2

-- I don't recommend changing it
Config.TipTruckHash = GetHashKey("tiptruck")

-- do not fill
Config.SpawnTipTruckSpawnPositions = {}

-- do not fill
Config.TankerShopPosition = {}

-- tap position where player will need to attach the hose
Config.FinalFuelPipe = {}

-- where player have to drive his phantom truck to delete it
Config.DespawnPhantomTruckLocation = vector3(-374.62, -2665.71, 6)

-- where player have to change outfit to normal clothes
Config.ChangeToCivilMarkerOutfit = vector3(-413.21, -2699.03, 6)

-- do you wish to enable taxi which will take player back to the original position he took the mission truck?
Config.EnableTaxi = true

-- position of the marker where player have to go to request the Taxi
Config.TaxiMarkerPosition = vector3(-408.96, -2690.29, 5)

-- where we will teleport player so he can enter car later
Config.TeleportPlayer = vector3(-412.67, -2694.33, 6.00)

-- heading of the player
Config.TeleportPlayerHeading = 315.39

-- camera taxi pos + rot
Config.CameraTaxiInfo = {
    pos = vec3(-415.035431, -2696.837891, 7.117627),
    rot = vec3(-5.614061, 0.058014, -43.486141),
}

-- where the taxi will spawn + drive to?
Config.TaxiPoints = {
    spawnPos = vector3(-388.41, -2710.59, 6.00),
    spawnHeading = 42.98,

    drivePos = vector3(-408.96, -2690.29, 6),
}

-- few maps simply for unknow reasons just are deleting every little  object
-- from the rcore_fuel_assets map, this will spawn them via game code which shouldnt really care about anything.
Config.EnableFakeMap = false

if Config.EnableFakeMap then
    local mapObjects = {
        {
            model = -353447166,
            pos = vec3(-217.804993, -2654.607422, 4.994317),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(-0.000000, -0.000000, -89.999985)
        },
        {
            model = 1652026494,
            pos = vec3(-221.769592, -2667.137207, 5.295784),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(0.000000, -0.000000, -179.999985)
        },
        {
            model = 1652026494,
            pos = vec3(-219.375870, -2667.127686, 5.284799),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(0.000000, -0.000000, -179.999985)
        },
        {
            model = 1652026494,
            pos = vec3(-221.808578, -2667.105713, 6.327827),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(-180.000000, -0.000009, -0.000009)
        },
        {
            model = 1652026494,
            pos = vec3(-218.781418, -2666.993652, 5.479331),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(-89.999992, 0.000000, 0.000000)
        },
        {
            model = 1652026494,
            pos = vec3(-218.783356, -2667.012451, 6.330143),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(-89.999992, 0.000000, 0.000000)
        },
        {
            model = 1652026494,
            pos = vec3(-224.206039, -2667.223145, 5.292256),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(0.000000, -0.000000, -179.999985)
        },
        {
            model = 1652026494,
            pos = vec3(-226.640060, -2667.247314, 5.297879),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(0.000000, -0.000000, -179.999985)
        },
        {
            model = 1652026494,
            pos = vec3(-224.215714, -2667.158203, 6.344749),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(-180.000000, -0.000009, -0.000009)
        },
        {
            model = 1652026494,
            pos = vec3(-226.707977, -2667.229492, 6.296677),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(-180.000000, -0.000009, -0.000009)
        },
        {
            model = 1652026494,
            pos = vec3(-223.904419, -2667.181885, 6.857934),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(0.000000, -0.000000, -179.999985)
        },
        {
            model = 1652026494,
            pos = vec3(-230.915771, -2667.348877, 5.415252),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(-89.999992, 0.000000, 0.000000)
        },
        {
            model = 1652026494,
            pos = vec3(-220.314407, -2667.189697, 6.870633),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(0.000000, -0.000000, -179.999985)
        },
        {
            model = -353447166,
            pos = vec3(-217.826889, -2662.378418, 5.002197),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(-0.000000, -0.000000, -89.999985)
        },
        {
            model = 1652026494,
            pos = vec3(-231.550049, -2667.177246, 5.430323),
            renderDistance = 100.0,
            isMission = false,
            heading = 0.0,
            rotation = vec3(-89.999985, -0.000004, 54.999992)
        }
    }

    for k, tbl in pairs(mapObjects) do
        table.insert(Config.SpawnObject, tbl)
    end
end