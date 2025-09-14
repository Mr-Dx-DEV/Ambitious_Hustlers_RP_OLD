--===================================================================
-- Rims
--===================================================================
EmergencyBench.applyRims = function(data)
    local Ped = PlayerPedId()
    local vehicle

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

   if progressBar({
        label = locale("common", "actionInstalling")..": ",
        time  = 1000,
        cancel= true
    }) then
        SetVehicleWheelType(vehicle, tonumber(data.wheeltype))
        if not data.bike then
            SetVehicleMod(vehicle, 23, tonumber(data.mod), GetVehicleModVariation(vehicle, 23))
        else
            SetVehicleMod(vehicle, 24, tonumber(data.mod), false)
        end
    end

    if data.mod == -1 then
        EmergencyBench.RimsMenu()
    else
        EmergencyBench.RimsChoose(data)
    end
end

EmergencyBench.applyCustomTires = function()
    local Ped = PlayerPedId()
    local vehicle

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    if progressBar({
        label = locale("common", "actionInstalling")..": ",
        time  = 1000,
        cancel= true
    }) then
        SetVehicleMod(vehicle, 23, GetVehicleMod(vehicle, 23), not GetVehicleModVariation(vehicle, 23))
    end

    EmergencyBench.RimsMenu()
end

EmergencyBench.RimsMenu = function(data)
    local Menu, Ped = {}, PlayerPedId()
    local vehicle

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    local cycle = IsThisModelABike(GetEntityModel(vehicle))

    if not cycle then
        Menu[#Menu+1] = {
            icon        = (GetVehicleMod(vehicle, 23) ~= -1) and "fa-solid fa-rotate-left" or nil,
            isMenuHeader= (GetVehicleMod(vehicle, 23) == -1),
            header      = locale("common", "stockLabel"),
            txt         = (GetVehicleMod(vehicle, 23) == -1) and locale("common", "stockLabel") or "",
            onSelect    = function()
                EmergencyBench.applyRims({ mod=-1, wheeltype=0 })
            end,
        }
        if GetVehicleMod(vehicle, 23) ~= -1 then
            Menu[#Menu+1] = {
                isMenuHeader= (GetVehicleMod(vehicle, 23) == -1 and GetVehicleMod(vehicle, 24) == -1),
                header      = locale("rimsMod", "customTires"),
                txt         = GetVehicleModVariation(vehicle, 23)
                              and locale("common", "installedMsg"):gsub("%!", "")
                              or locale("common", "notInstalled"),
                onSelect    = function()
                    EmergencyBench.applyCustomTires()
                end,
            }
        end

        for k, v in pairs(wheelType) do
            Menu[#Menu+1] = {
                arrow   = true,
                header  = v,
                onSelect= function()
                    EmergencyBench.RimsChoose({ wheeltype=k, bike=false })
                end,
            }
        end
    end

    if cycle then
        Menu[#Menu+1] = {
            arrow   = true,
            header  = locale("rimsMod", "frontWheel"),
            onSelect= function()
                EmergencyBench.RimsChoose({ wheeltype=6, bike=false })
            end,
        }
        Menu[#Menu+1] = {
            arrow   = true,
            header  = locale("rimsMod", "backWheel"),
            onSelect= function()
                EmergencyBench.RimsChoose({ wheeltype=6, bike=true })
            end,
        }
    end

	local headertxt =
		(not cycle and br..locale("common", "currentInstalled")..": "..br..(isOx() and br or "")..
		(GetVehicleMod(vehicle, 23) == -1 and locale("common", "stockLabel") or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))).." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")" or "")

    openMenu(Menu, {
        header    = carMeta["search"],
        headertxt = headertxt,
        onBack    = function()
            EmergencyBench.Menu()
        end,
    })
end

EmergencyBench.RimsChoose = function(data)
    local vehicle, validMods, originalWheel, Menu, Ped = nil, {}, 0, {}, PlayerPedId()

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    originalWheel = tonumber(GetVehicleWheelType(vehicle))
    SetVehicleWheelType(vehicle, tonumber(data.wheeltype))

    for i = 1, (GetNumVehicleMods(vehicle, 23) + 1) do
        local modName = GetLabelText(GetModTextLabel(vehicle, 23, (i-1)))
        if not validMods[modName] then
            validMods[modName] = {}
            validMods[modName][#validMods[modName] + 1] = { id = (i-1), name = modName }
        else
            if validMods[modName][1] then
                local name = modName
                if modName == "NULL" then
                    name = modName.." ("..(i-1)..")"
                end
                validMods[modName][#validMods[modName]+1] = {
                    id   = (i-1),
                    name = name.." - Var "..(#validMods[modName]+1)
                }
            else
                validMods[modName][#validMods[modName]+1] = {
                    id   = validMods[modName].id,
                    name = validMods[modName].name.." - Var 1"
                }
                validMods[modName][#validMods[modName]+1] = {
                    id   = (i-1),
                    name = modName.." - Var "..(#validMods[modName]+1)
                }
            end
        end
    end

    if validMods["NULL"] then
        validMods[locale("rimsMod", "customRims")] = validMods["NULL"]
        validMods["NULL"] = nil
    end

    Menu = {}
    if data.wheeltype == 6 then
        Menu[#Menu + 1] = {
            icon        = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) ~= -1) and "fa-solid fa-rotate-left" or "",
            isMenuHeader= (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1),
            header      = locale("common", "stockLabel"),
            txt         = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1) and locale("common", "stockLabel"),
            onSelect    = function()
                EmergencyBench.applyRims({ mod = -1, wheeltype = 6, bike = data.bike })
            end,
        }
    end

    for k, v in pairsByKeys(validMods) do
        Menu[#Menu + 1] = {
            arrow   = true,
            header  = k,
            txt     = locale("common", "optionsCount")..#validMods[k],
            onSelect= function()
                EmergencyBench.RimsSubmenu({
                    mod        = v.id,
                    wheeltype  = data.wheeltype,
                    wheeltable = validMods[k],
                    bike       = data.bike,
                    label      = wheelType[data.wheeltype]
                })
            end,
        }
    end

    SetVehicleWheelType(vehicle, originalWheel)

    local headertxt =
        locale("rimsMod", "menuHeader")
        ..br.."("..wheelType[data.wheeltype]..")"
        ..br..(isOx() and br or "")
        --..locale("common", "currentInstalled")..": "
        --..br..(isOx() and br or "")
        --..((GetVehicleMod(vehicle, 23) == -1)
        --   and locale("common", "stockLabel")
        --   or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23))))
        --.." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")"

    openMenu(Menu, {
        header    = carMeta["search"],
        headertxt = headertxt,
        onBack    = function()
            EmergencyBench.RimsMenu()
        end,
    })
end

EmergencyBench.RimsSubmenu = function(data)
   local Menu, Ped = {}, PlayerPedId()

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end

    for i = 1, #data.wheeltable do
        Menu[#Menu + 1] = {
            icon = ((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id)
                    and (GetVehicleWheelType(vehicle) == data.wheeltype))
                    and "fas fa-check"
                    or "",
            isMenuHeader = ((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id)
                            and (GetVehicleWheelType(vehicle) == data.wheeltype)),
            header = data.wheeltable[i].name,
            txt    = ((GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id)
                      and (GetVehicleWheelType(vehicle) == data.wheeltype))
                      and locale("common", "stockLabel")
                      or "",
            onSelect = function()
                EmergencyBench.applyRims({
                    mod        = data.wheeltable[i].id,
                    wheeltype  = data.wheeltype,
                    wheeltable = data.wheeltable,
                    bike       = data.bike,
                    label      = data.label
                })
            end,
        }
    end

    local headertxt =
        locale("rimsMod", "menuHeader")
        ..br.."("..string.upper(data.label)..")"
        ..br..(isOx() and br or "")
        ..locale("common", "optionsCount")..#data.wheeltable
        --..br..(isOx() and br or "")
        --..locale("common", "currentInstalled")..": "
        --..br..(isOx() and br or "")
        --..((GetVehicleMod(vehicle, 23) == -1)
        --   and locale("common", "stockLabel")
        --   or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23))))
        --.." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")"

    openMenu(Menu, {
        header    = carMeta["search"],
        headertxt = headertxt,
        onBack    = function()
            EmergencyBench.RimsChoose({ wheeltype = data.wheeltype, bike = data.bike })
        end,
    })
end