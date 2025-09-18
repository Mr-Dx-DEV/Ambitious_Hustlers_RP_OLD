Config                       = {}
Locales                      = Locales or {}
Config.Framework             = 'qb'       -- esx, oldesx, qb, oldqb qb = qbox -- || type qb if you are using qbox
Config.Locale                = 'en'
Config.CurrencyUnit          = '$'        -- '€' -- '₺'  '$'
Config.SQL                   = "oxmysql"  -- oxmysql / mysql-async / ghmattimysql
Config.Inventory             =
"qb_inventory"                            -- qb_inventory / esx_inventory / ox_inventory / qs_inventory / need Config.missioncompletedItems
Config.ServerName            = "TWORST"   -- Server Name MAX 10
Config.MoneyType             = "$"        -- Money Type
Config.MoneyType2            = "bank"     -- Money Type bank / cash
Config.InteractionHandler    = 'ox-target' --  qb-target, drawtext,ox-target
Config.ExampleProfilePicture = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
Config.Command               = {
    jobReset = "jobresetgardenerv2",
    jobLeave = "jobleavegardenerv2",
    openTutorial = "openTutorialgardenerv2",
}
Config.jobCoolDownHours      = 0             -- Job Cooldown Hours if 0 no cooldowns
Config.ChangeClothesSystem   = false         -- true / false
Config.ClothingScript        = "qb-clothing" -- fivem-appearance / illenium-appearance  / esx_skin / qb-clothing
Config.TebexSystem           = true          -- true / false -- There is currently no tebex system, infrastructure for future addition
Config.Debug                 = false         -- true / false
Config.onlyOneGroup          = false         -- true / false
Config.jobLevelCheck         = false         -- true / false  -- Everyone in the lobby is checked for level.
Config.Vorp                  = false         -- true / false -- dont change this
Config.closeInvisable        = false         -- prevents the player from being invisible during UI


Config.DefaultUIPositions = {
    teamList = { top = '77.22vh', left = '85.94vw' },
    scoreList = { top = '2.64vh', left = '1.61vw' },
    inviteSide = { top = '2.85vh', left = '73.07vw' },
    notificationDiv = { top = '40.48vh', left = '81.54vw' }
}

Config.Gardenerv2         = {
    ['coords'] = {
        ['intreactionCoords'] = vector3(-670.43, -888.99, 24.5),
        ['ped'] = true,
        ['pedCoords'] = vector3(-670.43, -888.99, 24.5),
        ['pedHeading'] = 186.29,
        ['pedHash'] = 0x49EA5685,
    },
    ['job'] = 'all',
    ['blip'] = {
        show = true,
        blipName = Locales[Config.Locale]['gardenerv2job'],
        blipType = 631,
        blipColor = 2,
        blipScale = 0.55
    },
    ['missionBlips'] = {
        ['prunegrass'] = {
            SetBlipSprite = 570,
            SetBlipColour = 24,
            SetBlipScale = 0.60,
            SetBlipDisplay = 4
        },
        ['lawnmowing'] = {
            SetBlipSprite = 570,
            SetBlipColour = 25,
            SetBlipScale = 0.60,
            SetBlipDisplay = 4
        },
        ['vehicleBlips'] = {
            SetBlipSprite = 67,
            SetBlipColour = 0,
            SetBlipScale = 0.8,
        },

        ['deliveryBlips'] = {
            SetBlipSprite = 38,
            SetBlipColour = 29,
            SetBlipScale = 0.80,
        },
        ['flower'] = {
            SetBlipSprite = 570,
            SetBlipColour = 43,
            SetBlipScale = 0.60,
            SetBlipDisplay = 4
        },
        ['branch'] = {
            SetBlipSprite = 836,
            SetBlipColour = 52,
            SetBlipScale = 0.80,
            SetBlipDisplay = 4
        }

    },
    ['missioncompletedItems'] = {
        giveItemPlayer = false, -- true / false
        itemList = {
            { item = "sandwich", count = math.random(1, 4) },
            { item = "sandwich", count = 1 },
        },
    },
    ['drawtext'] = {
        ['deliveryVehicle'] = Locales[Config.Locale]['deliveryVehicle'],
    },
    ['progressBarText'] = {

    },
    ['regionData'] = {
        {
            regionID = 1,
            regionInfo = {
                regionName = "Los Santos Department",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 5000,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 0,
                bonusExtraXP = 0,
            },
            regionJobVehicle = {
                vehicle = "tolsadler",
                mower = "mower",
                ExtraVehicle = true,
            },
            vehicleSpawnCoords = {
                vector4(-685.23, -885.77, 24.57, 180.75),
                vector4(-681.05, -884.81, 24.24, 180.16)
            },
            jobDeliverCoords = vector3(-685.23, -885.77, 24.57),
            mowerSpawnCoords = {
                vector4(-686.2, -877.41, 24.89, 180.79),
                vector4(-680.95, -877.76, 23.93, 180.24)
            },
            flowerArea = {
                { coords = vector3(-1315.52, -1463.46, 4.31), area = 15.0 }
            },
            regionJobTask = {
                {
                    jobName = "lawnmowing",
                    missionCount = { -- default max 120
                        minAmount = 20,
                        maxAmount = 30,
                    },
                    jobLabel = Locales[Config.Locale]['lawnmowing']
                },
                {
                    jobName = "prunegrass", -- default max 32
                    missionCount = {
                        minAmount = 8,
                        maxAmount = 12,
                    },
                    jobLabel = Locales[Config.Locale]['prunegrass']
                },
                {
                    jobName = "branch", -- default max 4
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2,
                    },
                    jobLabel = Locales[Config.Locale]['branch']
                },
                {
                    jobName = "plantflower", -- write according to no limit area size
                    missionCount = {
                        minAmount = 4,
                        maxAmount = 10,
                    },
                    jobLabel = Locales[Config.Locale]['plantflower']
                },
                {
                    jobName = "wateringcan",
                    jobLabel = Locales[Config.Locale]['wateringcan'],
                    bonusJob = true,
                },
                {
                    jobName = "takeBranch",
                    jobLabel = Locales[Config.Locale]['takebranch'],
                    bonusJob = true,
                },
            },
            modelList = {
                flower = {
                    "vw_prop_flowers_vase_03a"
                },
                mower = {
                    "prop_weeddry_nxg04", "prop_weeds_nxg08", "prop_weeds_nxg07b001", "prop_weeds_nxg06",
                    "prop_weeds_nxg07b", "prop_weeds_nxg08b"
                },
                prunegrass = {
                    before = { "prop_bush_neat_08" },
                    after = { "prop_bush_ornament_04", "prop_bush_ornament_02", "prop_bush_ornament_03", "prop_bush_neat_02" },
                },
            }
        },
        {
            regionID = 2,
            regionInfo = {
                regionName = "Los Santos Department",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 7500,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 0,
                bonusExtraXP = 0,
            },
            regionJobVehicle = {
                vehicle = "tolsadler",
                mower = "mower",
                ExtraVehicle = true,
            },
            vehicleSpawnCoords = {
                vector4(-685.23, -885.77, 24.57, 180.75),
                vector4(-681.05, -884.81, 24.24, 180.16)
            },
            jobDeliverCoords = vector3(-685.23, -885.77, 24.57),
            mowerSpawnCoords = {
                vector4(-686.2, -877.41, 24.89, 180.79),
                vector4(-680.95, -877.76, 23.93, 180.24)
            },
            flowerArea = {
                { coords = vector3(-117.02, -426.76, 35.8), area = 10.0 }
            },
            regionJobTask = {
                {
                    jobName = "lawnmowing", -- default max 88
                    missionCount = {
                        minAmount = 20,
                        maxAmount = 25,
                    },
                    jobLabel = Locales[Config.Locale]['lawnmowing']
                },
                {
                    jobName = "prunegrass", -- default max 33
                    missionCount = {
                        minAmount = 15,
                        maxAmount = 20,
                    },
                    jobLabel = Locales[Config.Locale]['prunegrass']
                },
                {
                    jobName = "branch", -- default max 9
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 6,
                    },
                    jobLabel = Locales[Config.Locale]['branch']
                },
                {
                    jobName = "plantflower", -- write according to no limit area size
                    missionCount = {
                        minAmount = 5,
                        maxAmount = 12,
                    },
                    jobLabel = Locales[Config.Locale]['plantflower']
                },
                {
                    jobName = "wateringcan",
                    jobLabel = Locales[Config.Locale]['wateringcan'],
                    bonusJob = true,
                },
                {
                    jobName = "takeBranch",
                    jobLabel = Locales[Config.Locale]['takebranch'],
                    bonusJob = true,
                },
            },
            modelList = {
                flower = {
                    "vw_prop_flowers_vase_03a"
                },
                mower = {
                    "prop_weeddry_nxg04", "prop_weeds_nxg08", "prop_weeds_nxg07b001", "prop_weeds_nxg06",
                    "prop_weeds_nxg07b", "prop_weeds_nxg08b"
                },
                prunegrass = {
                    before = { "prop_bush_neat_08" },
                    after = { "prop_bush_ornament_04", "prop_bush_ornament_02", "prop_bush_ornament_03", "prop_bush_neat_02" },
                },
            }
        },
        {
            regionID = 3,
            regionInfo = {
                regionName = "Los Santos Department",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 10000,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 0,
                bonusExtraXP = 0,
            },
            regionJobVehicle = {
                vehicle = "tolsadler",
                mower = "mower",
                ExtraVehicle = true,
            },
            vehicleSpawnCoords = {
                vector4(-685.23, -885.77, 24.57, 180.75),
                vector4(-681.05, -884.81, 24.24, 180.16)
            },
            jobDeliverCoords = vector3(-685.23, -885.77, 24.57),
            mowerSpawnCoords = {
                vector4(-686.2, -877.41, 24.89, 180.79),
                vector4(-680.95, -877.76, 23.93, 180.24)
            },
            flowerArea = {
                { coords = vector3(-523.14, -242.22, 36.08), area = 10.0 }
            },
            regionJobTask = {
                {
                    jobName = "lawnmowing", -- default max 99
                    missionCount = {
                        minAmount = 25,
                        maxAmount = 32,
                    },
                    jobLabel = Locales[Config.Locale]['lawnmowing']
                },
                {
                    jobName = "prunegrass", -- default max 58
                    missionCount = {
                        minAmount = 15,
                        maxAmount = 24,
                    },
                    jobLabel = Locales[Config.Locale]['prunegrass']
                },
                {
                    jobName = "branch", -- default max 9
                    missionCount = {
                        minAmount = 5,
                        maxAmount = 5,
                    },
                    jobLabel = Locales[Config.Locale]['branch']
                },
                {
                    jobName = "plantflower", -- write according to no limit area size
                    missionCount = {
                        minAmount = 7,
                        maxAmount = 12
                    },
                    jobLabel = Locales[Config.Locale]['plantflower']
                },
                {
                    jobName = "wateringcan",
                    jobLabel = Locales[Config.Locale]['wateringcan'],
                    bonusJob = true,
                },
                {
                    jobName = "takeBranch",
                    jobLabel = Locales[Config.Locale]['takebranch'],
                    bonusJob = true,
                },
            },
            modelList = {
                flower = {
                    "vw_prop_flowers_vase_03a"
                },
                mower = {
                    "prop_weeddry_nxg04", "prop_weeds_nxg08", "prop_weeds_nxg07b001", "prop_weeds_nxg06",
                    "prop_weeds_nxg07b", "prop_weeds_nxg08b"
                },
                prunegrass = {
                    before = { "prop_bush_neat_08" },
                    after = { "prop_bush_ornament_04", "prop_bush_ornament_02", "prop_bush_ornament_03", "prop_bush_neat_02" },
                },
            }
        },
        {
            regionID = 4,
            regionInfo = {
                regionName = "Los Santos Department",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 12500,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 0,
                bonusExtraXP = 0,
            },
            regionJobVehicle = {
                vehicle = "tolsadler",
                mower = "mower",
                ExtraVehicle = true,
            },
            vehicleSpawnCoords = {
                vector4(-685.23, -885.77, 24.57, 180.75),
                vector4(-681.05, -884.81, 24.24, 180.16)
            },
            jobDeliverCoords = vector3(-685.23, -885.77, 24.57),
            mowerSpawnCoords = {
                vector4(-686.2, -877.41, 24.89, 180.79),
                vector4(-680.95, -877.76, 23.93, 180.24)
            },
            flowerArea = {
                { coords = vector3(-988.64, 279.46, 67.85), area = 14.0 }
            },
            regionJobTask = {
                {
                    jobName = "lawnmowing",
                    missionCount = { -- default max 116
                        minAmount = 20,
                        maxAmount = 28,
                    },
                    jobLabel = Locales[Config.Locale]['lawnmowing']
                },
                {
                    jobName = "prunegrass", -- default max 24
                    missionCount = {
                        minAmount = 10,
                        maxAmount = 15,
                    },
                    jobLabel = Locales[Config.Locale]['prunegrass']
                },
                {
                    jobName = "branch", -- default max 9
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 4,
                    },
                    jobLabel = Locales[Config.Locale]['branch']
                },
                {
                    jobName = "plantflower", -- write according to no limit area size
                    missionCount = {
                        minAmount = 8,
                        maxAmount = 13,
                    },
                    jobLabel = Locales[Config.Locale]['plantflower']
                },
                {
                    jobName = "wateringcan",
                    jobLabel = Locales[Config.Locale]['wateringcan'],
                    bonusJob = true,
                },
                {
                    jobName = "takeBranch",
                    jobLabel = Locales[Config.Locale]['takebranch'],
                    bonusJob = true,
                },
            },
            modelList = {
                flower = {
                    "vw_prop_flowers_vase_03a"
                },
                mower = {
                    "prop_weeddry_nxg04", "prop_weeds_nxg08", "prop_weeds_nxg07b001", "prop_weeds_nxg06",
                    "prop_weeds_nxg07b", "prop_weeds_nxg08b"
                },
                prunegrass = {
                    before = { "prop_bush_neat_08" },
                    after = { "prop_bush_ornament_04", "prop_bush_ornament_02", "prop_bush_ornament_03", "prop_bush_neat_02" },
                },
            }
        },

        {
            regionID = 5,
            regionInfo = {
                regionName = "Los Santos Department",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 12500,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 0,
                bonusExtraXP = 0,
            },
            regionJobVehicle = {
                vehicle = "tolsadler",
                mower = "mower",
                ExtraVehicle = true,
            },
            vehicleSpawnCoords = {
                vector4(-685.23, -885.77, 24.57, 180.75),
                vector4(-681.05, -884.81, 24.24, 180.16)
            },
            jobDeliverCoords = vector3(-685.23, -885.77, 24.57),
            mowerSpawnCoords = {
                vector4(-686.2, -877.41, 24.89, 180.79),
                vector4(-680.95, -877.76, 23.93, 180.24)
            },
            flowerArea = {
                { coords = vector3(-779.38, 886.04, 203.19), area = 15.0 }
            },
            regionJobTask = {
                {
                    jobName = "lawnmowing",
                    missionCount = { -- default max 116
                        minAmount = 30,
                        maxAmount = 45,
                    },
                    jobLabel = Locales[Config.Locale]['lawnmowing']
                },
                {
                    jobName = "prunegrass", -- default max 24
                    missionCount = {
                        minAmount = 10,
                        maxAmount = 12,
                    },
                    jobLabel = Locales[Config.Locale]['prunegrass']
                },
                {
                    jobName = "branch", -- default max 9
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2,
                    },
                    jobLabel = Locales[Config.Locale]['branch']
                },
                {
                    jobName = "plantflower", -- write according to no limit area size
                    missionCount = {
                        minAmount = 6,
                        maxAmount = 12,
                    },
                    jobLabel = Locales[Config.Locale]['plantflower']
                },
                {
                    jobName = "wateringcan",
                    jobLabel = Locales[Config.Locale]['wateringcan'],
                    bonusJob = true,
                },
                {
                    jobName = "takeBranch",
                    jobLabel = Locales[Config.Locale]['takebranch'],
                    bonusJob = true,
                },
            },
            modelList = {
                flower = {
                    "vw_prop_flowers_vase_03a"
                },
                mower = {
                    "prop_weeddry_nxg04", "prop_weeds_nxg08", "prop_weeds_nxg07b001", "prop_weeds_nxg06",
                    "prop_weeds_nxg07b", "prop_weeds_nxg08b"
                },
                prunegrass = {
                    before = { "prop_bush_neat_08" },
                    after = { "prop_bush_ornament_04", "prop_bush_ornament_02", "prop_bush_ornament_03", "prop_bush_neat_02" },
                },
            }
        },
    },
    ['dailyMission'] = {
        {
            name = 'jobtask_one',
            header = Locales[Config.Locale]['jobtask'] .. " 1",
            label = Locales[Config.Locale]['dailyjobone'],
            count = 200,
            xp = 2500,
            money = 1000,
        },
        {
            name = 'jobtask_two',
            header = Locales[Config.Locale]['jobtask'] .. " 2",
            label = Locales[Config.Locale]['dailyjobtwo'],
            count = 10,
            xp = 1000,
            money = 3000

        },
        {
            name = 'jobtask_three',
            header = Locales[Config.Locale]['jobtask'] .. " 3",
            label = Locales[Config.Locale]['dailyjobthree'],
            count = 10000,
            xp = 2000,
            money = 3000
        },

        {
            name = 'jobtask_four',
            header = Locales[Config.Locale]['jobtask'] .. " 4",
            label = Locales[Config.Locale]['dailyjobfour'],
            count = 20,
            xp = 2000,
            money = 3000
        },
    },
}

Config.TutorialList       = {
    { id = 1,  title = Locales[Config.Locale]['tutorialTitle1'],  description = Locales[Config.Locale]['tutorialDescription1'],  name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_one.mp4' },
    { id = 2,  title = Locales[Config.Locale]['tutorialTitle2'],  description = Locales[Config.Locale]['tutorialDescription2'],  name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_two.mp4' },
    { id = 3,  title = Locales[Config.Locale]['tutorialTitle3'],  description = Locales[Config.Locale]['tutorialDescription3'],  name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_three.mp4' },
    { id = 4,  title = Locales[Config.Locale]['tutorialTitle4'],  description = Locales[Config.Locale]['tutorialDescription4'],  name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_four.mp4' },
    { id = 5,  title = Locales[Config.Locale]['tutorialTitle5'],  description = Locales[Config.Locale]['tutorialDescription5'],  name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_five.mp4' },
    { id = 6,  title = Locales[Config.Locale]['tutorialTitle6'],  description = Locales[Config.Locale]['tutorialDescription6'],  name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_six.mp4' },
    { id = 7,  title = Locales[Config.Locale]['tutorialTitle7'],  description = Locales[Config.Locale]['tutorialDescription7'],  name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_seven.mp4' },
    { id = 8,  title = Locales[Config.Locale]['tutorialTitle8'],  description = Locales[Config.Locale]['tutorialDescription8'],  name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_eight.mp4' },
    { id = 9,  title = Locales[Config.Locale]['tutorialTitle9'],  description = Locales[Config.Locale]['tutorialDescription9'],  name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_nine.mp4' },
    { id = 10, title = Locales[Config.Locale]['tutorialTitle10'], description = Locales[Config.Locale]['tutorialDescription10'], name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_ten.mp4' },
    { id = 11, title = Locales[Config.Locale]['tutorialTitle11'], description = Locales[Config.Locale]['tutorialDescription11'], name = 'https://r2.fivemanage.com/9NudXTYtpmpSgugXi97iZ/video/tutorial_eleven.mp4' },
}

Config.JobClothes         = {
    male = {
        { jacket = 97,   texture = 0 },
        { shirt = 59,    texture = 0 },
        { arms = 0,      texture = 0 },
        { legs = 9,      texture = 6 },
        { shoes = 12,    texture = 3 },
        { mask = 0,      texture = 0 },
        { chain = 0,     texture = 11 },
        { decals = 0,    texture = 11 },
        { helmet = 0,    texture = 11 },
        { glasses = 0,   texture = 11 },
        { watches = 0,   texture = 11 },
        { bracelets = 0, texture = 11 }
    },
    female = {
        { jacket = 97,   texture = 0 },
        { shirt = 59,    texture = 0 },
        { arms = 0,      texture = 0 },
        { legs = 9,      texture = 6 },
        { shoes = 12,    texture = 3 },
        { mask = 0,      texture = 0 },
        { chain = 0,     texture = 11 },
        { decals = 0,    texture = 11 },
        { helmet = 0,    texture = 11 },
        { glasses = 0,   texture = 11 },
        { watches = 0,   texture = 11 },
        { bracelets = 0, texture = 11 }
    }
}

Config.Models             = {
    vehicleLadder = 'prop_ic_ladder',
}

Config.Vehiclekey         = true

Config.GiveVehicleKey     = function(plate, model, vehicle) -- you can change vehiclekeys export if you use another vehicle key system
    if Config.Vehiclekey then
        if GetResourceState("cd_garage") == "started" then
            TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
        elseif GetResourceState("qs-vehiclekeys") == "started" then
            model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
        elseif GetResourceState("wasabi-carlock") == "started" then
            exports.wasabi_carlock:GiveKey(plate)
        elseif GetResourceState("qb-vehiclekeys") == "started" then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        elseif GetResourceState("qbx-vehiclekeys") == "started" then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        else
            if Config.Framework == "qb" or Config.Framework == "oldqb" then
                TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
            else
                print("No vehicle key system found")
            end
        end
    end
end

Config.Removekeys         = true

Config.RemoveVehiclekey   = function(plate, model, vehicle)
    if Config.Removekeys then
        if GetResourceState("cd_garage") == "started" then
            TriggerServerEvent('cd_garage:RemovePersistentVehicles', exports['cd_garage']:GetPlate(vehicle))
        elseif GetResourceState("qs-vehiclekeys") == "started" then
            model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
            exports['qs-vehiclekeys']:RemoveKeys(plate, model)
        elseif GetResourceState("wasabi-carlock") == "started" then
            exports.wasabi_carlock:RemoveKey(plate)
        elseif GetResourceState("qb-vehiclekeys") == "started" then
            TriggerServerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
        elseif GetResourceState("qbx-vehiclekeys") == "started" then
            TriggerServerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
        else
            if Config.Framework == "qb" or Config.Framework == "oldqb" then
                TriggerServerEvent('qb-vehiclekeys:client:RemoveKeys', plate)
            else
                print("No vehicle key system found")
            end
        end
    end
end

Config.SetVehicleFuel     = function(vehicle) -- you can change LegacyFuel export if you use another fuel system
    if GetResourceState("LegacyFuel") == "started" then
        return exports["LegacyFuel"]:SetFuel(vehicle, 100.0)
    elseif GetResourceState("x-fuel") == "started" then
        return exports["x-fuel"]:SetFuel(vehicle, 100.0)
    elseif GetResourceState("ox_fuel") == "started" then
        return SetVehicleFuelLevel(vehicle, 100.0)
    elseif GetResourceState("cdn-fuel") == "started" then
        return exports['cdn-fuel']:SetFuel(vehicle, 100.0)
    elseif GetResourceState("ps-fuel") == "started" then
        return exports['ps-fuel']:SetFuel(vehicle, 100.0)
    else
        return SetVehicleFuelLevel(vehicle, 100.0)
    end
end

Config.RefreshSkin        = function()
    if Config.ChangeClothesSystem then
        if Config.ChangeClothesSystem then
            if Config.ClothingScript == 'fivem-appearance' then
                -- wasabi-fivem-appearance
                Core.TriggerServerCallback('esx_skin:getPlayerSkin', function(appearance)
                    exports['fivem-appearance']:setPlayerAppearance(appearance)
                end)

                --normal fivem-appearance
                -- TriggerEvent("fivem-appearance:client:reloadSkin")
            end
            if Config.ClothingScript == 'illenium-appearance' then
                TriggerEvent("illenium-appearance:client:reloadSkin")
            end
            if Config.ClothingScript == 'esx_skin' then
                TriggerEvent("esx_skin:getLastSkin", function(lastSkin)
                    TriggerEvent('skinchanger:loadSkin', lastSkin)
                end)
            end
            if Config.ClothingScript == 'qb-clothing' then
                TriggerEvent("qb-clothing:reloadSkin")
                --[[
                    // Add this code in qb-clothing client/main.lua

                    RegisterNetEvent("qb-clothing:reloadSkin")
                    AddEventHandler("qb-clothing:reloadSkin", function()
                        local playerPed = PlayerPedId()
                        local health = GetEntityHealth(playerPed)
                        reloadSkin(health)
                    end)
                --]]
                ExecuteCommand('refreshskin')
            end
        end
    end
end

Config.sendNotification   = function(messages, value)
    NuiMessage('NOTIFICATION', { message = messages, type = value })
end

Config.endJobFunction     = function(source, owneridentifier, scoreAmount)
end

Config.NotificationText   = {
    ['vehicleexist'] = {
        text = Locales[Config.Locale]['vehicleexist'],
        type = "error"
    },
    ['wrongjob'] = {
        text = Locales[Config.Locale]['wrongjob'],
        type = "error"
    },
    ['jobcooldown'] = {
        text = Locales[Config.Locale]['jobcooldown'],
        type = "error"
    },
    ['delivervehicle'] = {
        text = Locales[Config.Locale]['delivervehicle'],
        type = "info"
    },
    ['playerfaraway'] = {
        text = Locales[Config.Locale]['playerfaraway'],
        type = "info"
    },
    ['lobbyfull'] = {
        text = Locales[Config.Locale]['lobbyfull'],
        type = "succes"
    },
    ['jobnotstarted'] = {
        text = Locales[Config.Locale]['jobnotstarted'],
        type = "error"
    },
    ['jobalreadystarted'] = {
        text = Locales[Config.Locale]['jobalreadystarted'],
        type = "error"
    },
    ['maxlevel'] = {
        text = Locales[Config.Locale]['maxlevel'],
        type = "error"
    },
    ['joblevelnotenough'] = {
        text = Locales[Config.Locale]['joblevelnotenough'],
        type = "error"
    },
    ['playeralreadyinlobby'] = {
        text = Locales[Config.Locale]['playeralreadyinlobby'],
        type = "error"
    },

    ['missionnotselected'] = {
        text = Locales[Config.Locale]['missionnotselected'],
        type = "error"
    },
    ['playerleftlobby'] = {
        text = Locales[Config.Locale]['playerleftlobby'],
        type = "error"
    },
    ['deliverVehile'] = {
        text = Locales[Config.Locale]['deliverVehile'],
        type = "info"
    },
    ['resetJob'] = {
        text = Locales[Config.Locale]['resetJob'],
        type = "error"
    },
    ['notowner'] = {
        text = Locales[Config.Locale]['notowner'],
        type = "error"
    },
    ['usedtbxid'] = {
        text = Locales[Config.Locale]['usedtbxid'],
        type = "error"
    },
    ['successfullyExp'] = {
        text = Locales[Config.Locale]['successfullyExp'],
        type = "succes"
    },
    ['notfoundtbxid'] = {
        text = Locales[Config.Locale]['notfoundtbxid'],
        type = "error"
    },
    ['getontruck'] = {
        text = Locales[Config.Locale]['getontruck'],
        type = "info"
    },
    ['waypoint'] = {
        text = Locales[Config.Locale]['waypoint'],
        type = "succes"
    },
    ['boxfull'] = {
        text = Locales[Config.Locale]['boxfull'],
        type = "error"
    },
    ['alreadyarea'] = {
        text = Locales[Config.Locale]['alreadyarea'],
        type = "error"
    },
    ['isownernotleave'] = {
        text = Locales[Config.Locale]['isownernotleave'],
        type = "error"
    },
    ['alreadyhaveitem'] = {
        text = Locales[Config.Locale]['alreadyhaveitem'],
        type = "error"
    },
    ['branchnotintree'] = {
        text = Locales[Config.Locale]['branchnotintree'],
        type = "error"
    },

    ['bonusjobtask'] = {
        text = Locales[Config.Locale]['bonusjobtask'],
        type = "succes"
    },
    ['water'] = {
        text = Locales[Config.Locale]['water'],
        type = "succes"
    },
    ['invehicle'] = {
        text = Locales[Config.Locale]['invehicle'],
        type = "error"
    },
    ['needtrimmer'] = {
        text = Locales[Config.Locale]['needtrimmer'],
        type = "error"
    },

    ['nohit'] = {
        text = Locales[Config.Locale]['nohit'],
        type = "error"
    },
    ['cantentervehicle'] = {
        text = Locales[Config.Locale]['cantentervehicle'],
        type = "error"
    },
    ['settingssaved'] = {
        text = Locales[Config.Locale]['settingssaved'],
        type = "succes"
    },
}

Config.RequiredXP         = {
    [1] = 1000,
    [2] = 1500,
    [3] = 2000,
    [4] = 2500,
    [5] = 3000,
    [6] = 3500,
    [7] = 4000,
    [8] = 4500,
    [9] = 5000,
    [10] = 5500,
    [11] = 6000,
    [12] = 6500,
    [13] = 7000,
    [14] = 7500,
    [15] = 8000,
    [16] = 8500,
    [17] = 9000,
    [18] = 9500,
    [19] = 10000,
    [20] = 10500,
    [21] = 11000,
    [22] = 11500,
    [23] = 12000,
    [24] = 12500,
    [25] = 13000,
    [26] = 13500,
    [27] = 14000,
    [28] = 14500,
    [29] = 15000,
    [30] = 15500,
    [31] = 16000,
    [32] = 16500,
    [33] = 17000,
    [34] = 17500,
    [35] = 18000,
    [36] = 18500,
    [37] = 19000,
    [38] = 19500,
    [39] = 20000,
    [40] = 20500,
    [41] = 21000,
    [42] = 21500,
    [43] = 22000,
    [44] = 22500,
    [45] = 23000,
    [46] = 23500,
    [47] = 24000,
    [48] = 24500,
    [49] = 25000,
    [50] = 25500,
    [51] = 26500,
    [52] = 27500,
    [53] = 28500,
    [54] = 29500,
    [55] = 30500,
    [56] = 31500,
    [57] = 32500,
    [58] = 33500,
    [59] = 34500,
    [60] = 35500,
    [61] = 36500,
    [62] = 37500,
    [63] = 38500,
    [64] = 39500,
    [65] = 40500,
    [66] = 41500,
    [67] = 42500,
    [68] = 43500,
    [69] = 44500,
    [70] = 45500,

}

Config.Disable            = {
    onDeath = true,    -- Disable interactions on death
    onNuiFocus = true, -- Disable interactions while NUI is focused
    onVehicle = false, -- Disable interactions while in a vehicle
    onHandCuff = true, -- Disable interactions while handcuffed
}

Config.MaterialHashes     = {
    [-461750719] = 1,
    [930824497] = 1,
    [581794674] = 2,
    [-2041329971] = 4,
    [-309121453] = 2,
    [-913351839] = 2,
    [-1885547121] = 2,
    [-1915425863] = 2,
    [-1833527165] = 2,
    [2128369009] = 2,
    [-124769592] = 2,
    [-840216541] = 2,
    [-2073312001] = 3,
    [627123000] = 3,
    [1333033863] = 2, -- grass
    [-1286696947] = 5,
    [-1942898710] = 5,
    [-1595148316] = 6,
    [435688960] = 7,
    [223086562] = 8,
    [1109728704] = 8,
    [510490462] = 4,
    [-700658213] = 4,
}


Config.LanguageTitle = {
    { value = 'en', label = 'English' },
    { value = 'tr', label = 'Turkish' },
    { value = 'ar', label = 'Arabic' },
    { value = 'de', label = 'German' },
    { value = 'fr', label = 'French' },
    { value = 'pt', label = 'Portuguese' },
    { value = 'ru', label = 'Russian' },
}
