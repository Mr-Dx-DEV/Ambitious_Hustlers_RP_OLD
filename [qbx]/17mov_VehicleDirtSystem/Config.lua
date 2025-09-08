Config = {}
Config.Lang = "en"
Config.Debug = false
Config.UseTarget = false
Config.EnableTextureReplace = true         -- Turn this off if you don't want the custom dirt texture

Config.WashPaymentType = "cash" -- "cash" or "bank"

-- Settings for the installer.lua file.
Config.Installer = {
    AutoAddItems = true,
    AutoAddInventoryImages = true,
    AutoDisableOldCarWashScript = true,
    AutoSearchForStreamConflict = true,
}

Config.BlacklistedVehicleClass = { 14, 15, 16 } -- Boats, planes and helicopters will not get dirt from our resource (still can get dirty from GTA ENGINE)
Config.BlacklistedVehicleModels = {
    `buzzard`
}

Config.DisableRealTimeSyncWhenWashing = false

Config.Blip = {
    sprite = 100,
    scale = 0.8,
    color = 0,
    label = _L("Blip.Label"),
    onlyNearest = false,                -- when true, map will display only one nearest blip of the carwash. It is dynamic, so when player is driving around map, it will always show nearest.
    coordinates = {
        vector3(175.58, -1728.66, 34.58),
        vector3(22.88, -1396.07, 34.11),
        vector3(-699.17, -933.78, 23.63),
    }
}

Config.ProtectionApplyingTime = 5000    -- Animation time
Config.Items = {
    ["mov_basic_ceramic"] = {
        durability = 72, -- 72 hours = 3 days. When changing, don't forget to update description too
        washingModifier = 0.5, -- 50% easier to clean your car
        label = _L("BasicCeramic.Label"),
        description = _L("BasicCeramic.Description"),
        price = 15
    },
    ["mov_advanced_ceramic"] = {
        durability = 168, -- 168 hours = 7 days. When changing, don't forget to update description too
        washingModifier = 0.9, -- 90% easier to clean your car
        label = _L("AdvanceedCeramic.Label"),
        description = _L("AdvanceedCeramic.Description"),
        price = 45,
    },
    ["mov_basic_wax"] = {
        durability = 72, -- 72 hours = 3 days. When changing, don't forget to update description too
        dirtProtection = 0.7, -- 30% slower your car is getting dirt
        label = _L("BasicWax.Label"),
        description = _L("BasicWax.Description"),
        price = 15,
    },
    ["mov_advanced_wax"] = {
        durability = 168, -- 168 hours = 7 days. When changing, don't forget to update description too
        dirtProtection = 0.1, -- 60% slower your car is getting dirt
        label = _L("AdvanceedWax.Label"),
        description = _L("AdvanceedWax.Description"),
        price = 45,
    }
}

Config.VendingMachinesCoordinates = {
    vector4(155.78, -1720.79, 29.29, 226.41),
    vector4(154.89, -1721.66, 29.29, 226.91),
    vector4(154.06, -1722.65, 29.29, 227.54),

    vector4(49.08, -1398.29, 29.36, 264.77),
    vector4(49.03, -1397.07, 29.37, 267.0),
    vector4(22.31, -1415.41, 29.32, 356.65),
    vector4(20.99, -1415.4, 29.32, 352.44),
    vector4(-3.35, -1398.23, 29.26, 85.61),
    vector4(-3.49, -1396.94, 29.26, 67.91),

    vector4(-704.61, -927.62, 19.21, 92.45),
    vector4(-704.58, -928.86, 19.21, 89.61),
    vector4(-704.58, -930.12, 19.21, 85.41),
}

Config.Stations = {
    -- CARWASH 1:
    {
        cable = vector3(175.11, -1738.57458, 33.186),
        nozzle = vector3(174.521362, -1741.59753, 29.78719),
        nozzleRot = vec3(0.0, 45.0, 0.0),
        interface = vec3(177.0171, -1741.91028, 29.8663769),
        interfaceRot = vec3(0.0, 0.0, -90.0),
        radius = 3.0,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(175.11, -1731.91687, 33.186),
        nozzle = vector3(174.521362, -1735.15283, 29.78719),
        nozzleRot = vec3(0.0, 45.0, 0.0),
        interface = vec3(177.0171, -1735.46558, 29.8663769),
        interfaceRot = vec3(0.0, 0.0, -90.0),
        radius = 3.0,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(175.11, -1725.17664, 33.186),
        nozzle = vector3(174.521362, -1728.395, 29.78719),
        nozzleRot = vec3(0.0, 45.0, 0.0),
        interface = vec3(177.0171, -1728.70776, 29.8663769),
        interfaceRot = vec3(0.0, 0.0, -90.0),
        radius = 3.0,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(175.11, -1718.56519, 33.186),
        nozzle = vector3(174.521362, -1721.6322, 29.78719),
        nozzleRot = vec3(0.0, 45.0, 0.0),
        interface = vec3(177.0171, -1721.945, 29.8663769),
        interfaceRot = vec3(0.0, 0.0, -90.0),
        radius = 3.0,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(175.11, -1718.56519, 33.186),
        nozzle = vector3(174.521362, -1721.6322, 29.78719),
        nozzleRot = vec3(0.0, 45.0, 0.0),
        interface = vec3(177.0171, -1721.945, 29.8663769),
        interfaceRot = vec3(0.0, 0.0, -90.0),
        radius = 3.0,
        price = 10,
        requiredJob = nil,
    },
    -- CARWASH 2:
    {
        cable = vector3(44.2214165, -1394.796, 32.64741),
        nozzle = vector3(46.9425659, -1394.118, 29.4840965),
        nozzleRot = vec3(0.0, 45.0, 90.0),
        interface = vec3(47.3726273, -1391.57349, 30.001469),
        interfaceRot = vec3(0.0, 0.0, 0.0),
        radius = 3.0,
        cableLenght = 4.6,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(38.1458054, -1394.796, 32.64741),
        nozzle = vector3(40.8294373, -1394.13647, 29.4840965),
        nozzleRot = vec3(0.0, 45.0, 90.0),
        interface = vec3(41.2566147, -1391.57349, 30.0001469),
        interfaceRot = vec3(0.0, 0.0, 0.0),
        radius = 3.0,
        cableLenght = 4.6,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(32.03471, -1394.78, 32.6475677),
        nozzle = vector3(34.71834, -1394.118, 29.3627453),
        nozzleRot = vec3(0.0, 45.0, 90.0),
        interface = vec3(35.15003, -1391.57349, 29.8729725),
        interfaceRot = vec3(0.0, 0.0, 0.0),
        radius = 3.0,
        cableLenght = 4.6,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(25.9485321, -1394.78, 32.648468),
        nozzle = vector3(28.6332245, -1394.118, 29.4914017),
        nozzleRot = vec3(0.0, 45.0, 90.0),
        interface = vec3(29.0502243, -1391.57349, 29.9940758),
        interfaceRot = vec3(0.0, 0.0, 0.0),
        radius = 3.0,
        cableLenght = 4.6,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(19.75825, -1394.78418, 32.6408653),
        nozzle = vector3(22.5025635, -1394.08521, 29.3646641),
        nozzleRot = vec3(0.0, 45.0, 90.0),
        interface = vec3(22.9026928, -1391.57349, 29.8507144),
        interfaceRot = vec3(0.0, 0.0, 0.0),
        radius = 3.0,
        cableLenght = 4.6,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(13.6889715, -1394.78418, 32.63942),
        nozzle = vector3(16.4166565, -1394.1322, 29.481369),
        nozzleRot = vec3(0.0, 45.0, 90.0),
        interface = vec3(16.8303528, -1391.57349, 29.98511),
        interfaceRot = vec3(0.0, 0.0, 0.0),
        radius = 3.0,
        cableLenght = 4.6,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(7.552761, -1394.77954, 32.6542549),
        nozzle = vector3(10.2783623, -1394.116, 29.3557968),
        nozzleRot = vec3(0.0, 45.0, 90.0),
        interface = vec3(10.6679153, -1391.56885, 29.8744144),
        interfaceRot = vec3(0.0, 0.0, 0.0),
        radius = 3.0,
        cableLenght = 4.6,
        price = 10,
        requiredJob = nil,
    },
    {
        cable = vector3(1.47244394, -1394.77954, 32.6461),
        nozzle = vector3(4.206813, -1394.116, 29.4643211),
        nozzleRot = vec3(0.0, 45.0, 90.0),
        interface = vec3(4.63122, -1391.56885, 29.9829388),
        interfaceRot = vec3(0.0, 0.0, 0.0),
        radius = 3.0,
        cableLenght = 4.6,
        price = 10,
        requiredJob = nil,
    },
    -- CARWASH 3:
    {
        cable = vector3(-699.9154, -933.1925, 22.0808525),
        nozzle = vector3(-697.367065, -933.795044, 18.990387),
        nozzleRot = vec3(0.0, 45.0, 90.0),
        interface = vec3(-697.0775, -929.812744, 19.5410782),
        interfaceRot = vec3(0.0, 0.0, 0.0),
        radius = 3.0,
        cableLenght = 4.5,
        price = 10,
        requiredJob = nil,
    },
}


Config.VehicleDirt = {
    StaticValueAdding = 0.02, -- That means around 12,5 minutes of driving will make vehicle fully dirty. But Keep in mind below modifiers. For example while driving on tarmac (asphalt) with modifier 0.1, to make vehicle fully dirty, you need
    Multiplers = {
        [1187676648] = {
            -- 25 minutes of driving on concrete will make ur vehicle fully dirty
            multipler = 0.5,
            displayName = "Concrete"
        },
        [-1084640111] = {
            -- 6.25 minutes of driving on Dusty Concrete will make ur vehicle fully dirty
            multipler = 1.5,
            displayName = "Dusty Concrete"
        },
        [282940568] = {
            -- 125 minutes of driving on Tarmac will make ur vehicle fully dirty
            multipler = 0.1,
            displayName = "Tarmac"
        },
        [-840216541] = {
            -- Around 8 minutes of driving on Rock will make ur vehicle fully dirty
            multipler = 1.5,
            displayName = "Rock"
        },
        [-124769592] = {
            -- Around 6 minutes of driving on Messy Rock will make ur vehicle fully dirty
            multipler = 1.8,
            displayName = "Messy Rock"
        },
        [765206029] = {
            -- Around 8 minutes of driving on Stone will make ur vehicle fully dirty
            multipler = 1.5,
            displayName = "Stone"
        },
        [576169331] = {
            -- Around 8 minutes of driving on Cobblestone will make ur vehicle fully dirty
            multipler = 1.5,
            displayName = "Cobblestone"
        },
        [592446772] = {
            -- Around 5 minutes of driving on Sandstone Solid will make ur vehicle fully dirty
            multipler = 2.5,
            displayName = "Sandstone Solid"
        },
        [1913209870] = {
            -- Around 4 minutes of driving on Sandstone Brittle will make ur vehicle fully dirty
            multipler = 3.0,
            displayName = "Sandstone Brittle"
        },
        [-1595148316] = {
            -- Around 3 minutes of driving on Sand Loose will make ur vehicle fully dirty
            multipler = 3.5,
            displayName = "Sand Loose"
        },
        [909950165] = {
            -- Around 3 minutes of driving on Sand Wet will make ur vehicle fully dirty
            multipler = 4.0,
            displayName = "Sand Wet"
        },
        [-1907520769] = {
            -- Around 3 minutes of driving on Sand Track will make ur vehicle fully dirty
            multipler = 4.0,
            displayName = "Sand Track"
        },
        [509508168] = {
            -- Around 2.5 minutes of driving on Deep Sand (Dry) will make ur vehicle fully dirty
            multipler = 5.0,
            displayName = "Deep Sand (Dry)"
        },
        [1288448767] = {
            -- Around 3 minutes of driving on Deep Sand (Wet) will make ur vehicle fully dirty
            multipler = 4.0,
            displayName = "Deep Sand (Wet)"
        },
        [-1937569590] = {
            -- Around 4 minutes of driving on Loose Snow will make ur vehicle fully dirty
            multipler = 3.0,
            displayName = "Loose Snow"
        },
        [1619704960] = {
            -- Around 3 minutes of driving on Deep Snow will make ur vehicle fully dirty
            multipler = 4.0,
            displayName = "Deep Snow"
        },
        [1550304810] = {
            -- Around 6 minutes of driving on Snow on Tarmac will make ur vehicle fully dirty
            multipler = 2.0,
            displayName = "Snow on Tarmac"
        },
        [951832588] = {
            -- Around 6 minutes of driving on Gravel Small will make ur vehicle fully dirty
            multipler = 2.0,
            displayName = "Gravel Small"
        },
        [2128369009] = {
            -- Around 5 minutes of driving on Gravel Large will make ur vehicle fully dirty
            multipler = 2.5,
            displayName = "Gravel Large"
        },
        [-356706482] = {
            -- Around 4 minutes of driving on Gravel Large will make ur vehicle fully dirty
            multipler = 3.0,
            displayName = "Gravel Large"
        },
        [-1885547121] = {
            -- Around 3 minutes of driving on Dirt Track will make ur vehicle fully dirty
            multipler = 4.0,
            displayName = "Dirt Track"
        },
        [-1942898710] = {
            -- Around 4 minutes of driving on Hard Mud will make ur vehicle fully dirty
            multipler = 3.0,
            displayName = "Hard Mud"
        },
        [1635937914] = {
            -- Around 2.5 minutes of driving on Soft Mud will make ur vehicle fully dirty
            multipler = 5.0,
            displayName = "Soft Mud"
        },
        [1109728704] = {
            -- Around 1.5 minutes of driving on Deep Mud will make ur vehicle fully dirty
            multipler = 8.0,
            displayName = "Deep Mud"
        },
        [223086562] = {
            -- Around 1  minute of driving on Marsh will make ur vehicle fully dirty
            multipler = 11.0,
            displayName = "Marsh"
        },
        [1584636462] = {
            -- Around 0.8 minute of driving on Marsh Deep will make ur vehicle fully dirty
            multipler = 15.0,
            displayName = "Marsh Deep"
        },
        [-700658213] = {
            -- Around 6 minute of driving on Soil will make ur vehicle fully dirty
            multipler = 2.0,
            displayName = "Soil"
        },
        [1144315879] = {
            -- Around 2 minutes of driving on Clay Hard will make ur vehicle fully dirty
            multipler = 6.0,
            displayName = "Clay Hard"
        },
        [560985072] = {
            -- Around 3 minutes of driving on Clay Soft will make ur vehicle fully dirty
            multipler = 4.0,
            displayName = "Clay Soft"
        },
        [-461750719] = {
            -- Around 2.5 minutes of driving on Long Grass will make ur vehicle fully dirty
            multipler = 5.0,
            displayName = "Long Grass"
        },
        [1333033863] = {
            -- Around 3 minutes of driving on Medium Grass will make ur vehicle fully dirty
            multipler = 4.0,
            displayName = "Medium Grass"
        },
        [-1286696947] = {
            -- Around 4 minutes of driving on Short Grass will make ur vehicle fully dirty
            multipler = 3.0,
            displayName = "Short Grass"
        },
        [-1833527165] = {
            -- Around 3 minutes of driving on Hay will make ur vehicle fully dirty
            multipler = 4.0,
            displayName = "Hay"
        },
        [581794674] = {
            -- Around 3 minutes of driving on Bushes will make ur vehicle fully dirty
            multipler = 4.0,
            displayName = "Bushes"
        },
        [-913351839] = {
            -- Around 6 minutes of driving on Twigs will make ur vehicle fully dirty
            multipler = 2.0,
            displayName = "Twigs"
        },
        [-2041329971] = {
            -- Around 6 minutes of driving on Leaves will make ur vehicle fully dirty
            multipler = 2.0,
            displayName = "Leaves"
        },
        [-309121453] = {
            -- Around 6 minutes of driving on Wood Chips will make ur vehicle fully dirty
            multipler = 2.0,
            displayName = "Wood Chips"
        },
        [-1915425863] = {
            -- Around 6 minutes of driving on Tree Bark will make ur vehicle fully dirty
            multipler = 2.0,
            displayName = "Tree Bark"
        },
    }
}