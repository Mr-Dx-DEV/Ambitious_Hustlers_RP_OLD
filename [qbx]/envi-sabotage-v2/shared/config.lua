Config = {}

-- [EXPORTS] --   (To be used in other scripts, do not uncomment these!)

--[[ 
--  exports['envi-sabotage-v2']:sawAnimation()
--  exports['envi-sabotage-v2']:impactDriverAnimation()
--  exports['envi-sabotage-v2']:isHoldingSaw()
--  exports['envi-sabotage-v2']:isHoldingDrill()
--  exports['envi-sabotage-v2']:isHoldingImpactDriver()
--  exports['envi-sabotage-v2']:isHoldingPliers()
--  exports['envi-sabotage-v2']:isHoldingSpanner()
--  exports['envi-sabotage-v2']:isHoldingAdjustableSpanner()
--  exports['envi-sabotage-v2']:isHoldingScrewdriver() 

EXAMPLE: 
    
        RegisterCommand('saw', function(source, args, rawCommand)
            if exports['envi-sabotage-v2']:isHoldingSaw() then  -- Checks if player is holding saw {returns true/ false}
                local animationEnded = exports['envi-sabotage-v2']:sawAnimation()  -- Plays the saw animation {returns true when the animation ends}
                if animationEnded then
                    -- do something
                    print('Saw Animation Ended')
                end
            else
                print('You are not holding a saw')
            end
        end, false)

]]

Config.Debug = true -- Set to true to enable debug mode

Config.EnviAddictions = {
    enabled = false,         -- Set to true if you use Envi-Addictions and want to have crime addiction exports - Get it here: https://envi-scripts.tebex.io/package/6882797
    addictionType = 'crime',    -- The addiction to use for the crime addiction exports
    points = {
        fuelLeak = 3,
        cutBrakes = 3,
        removeWheels = 5,
        chopDoor = 2,
        messUpControls = 4,
        messUpElectrics = 4,
        startFire = 3,
        rigIgnitionBomb = 10,
        rigRemoteBomb = 10,
        rigImpactBomb = 10,
        rigSpeedBomb = 10,
    }
}

-- ADDED IN 2.6.0 --
Config.EngineBone = 'engine'   -- (support to change the engine TARGET bone for vehicles without engine bones)
-- Note: The Hood of the vehicle MUST BE OPEN to plant the bomb

Config.Tools = {

    impactDriver = {
        enabled = true, -- enable/disable the impact driver / remove wheels feature
        name = 'Impact Driver',
        item = 'impact_driver',
        model = `sf_prop_impact_driver_01a`,
        offsets = {0.14, -0.14, -0.1, 82.0, -94.0, 155.0},
        breakChance = 10, -- Chance that the tool will break on use (0-100) - 0 = never breaks - 100 = always breaks
        entity = nil, -- [DO NOT TOUCH THIS SETTING]
        active = false -- [DO NOT TOUCH THIS SETTING]
    },
    spanner = {
        enabled = true, -- enable/disable the spanner / loosen wheel nuts feature
        name = 'Spanner',
        item = 'spanner',
        model = `prop_tool_spanner01`,
        offsets = {0.13, 0.03, -0.01, 47.0, 213.0, 325.0},
        breakChance = 20, -- Chance that the tool will break on use (0-100) - 0 = never breaks - 100 = always breaks
        entity = nil, -- [DO NOT TOUCH THIS SETTING]
        active = false, -- [DO NOT TOUCH THIS SETTING]
        -- additional spanner settings
        wheelFallOffSpeed = 15               -- Speed at which wheels can start falling off (MPH)     

    },
    pliers = {
        enabled = true, -- enable/disable the pliers / cutting brakes feature
        name = 'Pliers',
        item = 'pliers',
        model = `prop_tool_pliers`,
        offsets = {0.13, 0.05, 0.0, -80.0, 0.0, 0.0},
        breakChance = 40, -- Chance that the tool will break on use (0-100) - 0 = never breaks - 100 = always breaks
        entity = nil, -- [DO NOT TOUCH THIS SETTING]
        active = false, -- [DO NOT TOUCH THIS SETTING]
        -- additional pliers settings
        noBrakesSpeed = 35                   -- Speed at which the brakes will fail (MPH) - to allow reversing - 0 will disable reversing, anything under 35 may glitch reversing animation
    },
    spannerAdj = {
        enabled = true, -- enable/disable the adjustable spanner / sabotage controls feature
        name = 'Adjustable Spanner',
        item = 'adjustable_spanner',
        model = `prop_tool_adjspanner`,
        offsets = {0.12, 0.02, -0.01, 122.0, 563.0, 551.0},
        breakChance = 50, -- Chance that the tool will break on use (0-100) - 0 = never breaks - 100 = always breaks
        entity = nil, -- [DO NOT TOUCH THIS SETTING]
        active = false -- [DO NOT TOUCH THIS SETTING]
    },
    drill = {
        enabled = true, -- enable/disable the drill / petrol leak feature
        name = 'Drill',
        item = 'drill',
        model = `gr_prop_gr_drill_01a`,
        offsets = {0.25, -0.13, -0.05, 82.0, -90.0, 163.0},
        breakChance = 60, -- Chance that the tool will break on use (0-100) - 0 = never breaks - 100 = always breaks
        entity = nil, -- [DO NOT TOUCH THIS SETTING]
        active = false, -- [DO NOT TOUCH THIS SETTING]
        -- additional drill settings
        leakSpeed = 60,                -- Speed at which the gas tank can start leaking (MPH)
    },
    buzzSaw = {
        enabled = true, -- enable/disable the buzz saw / removing doors feature 
        name = 'Buzz Saw',
        item = 'buzz_saw',
        model = `v_ind_cs_powersaw`,
        offsets = {0.22, 0.34, 0.03, -120.64, -158.35, -64.21},
        breakChance = 10, -- Chance that the tool will break on use (0-100) - 0 = never breaks - 100 = always breaks
        entity = nil, -- [DO NOT TOUCH THIS SETTING]
        active = false, -- [DO NOT TOUCH THIS SETTING]
        -- additional buzz saw settings
        keyToDrop = 73, -- Key to drop the buzz saw [Default: X]
    },

    screwdriver = {         --    (used to saboatge electronics to cause it to cut out)
        enabled = true, -- enable/disable the screwdriver / electrics sabotage feature
        name = 'Screwdriver',
        item = 'screwdriver',
        model = `prop_tool_screwdvr03`,
        offsets = {0.13, 0.10, 0.0, 80.0, 180.0, 0.0},
        breakChance = 10, -- Chance that the tool will break on use (0-100) - 0 = never breaks - 100 = always breaks
        entity = nil, -- [DO NOT TOUCH THIS SETTING]
        active = false, -- [DO NOT TOUCH THIS SETTING]
        -- additional screwdriver settings
        cutOutSpeed = 60, -- Speed at which the power will have a chance to cut out (MPH)
        cutOutChance = 10, -- Chance that the power will cut out (0-100) - 0 = never cuts out - 100 = always cuts out
    },

}

Config.Bombs = {

    ignitionBomb = {
        enabled = true, -- enable/disable the ignition bomb
        name = 'Ignition Bomb',
        item = 'ignition_bomb',
    },
    impactBomb = {
        enabled = true, -- enable/disable the impact bomb
        name = 'Impact Bomb',
        item = 'impact_bomb',
    },
    remoteBomb = {
        enabled = true, -- enable/disable the remote bomb
        name = 'Remote Bomb',
        item = 'remote_bomb',
        detonatorItem = 'phone_bomb',

    },
    firelighter = {
        enabled = true, -- enable/disable the fire lighter
        name = 'Fire Lighter',
        item = 'firelighter',
    },
    speedBomb = {
        enabled = true, -- enable/disable the speed bomb
        name = 'Speed Bomb',
        item = 'speed_bomb',
            -- Speed Bomb Settings
        speedToActivate = 75, -- Speed at which the bomb will activate (MPH)
        speedToExplode = 50, -- Speed at which the bomb will explode after activated (MPH)
        explodeTimer = 5, -- Time in seconds you have to recover before the bomb explodes after speed drops below the speedToExplode.
        beepWhenActive = true, -- enable/disable the bomb beeping
        notifyDriver = true, -- notify the driver when the bomb is activated
    },
}

-- Repair Settings
Config.RepairJob = {'mechanic', 'hobo'}               -- Job to use for repairs
Config.RepairTime = 10                      -- Time in seconds to repair a vehicle

Config.RealisticRepair = false              -- enable/disable realistic repairs for brakes, controls, gas tank etc. 
-- if true you must be holding the right tool for some repairs (brakes = spanner, controls = adjustable spanner)
--(to enable this you must use vehicle lifts (such as in wasabi_mechanic) as it will require you to be underneath the vehicle for some repairs)


-- Sound Settings          -- You must have the sound files in your Interact-Sound folder for this to work!
Config.SawVolume = 0.8     -- [0.1 = 10% volume, 1.0 = 100% volume]
Config.ImpactDriverVolume = 0.5
Config.DrillVolume = 0.3

Config.MiniGame = false -- Set to true to enable the minigames

-- [[ NEW ]] --

Config.BlacklistedVehClasses = { -- Blacklisted vehicle classes
    17, -- Service
    18, -- Emergency
    19, -- Military
    20, -- Commercial
    21, -- Trains
}

Config.RepairAll = true -- Set to true to allow players to repair all damamges on a vehicle

-- EDITABLE FUNCTIONS --

function skillCheckEasy()    -- change your minigame here
    return lib.skillCheck({'easy'}, {'e'}) --lib.skillCheck({'easy'}, {'w', 'a', 's', 'd'})
end

function skillCheckFast()    -- change your minigame here
    return lib.skillCheck({areaSize = 100, speedMultiplier = 2}, {'e'}) --lib.skillCheck({'easy'}, {'w', 'a', 's', 'd'})
end

function skillCheckLong()    -- change your minigame here
    return lib.skillCheck({'easy', 'easy', 'easy', 'easy', 'medium', 'medium', {areaSize = 100, speedMultiplier = 2}, 'hard'}, {'w', 'a', 's', 'd'})
end

function onFireStarted(coords)
    -- do something when a fire is started
end

function fuelExport(vehicle)
    --add your export here for when a vehicle has fuel drained. Standalone example:
    SetVehicleFuelLevel(vehicle, 0.0)
end

-- Language
Config.Lang = {
    -- Door Names
    ['driver_door'] = 'Driver Door',
    ['passenger_door'] = 'Passenger Door',
    ['back_driver_door'] = 'Back Driver Door',
    ['back_passenger_door'] = 'Back Passenger Door',
    ['hood'] = 'Hood',
    ['trunk'] = 'Trunk',

    -- Tire label
    ['remove_wheel'] = 'Remove Wheel',

    -- Target labels
    ['chop_target'] = 'Remove ',
    ['saw_off'] = 'Saw Off ',
    ['saw_off_door'] = 'Saw Off Door',
    ['impact_driver'] = 'Impact Driver',
    ['buzz_saw'] = 'Buzz Saw',
    ['pickup_buzz_saw'] = 'Disassemble Buzz Saw',
    ['loosen'] = 'Loosen Wheel Nuts',
    ['sabotage_tank'] = 'Sabotage Fuel Tank',
    ['fix_tank'] = 'Repair Fuel Tank',
    ['cut_brakes'] = 'Cut Brakes',
    ['fix_brakes'] = 'Repair Brake Lines',
    ['sabotage_controls'] = 'Sabotage Accelerator',
    ['fix_controls'] = 'Repair Accelerator',
    ['rig_ignition'] = 'Rig Ignition Explosive',
    ['rig_remote'] = 'Rig Remote Explosive',
    ['rig_impact'] = 'Rig Impact Explosive',
    ['disarm_bomb'] = 'Disarm Explosive',
    ['broke_tool'] = 'You have broken your ',
    ['rig_speed'] = 'Rig Speed Explosive',
    ['fix_loose_wheels'] = 'Repair Wheel Nuts',
    ['sabotage_electrics'] = 'Sabotage Electrics',
    ['fix_electrics'] = 'Repair Electrics',
    ['electrics_cut_out'] = 'The electrics of this vehicle keep cutting out!',
    ['speed_bomb_active'] = 'SPEED BOMB ACTIVE - Don\'t let the speed go below: ',
    ['blacklisted_vehicle_class'] = 'You can\'t use this on that vehicle!',

    -- [ NEW ] -- 
    ['vehicle_all_wheels'] = 'Your vehicle is missing a wheel',
    ['already_rigged'] = 'You have already rigged a vehicle - detonate it first!',

}