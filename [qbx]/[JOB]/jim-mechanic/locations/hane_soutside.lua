Locations = Locations or {}

--[[ HaneStudios Auto Shop ]]--
--[[ Hane Studios - https://hanestudios.tebex.io/package/6438247 ]]--

Locations["southside_hane"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "Auto Shop",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
    zones = {
        vec2(-191.2, -1351.21),
        vec2(-215.66, -1350.78),
        vec2(-247.53, -1367.76),
        vec2(-242.76, -1409.23),
        vec2(-170.48, -1378.89),
    },
    blip = {
        coords = vec3(-194.03, -1388.03, 31.37),
        color = 81,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
        previewImg = "https://i.imgur.com/kKC2Mw2.png",
    },
    Stash = {
        {   coords = vec4(-216.84, -1377.26, 31.26, 121.0), width = 0.8, depth = 2.6, minZ = 30.31, maxZ = 32.51,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(-214.25, -1381.54, 31.27, 121.0), width = 1.0, depth = 5.0, minZ = 30.32, maxZ = 33.52,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(-202.84, -1368.64, 26.7, 121.0), width = 0.6, depth = 4.8, minZ = 25.75, maxZ = 28.35,
            label = "Personal Stash", icon = "fas fa-box-open",
            stashName = "southsideMech_Personal_",
        },
        {   coords = vec4(-207.13, -1371.16, 26.7, 121.0), width = 0.6, depth = 4.8, minZ = 25.75, maxZ = 28.35,
            label = "Personal Stash", icon = "fas fa-box-open",
            stashName = "southsideMech_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(-211.48, -1366.73, 31.22, 31.0), width = 0.8, depth = 2.0, minZ = 30.27, maxZ = 31.67,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(-203.82, -1362.04, 31.22, 31.0), width = 0.8, depth = 4.0, minZ = 30.27, maxZ = 32.47,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   coords = vec4(-214.05, -1365.21, 31.22, 300.0), width = 0.6, depth = 0.8, minZ = 31.07, maxZ = 31.67,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(-212.31, -1364.11, 31.22, 301.0), width = 0.8, depth = 2.4, minZ = 30.27, maxZ = 32.27,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "southsideMech_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
    manualRepair = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-191.29, -1364.31, 31.26, 303.48), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    Payments = {
        {   coords = vec4(-197.55, -1364.84, 31.22, 300.0), width = 0.6, depth = 0.8, minZ = 31.27, maxZ = 31.87,
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(-201.99, -1370.83, 31.22, 212.74), },
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