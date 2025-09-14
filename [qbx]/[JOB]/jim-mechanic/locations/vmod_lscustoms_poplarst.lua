Locations = Locations or {}

--[[ LS CUSTOMS HIDEOUT POPLAR STREET ]]--
--[[ VModsFactory - https://forum.cfx.re/t/free-los-santos-customs-hideout-fivem/5247114 ]] --

Locations["lscustoms_poplar_vmod"] = {
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
        {   prop = { model = "xm_prop_rsply_crate04b", coords = vec4(736.25, -1063.52, 22.17, 87.0), },
            label = "Mech Stash: ", icon = "fas fa-cogs",
            slots = 60, maxWeight = 8000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(738.35, -1073.36, 22.17, 359.0), width = 1.0, depth = 4.0, minZ = 21.18, maxZ = 23.78,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "EastLSCustoms_Personal_",
        },
    },
    Shop = {
        {   prop = { model = "prop_toolchest_03_l2", coords = vec4(735.53, -1094.33, 22.17, 90.86), },
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(738.35, -1088.34, 22.17, 90.0), width = 1.0, depth = 4.0, minZ = 21.17, maxZ = 23.77,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   coords = vec4(725.17, -1071.3, 28.31, 270.0), width = 0.8, depth = 2.8, minZ = 27.71, maxZ = 29.11,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   prop = { model = "sf_prop_v_43_safe_s_bk_01a", coords = vec4(725.05, -1068.67, 28.31, 267.28) },
            label = "Boss Stash", icon = "fas fa-vault",
            stashName = "EastLSCustoms_BossStash", stashLabel = "Boss Storage",
            slots = 80, maxWeight = 1000000
        },
    },
    manualRepair = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(724.98, -1095.16, 22.44, 155.32), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    nosRefill = {
		{   prop = { model = "prop_byard_gastank02", coords = vec4(738.36, -1085.66, 22.17, 89.17), },
			label = "Refill NOS", icon = "fas fa-list",
		},
    },
    Payments = {
        {   prop = { model = "prop_till_01", coords = vec4(738.45, -1091.19, 23.20, 46.94), },
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