Locations = Locations or {}

--[[ AIRPORT HANGER MECH ]]--
--[[ Default Location ]]--

Locations["flightmech"] = {
    Enabled = false,
    autoClock = { enter = false, exit = false, },
    job = "mechanic",
    label = "Flight Mech",
    logo = "https://i.imgur.com/74UVnCb.jpeg",
    zones = {
        vec3(-1022.48, -2987.89, 13.95),
        vec3(-1039.5, -3018.16, 13.95),
        vec3(-938.36, -3082.5, 13.94),
        vec3(-917.82, -3048.68, 13.94)
    },
    blip = {
        coords = vec3(-1028.65, -3017.88, 12.5),
        color = 1,
        sprite = 423,
        disp = 6,
        scale = 0.7,
        cat = nil,
    },
    Stash = {
        {   prop = { model = "xm_prop_rsply_crate04b", coords = vec4(-1029.2, -3017.26, 13.95, 330.79), },
            label = "Mech Stash", icon = "fas fa-cogs",
            slots = 50, maxWeight = 4000000,
        },
    },
    PersonalStash = {
        --
    },
    Shop = { },
    Crafting = {
        { 	prop = { model = "xm3_prop_xm3_tool_draw_01d", coords = vec4(-1138.59, -1996.63, 13.17, 314.64), },
            width = 0.8, depth = 2.1,
            label = "Mechanic Crafting",
            icon = "fas fa-screwdriver-wrench",
        },
    },
    Payments = {
        { 	prop = { model = "prop_till_01", coords = vec4(-1023.47, -3020.92, 14.95, 339.0), },
            label = "Charge", icon = "fas fa-credit-card",
        },
    },
    Restrictions = { -- Remove what you DON'T what the location to be able to edit
        Vehicle = { "helicopters", "planes" },
        Allow = { "tools", "cosmetics", "repairs", "nos", "perform", "chameleon", "paints" },
    },
    discord = {
        link = "",
        color = 16711680,
    },
    PropHide = { }
}