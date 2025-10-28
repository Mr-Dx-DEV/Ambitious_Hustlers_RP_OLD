Locations = Locations or {}

--[[ LS CUSTOMS IN CITY ]]--
--[[ Default Location ]]--

Locations["kittys"] = {
	Enabled = true,
	autoClock = { enter = false, exit = false, },
	job = "kittys",
	label = "Kitty's Customs",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	zones = {
		vec2(-249.339, -1152.002),
		vec2(-248.799, -1185.063),
		vec2(-128.949, -1187.516),
		vec2(-125.76, -1151.523)
	},
	blip = {
		coords = vec3(-210.123, -1171.293, 23.034),
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	Stash = {
		{   coords = vec4(-209.2, -1176.95, 23.03, 90.0), width = 0.6, depth = 3.6,
			label = "Mech Stash: 1", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
		{   coords = vec4(-195.679, -1176.159, 23.034, 359.462), width = 0.6, depth = 3.6,
			label = "Mech Stash: 2", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
		{   coords = vec4(-181.756, -1176.26, 23.034, 5.236), width = 0.6, depth = 3.6,
			label = "Mech Stash: 3", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
       
        
	},
    PersonalStash = {
        {   prop = { model = "bkr_prop_biker_garage_locker_01", coords = vec4(-178.807, -1176.384, 30.23, 1.283), },
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "EastLSCustoms_Personal_",
        },
    },
	Shop = {
		{   coords = vec4(-202.53, -1175.81, 23.03, 90.0), width = 1.6, depth = 3.0,
            label = "Shop", icon = "fas fa-box-open",
        },
        {   coords = vec4(-188.56, -1175.83, 23.03, 90.0), width = 1.6, depth = 3.0,
            label = "Shop", icon = "fas fa-box-open",
        },
        {   coords = vec4(-175.5, -1175.34, 23.03, 90.0), width = 1.6, depth = 3.0,
            label = "Shop", icon = "fas fa-box-open",
        },
       
	},
	Crafting = {
		{	coords = vec4(-203.687, -1159.738, 23.034, 0.0), width = 1.6, depth = 1.0,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = { coords = vec4(-210.33, -1162.56, 23.03, 0.0), prop = false },
    BossMenus = {
		{   prop = { model = "prop_laptop_01a", coords = vec4(-173.041, -1174.753, 31.108, 100.5913), },
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(-195.93, -1176.84, 23.03, 90.0), width = 0.6, depth = 1.0, minZ = 38.01, maxZ = 40.01,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "EastLSCustoms_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
	--[[manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-171.99, -1159.58, 23.03, 270.0), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},]]
	nosRefill = { },
	Payments = {
		{   prop = { model = "prop_till_01", coords = vec4(-214.68, -1162.5, 23.86, 0.0), },
            label = "Charge", icon = "fas fa-credit-card",
        },
	},
	carLift = { },
	garage = { -- requires https://github.com/jimathy/jim-jobgarage
		spawn = vec4(-246.369, -1183.977, 23.096, 336.62),
		out = vec4(-241.054, -1183.624, 23.029, 274.45),
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