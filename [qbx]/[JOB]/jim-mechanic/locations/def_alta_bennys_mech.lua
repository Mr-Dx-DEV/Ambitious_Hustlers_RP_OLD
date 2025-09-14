Locations = Locations or {}

--[[ ALTA STREET BENNYS ]]--
--[[ Default Location ]]--

Locations["altastreet"] = {
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
        {   coords = vec4(-228.77, -1322.79, 30.89, 269.0), width = 1.0, depth = 4.45, minZ = 30.09, maxZ = 32.49,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
        {   coords = vec4(-226.91, -1334.93, 30.89, 0.0), width = 1.0, depth = 4.45, minZ = 30.09, maxZ = 32.49,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   prop = { model = "bkr_prop_biker_garage_locker_01", coords = vec4(-209.96, -1334.1, 30.89, 357.55), },
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "altaStreet_Personal_",
        },
    },
	Shop = {
        {   coords = vec4(-224.25, -1319.65, 30.89, 179.0), width = 0.6, depth = 3.05, minZ = 30.09, maxZ = 32.49,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
        {   coords = vec4(-228.7, -1327.2, 30.89, 270.0), width = 1.0, depth = 4.05, minZ = 30.09, maxZ = 31.89,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
    BossStash = {
		{   prop = { model = "sf_prop_v_43_safe_s_bk_01a", coords = vec4(-203.72, -1328.28, 34.89, 87.28) },
			label = "Boss Stash", icon = "fas fa-vault",
			stashName = "altaStreetBossStorage", stashLabel = "Boss Stash",
			slots = 80, maxWeight = 1000000
		},
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-200.35, -1294.89, 31.3, 179.54), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	Payments = {
		{ 	prop = { model = "prop_till_01", coords = vec4(-200.18, -1318.41, 32.12, 88.25), },
			label = "Charge", icon = "fas fa-credit-card",
		},
	},
	garage = { -- requires https://github.com/jimathy/jim-jobgarage
		spawn = vec4(-182.74, -1317.61, 30.63, 357.23),
		out = vec4(-190.62, -1311.57, 31.3, 0.0),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
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