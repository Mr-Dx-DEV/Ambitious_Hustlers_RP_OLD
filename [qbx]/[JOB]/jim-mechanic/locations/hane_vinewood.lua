Locations = Locations or {}

--[[ HaneStudios Auto Shop ]]--
--[[ Hane Studios - https://hanestudios.tebex.io/package/6438247 ]]--

Locations["vinewood_hane"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "Auto Shop",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
    zones = {
        vec2(523.9, -163.71),
        vec2(538.17, -243.6),
        vec2(565.47, -193.58),
        vec2(568.98, -163.19),
    },
    blip = {
        coords = vec3(528.26, -177.29, 54.55),
        color = 81,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
        previewImg = "https://i.imgur.com/kKC2Mw2.png",
    },
    Stash = {
        {   coords = vec4(547.62, -166.04, 54.54, 180.0), width = 1.0, depth = 2.6, minZ = 53.59, maxZ = 55.99,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(542.51, -166.09, 54.54, 180.0), width = 1.0, depth = 5.0, minZ = 53.59, maxZ = 56.79,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(547.92, -182.27, 49.97, 180.0), width = 0.8, depth = 4.6, minZ = 49.02, maxZ = 51.42,
            label = "Personal Stash", icon = "fas fa-box-open",
            stashName = "vinewoodMech_Personal_",
        },
        {   coords = vec4(547.95, -177.37, 49.97, 180.0), width = 0.8, depth = 4.6, minZ = 49.02, maxZ = 51.42,
            label = "Personal Stash", icon = "fas fa-box-open",
            stashName = "vinewoodMech_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(554.0, -175.94, 54.49, 90.0), width = 0.8, depth = 2.0, minZ = 53.54, maxZ = 54.94,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(554.12, -184.86, 54.49, 90.0), width = 0.8, depth = 4.0, minZ = 53.54, maxZ = 55.94,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   coords = vec4(556.59, -174.61, 54.49, 0.0), width = 0.8, depth = 1.0, minZ = 54.29, maxZ = 54.89,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(556.65, -176.49, 54.49, 0.0), width = 0.8, depth = 2.2, minZ = 53.54, maxZ = 55.94,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "vinewoodMech_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
    manualRepair = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(539.67, -200.78, 54.4, 269.86), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    Payments = {
        {   coords = vec4(548.51, -188.88, 54.49, 0.0), width = 0.8, depth = 0.8, minZ = 54.29, maxZ = 54.89,
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(543.43, -177.0, 54.49, 178.64), },
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