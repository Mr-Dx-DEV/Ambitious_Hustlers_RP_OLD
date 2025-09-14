Locations = Locations or {}

--[[ GABZ ALTA STREET BENNYS ]]--
--[[ Gabz - https://fivem.gabzv.com/package/5500605 ]]--

Locations["altastreet_gabz"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "Bennys Alta",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
	zones = {
		vec2(-263.99, -1349.67),
		vec2(-263.50, -1298.97),
		vec2(-229.94, -1299.08),
		vec2(-229.81, -1291.58),
		vec2(-216.73, -1288.94),
		vec2(-193.63, -1294.15),
		vec2(-174.24, -1293.14),
		vec2(-151.77, -1300.66),
		vec2(-151.88, -1311.19),
		vec2(-177.41, -1311.56),
		vec2(-177.59, -1351.19)
	},
	blip = {
		coords = vec3(-211.55, -1324.55, 30.9),
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	Stash = {
        {   coords = vec4(-201.17, -1314.36, 31.3, 180.0), width = 0.8, depth = 3.0, minZ = 30.5, maxZ = 33.1,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
        {   coords = vec4(-197.89, -1315.09, 31.3, 90.0), width = 0.6, depth = 2.0, minZ = 30.5, maxZ = 33.1,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   prop = { model = "bkr_prop_biker_garage_locker_01", coords = vec4(-191.01, -1329.28, 34.99, 86.12), },
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "altaStreet_Personal_",
        },
    },
	Shop = {
		{   coords = vec4(-228.64, -1314.19, 31.3, 90.0), width = 3.6, depth = 0.8,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
		{	coords = vec4(-214.82, -1339.74, 31.46, 90.0), width = 2.8, depth = 1.5,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = {
		--
	},
    BossMenus = {
        {   coords = vec4(-195.55, -1316.46, 30.8, 181.72), width = 0.6, depth = 0.6,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
		{   prop = { model = "sf_prop_v_43_safe_s_bk_01a", coords = vec4(-197.01, -1315.0, 31.3, 265.79) },
			label = "Boss Stash", icon = "fas fa-vault",
			stashName = "altaStreetBossStorage", stashLabel = "Boss Stash",
			slots = 80, maxWeight = 1000000
		},
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-248.94, -1319.61, 31.26, 89.05), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	Payments = {
		{ 	prop = { model = "prop_till_01", coords = vec4(-198.08, -1317.87, 32.10, 87.34), },
			label = "Charge", icon = "fas fa-credit-card",
		},
	},
	-- Having issues using models, mlo models of pylons not removing
	-- This works, but I don't recommended changing the coords, only adding new ones if needed
	carLiftModels = {
		pylons = "gabz_bennys_prop_carlift_02",
		lift = "gabz_bennys_prop_carlift_01",
		pylonOffset = vec3(0.0, 0.0, -1.88),
		liftOffset = vec3(0.0, 0.0, 0.18),
	},
	carLift = {
		{ coords = vec4(-201.817703, -1318.725830, 31.3, 81.760773) },
		{ coords = vec4(-220.975876, -1318.702759, 31.3, 110.118057) },
	},
	garage = { -- requires https://github.com/jimathy/jim-jobgarage
        spawn = vec4(-182.74, -1317.61, 30.63, 357.23),
		out = vec4(-190.62, -1311.57, 31.3, 0.0),
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