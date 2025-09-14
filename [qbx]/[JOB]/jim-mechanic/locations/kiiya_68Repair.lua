Locations = Locations or {}

--[[ ROUTE 68 MECHANIC ]]--
--[[ Kiiya - https://kiiya.tebex.io/package/6407793 ]]--

Locations["route_68_kiiya"] = {
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
		{ 	coords = vec4(1171.67, 2635.54, 37.22, 90.46), width = 4.0, depth = 2.0,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
		{ 	coords = vec4(1167.92, 2637.30, 37.15, 183.10), width = 4.0, depth = 1.0,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   coords = vec4(1163.50, 2636.67, 37.0, 180.99), width = 2.8, depth = 0.7, minZ = 37.0, maxZ = 38.75,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "route68_Personal_",
        },
    },
	Shop = {
        --{   coords = vec4(1171.75, 2635.96, 37.38, 315.0), width = 0.6, depth = 0.6, minZ = 36.93, maxZ = 38.33,
        --    label = "Shop", icon = "fas fa-box-open",
        --},
	},
	Crafting = {
		{	coords = vec4(1176.69, 2635.44, 37.05, 270.0), width = 3.2, depth = 1.0,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = {
		--
	},
    BossMenus = {
        {   prop = { model = "prop_monitor_03b", coords = vec4(1165.73, 2650.00, 38.74, 90.00) },
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(1163.44, 2650.09, 37.66, 178.85), width = 2.0, depth = 1.0, minZ = 37.4, maxZ = 38.55,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "route68_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(1167.58, 2652.72, 37.88, 358.8), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	Payments = {
        {   prop = { model = "prop_till_01", coords = vec4(1165.56, 2649.11, 38.76, 90.00), },
			label = "Charge",
			icon = "fas fa-credit-card",
		},
	},
	carLift = {
		--
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