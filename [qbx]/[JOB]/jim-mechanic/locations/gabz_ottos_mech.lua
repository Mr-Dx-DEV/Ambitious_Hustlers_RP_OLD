Locations = Locations or {}

--[[ GABZ OTTOS AUTOS ]]--
--[[ Gabz - https://fivem.gabzv.com/package/5127313 ]]--

Locations["ottos_autos_gabz"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "Ottos Autos",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	zones = {
		vec2(824.64, -802.48),
		vec2(838.40, -802.47),
		vec2(837.53, -830.51),
		vec2(823.86, -830.36)
	},
	blip = {
		coords = vec3(831.03, -813.01, 26.33),
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	Stash = {
		{   coords = vec4(836.97, -814.73, 25.83, 90.0), width = 0.6, depth = 3.6,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
        {   coords = vec4(840.28, -827.74, 25.83, 0.0), width = 0.6, depth = 4.2, minZ = 25.53, maxZ = 28.33,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
        {   coords = vec4(838.41, -825.22, 25.83, 270.0), width = 0.6, depth = 4.2, minZ = 25.53, maxZ = 28.33,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   coords = vec4(842.26, -824.54, 25.83, 90.0), width = 0.6, depth = 2.4, minZ = 25.53, maxZ = 27.73,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "ottoAuto_Personal_",
        },
    },
	Shop = {
		{   coords = vec4(837.02, -808.22, 25.83, 90.0), width = 1.0, depth = 1.4,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
		{	coords = vec4(837.03, -811.74, 25.33, 90.0), width = 1.4, depth = 2.2,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = {
		--
	},
    BossMenus = {
        {   coords = vec4(835.41, -829.71, 25.83, 270.0), width = 0.6, depth = 0.4, minZ = 26.13, maxZ = 26.73,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(832.16, -830.07, 25.83, 0.0), width = 0.6, depth = 2.6, minZ = 25.53, maxZ = 27.53,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "ottoAuto_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(835.0, -801.06, 26.27, 0.25), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	nosRefill = {
		--
	},
	Payments = {
		{   prop = { model = "prop_till_01", coords = vec4(833.96, -826.79, 27.18, 0.35), },
            label = "Charge", icon = "fas fa-credit-card",
        },
	},
	carLift = {
		{ coords = vec4(827.96, -805.63, 26.33, 270.5) },
	},
	garage = { -- requires https://github.com/jimathy/jim-jobgarage
		spawn = vec4(826.59, -793.63, 26.21, 84.34),
		out = vec4(824.3, -801.2, 26.37, 0.65),
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