Locations = Locations or {}

--[[ HAYES AUTOS ]]--
--[[ Default Location ]]--

Locations["hayes_autos"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "Hayes Autos",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	zones = {
		vec2(490.57, -1302.09),
		vec2(490.27, -1305.39),
		vec2(509.71, -1336.82),
		vec2(483.09, -1339.08),
		vec2(479.38, -1330.69),
		vec2(469.89, -1309.57)
	},
	blip = {
		coords = vec3(480.52, -1318.24, 29.2),
		color = 57,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/9SYmv3l.png",
	},
	Stash = {
        {   coords = vec4(486.18, -1324.87, 29.21, 28.0), width = 0.8, depth = 4.8, minZ = 28.21, maxZ = 31.01,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   prop = { model = "bkr_prop_biker_garage_locker_01", coords = vec4(471.97, -1308.87, 29.23, 205.76), },
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "hayesAutos_Personal_",
        },
    },
	Shop = {
        {   coords = vec4(474.64, -1307.89, 29.21, 205.0), width = 0.6, depth = 1.6, minZ = 28.21, maxZ = 30.61,
			label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
        {   coords = vec4(472.64, -1313.19, 29.21, 298.0), width = 0.8, depth = 2.8, minZ = 28.21, maxZ = 30.21,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = {
        {   coords = vec4(471.52, -1310.97, 29.22, 293.0), width = 0.4, depth = 0.6, minZ = 29.22, maxZ = 29.82,
            label = "Clock on/off", icon = "fas fa-list",
        },
	},
    BossStash = {
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(498.12, -1318.13, 29.25, 122.41), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	Payments = {
		{ 	prop = { model = "prop_till_01", coords = vec4(485.88, -1319.49, 30.14, 104.0), },
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
	},
}
