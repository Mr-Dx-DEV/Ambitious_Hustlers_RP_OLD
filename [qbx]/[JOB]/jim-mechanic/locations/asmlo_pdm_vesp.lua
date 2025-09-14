Locations = Locations or {}

--[[ PDM VESPUCCI MECHANIC ]]--
--[[ AS MLO - https://as-mlo.tebex.io/package/6038374 ]]--

Locations["pdm_vespucci_asmlo"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "PDM Repairs",
	zones = {
		vec2(-1049.18, -1411.27),
		vec2(-1019.38, -1415.28),
		vec2(-1012.37, -1433.85),
		vec2(-1045.95, -1446.58),
		vec2(-1057.03, -1435.75),
	},
	blip = {
		coords = vec3(-1037.83, -1431.66, 5.41),
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
	},
	Stash = {
		{ coords = vec4(-1032.72, -1434.13, 5.0, 110.0), width = 5.2, depth = 0.6,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
		{ coords = vec4(-1032.2, -1440.4, 5.0, 110.0), width = 3.8, depth = 0.6,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
		{ coords = vec4(-1039.21, -1439.82, 5.0, 345.0), width = 4.8, depth = 0.8,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
	Shop = {
        {   coords = vec4(-1036.23, -1435.31, 4.43, 200.0), width = 0.8, depth = 1.8, minZ = 4.43, maxZ = 6.63,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
		{ 	coords = vec4(-1028.39, -1438.96, 4.95, 110.0), width = 4.0, depth = 0.8,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
		{ 	coords = vec4(-1021.83, -1417.56, 4.95, 110.0), width = 4.0, depth = 0.8,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
    PersonalStash = {
        {   coords = vec4(-1036.06, -1441.84, 5.03, 290.07), width = 1.5, depth = 0.8,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "pdmVesp_Personal_",
        },
    },
    BossMenus = {
        {   coords = vec4(-1025.94, -1421.20, 5.00, 257.53), width = 0.8, depth = 0.8,
            label = "Open Bossmenu",
            icon = "fas fa-list",
        },
    },
	Clockin = { },
    Payments = {
        {   prop = { model = "prop_till_01", coords = vec4(-1026.36, -1422.74, 6.55, 270.0), },
            label = "Charge",
            icon = "fas fa-credit-card",
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-1040.21, -1438.71, 5.25, 75.21), },
			label = "Manual Repair", icon = "fas fa-cogs",
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