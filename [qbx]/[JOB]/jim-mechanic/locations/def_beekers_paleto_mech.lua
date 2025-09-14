Locations = Locations or {}

--[[ BEEKERS PALETO MECHANIC ]]--
--[[ Default Location ]]--

Locations["beekers_mech"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "Beekers Mechanic",
    logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
    zones = {
        vec2(117.79, 6625.31),
		vec2(102.88, 6611.96),
		vec2(95.51, 6619.93),
		vec2(108.8, 6633.98)
    },
    blip = {
        coords = vec3(108.36, 6623.67, 31.79),
        color = 81,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
        previewImg = "https://i.imgur.com/kKC2Mw2.png",
    },
    Stash = {
        {   coords = vec4(114.31, 6627.86, 31.79, 312.27), width = 0.6, depth = 3.6,
            label = "Mech Stash: ", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   prop = { model = "bkr_prop_biker_garage_locker_01", coords = vec4(102.42, 6613.93, 32.45, 313.24), },
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "beekersMech_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(109.03, 6631.97, 31.49, 44.35), width = 0.8, depth = 3.0,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {	coords = vec4(105.98, 6628.84, 31.79, 225.0), width = 0.6, depth = 1.0,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = {
        --
    },
    BossMenus = {
        {   coords = vec4(101.15, 6620.14, 32.47, 255.0), width = 0.6, depth = 0.5, minZ = 32.07, maxZ = 33.07,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(98.38, 6621.45, 32.47, 225.0), width = 0.6, depth = 1.4, minZ = 31.47, maxZ = 32.87,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "beekersMech_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
    manualRepair = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(105.66, 6612.41, 31.97, 223.67), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    nosRefill = {
        --
    },
    Payments = {
        {   prop = { model = "prop_till_01", coords = vec4(107.09, 6630.0, 32.89, 227.57), },
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    carLift = {
		{ coords = vec4(114.04, 6623.87, 31.79, 44.43), },
	},
    garage = { -- requires https://github.com/jimathy/jim-jobgarage
        spawn = vec4(109.92, 6608.11, 31.18, 313.99),
        out = vec4(107.43, 6614.64, 32.0, 226.54),
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