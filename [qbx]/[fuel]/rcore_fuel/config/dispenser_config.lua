Config.SupportedGasPumpModel = {
    {
        -- model of the gas pump
        modelHash = 612315590,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.29000, 0.8, 1.0),
                heading = -90.0,
                offsetHolder = vec3(-0.280000, 0.85, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.29000, 0.9, 1.0),
                heading = 90.0,
                offsetHolder = vec3(0.280000, 0.85, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [2] = vec3(0.3, 0.8, 2.1),
            [1] = vec3(-0.3, 0.8, 2.1)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [2] = -90.0,
            [1] = 90.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [2] = vec3(0.8, 0.7, 0.000000),
            [1] = vec3(-0.8, 0.7, 0.000000),
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one

        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [2] = vec3(1.250000, 0.000000, 0.000000),
            [1] = vec3(-1.250000, 0.000000, 0.000000),
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(1.250000, 0.000000, 0.000000),
            [2] = vec3(-1.250000, 0.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.111725, 0.060525, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            -- rotation offset for scaleform UI
            rotationOffset = vector3(0, 0, -90),

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(0.0, -2.9, 2.0),
                [AlignTypes.RIGHT] = vec3(0.0, 1.2, 2.0),
                [AlignTypes.MIDDLE] = vec3(0.0, -0.55, 3.2),
            }
        },
    },
    {
        -- model of the gas pump
        modelHash = 101414103,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.29000, 0.8, 1.0),
                heading = -90.0,
                offsetHolder = vec3(-0.280000, 0.85, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.29000, 0.9, 1.0),
                heading = 90.0,
                offsetHolder = vec3(0.280000, 0.85, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [2] = vec3(0.3, 0.8, 2.1),
            [1] = vec3(-0.3, 0.8, 2.1)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [2] = -90.0,
            [1] = 90.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [2] = vec3(0.8, 0.7, 0.000000),
            [1] = vec3(-0.8, 0.7, 0.000000),
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one

        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [2] = vec3(1.250000, 0.000000, 0.000000),
            [1] = vec3(-1.250000, 0.000000, 0.000000),
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(1.250000, 0.000000, 0.000000),
            [2] = vec3(-1.250000, 0.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.111725, 0.060525, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            -- rotation offset for scaleform UI
            rotationOffset = vector3(0, 0, -90),

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(0.0, -2.9, 2.0),
                [AlignTypes.RIGHT] = vec3(0.0, 1.2, 2.0),
                [AlignTypes.MIDDLE] = vec3(0.0, -0.55, 3.2),
            }
        },
    },
    {
        -- model of the gas pump
        modelHash = -134063931,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.29000, 0.8, 1.0),
                heading = -90.0,
                offsetHolder = vec3(-0.280000, 0.85, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.29000, 0.9, 1.0),
                heading = 90.0,
                offsetHolder = vec3(0.280000, 0.85, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [2] = vec3(0.3, 0.8, 2.1),
            [1] = vec3(-0.3, 0.8, 2.1)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [2] = -90.0,
            [1] = 90.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [2] = vec3(0.8, 0.7, 0.000000),
            [1] = vec3(-0.8, 0.7, 0.000000),
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one

        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [2] = vec3(1.250000, 0.000000, 0.000000),
            [1] = vec3(-1.250000, 0.000000, 0.000000),
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(1.250000, 0.000000, 0.000000),
            [2] = vec3(-1.250000, 0.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.111725, 0.060525, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            -- rotation offset for scaleform UI
            rotationOffset = vector3(0, 0, -90),

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(0.0, -2.9, 2.0),
                [AlignTypes.RIGHT] = vec3(0.0, 1.2, 2.0),
                [AlignTypes.MIDDLE] = vec3(0.0, -0.55, 3.2),
            }
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("amb_rox_caspump_pf"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000),
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.018495, 0.006080, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            -- rotation offset for scaleform UI
            --rotationOffset = vector3(0, 0, -90),

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(-1.852440, -0.037835, 2.052300),
                [AlignTypes.RIGHT] = vec3(0.7, -0.037835, 2.052300),
                [AlignTypes.MIDDLE] = vec3(-0.55, 0.0, 3.2),
            }
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("prop_gas_pump_old3"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "prop_gas_pump_old3_piece",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "pump_old_3_holders",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(0.500000, -0.000000, 0.920000),
                heading = 180.0,
                offsetHolder = vec3(0.420000, -0.000000, 0.890000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(0.380000, 0.000000, 0.630000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = -90.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(0.800000, 0.000000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(0.000000, 0.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(0.0, -1.000000, 0.000000),
            [2] = vec3(0.0, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.010495, 0.003080, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.MIDDLE] = vec3(-0.47, 0.0, 2.3),

                [AlignTypes.LEFT] = vec3(-1.5, 0.0, 1.7),
                [AlignTypes.RIGHT] = vec3(0.6, 0.0, 1.7),
            },
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("prop_gas_pump_1a"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.018495, 0.006080, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(-1.852440, -0.037835, 2.052300),
                [AlignTypes.RIGHT] = vec3(0.7, -0.037835, 2.052300),
                [AlignTypes.MIDDLE] = vec3(-0.55, 0.0, 3.2),
            },
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("prop_vintage_pump"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "prop_vintage_pump_piece",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "prop_vintage_pump_piece_hole",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(0.300000, -0.020000, 0.845000),
                heading = 180.0,
                offsetHolder = vec3(0.235000, 0.010000, 1.210000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(0.230000, -0.050000, 1.250000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = -90.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(0.800000, 0.000000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(0.000000, 0.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(0.0000, -1.000000, 0.000000),
            [2] = vec3(0.0000, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.003520, 0.000960, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.MIDDLE] = vec3(-0.393465, 0.000000, 2.406550),
                [AlignTypes.LEFT] = vec3(-1.2, 0.0, 1.7),
                [AlignTypes.RIGHT] = vec3(0.4, 0.0, 1.7),
            },
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("prop_gas_pump_1d"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.018495, 0.006080, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(-1.852440, -0.037835, 2.052300),
                [AlignTypes.RIGHT] = vec3(0.7, -0.037835, 2.052300),
                [AlignTypes.MIDDLE] = vec3(-0.55, 0.0, 3.2),
            },
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("rcore_electric_charger_a"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "rcore_electric_nozzle_hand",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_electric_nozzle_a",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(0.000000, 0.000000, 0.000000),
                heading = 0.0,
                offsetHolder = vec3(0.000000, -0.000000, -1.250000)
            },
            [2] = {
                offsetRope = vec3(0.000000, 0.000000, 0.000000),
                heading = 180.0,
                offsetHolder = vec3(0.000000, 0.000000, -1.250000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.400000, 0.000000, 0.800000),
            [2] = vec3(0.400000, 0.000000, 0.800000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 70.0,
            [2] = -110.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.900000, -0.500000, 0.000000),
            [2] = vec3(0.900000, 0.500000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.039500, 0.020500, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.MIDDLE] = vec3(-0.55, 0.0, 1.8),
                [AlignTypes.LEFT] = vec3(-1.522000, 0.000000, 0.847000),
                [AlignTypes.RIGHT] = vec3(0.522000, 0.000000, 0.847000),
            }
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("prop_gas_pump_1c"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.018495, 0.006080, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(-1.852440, -0.037835, 2.052300),
                [AlignTypes.RIGHT] = vec3(0.7, -0.037835, 2.052300),
                [AlignTypes.MIDDLE] = vec3(-0.55, 0.0, 3.2),
            },
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("prop_gas_pump_1d"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.018495, 0.006080, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(-1.852440, -0.037835, 2.052300),
                [AlignTypes.RIGHT] = vec3(0.7, -0.037835, 2.052300),
                [AlignTypes.MIDDLE] = vec3(-0.55, 0.0, 3.2),
            },
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("prop_gas_pump_old2_rc"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "prop_gas_pump_old3_piece",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "pump_old_3_holders",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.500000, -0.000000, 0.920000),
                heading = 0.0,
                offsetHolder = vec3(-0.420000, -0.000000, 0.890000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.380000, 0.000000, 0.630000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 90.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.800000, 0.000000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(0.000000, 0.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(0.0, -1.000000, 0.000000),
            [2] = vec3(0.0, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.010495, 0.003080, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.MIDDLE] = vec3(-0.47, 0.0, 2.3),

                [AlignTypes.LEFT] = vec3(-1.5, 0.0, 1.7),
                [AlignTypes.RIGHT] = vec3(0.6, 0.0, 1.7),
            },
        },
    },
    {
        -- model of the gas pump
        modelHash = GetHashKey("prop_gas_pump_1b"),

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.018495, 0.006080, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(-1.852440, -0.037835, 2.052300),
                [AlignTypes.RIGHT] = vec3(0.7, -0.037835, 2.052300),
                [AlignTypes.MIDDLE] = vec3(-0.55, 0.0, 3.2),
            }
        },
    },

    -- gabz LTD map
    {
        -- model of the gas pump
        modelHash = 486135101,

        -- model of the nozzle hand that player holds in his hand
        nozzleHand = "prop_cs_fuel_nozle",

        ----------------
        -- This is the the tube + nozzle that is on the gas pump
        nozzleWithTube = "rcore_gas_tube",

        -- this is the nozzle holster on the gas pump
        nozzleHolster = "rcore_gas_handle",

        -- this is where the nozzleWithTube + nozzleHolster are getting spawned
        -- heading is heading of the entity
        -- offsetRope = nozzleWithTube
        -- offsetHolder = nozzleHolster
        dispenserGunObjectsPosition = {
            [1] = {
                offsetRope = vec3(-0.275000, -0.315000, 0.940000),
                heading = 180.0,
                offsetHolder = vec3(-0.340000, -0.250000, 0.730000)
            },
            [2] = {
                offsetRope = vec3(0.275000, 0.315000, 0.940000),
                heading = 0.0,
                offsetHolder = vec3(0.340000, 0.250000, 0.730000)
            }
        },

        ----------------

        -- Rope position offset
        -- when player pick up the nozzle this is the offset for Rope that tag along with player
        ropeOffsetPosition = {
            [1] = vec3(-0.320000, -0.200000, 2.200000),
            [2] = vec3(0.320000, 0.200000, 2.200000)
        },

        -- Rotation towards the gas pump from either one side or both
        playerHeadingTowardGasPump = {
            [1] = 0.0,
            [2] = 180.0
        },

        -- This is offset for player where it will force him to walk towards specific side he is on.
        playerWalkingOffsetPosition = {
            [1] = vec3(-0.250000, -0.550000, 0.000000),
            [2] = vec3(0.250000, 0.550000, 0.000000)
        },

        -- this is position check for the  player
        -- if the player is close to side 1 -> player will use first side if second then the second one
        
        -- I recommend keeping this default like this unless there is possible to use only one side
        positionOffsetCheckForSides = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000)
        },

        -- This is for flipping the UI of the fuel pump
        -- by enabling Debug you will see red spheres that will indicate
        -- the points set
        positionOffsetCheckForCameraSide = {
            [1] = vec3(-1.250000, -1.000000, 0.000000),
            [2] = vec3(-1.250000, 1.000000, 0.000000),
        },

        ----------------
        inGameUIData = {
            distance = 5,

            ScreenSize = vec3(0.018495, 0.006080, 0.000000),
            CameraOffSet = {
                x = 0.0,
                y = -3.0,
                z = 0.35,
                rotationOffset = vec3(0.000000, 0.000000, 0.000000),
            },

            ScreenOffSet = {
                [AlignTypes.LEFT] = vec3(-1.852440, -0.037835, 2.052300),
                [AlignTypes.RIGHT] = vec3(0.7, -0.037835, 2.052300),
                [AlignTypes.MIDDLE] = vec3(-0.55, 0.0, 3.2),
            },
        },
    },
}