Locations = Locations or {}

--[[ Kingmaps Big LSCustoms ]]--
--[[ KingMaps - https://kingmaps.net/products/6487748 ]]--

Locations["ls_customs_kingmaps"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "LS Customs",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	zones = {
		vec2(-402.44, -108.23),
		vec2(-383.99, -97.2),
		vec2(-300.93, -134.1),
		vec2(-360.54, -182.3),
	},
	blip = {
		coords = vec3(-336.84, -136.39, 39.01),
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	Stash = {
        {   coords = vec4(-344.65, -121.1, 39.03, 70.0), width = 2.4, depth = 0.8, minZ = 38.03, maxZ = 40.63,
			label = "Mech Stash: ", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
        {   coords = vec4(-337.95, -123.55, 39.03, 70.0), width = 2.4, depth = 0.8, minZ = 38.03, maxZ = 40.63,
			label = "Mech Stash: ", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
        {   coords = vec4(-330.23, -126.36, 39.03, 70.0), width = 2.4, depth = 0.8, minZ = 38.03, maxZ = 40.63,
			label = "Mech Stash: ", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   coords = vec4(-319.9, -135.13, 39.53, 160.0), width = 2.2, depth = 0.6, minZ = 38.53, maxZ = 40.53,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "EastLSCustoms_Personal_",
        },
    },
	Shop = {
        {   coords = vec4(-319.02, -132.68, 39.53, 160.0), width = 3.0, depth = 1.0, minZ = 38.53, maxZ = 40.93,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
        {   coords = vec4(-325.07, -128.95, 39.53, 250.0), width = 2.2, depth = 1.2, minZ = 38.53, maxZ = 40.93,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
        {   coords = vec4(-338.1, -142.56, 39.03, 250.0), width = 0.8, depth = 1.0, minZ = 38.03, maxZ = 40.03,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = { },
    BossMenus = {
        {   coords = vec4(-319.72, -132.85, 43.21, 250.0), width = 1.6, depth = 0.6, minZ = 42.81, maxZ = 43.81,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(-319.38, -130.19, 43.21, 250.0), width = 1.6, depth = 0.6, minZ = 42.21, maxZ = 44.21,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "EastLSCustoms_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-356.54, -107.93, 38.7, 161.23), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
    nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(-324.66, -135.9, 39.53, 160.49), },
			label = "Refill NOS", icon = "fas fa-list",
		},
	},
	Payments = {
		{   prop = { model = "prop_till_01", coords = vec4(-323.11, -136.5, 44.38, 252.17), },
            label = "Charge", icon = "fas fa-credit-card",
        },
	},
	garage = { -- requires https://github.com/jimathy/jim-jobgarage
		spawn = vec4(-361.48, -123.14, 38.03, 158.96),
		out = vec4(-356.2, -126.55, 39.43, 73.49),
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