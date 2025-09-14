Locations = Locations or {}

--[[ GABZ LS CUSTOMS ROUTE 68 ]]--
--[[ Gabz - https://fivem.gabzv.com/package/4724717 ]]--

Locations["route_68_gabz"] = {
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
		coords = vec3(1180.85, 2635.0, 37.25),
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	Stash = {
		{ 	coords = vec4(1171.4, 2641.99, 37.25, 0.0), width = 3.0, depth = 0.8, minZ = 36.95, maxZ = 39.95,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
        {   coords = vec4(1184.97, 2639.38, 37.75, 90.0), width = 1.0, depth = 4.45, minZ = 36.95, maxZ = 39.95,
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
		{ 	coords = vec4(1180.85, 2635.0, 37.75, 90.0), width = 1.6, depth = 0.6,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
		{	coords = vec4(1176.69, 2635.44, 37.05, 270.0), width = 3.2, depth = 1.0, minZ = 36.95, maxZ = 39.95,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = { },
    BossMenus = {
        {   coords = vec4(1186.35, 2638.10, 38.1, 185.0), width = 0.8, depth = 0.8,
            label = "Open Bossmenu",
            icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(1187.25, 2635.33, 37.4, 270.0), width = 1.2, depth = 0.7, minZ = 37.4, maxZ = 38.55,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "route68_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(1162.75, 2622.96, 38.0, 1.32), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	Payments = {
		{ 	prop = { model = "prop_till_01", coords = vec4(1179.53, 2635.09, 38.75, 349.49), },
			label = "Charge", icon = "fas fa-credit-card",
		},
	},
    Restrictions = { -- Remove what you DON'T what the location to be able to edit
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", "Boats", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform", "chameleon", "paints" },
	},
	discord = {
		link = "",
		color = 2571775,
	}
}