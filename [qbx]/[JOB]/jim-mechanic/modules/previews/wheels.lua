--==========================================================
-- Wheels
--==========================================================
PrevFunc.Wheels = {}

local wheelType = {
    [0]  = locale("rimsMod", "sportRims"),
    [1]  = locale("rimsMod", "muscleRims"),
    [2]  = locale("rimsMod", "lowriderRims"),
    [3]  = locale("rimsMod", "suvRims"),
    [4]  = locale("rimsMod", "offroadRims"),
    [5]  = locale("rimsMod", "tunerRims"),
    [6]  = locale("rimsMod", "motorcycleRims"),
    [7]  = locale("rimsMod", "highendRims"),
    [8]  = locale("rimsMod", "bennysOriginals"),
    [9]  = locale("rimsMod", "bennysBespoke"),
    [10] = locale("rimsMod", "openWheel"),
    [11] = locale("rimsMod", "streetRims"),
    [12] = locale("rimsMod", "trackRims"),
}

PrevFunc.Wheels.Menu = function()
    local Menu, Ped = {}, PlayerPedId()

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    local cycle = IsThisModelABike(GetEntityModel(vehicle))

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
                PrevFunc.Wheels.Menu(data)
            end,
        }
    end

    if not cycle then
        Menu[#Menu+1] = {
            icon = (GetVehicleMod(vehicle, 23) ~= -1) and "fa-solid fa-rotate-left" or "fas fa-check",
            isMenuHeader = (GetVehicleMod(vehicle, 23) == -1),
            header = locale("common", "stockLabel"),
            txt = (GetVehicleMod(vehicle, 23) == -1) and locale("common", "stockLabel") or "",
            onSelect = function()
                PrevFunc.Wheels.Apply({ mod = -1, wheeltype = 0 })
            end,
        }

        if GetVehicleMod(vehicle, 23) ~= -1 then
            Menu[#Menu+1] = {
                isMenuHeader = ((GetVehicleMod(vehicle, 23) == -1) and (GetVehicleMod(vehicle, 24) == -1)),
                header = "Custom Tires",
                txt = GetVehicleModVariation(vehicle, 23)
                      and locale("common", "installedMsg"):gsub("%!", "")
                      or locale("common", "notInstalled"),
                onSelect = function()
                    PrevFunc.Wheels.ApplyCustomTires()
                end,
            }
        end

        for k, v in pairs(wheelType) do
            Menu[#Menu+1] = {
                arrow = true,
                header = v,
                onSelect = function()
                    PrevFunc.Wheels.Choose({ wheeltype = k, bike = false })
                end,
            }
        end
    end

    if cycle then
        Menu[#Menu+1] = {
            arrow = true,
            header = locale("rimsMod", "frontWheel"),
            onSelect = function()
                PrevFunc.Wheels.Choose({ wheeltype = 6, bike = false })
            end,
        }
        Menu[#Menu+1] = {
            arrow = true,
            header = locale("rimsMod", "backWheel"),
            onSelect = function()
                PrevFunc.Wheels.Choose({ wheeltype = 6, bike = true })
            end,
        }
    end

    local headertxt =
        (not cycle and br..locale("common", "currentInstalled")..": "..br
        ..(isOx() and br or "")
        ..(GetVehicleMod(vehicle, 23) == -1 and locale("common", "stockLabel") or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23))))
        .." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")" or "")

    openMenu(Menu, {
        header = carMeta["search"],
        headertxt = headertxt,
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

PrevFunc.Wheels.Choose = function(data)
    local vehicle, validMods, originalWheel, Menu, Ped = {}, {}, 0, {}, PlayerPedId()

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    originalWheel = tonumber(GetVehicleWheelType(vehicle))
    SetVehicleWheelType(vehicle, tonumber(data.wheeltype))

    for i = 1, (GetNumVehicleMods(vehicle, 23) + 1) do
        local modName = GetLabelText(GetModTextLabel(vehicle, 23, (i - 1)))
        if not validMods[modName] then
            validMods[modName] = {}
            validMods[modName][#validMods[modName] + 1] = { id = (i - 1), name = modName }
        elseif validMods[modName] then
            if validMods[modName][1] then
                local name = modName
                if modName == "NULL" then
                    name = modName.." ("..(i - 1)..")"
                end
                validMods[modName][#validMods[modName] + 1] = {
                    id = (i - 1),
                    name = name.." - Var "..(#validMods[modName] + 1)
                }
            else
                validMods[modName][#validMods[modName] + 1] = {
                    id = validMods[modName].id,
                    name = validMods[modName].name.." - Var 1"
                }
                validMods[modName][#validMods[modName] + 1] = {
                    id = (i - 1),
                    name = modName.." - Var "..(#validMods[modName] + 1)
                }
            end
        end
    end

    if validMods["NULL"] then
        validMods[locale("rimsMod", "customRims")] = validMods["NULL"]
        validMods["NULL"] = nil
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
                PrevFunc.Wheels.Choose(data)
            end,
        }
    end

    if data.wheeltype == 6 then
        Menu[#Menu+1] = {
            icon = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) ~= -1) and "fa-solid fa-rotate-left" or "fas fa-check",
            isMenuHeader = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1),
            header = locale("common", "stockLabel"),
            txt = ((GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1) and locale("common", "stockLabel") or nil),
            onSelect = function()
                PrevFunc.Wheels.Apply({ mod = -1, wheeltype = 6, bike = data.bike })
            end,
        }
    end

    for k, v in pairsByKeys(validMods) do
        Menu[#Menu+1] = {
            arrow = true,
            header = k,
            txt = locale("common", "optionsCount")..#validMods[k],
            onSelect = function()
                PrevFunc.Wheels.SubMenu({
                    mod = v.id,
                    wheeltype = data.wheeltype,
                    wheeltable = validMods[k],
                    bike = data.bike,
                    label = wheelType[data.wheeltype]
                })
            end,
        }
    end

    SetVehicleWheelType(vehicle, originalWheel)

    local headertxt =
        locale("rimsMod", "menuHeader")
       ..br.."("..wheelType[data.wheeltype]..")"..br
       ..(isOx() and br or "")
       ..locale("common", "currentInstalled")..": "..br
       ..(isOx() and br or "")
       ..(GetVehicleMod(vehicle, 23) == -1 and locale("common", "stockLabel")
            or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))
        )
       .." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")"

    openMenu(Menu, {
        header = carMeta["search"],
        headertxt = headertxt,
        onExit = function()
            if IsCamActive(camTable[currentCam]) then
                camWasActive = true
                SetCamActive(camTable[currentCam], false)
            end
        end,
        onBack = function()
            PrevFunc.Wheels.Menu()
        end,
        onSelected = oldMenu,
    })
end

PrevFunc.Wheels.SubMenu = function(data)
    local Menu, Ped = {}, PlayerPedId()
    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    else
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
                PrevFunc.Wheels.SubMenu(data)
            end,
        }
    end

    for i = 1, #data.wheeltable do
        Menu[#Menu+1] = {
            arrow = true,
            header = data.wheeltable[i].name,
            txt = ((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id)
                   and (GetVehicleWheelType(vehicle) == data.wheeltype))
                  and locale("common", "stockLabel"),
            onSelect = function()
                PrevFunc.Wheels.Apply({
                    mod = data.wheeltable[i].id,
                    wheeltype = data.wheeltype,
                    wheeltable = data.wheeltable,
                    bike = data.bike,
                    label = data.label
                })
            end,
        }
    end

    local headertxt =
        locale("rimsMod", "menuHeader")
       ..br.."("..string.upper(data.label)..")"..br
       ..(isOx() and br or "")
       ..locale("common", "optionsCount")..#data.wheeltable
       ..br..(isOx() and br or "")
       ..locale("common", "stockLabel")..": "..br
       ..(isOx() and br or "")
       ..((GetVehicleMod(vehicle, 23) == -1 and locale("common", "stockLabel"))
            or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))
           )
       .." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")"

    openMenu(Menu, {
        header = carMeta["search"],
        headertxt = headertxt,
        onExit = function()
            if IsCamActive(camTable[currentCam]) then
                camWasActive = true
                SetCamActive(camTable[currentCam], false)
            end
        end,
        onBack = function()
            PrevFunc.Wheels.Choose({
                wheeltype = data.wheeltype,
                bike = data.bike
            })
        end,
        onSelected = oldMenu,
    })
end

PrevFunc.Wheels.Apply = function(data)
    local Ped = PlayerPedId()
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    SetVehicleWheelType(vehicle, tonumber(data.wheeltype))

    if not data.bike then
        SetVehicleMod(vehicle, 23, tonumber(data.mod), GetVehicleModVariation(vehicle, 23))
    else
        SetVehicleMod(vehicle, 24, tonumber(data.mod), false)
    end

    if data.mod == -1 then
        PrevFunc.Wheels.Menu( data)
    else
        PrevFunc.Wheels.SubMenu(data)
    end
end

PrevFunc.Wheels.ApplyCustomTires = function(data)
    local Ped = PlayerPedId()
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    SetVehicleMod(vehicle, 23, GetVehicleMod(vehicle, 23), not GetVehicleModVariation(vehicle, 23))
    PrevFunc.Wheels.Menu()
end