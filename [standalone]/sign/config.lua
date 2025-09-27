config = {

    -- Maximum of 10 characters per line
    textLines = {
        [1] = "Ambitious", -- Line 1 of text (top)
        [2] = "Hustlerz", -- Line 2 of text (bottom)
    },

    -- This section allows you to add more than 1 choice of text to the sign. The sign will rotate through the different text options at the rate defined below 
    additionalText = {
        useAdditionalText = false, -- Set to false to disable text rotation 
        timeToRotate = 5, -- The amount of time to rotate through the text in seconds

        -- We've added multiple default texts here, but you can add or remove to have as many as you like
        -- If additional text is enabled then the above textLines values will not be used, you'll need to add them here
        textOptions = {
            [1] = {
                [1] = "london",
                [2] = "studios",
            },
            [2] = {
                [1] = "vinewood",
                [2] = "sign",
            },
            [3] = {
                [1] = "more text",
                [2] = "here",
            },
        },

    },

    -- If set to true, all text will automatically align center
    -- If set to false, all text will align to the left
    centerTextAutomatically = true,

    -- Each supported character and the it's corresponding model name 
    -- You do not need to edit this section
    letterModels = {
        ["a"] = "prop_vine_a",
        ["b"] = "prop_vine_b",
        ["c"] = "prop_vine_c",
        ["d"] = "prop_vine_d",
        ["e"] = "prop_vine_e",
        ["f"] = "prop_vine_f",
        ["g"] = "prop_vine_g",
        ["h"] = "prop_vine_h",
        ["i"] = "prop_vine_i",
        ["j"] = "prop_vine_j",
        ["k"] = "prop_vine_k",
        ["l"] = "prop_vine_l",
        ["m"] = "prop_vine_m",
        ["n"] = "prop_vine_n",
        ["o"] = "prop_vine_o",
        ["p"] = "prop_vine_p",
        ["q"] = "prop_vine_q",
        ["r"] = "prop_vine_r",
        ["s"] = "prop_vine_s",
        ["t"] = "prop_vine_t",
        ["u"] = "prop_vine_u",
        ["v"] = "prop_vine_v",
        ["w"] = "prop_vine_w",
        ["x"] = "prop_vine_x",
        ["y"] = "prop_vine_y",
        ["z"] = "prop_vine_z",
    },

    -- The position and rotation of each character on the sign (top row onky)
    -- You do not need to edit this section
    characterPositions = {
        {coords = vector3(670.0525, 1212.046, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
        {coords = vector3(683.1378, 1208.54, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
        {coords = vector3(696.4728, 1204.966, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
        {coords = vector3(709.6599, 1201.433, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
        {coords = vector3(723.123, 1197.826, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
        {coords = vector3(736.5312, 1194.233, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
        {coords = vector3(749.7458, 1190.692, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
        {coords = vector3(763.4346, 1187.024, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
        {coords = vector3(776.7411, 1183.458, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
        {coords = vector3(790.0059, 1179.904, 370.1438), rotation =vector4(0, 0, 0.1305262, 0.9914449)},
    }



}
