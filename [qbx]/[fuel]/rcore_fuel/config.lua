Config = {}

Config.Locale = "en"

Config.Framework = {
    -- 1 = esx
    -- 2 = qbcore
    Active = 2,

    -- esx
    ESX_SHARED_OBJECT = "esx:getSharedObject",

    -- es_extended resource name
    ES_EXTENDED_NAME = "es_extended",

    -------
    -- qbcore
    QBCORE_SHARED_OBJECT = "QBCore:GetObject",

    -- qb-core resource name
    QB_CORE_NAME = "qb-core",

    -- will not detect any supported framework if on true.
    DisableDetection = false,
}

-- enable statebags for ox_fuel
Config.EnableStateBagsForOxFuel = false

-- this will make the fuel pumps almost unbreakable.
-- ( for some reason rhino tank can destroy them god knows why... everything else I threw at the pumps didnt seems to break them, but the rhino tank... )
Config.EnableUnbreakableFuelPumps = true

-- general debug
Config.Debug = false

-- debug when error happens in F8
Config.ErrorDebug = false

-- is the game crashing when you pick the nozzle? Enable this, this will disable the ropes.
Config.DisableRopes = false

-- are you using notification that cannot work with ~keys~?
-- then please switch this to true and all keys will appear like this in notifications: [E] instead of ~INPUT_PICKUP~
Config.ForceNormalKeyLabels = false

-- what kind of skinchanger you would like to use?
-- if your server doesnt have any of the supported skinchanger the resource will simply disable this
-- feature and instead of equiping working clothes, the player will take "punch card" to work.

-- [[[[[[[       WARNING       ]]]]]]]
-- THIS configuration is automatic, you dont need to configure this at all. Configure this only if you need to force specific skinchanger.
-- [[[[[[[       WARNING       ]]]]]]]
--SkinChangerType.AUTOMATIC                 = Automatic detection
--SkinChangerType.SKIN_CHANGER              = skinchanger support
--SkinChangerType.CUI_CHARACTER             = cui_char support
--SkinChangerType.QB_CLOTHING               = qb_clothing support
--SkinChangerType.FIVEM_APPEARANCE          = Fivem appearance support
--SkinChangerType.ILLENIUM_APPEARANCE       = Illenium appearance support
--SkinChangerType.RCORE_CLOTHING            = rcore clothing support
--SkinChangerType.NONE                      = None will be used and punch card will be activated.
Config.SkinChangerType = SkinChangerType.AUTOMATIC

-- Target type
-- 0 = In build target system
-- 1 = Q_Target
-- 2 = BT Target
-- 3 = QB Target
-- 4 = OX Target
-- 5 = sleepless ( only v1. v2 is not supported )
-- 6 = is interaction
Config.TargetZoneType = 4

-- key for ALT? ( for target resources )
Config.KeyForTargetSystem = 19

-- [[[[[[[       WARNING       ]]]]]]]
-- THIS configuration is automatic, you dont need to configure this at all. Configure this only if you need to force specific inventory.
-- [[[[[[[       WARNING       ]]]]]]]
-- Inventory System
-- Inventory.AUTOMATIC = automatic detection
-- Inventory.OX        = ox_inventory
-- Inventory.ESX       = esx_inventory
-- Inventory.QB        = qb_inventory
-- Inventory.QS        = qs_inventory
-- Inventory.MF        = mf_inventory
-- Inventory.PS        = ps_inventory
-- Inventory.LJ        = lj_inventory
-- Inventory.CORE      = core_inventory
-- Inventory.CODEM     = codem-inventory
-- Inventory.TGIANN    = tgiann-inventory
-- Inventory.ORIGEN    = origen_inventory
Config.InventorySystem = Inventory.AUTOMATIC

-- which kind of society are you using?
-- [[[[[[[       WARNING       ]]]]]]]
-- THIS configuration is automatic, you dont need to configure this at all. Change unless you really have to.
-- [[[[[[[       WARNING       ]]]]]]]
-- Society systems
-- Society.AUTOMATIC            = automatic detection
-- Society.QB_BANKING           = qb-banking
-- Society.QB_BOSSMENU          = qb-bossmenu
-- Society.QB_MANAGEMENT        = qb-management
-- Society.ESX_ADDON_ACCOUNT    = esx_addonaccount
-- Society.NFS_BILLING          = nfs-billing
-- Society.OKOK_BANKING         = okokBanking
Config.SocietySystem = Society.AUTOMATIC

-- name of the cash item.
Config.CashItem = "money"

-- force usage of item use for cash
Config.IsCashBasedOnItem = false

-- Measurement system
-- metric    = MeasurementUnits.METRIC
-- IMPERIAL  = MeasurementUnits.IMPERIAL
Config.MeasurementUnits = MeasurementUnits.METRIC

-- if you do not wish to use some of the prepared map simply remove the (GetResourceState("cfx-gabz-esbltd") ~= "missing") and replace it with false
Config.ServerMaps = {
    ["cfx-gabz-esbltd"] = GetResourceState("cfx-gabz-esbltd") ~= "missing",
}

-- permission groups
Config.CommandGroups = {
    ["editor"] = { "admin", "superadmin", "god", 2, 3, 4, 5 }
}

-- color for the progress bar when pumping out wrong fuel from the vehicle
-- all possible colors
-- https://docs.fivem.net/docs/game-references/text-formatting/
Config.ColorOfProgressBar = "b"

-- color of the targeted vehicle
-- when you aim at vehicle and it starting glowing, you can edit the color here of the glow.
Config.ColorTarget = {
    r = 255,
    g = 255,
    b = 255,
    a = 255,
}

-- Sounds volume config
-- liquid sound effect
Config.LiquidVolume = 0.4 -- maximum value is 0.00 - 1.00

-- Electric humming effect
Config.ElectricHummingVolume = 0.4 -- maximum value is 0.00 - 1.00

-- save interval?
-- everything will get saved every 15 minutes.
Config.SaveCompaniesMinutesInterval = 15

-- permission map
Config.PermissionGroup = {
    ESX = {
        -- group system that used to work on numbers only
        [1] = {
            1, 2, 3, 4, 5
        },
        -- group system that works on name
        [2] = {
            "helper", "mod", "admin", "superadmin",
        },
    },

    QBCore = {
        -- group system that works on ACE
        [1] = {
            "god", "admin", "mod",
        },
    }
}

-- framework events
Config.Events = {
    QBCore = {
        playerLoaded = "QBCore:Client:OnPlayerLoaded",
        playerLoadedServer = "QBCore:Server:OnPlayerLoaded",
        jobUpdate = "QBCore:Client:OnJobUpdate",
    },
    ESX = {
        playerDropped = "esx:playerDropped",
        playerLoaded = "esx:playerLoaded",
        playerLogout = "esx:playerLogout",
        jobUpdate = "esx:setJob",
    },
}

Config.SpawnNPCList = {
    ["worker"] = {
        model = "s_m_y_airworker",

        pos = vector3(-328.03, -2700.7, 7.55),
        heading = 45.43,

        anim = "notepad2",

        renderDistance = 100.0,
    },
}

Config.ReplaceObjects = {
    ------
    {
        pos = vector3(-705.37, -1464.93, 5.42),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    {
        pos = vector3(-765.04, -1434.4, 5.42),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    ------
    {
        pos = vector3(48.52, 2779.06, 58.04),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    {
        pos = vector3(49.95, 2777.85, 58.04),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    ------
    {
        pos = vector3(2678.47, 3262.34, 55.24),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    {
        pos = vector3(2680.88, 3266.32, 55.24),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    ------
    {
        pos = vector3(2001.58, 3771.97, 32.18),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    {
        pos = vector3(2003.87, 3773.36, 32.18),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    {
        pos = vector3(2006.29, 3774.94, 32.18),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    {
        pos = vector3(2009.08, 3776.98, 32.18),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    ------
    {
        pos = vector3(-91.15, 6422.39, 31.48),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    {
        pos = vector3(-97.10, 6416.86, 31.48),
        radius = 2.0,
        originalModelHash = -469694731,
        newModelHash = GetHashKey("prop_gas_pump_old2_rc"),
    },
    ------
}

Config.SpawnObject = {
    -- EV machines
    {
        model = "rcore_electric_charger_a",
        pos = vec3(1204.195312, -1401.033691, 35.645233),
        heading = 45.0,
        renderDistance = 100.0,
        isMission = false,
    },
    {
        model = "rcore_electric_charger_a",
        pos = vec3(1207.068115, -1398.160889, 35.645233),
        heading = 45.0,
        renderDistance = 100.0,
        isMission = false,
    },
    {
        model = "rcore_electric_charger_a",
        pos = vec3(1212.937256, -1404.030029, 35.644920),
        heading = 45.0,
        renderDistance = 100.0,
        isMission = false,
    },
    {
        pos = vec3(1210.064697, -1406.903076, 35.644920),
        model = "rcore_electric_charger_a",
        heading = 45.0,
        renderDistance = 100.0,
        isMission = false,
    },
    -- oil puddles for mission
    {
        model = "p_oil_slick_01",
        pos = vector3(1109.55872, -1997.74939, 29.9181156),
        heading = 33.0,
        renderDistance = 100.0,
        isMission = true,
    },
    {
        model = "p_oil_slick_01",
        pos = vector3(1110.76086, -1997.04565, 29.9610119),
        heading = 128.0,
        renderDistance = 100.0,
        isMission = true,
    },
    {
        model = "rcore_electric_charger_a",
        pos = vector3(-1219.81, -2317.43, 14.2),
        heading = 150.0,
        renderDistance = 100.0,
        isMission = false,
    },
}

-- do not touch
Config.ScaleFormLists = {
    ["shop_scaleform_1"] = false,
    ["shop_scaleform_2"] = false,
}

-- will preload one scaleform and never release it just in case your server have use of too many scaleforms
Config.UsePreloaded = false

Config.ScaleformEditor = false

-- do not touch
-- you can view all AlignTypes in const.lua
Config.resolution = {
    -- objects that are non related to the fuel
    [GetHashKey("prop_tv_flat_02")] = {
        ['distance'] = 5,

        ['ScreenSize'] = vec3(-0.002965, -0.009885, 0.000000),
        ['CameraOffSet'] = {
            ['rotationOffset'] = vec3(0.000000, 0.000000, 0.000000),
            ['x'] = 0.0,
            ['y'] = -3.0,
            ['z'] = 0.35
        },

        ['ScreenOffSet'] = vec3(-0.6, -0.01, 0.5),
    },
}

-- the lower the better but the lower the more heavier it will become to NUI
Config.RefreshTime = 300

-- for some users the qbcore just refuse to call event for playerLoadedServer so this is work around... Turn only if support from rcore tell you so
Config.WorkAroundForQBCoreLoadedEvent = false

-- disable payment for this resource ( use only if you have your own solution )
-- rcore_fuel/client/payment.lua for UI
-- rcore_fuel/server/fuel_pump/pricing.lua ( event: rcore_fuel:payForFuel )
Config.DisablePaymentModal = false

-- will enable statebags only ( experimental )
Config.EnableStateBagsOnly = false

-- will enable keybinds for inventory active key ( experimental )
Config.EnableInventoryKeyBinds = false