Locations = Locations or {}

--[[ LS CUSTOMS POPLAR STREET ]]--
--[[ Default Location ]] --

Locations["lscustoms_poplar"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "LS Customs Poplar",
    logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
    zones = {
		vec2(712.07, -1092.94),
		vec2(712.08, -1052.44),
		vec2(767.22, -1053.33),
		vec2(770.71, -1113.09),
		vec2(741.73, -1108.98)
    },
    blip = {
        coords = vec3(731.69, -1088.84, 22.17),
        color = 81,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
		previewImg = "https://i.imgur.com/Sa8TFE5.png",
    },
    Stash = {
        {   coords = vec4(736.25, -1063.52, 22.17, 87.0), width = 1.6, depth = 1.0,
            label = "Mech Stash: ", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(738.49, -1081.46, 22.17, 90.0), width = 0.6, depth = 3.6, minZ = 21.17, maxZ = 24.57,
            label = "Mech Stash: ", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(728.22, -1063.32, 22.17, 179.0), width = 0.6, depth = 2.4, minZ = 21.17, maxZ = 23.57,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "LSCustomsPoplar_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(738.26, -1089.23, 22.17, 89.0), width = 1.2, depth = 3.6, minZ = 21.17, maxZ = 23.57,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(738.59, -1078.0, 22.17, 90.0), width = 0.8, depth = 1.6, minZ = 21.17, maxZ = 23.57,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   prop = { model = "prop_laptop_01a", coords = vec4(725.16, -1070.82, 29.16, 268.24), },
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   prop = { model = "sf_prop_v_43_safe_s_bk_01a", coords = vec4(725.06, -1074.3, 28.34, 267.41) },
            label = "Boss Stash", icon = "fas fa-vault",
            stashName = "LSCustomsPoplarBossStorage", stashLabel = "Boss Stash",
            slots = 80, maxWeight = 1000000
        },
    },
    manualRepair = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(724.98, -1095.16, 22.44, 155.32), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(725.63, -1084.71, 22.20, 264.17), },
			label = "Refill NOS", icon = "fas fa-list",
		},
    },
    Payments = {
        {   prop = { model = "prop_till_01", coords = vec4(737.44, -1084.69, 23.05, 113.66), },
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    garage = { -- requires https://github.com/jimathy/jim-jobgarage
        spawn = vec4(716.95, -1071.7, 21.95, 0.86),
        out = vec4(719.56, -1074.88, 22.24, 90.0),
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