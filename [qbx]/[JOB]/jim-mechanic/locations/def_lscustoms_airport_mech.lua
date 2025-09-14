Locations = Locations or {}

--[[ LS CUSTOMS NEAR AIRPORT ]]--
--[[ Default Location ]]--

Locations["lscustoms_airport"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "LS Customs",
    logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
    zones = {
        vec2(-1118.57, -2017.47),
		vec2(-1143.93, -2042.66),
		vec2(-1172.80, -2014.10),
		vec2(-1147.36, -1988.70)
    },
    blip = {
        coords = vec3(-1150.68, -2002.48, 13.18),
        color = 81,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
        previewImg = "https://i.imgur.com/kKC2Mw2.png",
    },
    Stash = {
        {   coords = vec4(-1141.11, -2004.79, 13.18, 45.0), width = 1.6, depth = 1.0,
            label = "Mech Stash: ", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(-1147.99, -1999.25, 13.18, 135.0), width = 0.2, depth = 1.2, minZ = 12.18, maxZ = 14.58,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "airportLSCustoms_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(-1144.2, -2003.91, 13.18, 45.0), width = 1.6, depth = 1.0,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {	coords = vec4(-1158.71, -2002.37, 13.18, 45.0), width = 0.6, depth = 1.0,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   prop = { model = "prop_laptop_01a", coords = vec4(-1155.69, -1998.91, 14.22, 222.0), },
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   prop = { model = "sf_prop_v_43_safe_s_bk_01a", coords = vec4(-1139.77, -2007.38, 13.18, 47.6) },
            label = "Boss Stash", icon = "fas fa-vault",
            stashName = "airportLSCustoms_BossStorage", stashLabel = "Boss Stash",
            slots = 80, maxWeight = 1000000
        },
    },
    manualRepair = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-1154.66, -2023.07, 13.18, 45.81), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(-1154.25, -1997.88, 13.18, 215.84), },
			label = "Refill NOS", icon = "fas fa-list",
		},
    },
    Payments = {
        {   prop = { model = "prop_till_01", coords = vec4(-1147.41, -2001.07, 14.20, 105.0), },
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    carLift = {
		{ coords = vec4(-1161.27, -2014.98, 13.18, 135.01) },
	},
    garage = { -- requires https://github.com/jimathy/jim-jobgarage
        spawn = vec4(-1154.63, -1986.95, 12.5, 315.29),
        out = vec4(-1147.87, -1989.09, 13.16, 45.01),
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