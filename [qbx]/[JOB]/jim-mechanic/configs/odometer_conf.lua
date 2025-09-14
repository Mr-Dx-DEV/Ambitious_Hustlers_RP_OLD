Config = Config or {}

Config.Odometer = {
    ShowOdo = true, 					-- Wether the distance is showed in car by default
                                        -- This can be toggled by players on the fly by players with /showodo

    ShowToAll = false,					-- If enabled, the odometer, like the milage will be shown to passengers aswell as the driver
    ShowPassengersAllIcons = false, 	-- Enabling this will only show passengers the buckle/harness icon

    OdoAlwaysShowIcons = false, 		-- Enable this to show the icons even when not damaged

    OdoShowLimit = 70,					-- If OdoAlwaysShowIcons, the damage based icons only will be shown if below this percent

    SeatbeltHideWhenBuckled = true, 	-- If true, hide seatlbelt icon when buckled
                                        -- If false, the icon changes to red to green when buckled

    HarnessHideWhenBuckled = true, 		-- If true, hide Harness icon when buckled
                                        -- If false, the icon changes to red to green when buckled

    showSpeedometer = true,             -- If you wish to use the built in speedometer, enable this

    OdoIconsToShow = {
        -- Simply if these are true, they will show on the odometer hud
        ["engine"] = true,
        ["body"] = true,
        ["oil"] = true,
        ["spark"] = true,
        ["fuel"] = false,
        ["axle"] = true,
        ["battery"] = true,
        ["wheel"] = true,
        ["headlight"] = true,
        ["seatbelt"] = true,
        ["harness"] = true,
        ["underglow"] = true,
        ["doors"] = true,
        ["manual"] = true,
        ["antilag"] = true,
        ["mileage"] = true,
        ["lowfuel"] = true,
        ["nos"] = true,
    },

    -- Configurations for HUD (Odometer) appearance
    hudConfig = {
        font = 'DigitalFont',
        showHealthValues = false, -- Only shows numeric values if true

        -- Position on screen (%)
        position = {
            top = 70,
            left = 1.4
        },

        -- Background Style
        background = {
            color = {
                0, 0, 0, 0.5        -- RGBA
            },
            border = {
                color = { 0, 0, 0, 0.5 },
                width = '0px'
            },
            radius = '0.5rem',
            shadow = {
                color = { 0, 0, 0, 0.5 },
                style = '0px 0px 10px'
            },
            innerShadow = {
                color = {0, 0, 0, 0.7},
                style = 'inset 0px 0px 10px'
            },
        },

        -- Icon Settings
        icons = {
            glow = false,
            size = 0.35,
            colorHealthy = { 0, 255, 0 },
            colorDamaged = { 255, 0, 0 },
            boxShadow = {
                enabled = false,
                style = 'inset black 0px 0px 50px',
                corners = '0.5rem'
            },
        },

        -- Overlay Text (e.g., NOS)
        overlayText = {
            size = '1.4vh',
            position = {
                top = '42%',
                left = '0.2rem'
            },
            color = { 255, 255, 255 },
            glow = '0 0 3px #000, 0 0 5px #fff',
        },

        -- Mileage Display
        mileage = {
            enabled = true,
            size = '2.3vh',
            color = { 255, 255, 255 },
            glow = { style = '0 0 10px',
                color = {255,255,255,1.0}
            },
        },
    },

    -- Speedometer Configuration
    speedoConfig = {
        position = {top = '80%', left = '21%'},
        size = '14vh',

        style = {
            border = {
                width = '0.2vh',
                color = { 255, 255, 255, 1.0 },
                style = 'none'
            },
            background = {
                color = { 0, 0, 0, 0.0 },
                shadow = {
                    style = '0 0 10px',
                    color = { 0, 0, 0, 0.0 }
                }
            },
        },

        text = {
            color = { 255, 255, 255, 1.0 },
            highlightColor = { 255, 0, 0, 1.0 },
            size = '1.0vh',
        },
        font = 'DigitalFont',

        digitalSpeed = {
            enable = true,
            size = '3vh',
            position = {
                top = 40,
                left = 17
            },
            color = { 255, 255, 255, 0.9 },
            glow = '0 0 3px #000, 0 0 5px #fff',
        },

        needles = {
            type = 4, -- (1, 2, 3, 4, 5)
            speed = {
                length = '6.5vh',
                width = '0.3vh',
                color = { 255, 255, 255, 0.9 },
                shadow = {
                    style = '0px 0px 5px',
                    color = { 0, 0, 0, 0.9 }
                },
                digital = {
                    back = { 255, 255, 255, 0.3 },
                    nosActive = { 255, 51, 153, 1.0 },
                },
            },
            rpm = {
                enable = true,
                size = '5vh',
                position = {
                    x = "8.7vh",
                    y = "4.5vh"
                },
                length = '2.5vh',
                width = '0.1vh',
                color = { 255, 255, 255, 0.9 },
                shadow = {
                    style = '0px 0px 5px',
                    color = { 0, 0, 0, 0.9 }
                },
                digital = {
                    back = { 255, 255, 255, 0.3 },
                    nosActive = { 255, 51, 153, 1.0 },
                },
            },
            fuel = {
                enable = true,
                size = '5vh',
                position = {
                    x = "-8.5vh",
                    y = "4.5vh"
                },
                length = '2.5vh',
                width = '0.1vh',
                color = { 255, 255, 255, 0.9 },
                shadow = {
                    style = '0px 0px 5px',
                    color = { 0, 0, 0, 0.9 }
                },
                digital = {
                    back = { 255, 255, 255, 0.3 },
                    nosActive = { 255, 51, 153, 1.0 },
                },
            },
            nos = {
                enable = true,
                size = '5vh',
                position = {
                    x = "0vh",
                    y = "4.5vh"
                },
                length = '2.5vh',
                width = '0.1vh',
                color = { 255, 255, 255, 0.9 },
                shadow = {
                    style = '0px 0px 5px',
                    color = { 0, 0, 0, 0.9 }
                },
                digital = {
                    back = { 255, 255, 255, 0.3 },
                    nosActive = { 255, 0, 0, 1.0 },
                },
            },
        },

        nosBoostIndicator = {
            back = { 255, 255, 255, 0.3 },
            active = { 255, 255, 255, 0.9 },
        },

        highlights = {
            speed = true,
            highSpeed = true
        },

        markers = {
            color = { 255, 255, 255, 1.0 },
            highlightColor = { 255, 0, 0, 1.0 }
        },
    }

}