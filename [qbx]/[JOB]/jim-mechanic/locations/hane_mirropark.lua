Locations = Locations or {}

--[[ HaneStudios Auto Shop ]]--
--[[ Hane Studios - https://hanestudios.tebex.io/package/6438247 ]]--

Locations["mirrokpark_hane"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "Auto Shop",
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
        {   coords = vec4(1160.22, -784.55, 57.62, 0.0), width = 2.6, depth = 1.0, minZ = 56.82, maxZ = 59.22,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(1160.07, -778.74, 57.62, 0.0), width = 3.4, depth = 1.0, minZ = 56.82, maxZ = 59.22,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(1143.78, -784.89, 53.1, 0.0), width = 4.8, depth = 0.6, minZ = 52.3, maxZ = 54.7,
            label = "Personal Stash", icon = "fas fa-box-open",
            stashName = "mirrorPark_Personal_",
        },
        {   coords = vec4(1148.6, -784.91, 53.1, 0.0), width = 4.8, depth = 0.2, minZ = 52.3, maxZ = 54.7,
            label = "Personal Stash", icon = "fas fa-box-open",
            stashName = "mirrorPark_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(1150.19, -790.85, 57.62, 270.0), width = 2.0, depth = 0.6, minZ = 56.82, maxZ = 58.02,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(1141.26, -791.16, 57.62, 90.0), width = 4.0, depth = 1.0, minZ = 56.82, maxZ = 59.02,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   coords = vec4(1151.45, -793.52, 57.62, 270.0), width = 0.6, depth = 0.6, minZ = 57.27, maxZ = 58.07,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(1149.58, -793.62, 57.62, 270.0), width = 0.6, depth = 2.4, minZ = 56.47, maxZ = 58.67,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "mirrorMech_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
    manualRepair = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(1118.7, -775.5, 57.84, 269.76), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    Payments = {
        {   coords = vec4(1137.26, -785.44, 57.62, 270.0), width = 0.6, depth = 0.8, minZ = 57.67, maxZ = 58.27,
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(1149.06, -783.61, 57.62, 263.57), },
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