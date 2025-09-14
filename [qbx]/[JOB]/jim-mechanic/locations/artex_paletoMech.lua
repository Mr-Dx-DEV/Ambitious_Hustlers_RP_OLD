Locations = Locations or {}

--[[ PALETO MECHANIC ]]--
--[[ Artex - https://artex.tebex.io/package/6084381 ]]--

Locations["paletomech_artex"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "Paleto Mechanic",
    logo = "https://i.imgur.com/74UVnCb.jpeg",
    zones = {
        vec2(87.01, 6563.10),
		vec2(115.32, 6534.45),
		vec2(91.72, 6510.92),
		vec2(63.47, 6539.15),
    },
    blip = {
        coords = vec3(88.98, 6541.71, 31.34),
        color = 1,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
    },
    Stash = {
        {   coords = vec4(100.33, 6524.62, 30.5, 45.0), width = 0.6, depth = 3.8,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(90.07, 6520.48, 30.5, 45.0), width = 0.5, depth = 2.7,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(104.93, 6528.96, 30.5, 45), width = 0.5, depth = 3.0,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(82.58, 6526.03, 34.28, 44.07), width = 1.0, depth = 1.5,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "paletoMech_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(103.94, 6542.91, 31.44, 135.0), width = 0.8, depth = 1.6, minZ = 30.44, maxZ = 32.64,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(106.45, 6539.57, 30.75, 135.0), width = 1.0, depth = 2.6,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(87.48, 6520.35, 30.75, 135.0), width = 1.0, depth = 1.8,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   coords = vec4(93.54, 6518.10, 34.72, 225.02), width = 0.7, depth = 0.7,
            label = "Open Bossmenu",
            icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(91.79, 6515.49, 33.89, 321.0), width = 0.6, depth = 0.7, minZ = 33.89, maxZ = 35.09,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "paletoMech_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
    manualRepair = {
        {   prop = { model = "xm3_prop_xm3_tool_draw_01d" , coords = vec4(107.12, 6545.30, 31.38, 315), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    Payments = {
        {   prop = { model = "prop_till_01", coords = vec4(103.43, 6531.98, 32.43, 135.0), },
            label = "Charge",
            icon = "fas fa-credit-card",
        },
    },
    Restrictions = { -- Remove what you DON'T what the location to be able to edit
        Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", "Boats", },
        Allow = { "tools", "cosmetics", "repairs", "nos", "perform", "chameleon", "paints" },
    },
    discord = {
        link = "",
        color = 16711680,
    },
    nosrefill = {
        --
    },
    carLift = {
        { coords = vec4(99.76, 6541.25, 31.43, 226.27), },
    },
}