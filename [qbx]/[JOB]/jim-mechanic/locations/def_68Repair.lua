Locations = Locations or {}

--[[ ROUTE 68 MECHANIC ]]--
--[[ Default Location ]]--

Locations["route_68"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "68 Cyles & Repairs",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	zones = {
		vec2(1191.87, 2621.86),
		vec2(1159.44, 2621.85),
		vec2(1159.79, 2674.09),
		vec2(1188.45, 2674.65)
	},
	blip = {
		coords = vec3(1177.62, 2640.83, 37.75),
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/Zd6V0vI.png",
	},
	Stash = {
		{ coords = vec4(1171.4, 2641.99, 37.25, 0.0), width = 3.0, depth = 0.8,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   prop = { model = "bkr_prop_biker_garage_locker_01", coords = vec4(1189.66, 2643.52, 38.32, 89.34), },
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "route68_Personal_",
        },
    },
	Shop = {
        {   coords = vec4(1171.75, 2635.96, 37.38, 315.0), width = 0.6, depth = 0.6, minZ = 36.93, maxZ = 38.33,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
		{	coords = vec4(1176.69, 2635.44, 37.05, 270.0), width = 3.2, depth = 1.0,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = { },
    BossMenus = {
        {   coords = vec4(1186.35, 2638.10, 38.1, 185.0), width = 0.8, depth = 0.8,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(1187.25, 2635.33, 37.4, 270.0), width = 1.2, depth = 0.7,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "route68_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(1170.07, 2641.54, 37.81, 88.86), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	Payments = {
		{ 	coords = vec4(1189.76, 2636.97, 38.3, 0),
			label = "Charge",
			icon = "fas fa-credit-card",
		},
	},
	carLift = {
		{ coords = vec4(1174.78, 2644.54, 37.75, 180.0), },
	},
	garage = { -- requires https://github.com/jimathy/jim-jobgarage
		spawn = vec4(1165.92, 2642.87, 37.23, 358.2),
		out = vec4(1170.25, 2645.6, 37.81, 88.15),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = false,
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