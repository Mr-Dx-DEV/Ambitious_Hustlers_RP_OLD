--===================================================================
-- Quick Paint (Emergency)
--===================================================================

EmergencyBench.PaintMenu = function()
    local Ped     = PlayerPedId()
    local vehicle = nil

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    if DoesEntityExist(vehicle) then
        pushVehicle(vehicle)
        local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
        local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
        local interiorColor = GetVehicleInteriorColor(vehicle)
        local dashboardColor = GetVehicleDashboardColour(vehicle)

        for k, v in pairs(Loc[Config.Lan]) do
            local name = tostring(k)
            if name == "vehicleResprayOptionsClassic"
               or name == "vehicleResprayOptionsMatte"
               or name == "vehicleResprayOptionsMetals"
               or name == "vehicleResprayOptionsChameleon"
            then
                for _, paint in pairs(v) do
                    local text = ""
                    if k == "vehicleResprayOptionsClassic" then text = locale("paintOptions", "metallicFinish") end
                    if k == "vehicleResprayOptionsMatte"   then text = locale("paintOptions", "matteFinish") end

                    if vehPrimaryColour == paint.id then vehPrimaryColour = text.." "..paint.name end
                    if vehSecondaryColour == paint.id then vehSecondaryColour = text.." "..paint.name end
                    if vehPearlescentColour == paint.id then vehPearlescentColour = text.." "..paint.name end
                    if vehWheelColour == paint.id then vehWheelColour = text.." "..paint.name end
                    if interiorColor == paint.id then interiorColor = text.." "..paint.name end
                    if dashboardColor == paint.id then dashboardColor = text.." "..paint.name end
                end
            end
        end

        if type(vehPrimaryColour) == "number" then vehPrimaryColour = locale("common", "stockLabel") end
        if type(vehSecondaryColour) == "number" then vehSecondaryColour = locale("common", "stockLabel") end
        if type(vehPearlescentColour) == "number" then vehPearlescentColour = locale("common", "stockLabel") end
        if type(vehWheelColour) == "number" then vehWheelColour = locale("common", "stockLabel") end
        if type(interiorColor) == "number" then interiorColor = locale("common", "stockLabel") end
        if type(dashboardColor) == "number" then dashboardColor = locale("common", "stockLabel") end

        local PaintMenu = {}
        PaintMenu[#PaintMenu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "primaryColor"),
            txt     = locale("common", "currentInstalled")..": "..vehPrimaryColour,
            onSelect= function()
                EmergencyBench.ChooseFinish(locale("paintOptions", "primaryColor"))
            end,
        }
        PaintMenu[#PaintMenu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "secondaryColor"),
            txt     = locale("common", "currentInstalled")..": "..vehSecondaryColour,
            onSelect= function()
                EmergencyBench.ChooseFinish(locale("paintOptions", "secondaryColor"))
            end,
        }
        PaintMenu[#PaintMenu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "pearlescent"),
            txt     = locale("common", "currentInstalled")..": "..vehPearlescentColour,
            onSelect= function()
                EmergencyBench.ChooseFinish(locale("paintOptions", "pearlescent"))
            end,
        }
        PaintMenu[#PaintMenu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "wheelColor"),
            txt     = locale("common", "currentInstalled")..": "..vehWheelColour,
            onSelect= function()
                EmergencyBench.ChooseFinish(locale("paintOptions", "wheelColor"))
            end,
        }

        openMenu(PaintMenu, {
            header    = carMeta.search,
            headertxt = locale("paintOptions", "menuHeader"),
            onBack    = function()
                EmergencyBench.Menu()
            end,
        })
    end
end

EmergencyBench.ChooseFinish = function(data)
    local Ped = PlayerPedId()
    local vehicle = nil

    if not IsPedInAnyVehicle(Ped, false) then
        return
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    if DoesEntityExist(vehicle) then
        local Menu = {}

        Menu[#Menu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "metallicFinish"),
            title   = locale("paintOptions", "metallicFinish"),
            onSelect= function()
                EmergencyBench.ChooseColour({ paint=data, finish=locale("paintOptions", "metallicFinish") })
            end,
        }
        Menu[#Menu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "matteFinish"),
            title   = locale("paintOptions", "matteFinish"),
            onSelect= function()
                EmergencyBench.ChooseColour({ paint=data, finish=locale("paintOptions", "matteFinish") })
            end,
        }
        Menu[#Menu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "metalsFinish"),
            title   = locale("paintOptions", "metalsFinish"),
            onSelect= function()
                EmergencyBench.ChooseColour({ paint=data, finish=locale("paintOptions", "metalsFinish") })
            end,
        }

        openMenu(Menu, {
            header    = carMeta.search,
            headertxt = locale("paintOptions", "menuHeader")..br..(isOx() and br or "")..data,
            onBack    = function()
                EmergencyBench.PaintMenu()
            end,
        })
    end
end

EmergencyBench.ChooseColour = function(data)
    local Ped = PlayerPedId()
    local vehicle = nil

    if not IsPedInAnyVehicle(Ped, false) then
        return
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
    local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
    local colourCheck
    if data.paint == locale("paintOptions", "primaryColor") then
        colourCheck = vehPrimaryColour
    end
    if data.paint == locale("paintOptions", "secondaryColor") then
        colourCheck = vehSecondaryColour
    end
    if data.paint == locale("paintOptions", "pearlescent") then
        colourCheck = vehPearlescentColour
    end

    local PaintMenu = {}
    local paintTable = {
        [locale("paintOptions", "metallicFinish")] = Loc[Config.Lan].vehicleResprayOptionsClassic,
        [locale("paintOptions", "matteFinish")]    = Loc[Config.Lan].vehicleResprayOptionsMatte,
        [locale("paintOptions", "metalsFinish")]   = Loc[Config.Lan].vehicleResprayOptionsMetals,
    }

    for k, v in pairs(paintTable[data.finish]) do
        local current = (colourCheck == v.id)
        PaintMenu[#PaintMenu+1] = {
            icon        = current and "fas fa-check",
            isMenuHeader= current,
            header      = k.." - "..v.name,
            txt         = current and locale("common", "stockLabel"),
            onSelect    = function()
                EmergencyBench.applyPaint({
                    paint  = data.paint,
                    id     = v.id,
                    name   = v.name,
                    finish = data.finish
                })
            end,
        }
    end

    openMenu(PaintMenu, {
        header    = carMeta.search,
        headertxt = locale("paintOptions", "menuHeader")..br..(isOx() and br or "")..data.finish.." "..data.paint,
        onBack    = function()
            EmergencyBench.ChooseFinish(data.paint)
        end,
    })
end

EmergencyBench.applyPaint = function(data)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    pushVehicle(vehicle)

    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
    local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)

    if data.paint == locale("paintOptions", "primaryColor") then
        ClearVehicleCustomPrimaryColour(vehicle)
        SetVehicleColours(vehicle, data.id, vehSecondaryColour)
    elseif data.paint == locale("paintOptions", "secondaryColor") then
        ClearVehicleCustomSecondaryColour(vehicle)
        SetVehicleColours(vehicle, vehPrimaryColour, data.id)
    elseif data.paint == locale("paintOptions", "interiorColor") then
        SetVehicleInteriorColor(vehicle, data.id)
    elseif data.paint == locale("paintOptions", "dashboardColor") then
        SetVehicleDashboardColor(vehicle, data.id)
    elseif data.paint == locale("paintOptions", "pearlescent") then
        SetVehicleExtraColours(vehicle, data.id, vehWheelColour)
    end

    Helper.addCarToUpdateLoop(vehicle)
    EmergencyBench.ChooseColour(data)
end