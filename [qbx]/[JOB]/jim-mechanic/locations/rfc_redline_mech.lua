Locations = Locations or {}

--[[ REDLINE MECHANIC ]]--
--[[ RFC Mapping - https://store.rfcmapping.com/package/4652693 ]]--

Locations["redline_rfx"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "Redline Mechanic",
    logo = "https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png",
    zones = {
        vec2(-548.77, -940.03),
        vec2(-541.89, -918.62),
        vec2(-555.16, -918.66),
        vec2(-555.02, -910.86),
        vec2(-581.12, -911.25),
        vec2(-581.49, -913.33),
        vec2(-587.48, -913.96),
        vec2(-587.51, -939.09)
    },
    blip = {
        coords = vec3(-576.77, -922.96, 23.89),
        color = 81,
        sprite = 446,
        disp = 6,
        scale = 0.7,
        cat = nil,
        previewImg = "https://i.imgur.com/kKC2Mw2.png",
    },
    Stash = {
        {   coords = vec4(-589.33, -930.19, 28.14, 90.0), width = 2.25, depth = 5.6, minZ = 26.94, maxZ = 29.74,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(-570.32, -911.28, 23.89, 180.0), width = 0.85, depth = 3.8, minZ = 22.69, maxZ = 25.49,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
        {   coords = vec4(-568.6, -939.66, 23.89, 180.0), width = 0.85, depth = 3.8, minZ = 22.69, maxZ = 25.49,
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        {   coords = vec4(-601.78, -913.26, 23.89, 180.0), width = 0.6, depth = 3.8, minZ = 22.69, maxZ = 25.29,
            label = "Personal Stash",
            icon = "fas fa-box-open",
            stashName = "redLine_Personal_",
        },
    },
    Shop = {
        {   coords = vec4(-589.26, -938.59, 28.14, 90.0), width = 2.25, depth = 2.8, minZ = 26.94, maxZ = 29.74,
            label = "Shop", icon = "fas fa-box-open",
        },
    },
    Crafting = {
        {   coords = vec4(-587.21, -932.48, 23.89, 270.0), width = 0.65, depth = 3.8, minZ = 23.09, maxZ = 24.49,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(-587.35, -923.86, 24.05, 270.0), width = 0.65, depth = 3.8, minZ = 23.05, maxZ = 24.45,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(-587.24, -918.46, 23.89, 270.0), width = 0.65, depth = 3.8, minZ = 22.89, maxZ = 24.29,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
        {   coords = vec4(-584.09, -913.17, 23.89, 180.0), width = 0.85, depth = 3.8, minZ = 22.69, maxZ = 25.09,
            label = "Mechanic Crafting", icon = "fas fa-screwdriver-wrench",
        },
    },
    Clockin = { },
    BossMenus = {
        {   coords = vec4(-604.53, -919.5, 23.89, 90.0), width = 0.6, depth = 0.8, minZ = 22.69, maxZ = 24.49,
            label = "Open Bossmenu", icon = "fas fa-list",
        },
    },
    BossStash = {
        {   coords = vec4(-604.41, -922.86, 23.89, 0.0), width = 0.65, depth = 3.8, minZ = 22.69, maxZ = 24.49,
            label = 'Open Storage', icon = "fa-solid fa-vault",
            stashName = "redLine_BossStash", stashLabel = "Boss Storage",
            slots = 100, maxWeight = 2000000,
        },
    },
    manualRepair = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-559.65, -937.35, 23.87, 270.19), },
            label = "Manual Repair", icon = "fas fa-cogs",
        },
    },
    Payments = {
        { 	prop = { model = "prop_till_01", coords = vec4(-590.49, -932.42, 25.10, 250.0), },
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    carLift = {
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