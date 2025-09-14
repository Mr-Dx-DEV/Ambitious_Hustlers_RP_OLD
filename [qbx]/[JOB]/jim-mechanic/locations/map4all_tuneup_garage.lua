Locations = Locations or {}

--[[ TUNE UP GARAGE ]]--
--[[ Map4All - https://fivem.map4all-shop.com/package/4967549 ]]

Locations["tuneup_garage_map4all"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "Trackstar",
    logo = "https://i.imgur.com/74UVnCb.jpeg",
    zones = {
        vec2(1004.52, -1489.37),
		vec2(1004.37, -1504.59),
		vec2(977.21, -1504.96),
		vec2(977.86, -1480.86),
		vec2(996.25, -1480.59),
		vec2(997.43, -1490.05)
    },
    blip = {
		coords = vec3(1001.18, -1485.68, 31.29),
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
    Stash = {
        {   coords = vec4(988.33, -1502.52, 30.5, 90.0), width = 1.4, depth = 0.8,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(985.78, -1502.57, 30.5, 90.0), width = 1.4, depth = 0.8,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
		{   coords = vec4(983.47, -1492.40, 30.5, 90.0), width = 1.4, depth = 0.8,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
	Shop = {
        {   coords = vec4(995.02, -1488.38, 31.0, 0.0), width = 0.6, depth = 1.4, minZ = 30.5, maxZ = 32.7,
            label = "Shop", icon = "fas fa-box-open",
        },
        {   coords = vec4(995.02, -1489.85, 31.0, 0.0), width = 0.6, depth = 1.4, minZ = 30.5, maxZ = 32.7,
            label = "Shop", icon = "fas fa-box-open",
        },
        {   coords = vec4(995.04, -1491.19, 31.0, 0.0), width = 0.6, depth = 1.4, minZ = 30.5, maxZ = 32.7,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
    Crafting = {
        {   coords = vec4(988.53, -1499.29, 30.5, 1.0), width = 2.4, depth = 1.1, minZ = 30.5, maxZ = 32.1,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(985.91, -1499.5, 30.5, 1.0), width = 2.4, depth = 1.1, minZ = 30.5, maxZ = 32.1,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = {
        --
    },
    BossMenus = {
        {   coords = vec4(990.61, -1490.75, 31.47, 160.92), width = 0.8, depth = 0.8,
            label = "Open Bossmenu",
            icon = "fas fa-list",
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(997.05, -1482.88, 31.43, 275.11), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
    Payments = {
        {   prop = { model = "prop_till_01", coords = vec4(991.46, -1490.73, 32.485, 2.0), },
            label = "Charge",
            icon = "fas fa-credit-card",
        },
    },
    Restrictions = { -- Remove what you DON'T what the location to be able to edit
        Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", "Boats", },
        Allow = { "tools", "cosmetics", "repairs", "nos", "perform", "chameleon", "paints" },
    },
    nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(996.0, -1492.33, 31.5, 181.0), },
			label = "Refill NOS", icon = "fas fa-list",
		},
	},
    discord = {
        link = "",
        color = 16711680,
    }
}