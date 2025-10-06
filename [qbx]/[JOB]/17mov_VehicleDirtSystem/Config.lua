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

Config.DevToolCommand = "vehicledevtool"  -- Command to open dev tool (only for admins, see server/devtool.lua to set permissions)
Config.Premissionlevel = "admin"

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
    [1] = {
        cable = vector3(175.110001, -1738.574585, 33.186001),
        cableLength = 5,
        interface = vector3(177.015991, -1741.689941, 29.818842),
        nozzle = vector3(174.521362, -1741.597534, 29.787189),
        nozzleRot = vector3(0.000000, 45.000000, 0.000000),
        radius = 3,
        interfaceRot = vector3(0.000000, 0.000000, -0.180937),
        price = 10
    },
    [2] = {
        cable = vector3(175.110001, -1731.916870, 33.186001),
        price = 10,
        interface = vector3(177.026367, -1735.195068, 29.832987),
        interfaceRot = vector3(0.000000, 0.000000, -0.483236),
        nozzleRot = vector3(0.000000, 45.000000, 0.000000),
        radius = 3,
        nozzle = vector3(174.521362, -1735.152832, 29.787189),
        cableLength = 5
    },
    [3] = {
        cable = vector3(175.110001, -1725.176636, 33.186001),
        cableLength = 5,
        interface = vector3(177.017105, -1728.469360, 29.813568),
        nozzleRot = vector3(0.000000, 45.000000, 0.000000),
        nozzle = vector3(174.521362, -1728.395020, 29.787189),
        radius = 3,
        interfaceRot = vector3(0.000000, 0.000000, 0.889686),
        price = 10
    },
    [4] = {
        cable = vector3(175.110001, -1718.565186, 33.186001),
        price = 10,
        interface = vector3(177.017105, -1721.717285, 29.826523),
        interfaceRot = vector3(0.000000, 0.000000, 0.212749),
        nozzle = vector3(174.521362, -1721.632202, 29.787189),
        radius = 3,
        nozzleRot = vector3(0.000000, 45.000000, 0.000000),
        cableLength = 5
    },
    [5] = {
        cable = vector3(44.221416, -1394.796021, 32.647411),
        cableLength = 4.6,
        interface = vector3(47.072483, -1391.565552, 29.937725),
        nozzleRot = vector3(0.000000, 45.000000, 90.000000),
        nozzle = vector3(46.942566, -1394.118042, 29.484097),
        radius = 3,
        interfaceRot = vector3(0.000000, 0.000000, 87.461243),
        price = 10
    },
    [6] = {
        cable = vector3(38.145805, -1394.796021, 32.647411),
        price = 10,
        interface = vector3(40.999573, -1391.573486, 29.925032),
        interfaceRot = vector3(0.000000, 0.000000, 91.828545),
        nozzleRot = vector3(0.000000, 45.000000, 90.000000),
        radius = 3,
        nozzle = vector3(40.829437, -1394.136475, 29.484097),
        cableLength = 4.6
    },
    [7] = {
        cable = vector3(32.034710, -1394.780029, 32.647568),
        cableLength = 10,
        interface = vector3(34.877045, -1391.573486, 29.827768),
        nozzle = vector3(34.727131, -1394.118042, 29.362745),
        nozzleRot = vector3(0.000000, 45.000000, 90.000000),
        radius = 3,
        interfaceRot = vector3(0.000000, 0.000000, 89.412689),
        price = 1500
    },
    [8] = {
        cable = vector3(25.948532, -1394.780029, 32.648468),
        price = 10,
        interface = vector3(28.787107, -1391.573486, 29.942423),
        interfaceRot = vector3(0.000000, 0.000000, 90.492813),
        nozzleRot = vector3(0.000000, 45.000000, 90.000000),
        radius = 3,
        nozzle = vector3(28.633224, -1394.118042, 29.491402),
        cableLength = 4.6
    },
    [9] = {
        cable = vector3(19.758249, -1394.784180, 32.640865),
        cableLength = 4.6,
        interface = vector3(22.658728, -1391.573486, 29.815983),
        nozzleRot = vector3(0.000000, 45.000000, 90.000000),
        nozzle = vector3(22.502563, -1394.085205, 29.364664),
        radius = 3,
        interfaceRot = vector3(0.000000, 0.000000, 88.889915),
        price = 10
    },
    [10] = {
        cable = vector3(13.688972, -1394.784180, 32.639420),
        price = 10,
        interface = vector3(16.558548, -1391.573486, 29.924704),
        interfaceRot = vector3(0.000000, 0.000000, 90.101059),
        nozzle = vector3(16.416656, -1394.132202, 29.481369),
        radius = 3,
        nozzleRot = vector3(0.000000, 45.000000, 90.000000),
        cableLength = 5
    },
    [11] = {
        cable = vector3(7.552761, -1394.779541, 32.654255),
        cableLength = 4.6,
        interface = vector3(10.468729, -1391.590698, 29.821638),
        nozzle = vector3(10.278362, -1394.115967, 29.355797),
        nozzleRot = vector3(0.000000, 45.000000, 90.000000),
        radius = 3,
        interfaceRot = vector3(0.000000, 0.000000, 89.708527),
        price = 10
    },
    [12] = {
        cable = vector3(1.472444, -1394.779541, 32.646099),
        price = 10,
        interface = vector3(4.399435, -1391.566040, 29.923159),
        interfaceRot = vector3(0.000000, 0.000000, 89.665733),
        nozzleRot = vector3(0.000000, 45.000000, 90.000000),
        radius = 3,
        nozzle = vector3(4.206813, -1394.115967, 29.464321),
        cableLength = 4.6
    },
    [13] = {
        cable = vector3(-699.915405, -933.192505, 22.080853),
        cableLength = 4.5,
        interface = vector3(-697.351013, -929.812317, 19.523306),
        nozzleRot = vector3(0.000000, 45.000000, 90.000000),
        nozzle = vector3(-697.367065, -933.795044, 18.990387),
        radius = 3,
        interfaceRot = vector3(0.000000, 0.000000, 89.934486),
        price = 10
    }
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