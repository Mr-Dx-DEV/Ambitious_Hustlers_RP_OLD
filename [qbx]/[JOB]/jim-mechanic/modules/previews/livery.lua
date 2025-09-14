PrevFunc.Livery = {}

PrevFunc.Livery.Menu = function(data)
    local stockinstall, Menu, validMods, amountMods = "", {}, {}, 0
    local vehicle, Ped = nil, PlayerPedId()

    if not data then data = {} end
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)

        if GetNumVehicleMods(vehicle, 48) == 0 and GetVehicleLiveryCount(vehicle) ~= 0 then
            oldlivery = true
            for i = 0, (GetVehicleLiveryCount(vehicle)-1) do
                local txt = (GetVehicleLivery(vehicle) == i) and locale("common", "stockLabel") or ""
                if i ~= 0 then
                    validMods[i] = { id = i, name = locale("checkDetails", "wrapLabel").." "..i, install = txt }
                end
            end
            amountMods = GetVehicleLiveryCount(vehicle)
        else
            oldlivery = false
            for i = 1, GetNumVehicleMods(vehicle, 48) do
                local modName = GetLabelText(GetModTextLabel(vehicle, 48, (i-1)))
                local txt     = (GetVehicleMod(vehicle, 48) == (i-1)) and locale("common", "stockLabel") or ""
                validMods[i]  = { id = (i-1), name = modName, install = txt }
                amountMods    = (GetNumVehicleMods(vehicle, 48)+1)
            end
        end
    end

    if IsCamActive(camTable[currentCam]) then
        Menu[#Menu+1] = {
            icon = "fas fa-camera",
            header = "",
            txt   = locale("previewSettings", "classLabel")..": "..carMeta["class"]
                   ..br..locale("checkDetails", "plateLabel")..": ".." "..carMeta["plate"]
                   ..br..locale("checkDetails", "valueLabel")..carMeta["price"]..br..carMeta["dist"],
            onSelect = function()
                PrevFunc.changeCamAngle()
                PrevFunc.Livery.Menu(data)
            end,
        }
    end

    if oldlivery then
        Menu[#Menu+1] = {
            isMenuHeader = GetVehicleLivery(vehicle) == 0,
            icon         = GetVehicleLivery(vehicle) == 0 and "fas fa-check" or "fa-solid fa-rotate-left",
            header       = "0 - "..locale("common", "stockLabel"),
            txt          = GetVehicleLivery(vehicle) == 0 and locale("common", "stockLabel") or "",
            onSelect     = function()
                PrevFunc.Main.Apply({ id = tostring(0), old = true })
            end,
        }

        for k, v in pairs(validMods) do
            Menu[#Menu+1] = {
                icon         = (GetVehicleLivery(vehicle) == v.id) and "fas fa-check" or "",
                isMenuHeader = (GetVehicleLivery(vehicle) == v.id),
                header       = k.." - "..v.name,
                txt          = v.install,
                onSelect     = function()
                    PrevFunc.Main.Apply({ id = tostring(v.id), old = true, close = data.close })
                end,
            }
        end
    else
        Menu[#Menu+1] = {
            isMenuHeader = (GetVehicleMod(vehicle, 48) == -1),
            icon         = (GetVehicleMod(vehicle, 48) == -1) and "fas fa-check" or "fa-solid fa-rotate-left",
            header       = "0 - "..locale("common", "stockLabel"),
            txt          = (GetVehicleMod(vehicle, 48) == -1) and locale("common", "stockLabel") or "",
            onSelect     = function()
                PrevFunc.Main.Apply({ id = tostring(-1) })
            end,
        }

        for k, v in pairs(validMods) do
            Menu[#Menu+1] = {
                icon         = (GetVehicleMod(vehicle, 48) == v.id) and "fas fa-check" or "",
                isMenuHeader = (GetVehicleMod(vehicle, 48) == v.id),
                header       = k.." - "..v.name,
                txt          = v.install,
                onSelect     = function()
                    PrevFunc.Main.Apply({ id = tostring(v.id), close = data.close })
                end,
            }
        end
    end

    openMenu(Menu, {
        header    = carMeta["search"],
        headertxt = locale("checkDetails", "wrapLabel").." - [ "..locale("common", "optionsCount")..amountMods.." ]",
        onExit = function()
            if IsCamActive(camTable[currentCam]) then
                camWasActive = true
                RenderScriptCams(false, true, 500, true, true)
            end
        end,
        onBack    = function()
            PrevFunc.Main.Menu()
        end,
        onSelected= oldMenu,
    })
end