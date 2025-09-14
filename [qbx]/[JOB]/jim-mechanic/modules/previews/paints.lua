PrevFunc.Paint = {}

PrevFunc.Paint.Menu = function()
    local vehicle, Menu, validMods, Ped = nil, {}, {}, PlayerPedId()

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
    local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
    local setTable = {
        ["Prim"] = vehPrimaryColour,
        ["Seco"] = vehSecondaryColour,
        ["Pear"] = vehPearlescentColour,
        ["Whee"] = vehWheelColour,
        ["Inte"] = GetVehicleInteriorColor(vehicle),
        ["Dash"] = GetVehicleDashboardColour(vehicle),
    }

    for _, v in pairs(Loc[Config.Lan].vehicleResprayOptionsClassic) do
        for id, paint in pairs(setTable) do
            if paint == v.id then
                setTable[id] = locale("paintOptions", "metallicFinish").." "..v.name
            end
        end
    end
    for _, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMatte) do
        for id, paint in pairs(setTable) do
            if paint == v.id then
                setTable[id] = locale("paintOptions", "matteFinish").." "..v.name
            end
        end
    end
    for _, v in pairs(Loc[Config.Lan].vehicleResprayOptionsMetals) do
        for id, paint in pairs(setTable) do
            if paint == v.id then
                setTable[id] = v.name
            end
        end
    end
    if Config.Overrides.ChameleonPaints then
        for _, v in pairs(Loc[Config.Lan].vehicleResprayOptionsChameleon) do
            for id, paint in pairs(setTable) do
                if paint == v.id then
                    setTable[id] = v.name
                end
            end
        end
    end

    for id, paint in pairs(setTable) do
        if type(paint) == "number" then
            setTable[id] = locale("common", "stockLabel")
        end
    end

    if IsCamActive(camTable[currentCam]) then
        Menu[#Menu+1] = {
            icon = "fas fa-camera", header = "",
            txt = locale("previewSettings", "classLabel")..": "..carMeta["class"]
                 ..br..locale("checkDetails", "plateLabel")..": "..carMeta["plate"]
                 ..br..locale("checkDetails", "valueLabel")..carMeta["price"]
                 ..br..carMeta["dist"],
            onSelect = function()
                PrevFunc.changeCamAngle()
                PrevFunc.Paint.Menu()
            end,
        }
    end

    Menu[#Menu+1] = {
        arrow  = true,
        header = locale("paintOptions", "primaryColor"),
        txt    = locale("common", "stockLabel")..": "..setTable["Prim"],
        onSelect = function()
            PrevFunc.Paint.Choose(locale("paintOptions", "primaryColor"))
        end,
    }
    Menu[#Menu+1] = {
        arrow  = true,
        header = locale("paintOptions", "secondaryColor"),
        txt    = locale("common", "stockLabel")..": "..setTable["Seco"],
        onSelect = function()
            PrevFunc.Paint.Choose(locale("paintOptions", "secondaryColor"))
        end,
    }
    Menu[#Menu+1] = {
        arrow  = true,
        header = locale("paintOptions", "pearlescent"),
        txt    = locale("common", "stockLabel")..": "..setTable["Pear"],
        onSelect = function()
            PrevFunc.Paint.Choose(locale("paintOptions", "pearlescent"))
        end,
    }
    Menu[#Menu+1] = {
        arrow  = true,
        header = locale("paintOptions", "wheelColor"),
        txt    = locale("common", "stockLabel")..": "..setTable["Whee"],
        onSelect = function()
            PrevFunc.Paint.Choose(locale("paintOptions", "wheelColor"))
        end,
    }
    if not IsThisModelABike(GetEntityModel(vehicle)) then
        Menu[#Menu+1] = {
            arrow = true,
            header = locale("paintOptions", "interiorColor"),
            txt    = locale("common", "stockLabel")..": "..setTable["Inte"],
            onSelect = function()
                PrevFunc.Paint.Choose(locale("paintOptions", "interiorColor"))
            end,
        }
        Menu[#Menu+1] = {
            arrow = true,
            header = locale("paintOptions", "dashboardColor"),
            txt    = locale("common", "stockLabel")..": "..setTable["Dash"],
            onSelect = function()
                PrevFunc.Paint.Choose(locale("paintOptions", "dashboardColor"))
            end,
        }
    end

    openMenu(Menu, {
        header    = carMeta["search"],
        headertxt = locale("paintOptions", "menuHeader"),
        onExit = function()
            if IsCamActive(camTable[currentCam]) then
                camWasActive = true
                RenderScriptCams(false, true, 500, true, true)
            end
        end,
        onBack    = function()
            PrevFunc.Main.Menu()
        end,
        onSelected = oldMenu,
    })
end

PrevFunc.Paint.Choose = function(data)
    local vehicle, Menu, validMods, Ped = nil, {}, {}, PlayerPedId()

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    if IsCamActive(camTable[currentCam]) then
        Menu[#Menu+1] = {
            icon = "fas fa-camera",
            header = "",
            txt = "Class: "..carMeta["class"]
                 ..br..locale("checkDetails", "plateLabel")..": "..carMeta["plate"]
                 ..br..locale("checkDetails", "valueLabel")..carMeta["price"]
                 ..br..carMeta["dist"],
            onSelect = function()
                PrevFunc.changeCamAngle()
                PrevFunc.Paint.Choose(data)
            end,
        }
    end

    Menu[#Menu+1] = {
        arrow  = true,
        header = locale("paintOptions", "classicFinish"),
        onSelect = function()
            PrevFunc.Paint.ChooseColour({
                paint = data,
                finish = locale("paintOptions", "classicFinish")
            })
        end,
    }
    Menu[#Menu+1] = {
        arrow  = true,
        header = locale("paintOptions", "metallicFinish"),
        onSelect = function()
            PrevFunc.Paint.ChooseColour({
                paint = data,
                finish = locale("paintOptions", "metallicFinish")
            })
        end,
    }
    Menu[#Menu+1] = {
        arrow  = true,
        header = locale("paintOptions", "matteFinish"),
        onSelect = function()
            PrevFunc.Paint.ChooseColour({
                paint = data,
                finish = locale("paintOptions", "matteFinish")
            })
        end,
    }
    Menu[#Menu+1] = {
        arrow  = true,
        header = locale("paintOptions", "metalsFinish"),
        onSelect = function()
            PrevFunc.Paint.ChooseColour({
                paint = data,
                finish = locale("paintOptions", "metalsFinish")
            })
        end,
    }

    if Config.Overrides.ChameleonPaints and (data ~= locale("paintOptions", "interiorColor") and data ~= locale("paintOptions", "dashboardColor")) then
        Menu[#Menu+1] = {
            arrow  = true,
            header = locale("paintOptions", "chameleonFinish"),
            onSelect = function()
                PrevFunc.Paint.ChooseColour({
                    paint = data,
                    finish = locale("paintOptions", "chameleonFinish")
                })
            end,
        }
    end

    openMenu(Menu, {
        header    = carMeta["search"],
        headertxt = locale("paintOptions", "menuHeader")..br..(isOx() and br or "")..data,
        onExit = function()
            if IsCamActive(camTable[currentCam]) then
                camWasActive = true
                RenderScriptCams(false, true, 500, true, true)
            end
        end,
        onBack    = function()
            PrevFunc.Paint.Menu()
        end,
        onSelected = oldMenu,
    })
end

PrevFunc.Paint.ChooseColour = function(data)
    local vehicle, Menu, Ped = nil, {}, PlayerPedId()

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
    local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)

    local setTable = {
        [locale("paintOptions", "primaryColor")]   = vehPrimaryColour,
        [locale("paintOptions", "secondaryColor")] = vehSecondaryColour,
        [locale("paintOptions", "pearlescent")]     = vehPearlescentColour,
        [locale("paintOptions", "wheelColor")]     = vehWheelColour,
        [locale("paintOptions", "dashboardColor")] = GetVehicleDashboardColour(vehicle),
        [locale("paintOptions", "interiorColor")]  = GetVehicleInteriorColour(vehicle),
    }
    local colourCheck = setTable[data.paint]

    if IsCamActive(camTable[currentCam]) then
        Menu[#Menu+1] = {
            icon = "fas fa-camera", header = "",
            txt = "Class: "..carMeta["class"]
                 ..br..locale("checkDetails", "plateLabel")..": "..carMeta["plate"]
                 ..br..locale("checkDetails", "valueLabel")..carMeta["price"]
                 ..br..carMeta["dist"],
            onSelect = function()
                PrevFunc.changeCamAngle()
                PrevFunc.Paint.ChooseColour(data)
            end,
        }
    end

    local colourTable = {
        [locale("paintOptions", "classicFinish")]   = Loc[Config.Lan].vehicleResprayOptionsClassic,
        [locale("paintOptions", "metallicFinish")]  = Loc[Config.Lan].vehicleResprayOptionsClassic,
        [locale("paintOptions", "matteFinish")]     = Loc[Config.Lan].vehicleResprayOptionsMatte,
        [locale("paintOptions", "metalsFinish")]    = Loc[Config.Lan].vehicleResprayOptionsMetals,
        [locale("paintOptions", "chameleonFinish")] = Loc[Config.Lan].vehicleResprayOptionsChameleon,
    }

    for k, v in pairs(colourTable[data.finish]) do
        local icon = (colourCheck == v.id) and "fas fa-check" or ""
        local isHeader = (colourCheck == v.id)
        local txt = (colourCheck == v.id) and locale("common", "stockLabel") or ""

        Menu[#Menu + 1] = {
            icon         = icon,
            isMenuHeader = isHeader,
            header       = k.." - "..v.name,
            txt          = txt,
            onSelect     = function()
                PrevFunc.Paint.Apply({
                    paint  = data.paint,
                    id     = v.id,
                    name   = v.name,
                    finish = data.finish
                })
            end,
        }
    end

    openMenu(Menu, {
        header    = carMeta["search"],
        headertxt = locale("paintOptions", "menuHeader")..br..(isOx() and br or "")..data.finish.." "..data.paint,
        onExit = function()
            if IsCamActive(camTable[currentCam]) then
                camWasActive = true
                RenderScriptCams(false, true, 500, true, true)
            end
        end,
        onBack    = function()
            PrevFunc.Paint.Choose(data.paint)
        end,
        onSelected = oldMenu,
    })
end

PrevFunc.Paint.Apply = function(data)
    local Ped = PlayerPedId()
    local coords = GetEntityCoords(Ped)
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
    local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)

    if data.paint == locale("paintOptions", "primaryColor") then
        ClearVehicleCustomPrimaryColour(vehicle)
        SetVehicleColours(vehicle, data.id, vehSecondaryColour)
    elseif data.paint == locale("paintOptions", "secondaryColor") then
        ClearVehicleCustomSecondaryColour(vehicle)
        SetVehicleColours(vehicle, vehPrimaryColour, data.id)
    elseif data.paint == locale("paintOptions", "pearlescent") then
        SetVehicleExtraColours(vehicle, data.id, vehWheelColour)
    elseif data.paint == locale("paintOptions", "wheelColor") then
        SetVehicleExtraColours(vehicle, vehPearlescentColour, data.id)
    elseif data.paint == locale("paintOptions", "dashboardColor") then
        SetVehicleDashboardColour(vehicle, data.id)
    elseif data.paint == locale("paintOptions", "interiorColor") then
        SetVehicleInteriorColour(vehicle, data.id)
    end
    PrevFunc.Paint.ChooseColour(data)
end