Locations = Locations or {}

--[[ MIRROR PARK AUTO ]]--
--[[ K4MB1 - https://k4mb1maps.com/product/4672245 ]]--

Locations["mirror_park_auto_k4mb1"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "Mirror Park Auto",
    logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
    zones = {
        vec2(1115.17, -765.85),
        vec2(1174.3, -765.65),
        vec2(1170.87, -805.39),
        vec2(1114.54, -807.89),
    },
    blip = {
        coords = vec3(1146.22, -768.47, 57.55),
        color = 81,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
        previewImg = "https://i.imgur.com/kKC2Mw2.png",
    },
    Stash = {
        {   coords = vec4(1149.16, -795.34, 57.61, 359.0), width = 0.8, depth = 2.0, minZ = 56.61, maxZ = 58.01,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(1143.87, -788.61, 57.61, 269.0), width = 1.0, depth = 3.0, minZ = 56.81, maxZ = 59.41,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,

        },
    },
    PersonalStash = {
        {   coords = vec4(1161.04, -782.31, 57.61, 89.0), width = 0.6, depth = 2.0, minZ = 56.61, maxZ = 58.61,
            label = "Personal Stash", icon = "fas fa-box-open",
            stashName = "mirrorPark_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(1147.61, -787.76, 57.61, 179.0), width = 1.0, depth = 3.8, minZ = 56.81, maxZ = 58.21,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(1155.32, -792.28, 57.61, 89.0), width = 1.0, depth = 4.0,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   coords = vec4(1157.88, -778.66, 57.61, 89.0), width = 0.8, depth = 1.2, minZ = 57.41, maxZ = 58.01,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(1160.94, -783.76, 57.61, 89.0), width = 0.6, depth = 0.8, minZ = 56.61, maxZ = 57.81,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "mirrorMech_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
    manualRepair = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(1135.43, -782.41, 57.6, 268.65), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    Payments = {
        { 	prop = { model = "prop_till_01", coords = vec4(1154.68, -780.22, 58.62, 80.69), },
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    carLift = {
        { coords = vec4(1149.75, -778.28, 57.6, 179.41), },
    },
    nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(1152.15, -786.7, 57.6, 359.16), },
			label = "Refill NOS", icon = "fas fa-list",
		},
	},
    Restrictions = { -- Remove what you DON'T what the location to be able to edit
        Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", "Boats", },
        Allow = { "tools", "cosmetics", "repairs", "nos", "perform", "chameleon", "paints" },
    },
    discord = {
        link = "",
        color = 2571775,
    },
}