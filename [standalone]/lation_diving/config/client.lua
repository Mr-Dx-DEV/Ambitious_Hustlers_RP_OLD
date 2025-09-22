return {
    ----------------------------------------------
    --     📊 Customize stats & leaderboard
    ----------------------------------------------

    -- Don't want to show the stats menu option at all?
    -- Set all stats below to false!
    stats = {
        -- Do you want to show the crates collected stat?
        crates = true,
        -- Do you want to show the lowest depth recorded stat?
        depth = true,
        -- Do you want to show the total distance swam stat?
        swam = true
    },

    -- Do you want to display the leaderboard?
    -- This shows the top 10 divers by XP
    -- 🗒️ Note: the leaderboard is not updated constantly
    -- It is only updated on server restarts & player logouts
    leaderboard = true,

    ----------------------------------------------
    --          🗺️ Customize blips
    ----------------------------------------------

    blips = {
        -- The location of the starting/main ped
        start = {
            -- Enable or disable the blip
            enable = true,
            -- Sprite ID (https://docs.fivem.net/docs/game-references/blips/)
            sprite = 729,
            -- Color (https://docs.fivem.net/docs/game-references/blips/#blip-colors)
            color = 3,
            -- Size/scale
            scale = 0.9,
            -- Label
            label = 'Scuba Diving'
        },
        -- The diving zone radius blip
        zone = {
            color = 1,
            alpha = 100
        }
    },

    ----------------------------------------------
    --     💃 Customize animations & props
    ----------------------------------------------

    anims = {
        anchorBoat = {
            label = 'Toggling anchor..',
            icon = 'fas fa-anchor',
            duration = 1000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = { car = true, move = true, comat = true },
            anim = { dict = 'random@domestic', clip = 'pickup_low' },
            prop = { }
        },
        openCrate = {
            label = 'Opening crate..',
            duration = 2000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = { move = false, car = true, combat = true },
            anim = { dict = 'anim@heists@box_carry@', clip = 'idle' },
            prop = { model = 'v_serv_abox_04', bone = 57005, pos = vec3(0.24531, 0.0, -0.21094), rot = vec3(-109.6165, -5.7869, 32.9873) }
        },
        toggleGear = {
            label = 'Changing clothes..',
            icon = 'fas fa-shirt',
            duration = 5000,
            position = 'bottom',
            useWhileDead = false,
            allowSwimming = true,
            canCancel = true,
            disable = { car = true },
            anim = { dict = 'clothingshirt', clip = 'try_shirt_positive_d' },
            prop = { }
        },
        pickupCrate = {
            label = 'Picking up..',
            icon = 'fas fa-hand',
            duration = 3000,
            position = 'bottom',
            useWhileDead = false,
            allowSwimming = true,
            canCancel = false,
            disable = { move = true, car = true, combat = true },
            anim = { },
            prop = { }
        },
        createGroup = {
            label = 'Creating group..',
            icon = 'fas fa-users',
            duration = 1000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = { car = true, move = true, comat = true },
            anim = { },
            prop = { }
        },
    },

}