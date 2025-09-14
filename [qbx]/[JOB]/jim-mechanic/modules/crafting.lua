----- CRAFTING STUFF -------
function mechCraftingMenu(data)
    local Menu = {}
    local restrictionTable = {}

    -- If this location has any special restrictions
    if data.restrict then
        for i = 1, #data.restrict do
            restrictionTable[data.restrict[i]] = true
        end
    end

    -- Tools category
    if data.restrict and not restrictionTable["tools"] then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow  = true,
            header = locale("craftingMenu", "toolsHeader"),
            txt    = #Crafting.Tools.Recipes..locale("craftingMenu", "itemsCountSuffix"),
            onSelect = function()
                craftingMenu({
                    job       = data.job,
                    gang      = data.gang,
                    craftable = Crafting.Tools,
                    coords    = data.coords.xyz,
                    stashName = data.stashName,
                    onBack    = function()
                        mechCraftingMenu(data)
                    end,
                })
            end,
        }
    end

    -- Repairs category
    if data.restrict and not restrictionTable["repairs"] then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow  = true,
            header = locale("craftingMenu", "repairHeader"),
            txt    = #Crafting.Repairs.Recipes..locale("craftingMenu", "itemsCountSuffix"),
            onSelect = function()
                craftingMenu({
                    job       = data.job,
                    gang      = data.gang,
                    craftable = Crafting.Repairs,
                    coords    = data.coords.xyz,
                    stashName = data.stashName,
                    onBack    = function()
                        mechCraftingMenu(data)
                    end,
                })
            end,
        }
    end

    -- Performance category
    if data.restrict and not restrictionTable["perform"] then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow  = true,
            header = locale("craftingMenu", "performanceHeader"),
            txt    = #Crafting.Perform.Recipes..locale("craftingMenu", "itemsCountSuffix"),
            onSelect = function()
                craftingMenu({
                    job       = data.job,
                    gang      = data.gang,
                    craftable = Crafting.Perform,
                    coords    = data.coords.xyz,
                    stashName = data.stashName,
                    onBack    = function()
                        mechCraftingMenu(data)
                    end,
                })
            end,
        }
        Menu[#Menu + 1] = {
            arrow  = true,
            header = locale("craftingMenu", "extras"),
            txt    = #Crafting.Extras.Recipes..locale("craftingMenu", "itemsCountSuffix"),
            onSelect = function()
                craftingMenu({
                    job       = data.job,
                    gang      = data.gang,
                    craftable = Crafting.Extras,
                    coords    = data.coords.xyz,
                    stashName = data.stashName,
                    onBack    = function()
                        mechCraftingMenu(data)
                    end,
                })
            end,
        }
    end

    -- Cosmetics category
    if data.restrict and not restrictionTable["cosmetics"] then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow  = true,
            header = locale("craftingMenu", "cosmeticHeader"),
            txt    = #Crafting.Cosmetic.Recipes..locale("craftingMenu", "itemsCountSuffix"),
            onSelect = function()
                craftingMenu({
                    job       = data.job,
                    gang      = data.gang,
                    craftable = Crafting.Cosmetic,
                    coords    = data.coords.xyz,
                    stashName = data.stashName,
                    onBack    = function()
                        mechCraftingMenu(data)
                    end,
                })
            end,
        }
    end

    -- NOS category (if not disabled)
    if data.restrict and not restrictionTable["nos"] and Config.NOS.enable then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow  = true,
            header = locale("craftingMenu", "nosHeader"),
            txt    = #Crafting.Nos.Recipes..locale("craftingMenu", "itemsCountSuffix"),
            onSelect = function()
                craftingMenu({
                    job       = data.job,
                    gang      = data.gang,
                    craftable = Crafting.Nos,
                    coords    = data.coords.xyz,
                    stashName = data.stashName,
                    onBack    = function()
                        mechCraftingMenu(data)
                    end,
                })
            end,
        }
    end

    -- Finally, open the menu
    openMenu(Menu, {
        header  = locale("craftingMenu", "menuHeader"),
        canClose= true,
    })

    -- Ensure ped is looking at coords
    lookEnt(data.coords)
end
