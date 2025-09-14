Locations = Locations or {}

--[[ GABZ HAYES MECHANIC ]]--
--[[ Gabz - https://fivem.gabzv.com/package/4724718 ]]

Locations["hayes_mech_gabz"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "Hayes Mechanic",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	zones = {
		vec2(-1439.90, -443.45),
		vec2(-1426.02, -466.52),
		vec2(-1400.13, -451.71),
		vec2(-1414.79, -427.64)
	},
	blip = {
		coords = vec3(-1417.12, -445.9, 35.91),
		color = 57,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/j823Ss0.png",
	},
	Stash = {
		{ 	coords = vec4(-1414.94, -452.35, 35.41, 302.0), width = 4.0, depth = 1.0,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   coords = vec4(-1425.52, -457.69, 35.91, 305.0), width = 0.6, depth = 2.65, minZ = 34.91, maxZ = 37.11,
			label = "Personal Stash",
			icon = "fas fa-box-open",
			stashName = "hayesMech_Personal_",
		},
    },
	Shop = {
		{   coords = vec4(-1408.04, -448.04, 35.41, 302.0), width = 5.5, depth = 1.0,
			label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
		{	coords = vec4(-1407.68, -442.32, 35.41, 302.0), width = 0.6, depth = 1.0,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = {
		{   prop = { model = "prop_laptop_01a", coords = vec4(-1427.19, -457.51, 36.73, 120.0), },
            label = "Clock on/off", icon = "fas fa-list",
        },
	},
    BossMenus = {
        {   coords = vec4(-1426.79, -458.36, 35.91, 125.0), width = 0.6, depth = 1.25, minZ = 35.31, maxZ = 36.51,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(-1428.58, -459.91, 35.91, 300.0), width = 0.6, depth = 1.25, minZ = 34.91, maxZ = 36.51,
            label = "Boss Stash", icon = "fas fa-vault",
            stashName = "hayesMechBossStorage", stashLabel = "Boss Stash",
            slots = 80, maxWeight = 1000000
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-1432.82, -456.25, 35.02, 120.33), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	Payments = {
        {   coords = vec4(-1429.66, -454.06, 35.91, 210.0), width = 0.6, depth = 0.45, minZ = 35.71, maxZ = 36.51,
			label = "Charge", icon = "fas fa-credit-card",
		},
	},
	carLift = {
		{ coords = vec4(-1418.92, -443.53, 35.91, 211.54) },
	},
	garage = {
		spawn = vec4(-1379.84, -451.82, 34.44, 124.0),
		out = vec4(-1401.57, -451.19, 34.48, 212.71),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = false
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
