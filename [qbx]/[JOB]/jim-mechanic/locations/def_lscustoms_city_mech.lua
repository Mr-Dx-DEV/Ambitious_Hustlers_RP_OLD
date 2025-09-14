Locations = Locations or {}

--[[ LS CUSTOMS IN CITY ]]--
--[[ Default Location ]]--

Locations["ls_customs"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "LS Customs",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	zones = {
		vec2(-356.63, -137.9),
		vec2(-347.32, -111.48),
		vec2(-309.05, -128.79),
		vec2(-324.44, -148.96)
	},
	blip = {
		coords = vec3(-336.84, -136.39, 39.01),
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	Stash = {
		{   coords = vec4(-346.14, -130.52, 38.51, 250.0), width = 0.6, depth = 3.6,
			label = "Mech Stash: ", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   prop = { model = "bkr_prop_biker_garage_locker_01", coords = vec4(-320.44, -135.61, 39.0, 71.21), },
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "EastLSCustoms_Personal_",
        },
    },
	Shop = {
		{   coords = vec4(-347.9, -133.19, 38.51, 340.0), width = 1.6, depth = 3.0,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
		{	coords = vec4(-340.44, -141.9, 38.51, 250.0), width = 1.6, depth = 1.0,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = { },
    BossMenus = {
		{   prop = { model = "prop_laptop_01a", coords = vec4(-344.85, -140.35, 40.05, 337.0), },
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(-345.75, -124.37, 39.01, 250.0), width = 0.6, depth = 1.0, minZ = 38.01, maxZ = 40.01,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "EastLSCustoms_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-322.28, -140.38, 39.01, 68.35), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	nosRefill = { },
	Payments = {
		{   prop = { model = "prop_till_01", coords = vec4(-343.75, -140.86, 40.05, 30.0), },
            label = "Charge", icon = "fas fa-credit-card",
        },
	},
	carLift = { },
	garage = { -- requires https://github.com/jimathy/jim-jobgarage
		spawn = vec4(-361.48, -123.14, 38.03, 158.96),
		out = vec4(-356.2, -126.55, 39.43, 73.49),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true,
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