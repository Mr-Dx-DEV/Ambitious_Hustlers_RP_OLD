Locations = Locations or {}

--[[ RED'S AUTO PARTS ]] --
--[[ AS Mlo - https://as-mlo.tebex.io/package/6122056 ]]

Locations["redsauto_asmlo"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "Reds Auto Parts",
    img = "https://i.imgur.com/74UVnCb.jpeg",
    zones = {
        vec2(-45.43, -1267.32),
        vec2(44.06, -1271.90),
        vec2(52.02, -1302.59),
        vec2(19.58, -1311.99),
        vec2(19.58, -1311.99),
        vec2(-45.77, -1350.94),
        vec2(-45.49, -1312.20),
    },
    blip = {
        coords = vec3(-15.96, -1299.04, 30.9),
        color = 1,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
    },
    Stash = {
        -- 1st room
        {   coords = vec4(-21.71, -1312.87, 28.18, 90.0), width = 4.5, depth = 0.8, minZ = 28.18, maxZ = 30.78,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },

        -- 2nd room
        {   coords = vec4(33.48, -1277.41, 34.54, 90.0), width = 2.1, depth = 3.2, minZ = 34.54, maxZ = 37.74,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(33.5, -1287.34, 34.54, 90.0), width = 2.1, depth = 3.2, minZ = 34.54, maxZ = 37.74,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(33.49, -1290.84, 34.54, 90.0), width = 2.1, depth = 3.2, minZ = 34.54, maxZ = 37.74,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        -- 2nd Room
        {   coords = vec4(3.41, -1294.11, 28.35, 90.0), width = 2.5, depth = 0.8, minZ = 28.35, maxZ = 30.55,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "redsAuto_Personal_",
        },
    },
	Shop = {
        -- 1st Room
        {   coords = vec4(-12.4, -1338.63, 29.18, 85.0), width = 0.8, depth = 2.6, minZ = 27.98, maxZ = 30.78,
            label = "Shop", icon = "fas fa-box-open",
        },
        -- 2nd Room
        {   coords = vec4(34.47, -1284.36, 35.09, 90.0), width = 1.0, depth = 2.2, minZ = 34.59, maxZ = 37.19,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
    Crafting = {
        -- 1st Room
        {   coords = vec4(-20.66, -1340.88, 28.18, 90.0), width = 2.5, depth = 0.8, minZ = 28.18, maxZ = 29.78,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(-8.58, -1313.07, 28.18, 90.0), width = 3.3, depth = 0.8, minZ = 28.18, maxZ = 29.78,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },

        -- 2nd room
        {   coords = vec4(35.51, -1283.06, 28.33, 90.0), width = 1.1, depth = 3.2, minZ = 28.33, maxZ = 30.53,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(20.58, -1298.51, 28.12, 0.0), width = 1.1, depth = 2.2, minZ = 28.12, maxZ = 29.72,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(10.15, -1275.15, 28.33, 0.0), width = 1.1, depth = 3.0, minZ = 28.33, maxZ = 30.53,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        -- 1st room
        {   coords = vec4(-15.13, -1340.96, 28.78, 90.0), width = 0.7, depth = 0.8, minZ = 28.78, maxZ = 29.58,
            label = "Open Bossmenu",
            icon = "fas fa-list",
        },
        -- 2nd room
        {   prop = { model = "prop_monitor_03b", coords = vec4(7.31, -1292.51, 30.17, 170.40), },
            label = "Open Bossmenu",
            icon = "fas fa-list",
        },
    },
    manualRepair = {
        {   prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-3.05, -1300.05, 29.25, 178.91), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    Payments = {
        -- 1st room
        {   coords = vec4(-15.83, -1340.74, 28.78, 0.0), width = 0.6, depth = 0.6, minZ = 28.78, maxZ = 29.58,
            label = "Charge",
            icon = "fas fa-credit-card",
        },
        {   coords = vec4(-10.58, -1334.93, 28.78, 0.0), width = 0.6, depth = 0.6, minZ = 28.78, maxZ = 29.58,
            label = "Charge",
            icon = "fas fa-credit-card",
        },
        -- 2nd room
        {   prop = { model = "prop_till_01", coords = vec4(16.28, -1275.30, 30.43, 157.02), },
            label = "Charge",
            icon = "fas fa-credit-card",
        },
        {   prop = { model = "prop_till_01", coords = vec4(7.50, -1298.09, 30.15, 0.62), },
            label = "Charge",
            icon = "fas fa-credit-card",
        },
    },
    PropAdd = {
        --{ model = "prop_atm_01", coords = vec4(5.09, -1291.56, 29.32, 0.0) },
    },
    PropHide = {
        --
    },
    Restrictions = { -- Remove what you DON'T what the location to be able to edit
        Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", "Boats", },
        Allow = { "tools", "cosmetics", "repairs", "nos", "perform", "paints" },
    },
    nosrefill = {
        --
    },
    discord = {
        link = "",
        color = 16711680,
    }
}