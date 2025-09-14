Locations = Locations or {}

--[[ MIRROR PARK MECH ]]--
--[[ Kiiya - https://kiiya.tebex.io/package/5845981 ]]--

Locations["mirror_park_mech"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "Mirror Park Workshop",
    logo = "https://i.imgur.com/74UVnCb.jpeg",
    zones = {
        vec2(1163.64, -765.60),
		vec2(1163.26, -802.25),
		vec2(1119.06, -801.79),
		vec2(1117.87, -765.52),
    },
    blip = {
        coords = vec3(1144.94, -766.04, 57.53),
        color = 1,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
    },
    Stash = {
        {   coords = vec4(1140.44, -789.36, 57.0, 180.0), width = 1.2, depth = 1.9,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(1138.47, -789.36, 57.0, 180.0), width = 1.2, depth = 1.9,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
		{   coords = vec4(1136.50, -789.36, 57.0, 180.0), width = 1.2, depth = 1.9,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
		{   coords = vec4(1153.528442, -793.080750, 60.003807, 180.0), width = 0.8, depth = 0.8,
            label = "Mirror Food Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(1139.05, -791.27, 57.0, 180.0), width = 0.8, depth = 3.0,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "mirrorPark_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(1143.15, -795.73, 57.6, 0.0), width = 1.0, depth = 2.4, minZ = 56.6, maxZ = 59.4,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(1151.67, -789.42, 56.6, 271.0), width = 3.8, depth = 1.1, minZ = 56.6, maxZ = 58.2,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(1147.75, -789.51, 56.6, 271.0), width = 3.8, depth = 1.1, minZ = 56.6, maxZ = 58.2,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   coords = vec4(1153.33, -792.16, 57.01, 279.45),
            label = "Open Bossmenu",
            icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(1153.41, -793.12, 56.6, 270.0), width = 0.6, depth = 0.7, minZ = 56.6, maxZ = 57.35,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "mirrorMech_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
    manualRepair = {
        {   prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(1119.22, -792.07, 57.9, 271.14), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    Payments = {
        {   coords = vec4(1135.76, -782.08, 57.50, 271.63),
            label = "Charge",
            icon = "fas fa-credit-card",
        },
    },
    Restrictions = { -- Remove what you DON'T what the location to be able to edit
        Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", "Boats", },
        Allow = { "tools", "cosmetics", "repairs", "nos", "perform", "chameleon", "paints" },
    },
    discord = {
        link = "",
        color = 16711680,
    }
}