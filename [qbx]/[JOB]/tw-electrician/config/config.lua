Config                       = {}
Locales                      = Locales or {}
Config.Framework             = 'qb'      -- esx, oldesx, qb, oldqb qb = qbox -- || type qb if you are using qbox
Config.Locale                = 'en'
Config.CurrencyUnit          = '$'       -- '€' -- '₺'  '$'
Config.SQL                   = "oxmysql" -- oxmysql / mysql-async / ghmattimysql
Config.Inventory             =
"qb_inventory"                           -- qb_inventory / esx_inventory / ox_inventory / qs_inventory / need Config.missioncompletedItems
Config.ServerName            = "TWORST"  -- Server Name MAX 10
Config.MoneyType             = "$"       -- Money Type
Config.MoneyType2            = "bank"    -- Money Type bank / cash
Config.InteractionHandler    =
'ox-target'                               --  drawtext, qb-target - ox-target
Config.ExampleProfilePicture = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"

Config.Command               = {
    jobReset = "jobresetelectrician",
    jobLeave = "jobleaveelectrician",
    openTutorial = "openTutorialelectrician",
}

Config.jobCoolDownHours      = 0             -- Job Cooldown Hours if 0 no cooldowns
Config.ChangeClothesSystem   = false         -- true / false
Config.ClothingScript        = "qb-clothing" -- fivem-appearance / illenium-appearance  / esx_skin / qb-clothing
Config.TebexSystem           = true          -- true / false -- There is currently no tebex system, infrastructure for future addition
Config.Debug                 = false         -- true / false
Config.jobLevelCheck         = false         -- true / false  -- Everyone in the lobby is checked for level.
Config.closeInvisable        = false         -- prevents the player from being invisible during UI

Config.DefaultUIPositions    = {
    teamList = { top = '77.22vh', left = '85.94vw' },
    scoreList = { top = '2.64vh', left = '1.61vw' },
    inviteSide = { top = '2.85vh', left = '73.07vw' },
    notificationDiv = { top = '40.48vh', left = '81.54vw' }
}


Config.Job                = {
    ['coords'] = {
        ['intreactionCoords'] = vector3(528.77, -1603.26, 29.34),
        ['ped'] = true,
        ['pedCoords'] = vector3(528.77, -1603.26, 29.34),
        ['pedHeading'] = 46.59,
        ['pedHash'] = 0x49EA5685,
    },
    ['job'] = 'all',
    ['blip'] = {
        show = true,
        blipName = Locales[Config.Locale]['jobName'],
        blipType = 643,
        blipColor = 3,
        blipScale = 0.9
    },
    ['missionBlips'] = {
        [1] = {
            SetBlipSprite = 354,
            SetBlipColour = 5,
            SetBlipScale = 0.8,
            SetBlipDisplay = 4,
            blipName = Locales[Config.Locale]['missionOneBlips']
        },
        [2] = {
            SetBlipSprite = 354,
            SetBlipColour = 5,
            SetBlipScale = 0.8,
            SetBlipDisplay = 4,
            blipName = Locales[Config.Locale]['missionTwoBlips']
        },
        [3] = {
            SetBlipSprite = 354,
            SetBlipColour = 5,
            SetBlipScale = 0.8,
            SetBlipDisplay = 4,
            blipName = Locales[Config.Locale]['missionThreeBlips']
        },
        [4] = {
            SetBlipSprite = 354,
            SetBlipColour = 5,
            SetBlipScale = 0.8,
            SetBlipDisplay = 4,
            blipName = Locales[Config.Locale]['missionFourBlips']
        },
        [5] = {
            SetBlipSprite = 354,
            SetBlipColour = 5,
            SetBlipScale = 0.8,
            SetBlipDisplay = 4,
            blipName = Locales[Config.Locale]['missionFiveBlips']
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
    ['regionData'] = {
        {
            regionID = 1,
            regionInfo = {
                regionName = "El Burro Heights",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 5000,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 500,
                bonusExtraXP = 200,
            },
            regionJobVehicle = {
                vehicle = "utillitruck2",
                vehicle2 = 'utillitruck3',
            },
            vehicleSpawnCoords = {
                vehicleCoords = vector4(528.24, -1590.85, 29.28, 139.91),
                vehicleCoords2 = vector4(516.8, -1604.03, 29.3, 319.85),
            },
            regionJobTask = {
                {
                    id = 1,
                    jobName = "fixTrafo",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2
                    },
                    jobLabel = Locales[Config.Locale]['missionOneBlips']
                },
                {
                    id = 2,
                    jobName = "fixHouseBoard",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 4
                    },
                    jobLabel = Locales[Config.Locale]['missionTwoBlips']
                },
                {
                    id = 3,
                    jobName = "fixStreetLamp",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 4
                    },
                    jobLabel = Locales[Config.Locale]['missionThreeBlips']
                },
                {
                    id = 4,
                    jobName = "fixTrafficLamp",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 1
                    },
                    jobLabel = Locales[Config.Locale]['missionFourBlips']
                },

                {
                    id = 5,
                    jobName = "phonePole",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2
                    },
                    jobLabel = Locales[Config.Locale]['missionFiveBlips']
                },
            },
        },
        {
            regionID = 2,
            regionInfo = {
                regionName = "El Burro Heights",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 5000,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 500,
                bonusExtraXP = 200,
            },
            regionJobVehicle = {
                vehicle = "utillitruck2",
                vehicle2 = 'utillitruck3',
            },
            vehicleSpawnCoords = {
                vehicleCoords = vector4(528.24, -1590.85, 29.28, 139.91),
                vehicleCoords2 = vector4(516.8, -1604.03, 29.3, 319.85),
            },
            regionJobTask = {
                {
                    id = 1,
                    jobName = "fixTrafo",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionOneBlips']
                },
                {
                    id = 2,
                    jobName = "fixHouseBoard",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 4
                    },
                    jobLabel = Locales[Config.Locale]['missionTwoBlips']
                },
                {
                    id = 3,
                    jobName = "fixStreetLamp",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionThreeBlips']
                },
                {
                    id = 4,
                    jobName = "fixTrafficLamp",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2
                    },
                    jobLabel = Locales[Config.Locale]['missionFourBlips']
                },

                {
                    id = 5,
                    jobName = "phonePole",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2
                    },
                    jobLabel = Locales[Config.Locale]['missionFiveBlips']
                },
            },
        },
        {
            regionID = 3,
            regionInfo = {
                regionName = "El Burro Heights",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 5000,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 500,
                bonusExtraXP = 200,
            },
            regionJobVehicle = {
                vehicle = "utillitruck2",
                vehicle2 = 'utillitruck3',
            },
            vehicleSpawnCoords = {
                vehicleCoords = vector4(528.24, -1590.85, 29.28, 139.91),
                vehicleCoords2 = vector4(516.8, -1604.03, 29.3, 319.85),
            },
            regionJobTask = {
                {
                    id = 1,
                    jobName = "fixTrafo",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionOneBlips']
                },
                {
                    id = 2,
                    jobName = "fixHouseBoard",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionTwoBlips']
                },
                {
                    id = 3,
                    jobName = "fixStreetLamp",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionThreeBlips']
                },
                {
                    id = 4,
                    jobName = "fixTrafficLamp",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2
                    },
                    jobLabel = Locales[Config.Locale]['missionFourBlips']
                },

                {
                    id = 5,
                    jobName = "phonePole",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionFiveBlips']
                },
            },
        },
        {
            regionID = 4,
            regionInfo = {
                regionName = "El Burro Heights",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 5000,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 500,
                bonusExtraXP = 200,
            },
            regionJobVehicle = {
                vehicle = "utillitruck2",
                vehicle2 = 'utillitruck3',
            },
            vehicleSpawnCoords = {
                vehicleCoords = vector4(528.24, -1590.85, 29.28, 139.91),
                vehicleCoords2 = vector4(516.8, -1604.03, 29.3, 319.85),
            },
            regionJobTask = {
                {
                    id = 1,
                    jobName = "fixTrafo",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionOneBlips']
                },
                {
                    id = 2,
                    jobName = "fixHouseBoard",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionTwoBlips']
                },
                {
                    id = 3,
                    jobName = "fixStreetLamp",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionThreeBlips']
                },
                {
                    id = 4,
                    jobName = "fixTrafficLamp",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2
                    },
                    jobLabel = Locales[Config.Locale]['missionFourBlips']
                },
                {
                    id = 5,
                    jobName = "phonePole",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionFiveBlips']
                },
            },
        },
        {
            regionID = 5,
            regionInfo = {
                regionName = "El Burro Heights",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 5000,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 500,
                bonusExtraXP = 200,
            },
            regionJobVehicle = {
                vehicle = "utillitruck2",
                vehicle2 = 'utillitruck3',
            },
            vehicleSpawnCoords = {
                vehicleCoords = vector4(528.24, -1590.85, 29.28, 139.91),
                vehicleCoords2 = vector4(516.8, -1604.03, 29.3, 319.85),
            },
            regionJobTask = {
                {
                    id = 1,
                    jobName = "fixTrafo",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 4
                    },
                    jobLabel = Locales[Config.Locale]['missionOneBlips']
                },
                {
                    id = 2,
                    jobName = "fixHouseBoard",
                    missionCount = {
                        minAmount = 3,
                        maxAmount = 5
                    },
                    jobLabel = Locales[Config.Locale]['missionTwoBlips']
                },
                {
                    id = 3,
                    jobName = "fixStreetLamp",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 4
                    },
                    jobLabel = Locales[Config.Locale]['missionThreeBlips']
                },
                {
                    id = 4,
                    jobName = "fixTrafficLamp",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2
                    },
                    jobLabel = Locales[Config.Locale]['missionFourBlips']
                },
                {
                    id = 5,
                    jobName = "phonePole",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionFiveBlips']
                },
            },
        },
        {
            regionID = 6,
            regionInfo = {
                regionName = "El Burro Heights",
                regionJobTask = Locales[Config.Locale] and Locales[Config.Locale]['regionJobTask'],
                regionImage = "region.png",
                regionMinimumLevel = 0
            },
            regionAwards = {
                money = 5000,
                xp = 1000,
                onlineJobExtraAwards = 2,
                bonusExtraMoney = 500,
                bonusExtraXP = 200,
            },
            regionJobVehicle = {
                vehicle = "utillitruck2",
                vehicle2 = 'utillitruck3',
            },
            vehicleSpawnCoords = {
                vehicleCoords = vector4(528.24, -1590.85, 29.28, 139.91),
                vehicleCoords2 = vector4(516.8, -1604.03, 29.3, 319.85),
            },
            regionJobTask = {
                {
                    id = 1,
                    jobName = "fixTrafo",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 4
                    },
                    jobLabel = Locales[Config.Locale]['missionOneBlips']
                },
                {
                    id = 2,
                    jobName = "fixHouseBoard",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 4
                    },
                    jobLabel = Locales[Config.Locale]['missionTwoBlips']
                },
                {
                    id = 3,
                    jobName = "fixStreetLamp",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 3
                    },
                    jobLabel = Locales[Config.Locale]['missionThreeBlips']
                },
                {
                    id = 4,
                    jobName = "fixTrafficLamp",
                    missionCount = {
                        minAmount = 1,
                        maxAmount = 2
                    },
                    jobLabel = Locales[Config.Locale]['missionFourBlips']
                },
                {
                    id = 5,
                    jobName = "phonePole",
                    missionCount = {
                        minAmount = 2,
                        maxAmount = 4
                    },
                    jobLabel = Locales[Config.Locale]['missionFiveBlips']
                },
            },
        },
    },
    ['dailyMission'] = {
        {
            name = 'jobtask_one',
            header = Locales[Config.Locale]['jobtask'] .. " 1",
            label = Locales[Config.Locale]['dailyjobone'],
            count = 50,
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
    { id = 1, title = Locales[Config.Locale]['tutorialTitle1'], description = Locales[Config.Locale]['tutorialDescription1'], name = 'https://r2.fivemanage.com/tM2PEEacUkwu1dgBsfJoa/video1-480p.mp4' },
    { id = 2, title = Locales[Config.Locale]['tutorialTitle2'], description = Locales[Config.Locale]['tutorialDescription2'], name = 'https://r2.fivemanage.com/tM2PEEacUkwu1dgBsfJoa/video2-480p.mp4' },
    { id = 3, title = Locales[Config.Locale]['tutorialTitle3'], description = Locales[Config.Locale]['tutorialDescription3'], name = 'https://r2.fivemanage.com/tM2PEEacUkwu1dgBsfJoa/video3-480p.mp4' },
    { id = 4, title = Locales[Config.Locale]['tutorialTitle4'], description = Locales[Config.Locale]['tutorialDescription4'], name = 'https://r2.fivemanage.com/tM2PEEacUkwu1dgBsfJoa/video4-480p.mp4' },
    { id = 5, title = Locales[Config.Locale]['tutorialTitle5'], description = Locales[Config.Locale]['tutorialDescription5'], name = 'https://r2.fivemanage.com/tM2PEEacUkwu1dgBsfJoa/video5-480p.mp4' },
    { id = 6, title = Locales[Config.Locale]['tutorialTitle6'], description = Locales[Config.Locale]['tutorialDescription6'], name = 'https://r2.fivemanage.com/tM2PEEacUkwu1dgBsfJoa/video6-480p.mp4' },
}

Config.trafficLightModels = {
    "prop_traffic_03a",
    "prop_traffic_02a",
    "prop_traffic_01a",
    "prop_traffic_01d",
    "prop_traffic_lightset_01",
    "prop_traffic_01b",
    "prop_traffic_03b",
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
    elseif GetResourceState("lc_fuel") == "started" then
        exports["lc_fuel"]:SetFuel(vehicle, 100)
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

Config.sendNotification   = function(messageData)
    local message, messageType
    if type(messageData) == "table" then
        message = messageData.text
        messageType = messageData.type
    elseif type(messageData) == "string" then
        for key, value in pairs(Config.NotificationText) do
            if value.text == messageData then
                message = value.text
                messageType = value.type
                break
            end
        end

        if not message then
            message = messageData
            messageType = "info"
        end
    end

    NuiMessage('NOTIFICATION', { message = message, type = messageType })
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
        type = "success"
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
        type = "success"
    },
    ['notfoundtbxid'] = {
        text = Locales[Config.Locale]['notfoundtbxid'],
        type = "error"
    },
    ['getontruck'] = {
        text = Locales[Config.Locale]['getontruck'],
        type = "info"
    },
    ['alreadyarea'] = {
        text = Locales[Config.Locale]['alreadyarea'],
        type = "error"
    },
    ['alreadyHaveItem'] = {
        text = Locales[Config.Locale]['alreadyHaveItem'],
        type = "error"
    },
    ['isownernotleave'] = {
        text = Locales[Config.Locale]['isownernotleave'],
        type = "error"
    },
    ['bonusjobtask'] = {
        text = Locales[Config.Locale]['bonusjobtask'],
        type = "success"
    },
    ['invehicle'] = {
        text = Locales[Config.Locale]['invehicle'],
        type = "error"
    },

    ['cantentervehicle'] = {
        text = Locales[Config.Locale]['cantentervehicle'],
        type = "error"
    },
    ['settingssaved'] = {
        text = Locales[Config.Locale]['settingssaved'],
        type = "success"
    },

    ['missionnotpermit'] = {
        text = Locales[Config.Locale]['missionnotpermit'],
        type = "errorNotify"
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

Config.LanguageTitle      = {
    { value = 'en', label = 'English' },
    { value = 'tr', label = 'Turkish' },
    { value = 'ar', label = 'Arabic' },
    { value = 'de', label = 'German' },
    { value = 'fr', label = 'French' },
    { value = 'pt', label = 'Portuguese' },
    { value = 'ru', label = 'Russian' },
}

Config.ControlLift        = {
    up = 172, -- 172 or 188
    down = 173
}

Config.InteractionKeys    = {
    ['E'] = 38,
}


Config.SetVehicleExtra = {
    { 1, 1 },
    { 2, 1 },
    { 3, 0 },
    { 4, 1 },
    { 5, 1 },
    { 6, 0 }
}

Keys                   = {
    ['ESC'] = 322,
    ['F1'] = 288,
    ['F2'] = 289,
    ['F3'] = 170,
    ['F5'] = 166,
    ['F6'] = 167,
    ['F7'] = 168,
    ['F8'] = 169,
    ['F9'] = 56,
    ['F10'] = 57,
    ['~'] = 243,
    ['1'] = 157,
    ['2'] = 158,
    ['3'] = 160,
    ['4'] = 164,
    ['5'] = 165,
    ['6'] = 159,
    ['7'] = 161,
    ['8'] = 162,
    ['9'] = 163,
    ['-'] = 84,
    ['='] = 83,
    ['BACKSPACE'] = 177,
    ['TAB'] = 37,
    ['Q'] = 44,
    ['W'] = 32,
    ['E'] = 38,
    ['R'] = 45,
    ['T'] = 245,
    ['Y'] = 246,
    ['U'] = 303,
    ['P'] = 199,
    ['['] = 39,
    [']'] = 40,
    ['ENTER'] = 18,
    ['CAPS'] = 137,
    ['A'] = 34,
    ['S'] = 8,
    ['D'] = 9,
    ['F'] = 23,
    ['G'] = 47,
    ['H'] = 74,
    ['K'] = 311,
    ['L'] = 182,
    ['LEFTSHIFT'] = 21,
    ['Z'] = 20,
    ['X'] = 73,
    ['C'] = 26,
    ['V'] = 0,
    ['B'] = 29,
    ['N'] = 249,
    ['M'] = 244,
    [','] = 82,
    ['.'] = 81,
    ['LEFTCTRL'] = 36,
    ['LEFTALT'] = 19,
    ['SPACE'] = 22,
    ['RIGHTCTRL'] = 70,
    ['HOME'] = 213,
    ['PAGEUP'] = 10,
    ['PAGEDOWN'] = 11,
    ['DEL'] = 178,
    ['LEFT'] = 174,
    ['RIGHT'] = 175,
    ['TOP'] = 27,
    ['DOWN'] = 173,
}

Config.Interaction     = {
    default = {
        hideSquare = false,
        checkVisibility = false,
        distance = 10.0,
        distanceText = 2.0,
        showInVehicle = true,
        offset = {
            text = { x = 0.0, y = 0.0, z = 0.2 },
            target = { x = 0.0, y = 0.0, z = 0.0 }
        },
        duration = 1000,
        key = "E",
        icon = "fa-solid fa-user",
    },
    maximumDistance = 50.0,
    keyScrollUp = "TOP",
    keyScrollDown = "DOWN",
    tick = {
        checkNearbyEntities = 3000,
        adjustEntities = 750,
        updateCoordinates = 5,
        drawInteraction = 3
    }
}
