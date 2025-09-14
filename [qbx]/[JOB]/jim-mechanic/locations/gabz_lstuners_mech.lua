Locations = Locations or {}

--[[ GABZ LS TUNER SHOP ]]--
--[[ Gabz - https://fivem.gabzv.com/package/4724521 ]]--

Locations["lstuners_gabz"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "Tuner Shop",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	zones = {
		vec2(154.69, -3007.01),
		vec2(120.64, -3006.72),
		vec2(120.48, -3051.88),
		vec2(154.61, -3051.54)
	},
	blip = {
		coords = vec3(139.91, -3023.83, 7.04),
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	Stash = {
		{   coords = vec4(144.38, -3051.3, 7.04, 0.0), width = 0.6, depth = 3.6,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
		{   coords = vec4(128.45, -3007.83, 7.04, 0.0), width = 2.4, depth = 3.5,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   prop = { model = "bkr_prop_biker_garage_locker_01", coords = vec4(124.02, -3007.25, 10.7, 182.12), },
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "LSTuners_Personal_",
        },
    },
	Shop = {
		{   coords = vec4(128.64, -3014.68, 7.04, 0.0), width = 1.6, depth = 3.0,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
		{	coords = vec4(136.71, -3051.29, 7.04, 0.0), width = 0.6, depth = 1.0,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = {
		{   prop = { model = "prop_laptop_01a", coords = vec4(145.29, -3012.93, 7.97, 266.0), },
            label = "Clock on/off", icon = "fas fa-list",
        },
	},
    BossMenus = {
        {   coords = vec4(125.55, -3007.25, 6.94, 350.0), width = 0.4, depth = 0.4,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(123.98, -3007.22, 7.04, 180.0), width = 0.6, depth = 0.6, minZ = 6.24, maxZ = 8.04,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "LSTuners_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(121.0, -3047.69, 7.07, 270.11), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(121.17, -3044.73, 7.04, 88.96), },
			label = "Refill NOS", icon = "fas fa-list",
		},
	},
	Payments = {
		{   prop = { model = "prop_till_01", coords = vec4(146.44, -3014.09, 7.96, 15.0), },
			label = "Charge", icon = "fas fa-credit-card",
		},
	},
	carLiftModels = {
		pylons = "denis3d_carlift_02",
		lift = "denis3d_carlift_01",
		pylonOffset = vec3(-3.0, 0.0, -1.88),
		liftOffset = vec3(-3.0, 0.0, 0.18),
	},
	carLift = {
		{ coords = vec4(127.71, -3041.16, 7.06, 90.0), },
        { coords = vec4(127.77, -3034.91, 7.04, 90.0), },
		{ coords = vec4(128.28, -3023.01, 7.04, 90.0) },
	},
	garage = { -- requires https://github.com/jimathy/jim-jobgarage
		spawn = vec4(163.22, -3009.31, 5.27, 89.72),
		out = vec4(157.37, -3016.57, 7.04, 179.58),
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