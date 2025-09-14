Locations = Locations or {}

--[[ TIRE NUTZ MECHANIC ]] --
--[[ Kiiya - https://kiiya.tebex.io/package/4538245 ]]

Locations["tirenutz_kiiya"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "Nutz Mechanic",
    logo = "https://i.imgur.com/74UVnCb.jpeg",
    zones = {
        vec2(-46.28, -1348.69),
        vec2(-68.42, -1348.58),
        vec2(-77.98, -1344.33),
        vec2(-82.03, -1339.85),
        vec2(-85.71, -1330.85),
        vec2(-85.94, -1312.22),
        vec2(-46.26, -1314.06),
    },
    blip = {
        coords = vec3(-70.29, -1338.3, 29.46),
        color = 1,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
    },
    Stash = {
        {   coords = vec4(-57.21, -1333.81, 28.3, 90.0), width = 1.0, depth = 3.8,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(-65.55, -1325.67, 28.3, 90.0), width = 1.0, depth = 3.8,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(-77.34, -1323.04, 29.27, 1.42), width = 1.0, depth = 1.5,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "tireNutz_Personal_",
        },
    },
	Shop = {
        {   coords = vec4(-63.23, -1324.26, 28.3, 90.0), width = 1.8, depth = 1.8,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
    Crafting = {
        {   coords = vec4(-61.23, -1342.75, 28.28, 0.0), width = 1.2, depth = 3.5,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(-57.41, -1327.77, 28.28, 90.0), width = 1.2, depth = 3.5,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = {

    },
    BossMenus = {
        {   coords = vec4(-71.05, -1330.27, 29.18, 170.92), width = 0.7, depth = 0.7,
            label = "Open Bossmenu",
            icon = "fas fa-list",
        },
    },
    manualRepair = {
        {   prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-66.29, -1344.23, 29.2, 90), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    carLift = {
        {   coords = vec4(-64.56, -1334.07, 29.27, 270.0) },
    },
    Payments = {
        {   coords = vec4(-71.34, -1328.32, 29.2, 115.0),
            label = "Charge",
            icon = "fas fa-credit-card",
        },
    },
    PropAdd = {
        { model = "prop_atm_01", coords = vec4(-70.68, -1331.56, 29.26, 179.75) },
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