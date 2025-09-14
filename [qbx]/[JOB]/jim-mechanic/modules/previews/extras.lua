PrevFunc.Extras = {}

PrevFunc.Extras.Menu = function(data)
    local Menu, validMods, Ped = {}, {}, PlayerPedId()
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    if IsCamActive(camTable[currentCam]) then
        Menu[#Menu+1] = {
            icon = "fas fa-camera",
            header = "",
            txt = "Class: "..carMeta["class"]..br
                 ..locale("checkDetails", "plateLabel")..": "..carMeta["plate"]..br
                 ..locale("checkDetails", "valueLabel")..carMeta["price"]..br
                 ..carMeta["dist"],
            onSelect = function()
                PrevFunc.changeCamAngle()
                PrevFunc.Extras.Menu(data)
            end,
        }
    end

    for i = 0, 14 do
        if DoesExtraExist(vehicle, i) then
            hadMod = true
            local icon = IsVehicleExtraTurnedOn(vehicle, i) and "fas fa-check" or ""
            validMods[i] = { mod = i, name = "Extra "..i, install = txt, icon = icon }
        end
    end

    for l, b in pairs(validMods) do
        Menu[#Menu+1] = {
            icon = b.icon,
            header = l..". "..b.name,
            txt = b.install,
            onSelect = function()
                PrevFunc.Extras.Apply(b)
            end,
            refresh = true,
        }
    end

    openMenu(Menu, {
        header = carMeta["search"],
        onExit = function()
            if IsCamActive(camTable[currentCam]) then
                camWasActive = true
                RenderScriptCams(false, true, 500, true, true)
            end
        end,
        onBack = function()
            PrevFunc.Main.Menu()
        end,
        onSelected = oldMenu,
    })
end

PrevFunc.Extras.Apply = function(data)
    local Ped     = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(Ped, false)
    local veh     = Helper.getDamageTable(vehicle)

    if IsVehicleExtraTurnedOn(vehicle, data.mod) then
        SetVehicleExtra(vehicle, data.mod, 1)
    else
        SetVehicleExtra(vehicle, data.mod, 0)
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)

        if isStarted("qs-advancedgarages") then
            exports["qs-advancedgarages"]:RepairNearestVehicle()
        end
    end

    Helper.forceCarDamage(vehicle, veh)
    Wait(100)
    SetVehicleEngineHealth(vehicle, veh.engine)
    SetVehicleBodyHealth(vehicle, veh.body)

    PrevFunc.Extras.Menu()
end