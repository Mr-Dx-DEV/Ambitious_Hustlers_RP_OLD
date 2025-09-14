Locations = Locations or {}

--[[ GABZ LS CUSTOMS POPLAR STREET ]]--
--[[ Gabz - https://fivem.gabzv.com/package/4775171 ]] --

Locations["lscustoms_poplar_gabz"] = {
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
        {   coords = vec4(736.21, -1063.4, 22.17, 177.0), width = 1.0, depth = 3.2, minZ = 21.37, maxZ = 23.77,
            label = "Mech Stash: ", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(737.18, -1076.93, 22.17, 90.0), width = 2.2, depth = 2.8, minZ = 21.37, maxZ = 25.37,
            label = "Mech Stash: ", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(737.19, -1079.73, 22.17, 90.0), width = 2.2, depth = 2.8, minZ = 21.37, maxZ = 25.37,
            label = "Mech Stash: ", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(737.15, -1082.48, 22.17, 90.0), width = 2.2, depth = 2.8, minZ = 21.37, maxZ = 25.37,
            label = "Mech Stash: ", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(724.46, -1079.03, 22.17, 270.0), width = 0.8, depth = 2.45, minZ = 21.37, maxZ = 24.37,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "LSCustomsPoplar_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(726.52, -1063.53, 22.17, 180.0), width = 0.8, depth = 3.65, minZ = 21.37, maxZ = 23.17,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(738.3, -1089.08, 22.17, 90.0), width = 1.0, depth = 4.05, minZ = 21.37, maxZ = 23.57,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(732.52, -1063.46, 22.17, 180.0), width = 1.0, depth = 4.05, minZ = 21.37, maxZ = 23.57,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   coords = vec4(726.12, -1067.52, 28.31, 0.0), width = 0.4, depth = 0.65, minZ = 27.91, maxZ = 28.71,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(727.76, -1065.09, 28.31, 180.0), width = 0.6, depth = 1.25, minZ = 27.31, maxZ = 28.71,
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
        {   prop = { model = "prop_till_01", coords = vec4(738.43, -1085.4, 23.08, 101.7), },
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    carLift = {
		{ coords = vec4(729.4, -1088.84, 22.17, 271.55) },
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