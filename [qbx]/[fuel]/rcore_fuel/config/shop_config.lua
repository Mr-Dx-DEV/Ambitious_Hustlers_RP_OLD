-- since it is automatic and not by system it is best to apply more fees so players are doing these tasks by them self
-- they will pay 10% more than they would by them self if they did the mission
Config.AutomaticRestockTax = 0.1

-- will be taxes enabled?
Config.EnableTax = false

-- 20% will be taken from what player will pay for gas and given to specific society
Config.TaxPercentage = 0.2 -- 0.2 = 20%

-- society where the tax goes
Config.TaxSociety = "society_goverment"

-- Disable passive income for all stores?
-- true = passive income will be disabled.
Config.DisablePassiveIncome = false

-- the minimum price of gas staton allowed to put by player?
Config.MinimumPriceOfGasStation = 100000

-- the maximum owned companies player can own?
-- ( -1 will be unlimited )
Config.MaximumOwnedCompanyPerPlayer = 2

-- you can view all AlignTypes/FuelType in const.lua
Config.ShopList = {
    ["fuel_pump27"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(1787.703247, 3331.467041, 40.248825),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(1775.401123, 3331.164062, 41.347057),

        -- boss menu marker style
        companyMenuMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
            color = { r = 255, g = 255, b = 255, a = 100 },
            type = 31,
        },

        -- marker where player can buy the company
        buyCompanyMarker = vec3(1777.514526, 3327.646973, 41.433311),

        -- buy marker style
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
            color = { r = 0, g = 255, b = 0, a = 100 },
            type = 29,
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(1785.374878, 3352.761719, 48.776100),
            rot = vec3(-17.687569, 0.056118, 157.401382),
        },

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",

        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                pos = vec3(1785.032471, 3331.476074, 40.343834),
                align = AlignTypes.RIGHT,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -462817101
            },
            [2] = {
                pos = vec3(1786.079834, 3329.853516, 40.411945),
                align = AlignTypes.RIGHT,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -462817101
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(1778.509155, 3341.641846, 40.523926),

            -- heading of the vehicle
            heading = 296.72723388672,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(1769.143921, 3345.927002, 40.871189),

            -- position of the scaleform
            pos = vec3(1763.006104, 3338.014893, 41.488499),

            -- rotation of the scaleform
            heading = 122.00001525879,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(1760.995239, 3341.157227, 39.819115),

            -- heading of the tap
            heading = 36.000003814697,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter
        -- for example if you set here 50$ then one liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income is how much money the gas station will make every hour so there is passive income. So location far away from town where no player is have at least a chance to make something
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                heading = 302.0,
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(1760.875977, 3338.828613, 40.157249)
            },
            [2] = {
                heading = 26.999998092651,
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(1755.244385, 3341.482178, 40.150227)
            }
        },
    },
    ["fuel_pump26"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-319.300171, -1471.467041, 29.548527),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-340.871002, -1477.680786, 30.754101),

        -- boss menu marker style
        companyMenuMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
            color = { r = 255, g = 255, b = 255, a = 100 },
            type = 31,
        },

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-340.962036, -1475.725830, 30.752728),

        -- buy marker style
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
            color = { r = 0, g = 255, b = 0, a = 100 },
            type = 29,
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-284.885284, -1506.109985, 38.193485),
            rot = vec3(-8.705058, 0.062590, 59.408875),
        },

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",

        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelType = -1,
                align = AlignTypes.RIGHT,
                pos = vec3(-329.819550, -1471.639648, 29.729012),
                hash = 1694452750,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [2] = {
                fuelType = -1,
                align = AlignTypes.RIGHT,
                pos = vec3(-322.333221, -1467.317627, 29.720665),
                hash = 1694452750,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [3] = {
                fuelType = -1,
                align = AlignTypes.RIGHT,
                pos = vec3(-314.921967, -1463.038574, 29.726250),
                hash = 1694452750,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [4] = {
                fuelType = -1,
                align = AlignTypes.LEFT,
                pos = vec3(-309.851532, -1471.798340, 29.723412),
                hash = 1694452750,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [5] = {
                fuelType = -1,
                align = AlignTypes.LEFT,
                pos = vec3(-317.262848, -1476.091797, 29.725029),
                hash = 1694452750,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [6] = {
                fuelType = -1,
                align = AlignTypes.LEFT,
                pos = vec3(-324.749115, -1480.414062, 29.728859),
                hash = 1694452750,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-343.648621, -1494.918335, 30.383053),

            -- heading of the vehicle
            heading = 269.60629272461,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-349.847534, -1494.527100, 30.390125),

            -- position of the scaleform
            pos = vec3(-359.436890, -1497.527710, 30.384823),

            -- rotation of the scaleform
            heading = 179.99998474121,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-360.253876, -1497.462158, 28.877869),

            -- heading of the tap
            heading = 96.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter
        -- for example if you set here 50$ then one liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income is how much money the gas station will make every hour so there is passive income. So location far away from town where no player is have at least a chance to make something
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                pos = vec3(-358.013306, -1498.923584, 29.158165),
                renderDistance = 100.0,
                heading = 0.0,
                model = 'prop_storagetank_03b'
            },
            [2] = {
                pos = vec3(-351.855530, -1498.892944, 29.303244),
                renderDistance = 100.0,
                heading = 0.0,
                model = 'prop_storagetank_03b'
            }
        },
    },
    ["fuel_pump25_airplanes"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-729.204529, -1451.262085, 4.000523),
        blipSprite = 307,
        blipName = "Airplanes Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-740.462097, -1504.257202, 5.000523),

        -- boss menu marker style
        companyMenuMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
            color = { r = 255, g = 255, b = 255, a = 100 },
            type = 31,
        },

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-743.149292, -1505.165649, 5.000523),

        -- buy marker style
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
            color = { r = 0, g = 255, b = 0, a = 100 },
            type = 29,
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-728.474792, -1392.591064, 20.741760),
            rot = vec3(-20.158653, 0.053697, 175.750870),
        },

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelTypeList = { FuelType.AVIATION, },
                hash = 1499213999,
                align = AlignTypes.MIDDLE,
                fuelType = -1,
                pos = vec3(-764.885864, -1434.485962, 4.035404)
            },
            [2] = {
                fuelTypeList = { FuelType.AVIATION, },
                hash = 1499213999,
                align = AlignTypes.MIDDLE,
                fuelType = -1,
                pos = vec3(-705.283325, -1464.977905, 4.024448)
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-704.691223, -1472.570312, 4.630657),

            -- heading of the vehicle
            heading = 319.00302124023,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-705.861877, -1477.226074, 5.000523),

            -- position of the scaleform
            pos = vec3(-704.250488, -1481.275024, 5.400265),

            -- rotation of the scaleform
            heading = 233.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-704.696716, -1481.422852, 3.720523),

            -- heading of the tap
            heading = 139.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.AVIATION] = 30000
        },

        -- default prices of the fuel per liter
        -- for example if you set here 50$ then one liter of fuel will cost 50$
        gasPrices = {
            [FuelType.AVIATION] = 500
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.AVIATION] = 30000
        },

        -- Hourly income is how much money the gas station will make every hour so there is passive income. So location far away from town where no player is have at least a chance to make something
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                heading = 53.0,
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-702.252747, -1480.926147, 4.150266)
            },
            [2] = {
                heading = 53.0,
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-698.550598, -1475.938477, 4.150265)
            }
        },
    },

    ["fuel_pump24"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(175.696030, -1561.231689, 28.258541),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(163.883148, -1557.446899, 29.261763),

        -- boss menu marker style
        companyMenuMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
            color = { r = 255, g = 255, b = 255, a = 100 },
            type = 31,
        },

        -- marker where player can buy the company
        buyCompanyMarker = vec3(167.765091, -1554.198975, 29.261763),

        -- buy marker style
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
            color = { r = 0, g = 255, b = 0, a = 100 },
            type = 29,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(167.221832, -1607.550659, 36.835239),
            rot = vec3(-4.175842, 0.058376, -6.852397),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = true,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                align = AlignTypes.RIGHT,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1339433404,
                pos = vec3(181.806717, -1561.969849, 28.329025),
                fuelType = -1
            },
            [2] = {
                align = AlignTypes.LEFT,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1339433404,
                pos = vec3(174.980148, -1568.444214, 28.329025),
                fuelType = -1
            },
            [3] = {
                align = AlignTypes.LEFT,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1339433404,
                pos = vec3(169.297256, -1562.266968, 28.329025),
                fuelType = -1
            },
            [4] = {
                align = AlignTypes.RIGHT,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1339433404,
                pos = vec3(176.020767, -1555.911499, 28.328381),
                fuelType = -1
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(189.980698, -1546.526611, 28.803238),

            -- heading of the vehicle
            heading = 215.84934997559,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(193.222855, -1550.486938, 29.198792),

            -- position of the scaleform
            pos = vec3(183.241409, -1536.398804, 29.391611),

            -- rotation of the scaleform
            heading = 309.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(183.608032, -1536.934937, 27.861610),

            -- heading of the tap
            heading = 215.00001525879,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                pos = vec3(183.200470, -1534.151367, 28.141609),
                model = 'prop_storagetank_03b',
                heading = 309.0
            },
            [2] = {
                renderDistance = 100.0,
                pos = vec3(179.381226, -1529.427124, 28.139103),
                model = 'prop_storagetank_03b',
                heading = 309.0
            }
        },
    },

    ["fuel_pump23"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-2100.799316, -317.997101, 12.028025),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-2074.044922, -323.312531, 13.315975),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-2074.344971, -326.936859, 13.315975),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-2127.091309, -354.244904, 23.695213),
            rot = vec3(-14.142569, 0.057736, -49.935062),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                align = AlignTypes.RIGHT,
                pos = vec3(-2106.065674, -325.579468, 12.160918),
                hash = -2007231801,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [2] = {
                align = AlignTypes.RIGHT,
                pos = vec3(-2097.483398, -326.481506, 12.160918),
                hash = -2007231801,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [3] = {
                align = AlignTypes.RIGHT,
                pos = vec3(-2088.755615, -327.398804, 12.160918),
                hash = -2007231801,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [4] = {
                align = AlignTypes.RIGHT,
                pos = vec3(-2088.086670, -321.035248, 12.160918),
                hash = -2007231801,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [5] = {
                align = AlignTypes.RIGHT,
                pos = vec3(-2096.814453, -320.117889, 12.160918),
                hash = -2007231801,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [6] = {
                align = AlignTypes.RIGHT,
                pos = vec3(-2105.396729, -319.215912, 12.160918),
                hash = -2007231801,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [7] = {
                align = AlignTypes.LEFT,
                pos = vec3(-2104.535156, -311.019836, 12.160918),
                hash = -2007231801,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [8] = {
                align = AlignTypes.LEFT,
                pos = vec3(-2096.096436, -311.906891, 12.160918),
                hash = -2007231801,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [9] = {
                align = AlignTypes.LEFT,
                pos = vec3(-2087.215332, -312.818481, 12.160918),
                hash = -2007231801,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-2097.593506, -295.149841, 12.676989),

            -- heading of the vehicle
            heading = 85.998924255371,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-2081.608643, -308.518494, 13.042221),

            -- position of the scaleform
            pos = vec3(-2070.456055, -299.334686, 13.565766),

            -- rotation of the scaleform
            heading = 353.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-2071.082520, -299.388916, 12.035767),

            -- heading of the tap
            heading = 264.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                heading = 353.0,
                model = 'prop_storagetank_03b',
                pos = vec3(-2062.611084, -298.894714, 12.315765)
            },
            [2] = {
                renderDistance = 100.0,
                heading = 353.0,
                model = 'prop_storagetank_03b',
                pos = vec3(-2068.711426, -298.147858, 12.315767)
            }
        },
    },

    ["fuel_pump22"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-719.509460, -935.380493, 18.017010),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-708.560669, -903.636047, 19.215599),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-709.456604, -917.572021, 19.214415),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-690.648132, -990.619568, 28.564650),
            rot = vec3(-9.177609, 0.056761, 21.509258),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                align = AlignTypes.RIGHT,
                pos = vec3(-732.645813, -932.516235, 18.211670),
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [2] = {
                align = AlignTypes.RIGHT,
                pos = vec3(-724.007385, -932.516235, 18.211670),
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [3] = {
                align = AlignTypes.RIGHT,
                pos = vec3(-715.437439, -932.516235, 18.211670),
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [4] = {
                align = AlignTypes.LEFT,
                pos = vec3(-715.437439, -939.321655, 18.211670),
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [5] = {
                align = AlignTypes.LEFT,
                pos = vec3(-724.007385, -939.321655, 18.211670),
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [6] = {
                align = AlignTypes.LEFT,
                pos = vec3(-732.645813, -939.321655, 18.211670),
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-728.777649, -912.904785, 18.644087),

            -- heading of the vehicle
            heading = 168.04501342773,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-709.280212, -855.554565, 23.153084),

            -- position of the scaleform
            pos = vec3(-713.259766, -866.049255, 23.511604),

            -- rotation of the scaleform
            heading = 89.000015258789,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-712.850220, -865.715698, 21.955540),

            -- heading of the tap
            heading = 353.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                heading = 269.0,
                model = 'prop_storagetank_03b',
                pos = vec3(-714.719849, -873.632141, 22.431683)
            },
            [2] = {
                renderDistance = 100.0,
                heading = 269.0,
                model = 'prop_storagetank_03b',
                pos = vec3(-714.652832, -867.560913, 22.284410)
            }
        },
    },

    ["fuel_pump21"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(822.966309, -1025.616821, 25.235981),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(822.249207, -1039.922363, 26.750805),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(818.125183, -1039.965454, 26.750805),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(783.872742, -991.963745, 41.652378),
            rot = vec3(-17.125530, 0.058819, -142.295441),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                align = AlignTypes.LEFT,
                pos = vec3(810.698975, -1026.247803, 25.435555),
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [2] = {
                align = AlignTypes.LEFT,
                pos = vec3(818.986084, -1026.247803, 25.435555),
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [3] = {
                align = AlignTypes.LEFT,
                pos = vec3(827.293335, -1026.247803, 25.635113),
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [4] = {
                align = AlignTypes.RIGHT,
                pos = vec3(827.293335, -1030.941406, 25.635113),
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [5] = {
                align = AlignTypes.RIGHT,
                pos = vec3(818.986084, -1030.941406, 25.435555),
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            },
            [6] = {
                align = AlignTypes.RIGHT,
                pos = vec3(810.698975, -1030.941406, 25.435555),
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(808.283142, -1045.315918, 26.287682),

            -- heading of the vehicle
            heading = 78.166641235352,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(722.224548, -1033.930542, 21.618265),

            -- position of the scaleform
            pos = vec3(741.721741, -1026.171509, 22.194794),

            -- rotation of the scaleform
            heading = 0.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(741.433655, -1026.536133, 20.632414),

            -- heading of the tap
            heading = 274.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                heading = 0.0,
                model = 'prop_storagetank_03b',
                pos = vec3(749.495789, -1024.756104, 20.864635)
            },
            [2] = {
                renderDistance = 100.0,
                heading = 0.0,
                model = 'prop_storagetank_03b',
                pos = vec3(743.321899, -1024.797119, 21.049568)
            }
        },
    },

    ["fuel_pump20"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-2555.762695, 2337.963623, 32.060032),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-2537.881836, 2318.416260, 33.215546),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-2544.132568, 2317.593262, 33.215664),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-2525.237549, 2410.862061, 58.179001),
            rot = vec3(-18.444834, 0.058370, 165.605011),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                pos = vec3(-2552.398438, 2341.891602, 32.216003),
                align = AlignTypes.RIGHT,
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [2] = {
                pos = vec3(-2552.607178, 2334.467529, 32.254150),
                align = AlignTypes.LEFT,
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [3] = {
                pos = vec3(-2551.396240, 2327.115479, 32.246918),
                align = AlignTypes.RIGHT,
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [4] = {
                pos = vec3(-2558.021484, 2326.704346, 32.256134),
                align = AlignTypes.LEFT,
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [5] = {
                pos = vec3(-2558.484619, 2334.133789, 32.255470),
                align = AlignTypes.LEFT,
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [6] = {
                pos = vec3(-2558.772461, 2341.487793, 32.225220),
                align = AlignTypes.LEFT,
                hash = 1339433404,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-2526.828613, 2341.371338, 32.690029),

            -- heading of the vehicle
            heading = 212.99473571777,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-2546.792480, 2345.339111, 33.059895),

            -- position of the scaleform
            pos = vec3(-2553.854248, 2347.781738, 33.309895),

            -- rotation of the scaleform
            heading = 4.9999990463257,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-2553.393311, 2347.651611, 31.779894),

            -- heading of the tap
            heading = 267.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(-2561.854004, 2348.460449, 32.071453),
                heading = 4.9999990463257
            },
            [2] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(-2555.668945, 2349.027832, 32.065269),
                heading = 4.9999990463257
            }
        },
    },

    ["fuel_pump19"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(1180.267456, -327.665863, 68.174400),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(1160.544067, -313.448975, 69.205101),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(1162.076904, -327.335999, 69.212715),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(1214.463013, -353.155121, 79.617386),
            rot = vec3(-16.164888, 0.059515, 54.702415),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [4] = {
                pos = vec3(1175.701538, -322.306122, 68.358780),
                align = AlignTypes.LEFT,
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [5] = {
                pos = vec3(1177.459839, -331.014374, 68.318726),
                align = AlignTypes.LEFT,
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [6] = {
                pos = vec3(1178.963257, -339.543060, 68.365601),
                align = AlignTypes.LEFT,
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [7] = {
                pos = vec3(1186.390991, -338.233246, 68.356384),
                align = AlignTypes.RIGHT,
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [8] = {
                pos = vec3(1184.887085, -329.704803, 68.309540),
                align = AlignTypes.RIGHT,
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [9] = {
                pos = vec3(1183.129272, -320.996552, 68.350693),
                align = AlignTypes.RIGHT,
                hash = 1933174915,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(1170.577515, -318.209595, 68.808815),

            -- heading of the vehicle
            heading = 189.08990478516,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(1190.917603, -318.046997, 69.182564),

            -- position of the scaleform
            pos = vec3(1182.526489, -310.592987, 69.442612),

            -- rotation of the scaleform
            heading = 12.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(1183.029419, -310.979767, 67.912613),

            -- heading of the tap
            heading = 287.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(1180.440796, -309.631836, 68.192612),
                heading = 12.0
            },
            [2] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(1174.481201, -310.905640, 68.213287),
                heading = 12.0
            }
        },
    },

    ["fuel_pump18"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(1210.213135, 2662.327393, 36.809952),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(1206.643433, 2652.103271, 37.851852),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(1202.693604, 2656.149658, 37.851852),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(1234.781250, 2664.950684, 45.926559),
            rot = vec3(-14.745935, 0.059871, 100.602493),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                pos = vec3(1205.899780, 2662.048584, 36.896744),
                align = AlignTypes.MIDDLE,
                hash = -462817101,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [2] = {
                pos = vec3(1208.509766, 2659.427979, 36.898148),
                align = AlignTypes.MIDDLE,
                hash = -462817101,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [3] = {
                pos = vec3(1209.581543, 2658.351562, 36.899551),
                align = AlignTypes.MIDDLE,
                hash = -462817101,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(1192.153564, 2662.152588, 37.450287),

            -- heading of the vehicle
            heading = 317.88168334961,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(1211.093994, 2649.508789, 37.846992),

            -- position of the scaleform
            pos = vec3(1210.160156, 2642.949707, 38.065098),

            -- rotation of the scaleform
            heading = 232.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(1209.684204, 2642.874512, 36.539852),

            -- heading of the tap
            heading = 134.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(1210.089111, 2640.603027, 36.809952),
                heading = 51.999996185303
            },
            [2] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(1205.355713, 2636.213135, 36.809952),
                heading = 34.0
            }
        },
    },

    ["fuel_pump17"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(620.677551, 268.942413, 102.089424),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(641.490845, 264.098541, 103.145409),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(643.840881, 268.493652, 103.140495),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(595.680237, 235.657135, 110.923546),
            rot = vec3(-11.761376, 0.057043, -52.460144),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                pos = vec3(612.432251, 263.835754, 102.269516),
                align = AlignTypes.RIGHT,
                hash = 1694452750,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [2] = {
                pos = vec3(620.990112, 263.835938, 102.269516),
                align = AlignTypes.RIGHT,
                hash = 1694452750,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [3] = {
                pos = vec3(629.634521, 263.835693, 102.269516),
                align = AlignTypes.RIGHT,
                hash = 1694452750,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [4] = {
                pos = vec3(629.630615, 273.969849, 102.269516),
                align = AlignTypes.LEFT,
                hash = 1694452750,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [5] = {
                pos = vec3(620.986084, 273.969788, 102.269516),
                align = AlignTypes.LEFT,
                hash = 1694452750,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [6] = {
                pos = vec3(612.421021, 273.957153, 102.269516),
                align = AlignTypes.LEFT,
                hash = 1694452750,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(640.960449, 283.195953, 102.826462),

            -- heading of the vehicle
            heading = 148.09420776367,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(639.658142, 273.278778, 103.100891),

            -- position of the scaleform
            pos = vec3(651.764587, 276.380219, 103.544426),

            -- rotation of the scaleform
            heading = 241.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(651.589722, 276.419586, 102.014580),

            -- heading of the tap
            heading = 147.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(653.894287, 277.359650, 102.293381),
                heading = 241.0
            }
        },
    },

    ["fuel_pump16"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(2682.504883, 3262.433350, 54.240540),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(2672.626709, 3262.753174, 55.240540),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(2674.367188, 3266.510986, 55.240540),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(2689.320557, 3242.261963, 62.196800),
            rot = vec3(-17.536564, 0.057596, 31.096781),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                pos = vec3(2678.512939, 3262.336914, 54.390862),
                align = AlignTypes.MIDDLE,
                hash = 1499213999,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [2] = {
                pos = vec3(2680.902344, 3266.407715, 54.390862),
                align = AlignTypes.MIDDLE,
                hash = 1499213999,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(2665.132568, 3233.863525, 53.863869),

            -- heading of the vehicle
            heading = 271.12246704102,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(2661.835205, 3245.829590, 54.781197),

            -- position of the scaleform
            pos = vec3(2664.592285, 3250.459717, 55.181698),

            -- rotation of the scaleform
            heading = 331.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(2664.168213, 3250.451172, 53.659073),

            -- heading of the tap
            heading = 240.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(2663.825439, 3252.473389, 54.026508),
                heading = 331.0
            },
            [2] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(2658.492188, 3255.463379, 54.078106),
                heading = 331.0
            }
        },
    },

    ["fuel_pump15"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-96.839989, 6422.183105, 30.457170),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-97.467377, 6408.032227, 31.462179),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-94.289246, 6411.132812, 31.466383),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-123.257072, 6406.364746, 43.234272),
            rot = vec3(-22.753496, 0.056505, -84.315529),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                pos = vec3(-91.290451, 6422.537109, 30.643494),
                align = AlignTypes.MIDDLE,
                hash = 1499213999,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [2] = {
                pos = vec3(-97.060867, 6416.766602, 30.643494),
                align = AlignTypes.MIDDLE,
                hash = 1499213999,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-96.094215, 6396.364746, 31.082489),

            -- heading of the vehicle
            heading = 55.511260986328,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-87.009094, 6429.818359, 31.485548),

            -- position of the scaleform
            pos = vec3(-74.357513, 6435.434082, 31.690332),

            -- rotation of the scaleform
            heading = 314.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-74.922096, 6435.576172, 30.160332),

            -- heading of the tap
            heading = 219.00001525879,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(-67.995399, 6430.840332, 30.438679),
                heading = 314.0
            },
            [2] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(-72.247002, 6435.251953, 30.439880),
                heading = 314.0
            }
        },
    },

    ["fuel_pump14"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(47.179821, 2776.922363, 56.884029),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(42.511555, 2791.095215, 57.878143),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(45.914116, 2788.412109, 57.878277),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(23.489433, 2774.799072, 65.122276),
            rot = vec3(-17.633652, 0.057876, -69.969025),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                pos = vec3(48.913097, 2779.585449, 57.041401),
                align = AlignTypes.MIDDLE,
                hash = 1499213999,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [2] = {
                pos = vec3(50.305706, 2778.534668, 57.041401),
                align = AlignTypes.MIDDLE,
                hash = 1499213999,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(37.786694, 2785.170654, 57.508278),

            -- heading of the vehicle
            heading = 121.09911346436,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(34.356720, 2795.632324, 57.878143),

            -- position of the scaleform
            pos = vec3(44.199677, 2810.466064, 58.128143),

            -- rotation of the scaleform
            heading = 321.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(43.563652, 2810.293457, 56.598145),

            -- heading of the tap
            heading = 227.00001525879,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(51.103107, 2806.698975, 56.878277),
                heading = 321.0
            },
            [2] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(46.312546, 2810.578613, 56.878277),
                heading = 321.0
            }
        },
    },

    ["fuel_pump13"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(263.508881, 2609.911621, 43.853329),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(261.231445, 2598.714844, 44.763493),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(265.575958, 2599.651855, 44.760590),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(236.935242, 2625.203857, 53.425240),
            rot = vec3(-21.418365, 0.057154, -136.014221),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                pos = vec3(263.082581, 2606.794678, 43.983231),
                align = AlignTypes.MIDDLE,
                hash = -462817101,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            },
            [2] = {
                pos = vec3(264.976318, 2607.177734, 43.983231),
                align = AlignTypes.MIDDLE,
                hash = -462817101,
                fuelType = -1,
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, }
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(229.674240, 2602.771729, 45.292988),

            -- heading of the vehicle
            heading = 29.304494857788,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(249.783020, 2576.988037, 45.413486),

            -- position of the scaleform
            pos = vec3(262.507324, 2581.300049, 45.198578),

            -- rotation of the scaleform
            heading = 10.999999046326,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(262.857635, 2581.152344, 43.651348),

            -- heading of the tap
            heading = 279.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                model = 'prop_storagetank_03b',
                pos = vec3(260.573242, 2582.315186, 43.885395),
                heading = 10.999999046326
            }
        },
    },

    ["fuel_pump12_airplanes"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-1234.913086, -2281.494385, 12.944557),
        blipSprite = 307,
        blipName = "Airplanes Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-1241.710815, -2324.319580, 13.944558),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-1236.190796, -2327.142334, 13.944558),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-1247.747559, -2226.727783, 20.706516),
            rot = vec3(-8.668986, 0.059517, -172.887650),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelTypeList = { FuelType.AVIATION, },
                pos = vec3(-1235.708984, -2308.739746, 12.942941),
                hash = 1339433404,
                align = AlignTypes.RIGHT,
                fuelType = -1
            },
            [2] = {
                fuelTypeList = { FuelType.AVIATION, },
                pos = vec3(-1259.496216, -2295.006104, 12.942941),
                hash = 1339433404,
                align = AlignTypes.RIGHT,
                fuelType = -1
            },
            [3] = {
                fuelTypeList = { FuelType.AVIATION, },
                pos = vec3(-1237.632324, -2257.136719, 12.942941),
                hash = 1339433404,
                align = AlignTypes.RIGHT,
                fuelType = -1
            },
            [4] = {
                fuelTypeList = { FuelType.AVIATION, },
                pos = vec3(-1213.840698, -2270.872803, 12.942941),
                hash = 1339433404,
                align = AlignTypes.RIGHT,
                fuelType = -1
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-1287.746216, -2298.204346, 13.716674),

            -- heading of the vehicle
            heading = 103.2183380127,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-1254.857666, -2306.694580, 13.944558),

            -- position of the scaleform
            pos = vec3(-1264.462158, -2310.250244, 14.335844),

            -- rotation of the scaleform
            heading = 150.99998474121,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-1265.004150, -2309.580566, 12.805194),

            -- heading of the tap
            heading = 49.000026702881,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.AVIATION] = 30000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 500$
        gasPrices = {
            [FuelType.AVIATION] = 500
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.AVIATION] = 30000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                heading = 332.0,
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-1247.708130, -2321.038330, 13.090293)
            },
            [2] = {
                heading = 331.0,
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-1253.125366, -2318.103760, 13.088238)
            },
            [3] = {
                heading = 331.0,
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-1258.558594, -2315.112305, 13.088264)
            },
            [4] = {
                heading = 331.0,
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-1263.961060, -2312.141357, 13.088264)
            }
        },
    },

    ["fuel_pump11"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(1208.704590, -1402.596191, 34.224159),
        blipSprite = 361,
        blipName = "EV Charger",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(1215.050415, -1389.761841, 35.374107),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(1211.133911, -1389.990845, 35.376919),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(1243.546509, -1405.128052, 44.447533),
            rot = vec3(-16.269184, 0.057723, 73.970009),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",

        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelTypeList = { FuelType.EV, },
                pos = vec3(1204.195312, -1401.033691, 35.645233),
                hash = 1537112021,
                align = AlignTypes.RIGHT,
                fuelType = -1
            },
            [2] = {
                fuelTypeList = { FuelType.EV, },
                pos = vec3(1207.068115, -1398.160889, 35.645233),
                hash = 1537112021,
                align = AlignTypes.RIGHT,
                fuelType = -1
            },
            [3] = {
                fuelTypeList = { FuelType.EV, },
                pos = vec3(1212.937256, -1404.030029, 35.644920),
                hash = 1537112021,
                align = AlignTypes.RIGHT,
                fuelType = -1
            },
            [4] = {
                fuelTypeList = { FuelType.EV, },
                pos = vec3(1210.064697, -1406.903076, 35.644920),
                hash = 1537112021,
                align = AlignTypes.RIGHT,
                fuelType = -1
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(1201.556641, -1410.811646, 34.856335),

            -- heading of the vehicle
            heading = 188.80009460449,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(1199.802124, -1400.395752, 35.224422),

            -- position of the scaleform
            pos = vec3(1202.112793, -1382.070557, 35.476936),

            -- rotation of the scaleform
            heading = 0.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(1202.443359, -1382.281250, 33.946938),

            -- heading of the tap
            heading = 272.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.EV] = 10000,
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.EV] = 50,
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.EV] = 10000,
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                heading = 0.0,
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(1200.333984, -1380.657837, 34.226936)
            }
        },
    },

    ["fuel_pump10"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(1039.403320, 2671.437256, 38.550934),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(1043.269165, 2665.156738, 39.550789),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(1039.386475, 2665.122803, 39.551067),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(1055.604858, 2687.336182, 44.667648),
            rot = vec3(-11.203968, 0.056657, 149.255539),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                hash = -462817101,
                align = AlignTypes.MIDDLE,
                pos = vec3(1043.219360, 2674.445557, 38.703392),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [2] = {
                hash = -462817101,
                align = AlignTypes.MIDDLE,
                pos = vec3(1043.219604, 2667.913818, 38.703453),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [3] = {
                hash = -462817101,
                align = AlignTypes.MIDDLE,
                pos = vec3(1035.442383, 2667.904053, 38.703190),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [4] = {
                hash = -462817101,
                align = AlignTypes.MIDDLE,
                pos = vec3(1035.442505, 2674.435791, 38.703194),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(1027.726074, 2662.042480, 39.181255),

            -- heading of the vehicle
            heading = 359.0,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(1029.838135, 2680.998779, 39.394073),

            -- position of the scaleform
            pos = vec3(1020.666687, 2679.485840, 39.861092),

            -- rotation of the scaleform
            heading = 89.000015258789,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(1020.797424, 2680.170898, 38.329754),

            -- heading of the tap
            heading = 359.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                pos = vec3(1019.234253, 2678.005127, 38.622726),
                model = 'prop_storagetank_03b',
                heading = 269.0,
                renderDistance = 100.0
            }
        },
    },

    ["fuel_pump9"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(2007.736450, 3770.942383, 31.180801),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(2005.730103, 3780.966797, 32.180801),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(2002.194946, 3779.244385, 32.180801),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(2006.713501, 3747.159912, 37.655064),
            rot = vec3(-11.554714, 0.058985, 4.703887),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                hash = 1499213999,
                align = AlignTypes.MIDDLE,
                pos = vec3(2001.546875, 3772.201660, 31.398464),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [2] = {
                hash = 1499213999,
                align = AlignTypes.MIDDLE,
                pos = vec3(2003.913818, 3773.476074, 31.398464),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [3] = {
                hash = 1499213999,
                align = AlignTypes.MIDDLE,
                pos = vec3(2006.205078, 3774.956543, 31.398464),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [4] = {
                hash = 1499213999,
                align = AlignTypes.MIDDLE,
                pos = vec3(2009.254395, 3776.773438, 31.398464),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(1990.279907, 3763.322021, 31.810745),

            -- heading of the vehicle
            heading = 28.927867889404,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(1987.433594, 3774.711182, 32.180801),

            -- position of the scaleform
            pos = vec3(1982.837402, 3787.108887, 32.430801),

            -- rotation of the scaleform
            heading = 30.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(1983.274780, 3787.168701, 30.900801),

            -- heading of the tap
            heading = 304.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                pos = vec3(1980.714600, 3787.473389, 31.180801),
                model = 'prop_storagetank_03b',
                heading = 30.0,
                renderDistance = 100.0
            },
            [2] = {
                pos = vec3(1975.718262, 3783.288574, 31.183380),
                model = 'prop_storagetank_03b',
                heading = 50.0,
                renderDistance = 100.0
            }
        },
    },

    ["fuel_pump8"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-1436.763550, -276.683258, 45.207676),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-1432.023193, -266.085999, 46.269653),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-1428.927490, -269.207764, 46.207676),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-1406.358643, -319.567261, 57.688519),
            rot = vec3(-11.862361, 0.057605, 22.476072),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                hash = 1339433404,
                align = AlignTypes.RIGHT,
                pos = vec3(-1444.503540, -274.232361, 45.403587),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [2] = {
                hash = 1339433404,
                align = AlignTypes.RIGHT,
                pos = vec3(-1438.072021, -268.697815, 45.403587),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [3] = {
                hash = 1339433404,
                align = AlignTypes.LEFT,
                pos = vec3(-1435.507446, -284.686401, 45.402596),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [4] = {
                hash = 1339433404,
                align = AlignTypes.LEFT,
                pos = vec3(-1429.075928, -279.151855, 45.402596),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-1423.503296, -288.977814, 45.892109),

            -- heading of the vehicle
            heading = 130.63317871094,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-1419.279785, -286.021729, 46.272346),

            -- position of the scaleform
            pos = vec3(-1404.988647, -275.097809, 46.640949),

            -- rotation of the scaleform
            heading = 311.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-1404.831665, -275.627075, 45.115135),

            -- heading of the tap
            heading = 220.00001525879,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                pos = vec3(-1405.063232, -272.849487, 45.397694),
                model = 'prop_storagetank_03b',
                heading = 311.0,
                renderDistance = 100.0
            }
        },
    },

    ["fuel_pump7"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(2577.346680, 362.636414, 107.457306),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(2550.103271, 386.984131, 108.622986),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(2561.622803, 382.855408, 108.620827),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(2611.792236, 406.865234, 116.103027),
            rot = vec3(-10.715755, 0.056853, 126.343643),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                hash = 1339433404,
                align = AlignTypes.RIGHT,
                pos = vec3(2588.406006, 358.559570, 107.650833),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [2] = {
                hash = 1339433404,
                align = AlignTypes.RIGHT,
                pos = vec3(2580.934082, 358.885071, 107.650780),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [3] = {
                hash = 1339433404,
                align = AlignTypes.RIGHT,
                pos = vec3(2573.544678, 359.206970, 107.651154),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [4] = {
                hash = 1339433404,
                align = AlignTypes.LEFT,
                pos = vec3(2588.645752, 364.059204, 107.650497),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [5] = {
                hash = 1339433404,
                align = AlignTypes.LEFT,
                pos = vec3(2581.173584, 364.384735, 107.650009),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            },
            [6] = {
                hash = 1339433404,
                align = AlignTypes.LEFT,
                pos = vec3(2573.784180, 364.706665, 107.650566),
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                fuelType = -1
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(2557.260010, 336.595886, 108.088493),

            -- heading of the vehicle
            heading = 316.23760986328,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(2561.595947, 338.904053, 108.460358),

            -- position of the scaleform
            pos = vec3(2551.755371, 345.109680, 108.719627),

            -- rotation of the scaleform
            heading = 0.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(2552.169922, 344.904755, 107.189247),

            -- heading of the tap
            heading = 269.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                pos = vec3(2543.980469, 346.514191, 107.462585),
                model = 'prop_storagetank_03b',
                heading = 0.0,
                renderDistance = 100.0
            },
            [2] = {
                pos = vec3(2550.113525, 346.501465, 107.472382),
                model = 'prop_storagetank_03b',
                heading = 0.0,
                renderDistance = 100.0
            }
        },
    },

    ["fuel_pump6"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-66.469276, -1762.625122, 28.253826),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-42.419178, -1749.113770, 29.421005),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-51.966904, -1759.466064, 29.182508),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-105.369362, -1769.807739, 37.500740),
            rot = vec3(-12.510389, 0.058021, -72.714951),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1933174915,
                pos = vec3(-63.613739, -1767.937744, 28.261608),
                align = AlignTypes.RIGHT
            },
            [2] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1933174915,
                pos = vec3(-72.034302, -1765.105957, 28.528473),
                align = AlignTypes.RIGHT
            },
            [3] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1933174915,
                pos = vec3(-80.172318, -1762.143799, 28.798901),
                align = AlignTypes.RIGHT
            },
            [4] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1933174915,
                pos = vec3(-77.592751, -1755.056885, 28.807949),
                align = AlignTypes.LEFT
            },
            [5] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1933174915,
                pos = vec3(-69.454819, -1758.018799, 28.541801),
                align = AlignTypes.LEFT
            },
            [6] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = 1933174915,
                pos = vec3(-61.034252, -1760.850586, 28.300560),
                align = AlignTypes.LEFT
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-39.661961, -1743.095581, 28.813437),

            -- heading of the vehicle
            heading = 50.738681793213,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-26.892881, -1754.925781, 29.093912),

            -- position of the scaleform
            pos = vec3(-33.339539, -1755.509888, 29.595926),

            -- rotation of the scaleform
            heading = 139.99998474121,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-33.681908, -1755.029785, 28.066097),

            -- heading of the tap
            heading = 53.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-33.062080, -1757.554565, 28.386267),
                heading = 320.0
            },
            [2] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-28.375452, -1761.528320, 28.346500),
                heading = 320.0
            }
        },
    },

    ["fuel_pump5"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-526.253967, -1210.782349, 17.184843),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-533.483459, -1218.812134, 18.459990),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-530.654968, -1220.071045, 18.459974),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-546.332886, -1174.659546, 29.612175),
            rot = vec3(-14.690322, 0.057091, -152.002457),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(-528.575806, -1204.801270, 17.325386),
                align = AlignTypes.LEFT
            },
            [2] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(-532.285278, -1212.718750, 17.325386),
                align = AlignTypes.LEFT
            },
            [3] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(-524.926758, -1216.152100, 17.325386),
                align = AlignTypes.LEFT
            },
            [4] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(-521.217285, -1208.234375, 17.325386),
                align = AlignTypes.LEFT
            },
            [5] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(-525.807617, -1206.044922, 17.325386),
                align = AlignTypes.LEFT
            },
            [6] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(-529.517090, -1213.962646, 17.325386),
                align = AlignTypes.LEFT
            },
            [7] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(-518.525635, -1209.504395, 17.325161),
                align = AlignTypes.LEFT
            },
            [8] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(-522.234985, -1217.422119, 17.325161),
                align = AlignTypes.LEFT
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-528.554077, -1196.366211, 18.030149),

            -- heading of the vehicle
            heading = 245.38444519043,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-512.724182, -1208.292969, 18.484310),

            -- position of the scaleform
            pos = vec3(-513.908875, -1219.007446, 18.671953),

            -- rotation of the scaleform
            heading = 210.00001525879,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-514.374939, -1218.985840, 17.140593),

            -- heading of the tap
            heading = 120.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-511.925659, -1219.511353, 17.428041),
                heading = 30.0
            },
            [2] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-511.924255, -1219.533325, 20.245913),
                heading = 30.0
            }
        },
    },

    ["fuel_pump4"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(260.763550, -1260.539917, 28.142902),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(287.501007, -1263.282593, 29.440767),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(287.336365, -1267.042358, 29.440767),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(240.807373, -1308.428345, 39.496403),
            rot = vec3(-9.988847, 0.056313, -30.357498),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(256.433380, -1268.639648, 28.291168),
                align = AlignTypes.RIGHT
            },
            [2] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(265.062714, -1268.639648, 28.291122),
                align = AlignTypes.RIGHT
            },
            [3] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(273.838593, -1268.639648, 28.290600),
                align = AlignTypes.RIGHT
            },
            [4] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(273.838593, -1261.298340, 28.286133),
                align = AlignTypes.LEFT
            },
            [5] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(265.062714, -1261.298340, 28.292721),
                align = AlignTypes.LEFT
            },
            [6] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(256.433380, -1261.298340, 28.291531),
                align = AlignTypes.LEFT
            },
            [7] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(256.433380, -1253.461426, 28.286732),
                align = AlignTypes.LEFT
            },
            [8] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(265.062714, -1253.461426, 28.289986),
                align = AlignTypes.LEFT
            },
            [9] = {
                fuelType = -1,
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                hash = -2007231801,
                pos = vec3(273.838593, -1253.461426, 28.291832),
                align = AlignTypes.LEFT
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(260.180237, -1238.717163, 28.782385),

            -- heading of the vehicle
            heading = 2.0326752662659,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(285.533600, -1245.118530, 29.216408),

            -- position of the scaleform
            pos = vec3(299.218231, -1248.410400, 29.540211),

            -- rotation of the scaleform
            heading = 271.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(299.058350, -1248.707153, 28.010336),

            -- heading of the tap
            heading = 181.00001525879,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(300.559540, -1246.648315, 28.290707),
                heading = 271.0
            },
            [2] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(300.461304, -1240.500488, 28.290707),
                heading = 271.0
            }
        },
    },

    ["fuel_pump3"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(176.217285, 6602.612793, 30.848732),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(167.273605, 6630.020508, 31.613564),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(160.990158, 6635.328613, 31.602364),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(209.648087, 6555.366699, 38.691162),
            rot = vec3(-4.776018, 0.060818, 25.364441),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                align = AlignTypes.LEFT,
                fuelType = -1,
                hash = 1339433404,
                pos = vec3(186.970917, 6606.217773, 31.062500)
            },
            [2] = {
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                align = AlignTypes.LEFT,
                fuelType = -1,
                hash = 1339433404,
                pos = vec3(179.674652, 6604.930664, 31.062500)
            },
            [3] = {
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                align = AlignTypes.RIGHT,
                fuelType = -1,
                hash = 1339433404,
                pos = vec3(172.333359, 6603.635742, 31.062500)
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(162.464981, 6575.087402, 31.458832),

            -- heading of the vehicle
            heading = 211.67735290527,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(201.896622, 6593.545898, 31.662130),

            -- position of the scaleform
            pos = vec3(206.752106, 6589.531738, 31.840111),

            -- rotation of the scaleform
            heading = 271.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(206.294571, 6588.963379, 30.338627),

            -- heading of the tap
            heading = 178.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(208.099762, 6591.032715, 30.793125),
                heading = 90.999992370605
            },
            [2] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(207.735413, 6597.319336, 30.732964),
                heading = 96.0
            }
        },
    },

    ["fuel_pump2"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(-1798.981934, 803.198059, 137.651291),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(-1828.340088, 799.606628, 138.168289),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(-1816.404907, 791.564636, 137.945999),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(-1769.150879, 790.317505, 148.215393),
            rot = vec3(-17.662016, 0.054814, 75.425606),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                align = AlignTypes.RIGHT,
                fuelType = -1,
                hash = 1933174915,
                pos = vec3(-1802.318970, 806.112915, 137.651703)
            },
            [2] = {
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                align = AlignTypes.RIGHT,
                fuelType = -1,
                hash = 1933174915,
                pos = vec3(-1808.719116, 799.951416, 137.685410)
            },
            [3] = {
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                align = AlignTypes.LEFT,
                fuelType = -1,
                hash = 1933174915,
                pos = vec3(-1803.623657, 794.390747, 137.689835)
            },
            [4] = {
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                align = AlignTypes.LEFT,
                fuelType = -1,
                hash = 1933174915,
                pos = vec3(-1797.223999, 800.552612, 137.654816)
            },
            [5] = {
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                align = AlignTypes.LEFT,
                fuelType = -1,
                hash = 1933174915,
                pos = vec3(-1790.838745, 806.402954, 137.695129)
            },
            [6] = {
                fuelTypeList = { FuelType.NATURAL, FuelType.DIESEL, },
                align = AlignTypes.RIGHT,
                fuelType = -1,
                hash = 1933174915,
                pos = vec3(-1795.934448, 811.963623, 137.690216)
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(-1814.779053, 775.655518, 136.446136),

            -- heading of the vehicle
            heading = 315.95556640625,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(-1820.125122, 778.690369, 137.451248),

            -- position of the scaleform
            pos = vec3(-1829.717773, 781.134521, 138.577103),

            -- rotation of the scaleform
            heading = 45.0,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(-1828.854004, 781.572632, 137.029480),

            -- heading of the tap
            heading = 310.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-1831.831055, 783.413452, 137.329590),
                heading = 312.0
            },
            [2] = {
                model = 'prop_storagetank_03b',
                renderDistance = 100.0,
                pos = vec3(-1831.864380, 783.428528, 140.147476),
                heading = 312.0
            }
        },
    },

    ["fuel_pump1"] = {
        -- blip on minimap/full map position
        enableBlip = true,
        blipScale = 1.0,
        blipPosition = vec3(1703.217407, 6420.282227, 31.637579),
        blipSprite = 361,
        blipName = "Fuel pump",

        -- boss marker for the owner of the company
        companyMenuMarkerPos = vec3(1698.206787, 6425.065430, 32.751270),

        -- marker where player can buy the company
        buyCompanyMarker = vec3(1705.670776, 6424.772461, 32.635269),
        buyCompanyMarkerStyle = {
            size = vector3(1.0, 1.0, 1.0),
            rotate = true,
            faceCamera = false,
        },

        -- when player buy the company where should the camera be rendered at
        buyCompanyCameraPosition = {
            pos = vec3(1676.944214, 6408.697754, 41.617207),
            rot = vec3(-21.555782, 0.056316, -61.405590),
        },

        -- Enable/Disable buying of the station?
        EnableBuyingCompany = false,

        -- Society info
        EnableSociety = false,
        SocietyLabel = "My awesome society name",
        --SocietyName = "society_jobname",
        Job = "jobName",
        Data = { type = "private", },

        -- works only for ESX this option
        ESX_BossOption = {
            withdraw = true,
            deposit = true,
            wash = false,
            employees = true,
            grades = true,
        },

        -- fuel pump position where player can fuel his car
        pumpPosition = {
            [1] = {
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                pos = vec3(1697.756592, 6418.344238, 31.760010),
                hash = 1694452750,
                align = AlignTypes.LEFT,
                fuelType = -1
            },
            [2] = {
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                pos = vec3(1701.724365, 6416.482910, 31.760010),
                hash = 1694452750,
                align = AlignTypes.LEFT,
                fuelType = -1
            },
            [3] = {
                fuelTypeList = { FuelType.DIESEL, FuelType.NATURAL, },
                pos = vec3(1705.737061, 6414.600098, 31.760010),
                hash = 1694452750,
                align = AlignTypes.LEFT,
                fuelType = -1
            }
        },

        -- spawn info of the mission vehicle
        tipTruckSpawnPosition = {
            -- position of the spawn
            pos = vec3(1718.632568, 6422.724609, 32.936764),

            -- heading of the vehicle
            heading = 159.13719177246,
        },

        -- Tanker scaleform + blip mission
        tankerScaleform = {
            -- Mission blip on minimap where player have to drive after picking up phantom
            missionBlipPosition = vec3(1687.645142, 6429.460938, 32.394287),

            -- position of the scaleform
            pos = vec3(1683.668945, 6438.291992, 32.477318),

            -- rotation of the scaleform
            heading = 63.000022888184,

            -- This is actually TV object hidden so we can display the nice 3D UI
            model = 1340914825,
        },

        -- this is the tap where player will attach the nozzle from phantom
        tankerTapPosition = {
            -- position of the tap
            pos = vec3(1684.017212, 6438.666016, 30.970520),

            -- heading of the tap
            heading = 333.0,

            -- render distance of the tap
            renderDistance = 100.0,
        },

        -- current capacity the tanker has
        -- do not change
        capacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- default prices of the fuel per liter so 1 liter of fuel will cost 50$
        gasPrices = {
            [FuelType.NATURAL] = 50,
            [FuelType.DIESEL] = 50
        },

        -- maximum capacity the tanker can have
        maxCapacity = {
            [FuelType.NATURAL] = 10000,
            [FuelType.DIESEL] = 10000
        },

        -- Hourly income represents the amount of money the gas station will generate every hour, providing passive income. Therefore, even in a location far away from town where there are no players, there is still a chance to make some profit.
        -- by setting value to "0" there wont be any passive income.
        hourlyIncome = 1000,

        -- do not change
        -- you will have to change this value in game not in config this is just placeholder for default value
        price = 520000,

        -- do not change
        open = true,

        -- do not change, will also not work unless society is enabled
        fuel_only_employee = false,

        -- do not change
        for_sale = true,

        -- do not change
        -- keep also default value "none"
        owner_identifier = "none",

        -- spawner object for this specific fuel station
        objectSpawner = {
            [1] = {
                renderDistance = 100.0,
                pos = vec3(1681.770264, 6437.568848, 31.095066),
                model = 'prop_storagetank_03b',
                heading = 243.00001525879
            },
            [2] = {
                renderDistance = 100.0,
                pos = vec3(1681.762573, 6437.590820, 33.912945),
                model = 'prop_storagetank_03b',
                heading = 243.00001525879
            }
        },
    },
}

-- PLEASE READ CAREFULLY!
-- PLEASE READ CAREFULLY!
-- PLEASE READ CAREFULLY!
-- PLEASE READ CAREFULLY!
-- PLEASE READ CAREFULLY!
-- PLEASE READ CAREFULLY!
-- PLEASE READ CAREFULLY!
-- PLEASE READ CAREFULLY!
-- ****** This defines the cost per liter that your company must pay when refueling! ******
-- ****** This is NOT how much player pay for fuel when he is refueling his vehicle ******
-- Set the minimum and maximum price per liter that your company will be charged for fuel.
-- The price will be randomly adjusted within this range every hour to simulate inflation and deflation,
-- giving a dynamic feel to fuel pricing.
-- You can find all possible FuelType values in const.lua
Config.CompanyGasPrices = {
    [FuelType.NATURAL] = {
        min = 20.0,
        max = 50.0,
    },
    [FuelType.DIESEL] = {
        min = 20.0,
        max = 50.0,
    },
    [FuelType.EV] = {
        min = 10.0,
        max = 30.0,
    },
    [FuelType.LPG] = {
        min = 10.0,
        max = 30.0,
    },
    [FuelType.CNG] = {
        min = 10.0,
        max = 30.0,
    },
    [FuelType.MILK] = {
        min = 100.0,
        max = 999.0,
    },
    [FuelType.AVIATION] = {
        min = 450.0,
        max = 750.0,
    },
}

-- If you want to set a maximum price limit for different types of fuel when the gas station owner is updating prices,
-- you can configure that here. This ensures that the price for each fuel type cannot exceed the specified value.
Config.LockedFuelPrice = {
    --[FuelType.NATURAL] = 0,
    --[FuelType.DIESEL] = 0,
    --[FuelType.EV] = 0,
    --[FuelType.LPG] = 0,
    --[FuelType.CNG] = 0,
    --[FuelType.MILK] = 0,
    --[FuelType.AVIATION] = 0,
}

-- updating hash models, some maps that are changing the models them self.
-- according to my search it seems like this specific map only change one fuel station
if Config.ServerMaps then
    if Config.ServerMaps["cfx-gabz-esbltd"] then
        if Config.ShopList["fuel_pump6"] then
            for k, v in pairs(Config.ShopList["fuel_pump6"].pumpPosition) do
                v.hash = 486135101
            end
        end
    end
end