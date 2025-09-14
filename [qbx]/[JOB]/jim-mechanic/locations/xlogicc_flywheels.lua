Locations = Locations or {}

--[[ FLYWHEELS IN SANDY SHORE ]]--
--[[ xLogicc - https://forum.cfx.re/t/release-flywheels-garage/1436833 ]]

Locations["flywheels_xlogicc"] = {
	Enabled = false,
	autoClock = { enter = false, exit = false, },
	job = "mechanic",
	label = "FlyWheels",
	logo = "https://https://static.wikia.nocookie.net/gtawiki/images/c/c6/Flywheels-GTAV-Logo-0.png",
	zones = {
		vec2(1737.60, 3335.52),
        vec2(1772.21, 3355.80),
        vec2(1794.50, 3321.30),
        vec2(1751.00, 3294.07)
	},
	blip = {
        coords = vec3(1774.36, 3331.67, 41.35),
        color = 57,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
		previewImg = "https://i.imgur.com/rH2aI8o.png",
	},
	Stash = {
		{   coords = vec4(1763.4, 3324.25, 41.43-1, 118.9), width = 1.0, depth = 3.5,
			label = "Mech Stash: ", icon = "fas fa-cogs",
			slots = 50, maxWeight = 4000000,
		},
	},
    PersonalStash = {
        {   coords = vec4(1765.19, 3321.57, 41.44, 210.0), width = 0.3, depth = 1.3, minZ = 40.44, maxZ = 42.64,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "flyWheels_Personal_",
        },
    },
	Shop = {
		{   coords = vec4(1768.43, 3320.26, 41.44-1, 118.0), width = 0.5, depth = 2.0,
            label = "Shop", icon = "fas fa-box-open",
        },
	},
	Crafting = {
		{	coords = vec4(1763.45, 3332.2, 41.33-1, 28.9), width = 1.0, depth = 8.0,
			label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
		},
	},
	Clockin = {
		{   prop = { model = "prop_laptop_01a", coords = vec4(1767.37, 3324.13, 42.55, 25.63), },
			label = "Clock on/off", icon = "fas fa-list",
		},
	},
    BossStash = {
		--
    },
	manualRepair = {
		{ 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(1776.98, 3320.63, 41.43, 210.0), },
			label = "Manual Repair", icon = "fas fa-cogs",
		},
	},
	nosRefill = { },
	Payments = {
		{   coords = vec4(1770.95, 3323.61, 41.44, 207.25),
            label = "Charge", icon = "fas fa-credit-card",
        },
	},
    carLift = {
        { coords = vec4(1753.63, 3331.17, 41.2, 27.33) },
		{ coords = vec4(1756.96, 3320.7, 41.17, 298.77) },
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