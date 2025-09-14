Locations = Locations or {}

--[[ KIIYA TUNER AUTO SHOP ]]--
--[[ Kiiya - https://kiiya.tebex.io/package/4609998 ]]--

Locations["tunerauto_kiiya"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "Tuner Auto Shop",
	logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
	zones = {
		vec2(795.92, -997.61),
		vec2(792.77, -911.42),
		vec2(847.04, -912.33),
		vec2(845.58, -996.69),
	},
	blip = {
		coords = vec3(795.13, -969.9, 27.93),
		color = 81,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/Zd6V0vI.png",
	},
	Stash = {
        {   coords = vec4(808.05, -980.36, 26.31, 0.0), width = 1.0, depth = 3.2, minZ = 25.31, maxZ = 27.51,
			label = "Mech Stash", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   coords = vec4(826.5, -969.88, 30.18, 90.0), width = 0.8, depth = 0.8, minZ = 29.18, maxZ = 31.38,
			label = "Personal Stash",
			icon = "fas fa-box-open",
			stashName = "tunerAuto_Personal_",
		},
    },
	Shop = {
        {   coords = vec4(805.04, -973.85, 26.31, 270.0), width = 0.8, depth = 1.2, minZ = 25.31, maxZ = 27.51,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
        {   coords = vec4(811.22, -980.0, 26.31, 0.0), width = 0.8, depth = 2.4, minZ = 25.31, maxZ = 27.31,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
    BossMenus = {
		{   prop = { model = "prop_laptop_01a", coords = vec4(832.87, -970.13, 30.96, 171.71), },
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(831.38, -972.27, 30.18, 0.0), width = 0.8, depth = 1.4, minZ = 29.18, maxZ = 30.78,
            label = "Boss Stash", icon = "fas fa-vault",
            stashName = "tunerAutoBossStorage", stashLabel = "Boss Stash",
            slots = 80, maxWeight = 1000000
        },
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(800.22, -957.06, 25.84, 91.66), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	Payments = {
		{ 	prop = { model = "prop_till_01", coords = vec4(810.14, -958.57, 27.23, 179.1), },
			label = "Charge", icon = "fas fa-credit-card",
		},
	},
	carLift = {
		--
	},
	PropHide = {
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
