--==========================================================
-- Windows
--==========================================================
PrevFunc.Windows = {}

PrevFunc.Windows.Menu = function(data)
    local Menu, vehicle, validMods, getTint, Ped = {}, nil, {}, 0, PlayerPedId()
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    getTint = GetVehicleWindowTint(vehicle)

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
                PrevFunc.Windows.Menu(data)
            end,
        }
    end

    for l, b in pairs(Loc[Config.Lan].vehicleWindowOptions) do
        local txt, disabled, icon = "", false, ""
        if GetVehicleWindowTint(vehicle) == b.id then
            txt      = locale("common", "stockLabel")
            disabled = true
            icon     = "fas fa-check"
        end
        validMods[l] = {
            mod = b.id,
            name = b.name,
            window = true,
            install = txt,
            disabled = disabled,
            icon = icon
        }
    end

    Menu[#Menu+1] = {
        icon = (GetVehicleWindowTint(vehicle) <= 0 and "fas fa-check" or ""),
        isMenuHeader = (GetVehicleWindowTint(vehicle) <= 0),
        header = "0 - "..locale("common", "stockLabel"),
        txt = (GetVehicleWindowTint(vehicle) <= 0 and locale("common", "stockLabel") or nil),
        onSelect = function()
            PrevFunc.Windows.Apply({ mod = -1, id = -1 })
        end,
    }

    for l, b in pairs(validMods) do
        Menu[#Menu+1] = {
            icon = b.icon,
            isMenuHeader = b.disabled,
            header = l.." - "..b.name,
            txt = b.install,
            onSelect = function()
                PrevFunc.Windows.Apply(b)
            end,
        }
    end

    openMenu(Menu, {
        header = carMeta["search"],
        headertxt = locale("windowTints", "menuHeader"),
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

PrevFunc.Windows.Apply = function(data)
    local Ped = PlayerPedId()
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    if GetVehicleWindowTint(vehicle) == tonumber(data.mod) then
        triggerNotify(nil, data.name.." "..locale("common", "alreadyInstalled"), "error")
        PrevFunc.Windows.Menu()
    elseif GetVehicleWindowTint(vehicle) ~= tonumber(data.mod) then
        SetVehicleWindowTint(vehicle, tonumber(data.mod))
        PrevFunc.Windows.Menu()
    end
    Helper.removePropHoldCoolDown()
end