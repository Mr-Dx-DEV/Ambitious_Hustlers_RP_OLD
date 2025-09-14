------ Store Stuff ------
-- Menu to pick the store
function mechStoreMenu(data)
    lookEnt(data.coords)
    local Menu = {}
    local restrictionTable = {}

    -- If there's a restriction list
    if data.restrict then
        for i = 1, #data.restrict do
            restrictionTable[data.restrict[i]] = true
        end
    end

    -- NOS items
    if data.restrict and not restrictionTable["nos"] and Config.NOS.enable then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow   = true,
            header  = locale("storeMenu", "nosItems"),
            onSelect = function()
                openShop({
                    shop  = "nosShop",
                    items = Stores.NosItems,
                    job   = data.job,
                    gang  = data.gang,
                })
            end,
        }
    end

    -- Tools
    if data.restrict and not restrictionTable["tools"] then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow   = true,
            header  = locale("storeMenu", "mechanicTools"),
            onSelect = function()
                openShop({
                    shop  = "toolShop",
                    items = Stores.ToolItems,
                    job   = data.job,
                    gang  = data.gang,
                })
            end,
        }
    end

    -- Repairs
    if data.restrict and not restrictionTable["repairs"] then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow   = true,
            header  = locale("storeMenu", "repairItems"),
            onSelect = function()
                openShop({
                    shop  = "repairShop",
                    items = Stores.RepairItems,
                    job   = data.job,
                    gang  = data.gang,
                })
            end,
        }
    end

    -- Performance
    if data.restrict and not restrictionTable["perform"] then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow   = true,
            header  = locale("storeMenu", "performanceItems"),
            onSelect = function()
                openShop({
                    shop  = "performShop",
                    items = Stores.PerformItems,
                    job   = data.job,
                    gang  = data.gang,
                })
            end,
        }
    end

    -- Cosmetics
    if data.restrict and not restrictionTable["cosmetics"] then
        -- do nothing
    else
        Menu[#Menu + 1] = {
            arrow   = true,
            header  = locale("storeMenu", "cosmeticItems"),
            onSelect = function()
                openShop({
                    shop  = "cosmeticShop",
                    items = Stores.CosmeticItems,
                    job   = data.job,
                    gang  = data.gang,
                })
            end,
        }
    end

    -- Finally open the menu
    openMenu(Menu, {
        header = locale("storeMenu", "browseStore"),
        onExit = function() end,
    })
end