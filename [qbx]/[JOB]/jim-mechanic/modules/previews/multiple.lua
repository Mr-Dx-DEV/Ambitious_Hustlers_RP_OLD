PrevFunc.Main = {}
camWasActive = false
PrevFunc.Main.Menu = function()
    if camWasActive then
        camWasActive = false
        RenderScriptCams(true, true, 1000, true, true)

    end
    local validMods, Menu, vehicle, hasExtra, Ped = {}, {}, nil, false, PlayerPedId()

    if not Helper.canJobUsePreview() then return end

    if not Helper.canUsePreviewLocation() then return end

    if not Helper.isOutCar() then return end

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
        pushVehicle(vehicle)
        local plate = Helper.getTrimmedPlate(vehicle)
        if GetPedInVehicleSeat(vehicle, -1) ~= Ped then return end

        carMeta = {
            ["search"] = searchCar(vehicle).name,
            ["class"]  = searchCar(vehicle).class,
            ["plate"]  = plate,
            ["price"]  = searchCar(vehicle).price,
            ["dist"]   = Helper.getMilageString(plate),
        }

        if IsCamActive(camTable[currentCam]) then
            Menu[#Menu+1] = {
                icon = "fas fa-camera",
                header = "",
                txt  = locale("previewSettings", "classLabel")..": "..carMeta["class"]
                      ..br..locale("checkDetails", "plateLabel")..": "..carMeta["plate"]
                      ..br..locale("checkDetails", "valueLabel")..carMeta["price"]..br..carMeta["dist"],
                onSelect = function()
                    PrevFunc.changeCamAngle()
                    PrevFunc.Main.Menu()
                end,
            }
        end

        Menu[#Menu+1] = {
            icon = IsCamActive(camTable[currentCam]) and "fas fa-unlock" or "fas fa-lock",
            header = IsCamActive(camTable[currentCam]) and "Unlock Cam" or "Lock Cam",
            onSelect = function()
                if not IsCamActive(camTable[currentCam]) then
                    PrevFunc.startPreviewCamera(vehicle)
                else
                    for i = 1, #camTable do
                        SetCamActive(camTable[i], true)
                        DestroyCam(camTable[i], true)
                    end
                    camTable = {}
                    RenderScriptCams(false, true, 2000, true, true)
                    Wait(100)
                end
                PrevFunc.Main.Menu()
            end,
        }

        Menu[#Menu+1] = {
            icon = "fas fa-ban",
            header = "",
            txt = "Stop Previewing",
            onSelect = function()
                PrevFunc.stopPreview()
            end,
        }

        Menu[#Menu+1] = {
            arrow = true,
            header = "",
            txt = locale("paintOptions", "menuHeader"),
            onSelect = function()
                PrevFunc.Paint.Menu()
            end,
        }
        Menu[#Menu+1] = {
            arrow = true,
            header = "",
            txt = locale("checkDetails", "plateLabel"),
            onSelect = function()
                PrevFunc.Plates.Menu()
            end,
        }

        if GetNumVehicleMods(vehicle, 48) > 0 or GetVehicleLiveryCount(vehicle) > -1 then
            Menu[#Menu+1] = {
                arrow = true,
                header = "",
                txt = locale("checkDetails", "wrapLabel"),
                onSelect = function()
                    PrevFunc.Livery.Menu()
                end,
            }
        end

        Menu[#Menu+1] = {
            arrow = true,
            header = "",
            txt = locale("rimsMod", "menuHeader"),
            onSelect = function()
                PrevFunc.Wheels.Menu()
            end,
        }

        local extraCount = 0
        for i = 0, 14 do
            extraCount = extraCount + (tonumber(DoesExtraExist(vehicle, i)) or 0)
        end

        if extraCount > 0 then
            local isDamaged = false
            local text      = ""
            if GetVehicleBodyHealth(vehicle) < 950
               or GetVehicleEngineHealth(vehicle) < 990
               or GetVehiclePetrolTankHealth(vehicle) < 980
            then
                isDamaged = true
                text      = " - Vehicle Damaged"
            end

            Menu[#Menu+1] = {
                isMenuHeader = isDamaged,
                arrow        = not isDamaged,
                header       = "",
                txt          = locale("policeMenu", "extrasOption"),
                onSelect     = function()
                    PrevFunc.Extras.Menu()
                end
            }
        end

        local list = {
            -- Exterior
            { id = 0,  name = locale("checkDetails", "spoilersLabel").." - [" },
            { id = 1,  name = locale("checkDetails", "frontBumpersLabel").." - [" },
            { id = 2,  name = locale("checkDetails", "rearBumpersLabel").." - [" },
            { id = 3,  name = locale("checkDetails", "skirtsLabel").." - [" },
            { id = 4,  name = locale("checkDetails", "exhaustsLabel").." - [" },
            { id = 6,  name = locale("checkDetails", "grillesLabel").." - [" },
            { id = 7,  name = locale("checkDetails", "hoodsLabel").." - [" },
            { id = 8,  name = locale("checkDetails", "leftFenderLabel").." - [" },
            { id = 9,  name = locale("checkDetails", "rightFenderLabel").." - [" },
            { id = 10, name = locale("checkDetails", "roofLabel").." - [" },
            { id = 25, name = locale("checkDetails", "plateHoldersLabel").." - [" },
            { id = 26, name = locale("checkDetails", "vanityPlatesLabel").." - [" },
            { id = 27, name = locale("checkDetails", "trimALabel").." - [" },
            { id = 44, name = locale("checkDetails", "trimBLabel").." - [" },
            { id = 37, name = locale("checkDetails", "trunksLabel").." - [" },
            { id = 39, name = locale("checkDetails", "engineBlocksLabel").." - [" },
            { id = 40, name = locale("checkDetails", "airFiltersLabel").." - [" },
            { id = 41, name = locale("checkDetails", "engineStrutLabel").." - [" },
            { id = 42, name = locale("checkDetails", "archCoversLabel").." - [" },

            -- Interior
            { id = 5,  name = locale("checkDetails", "rollCagesLabel").." - [" },
            { id = 28, name = locale("checkDetails", "ornamentsLabel").." - [" },
            { id = 29, name = locale("checkDetails", "dashboardsLabel").." - [" },
            { id = 30, name = locale("checkDetails", "dialsLabel").." - [" },
            { id = 31, name = locale("checkDetails", "doorSpeakersLabel").." - [" },
            { id = 32, name = locale("checkDetails", "seatsLabel").." - [" },
            { id = 33, name = locale("checkDetails", "steeringWheelsLabel").." - [" },
            { id = 34, name = locale("checkDetails", "shifterLeversLabel").." - [" },
            { id = 35, name = locale("checkDetails", "plaquesLabel").." - [" },
            { id = 36, name = locale("checkDetails", "speakersLabel").." - [" },
            { id = 38, name = locale("checkDetails", "hydraulicsLabel").." - [" },
            { id = 43, name = locale("checkDetails", "aerialsLabel").." - [" },
            { id = 45, name = locale("checkDetails", "fuelTanksLabel").." - [" },
        }

        for i = 1, #list do
            if GetNumVehicleMods(vehicle, list[i].id) ~= 0 then
                Menu[#Menu+1] = {
                    arrow   = true,
                    header  = "",
                    txt     = list[i].name
                             ..locale("common", "optionsCount")
                             ..(GetNumVehicleMods(vehicle, list[i].id) + 1).." ]",
                    onSelect = function()
                        PrevFunc.Main.MultiMenu(list[i])
                    end,
                }
            end
        end

        if not IsThisModelABike(GetEntityModel(vehicle)) then
            Menu[#Menu+1] = {
                arrow  = true,
                header = "",
                txt    = locale("windowTints", "menuHeader"),
                onSelect = function()
                    PrevFunc.Windows.Menu()
                end,
            }
        end

        openMenu(Menu, {
            header = carMeta["search"],
            onSelected = oldMenu,
            onExit = function()
                if IsCamActive(camTable[currentCam]) then
                    camWasActive = true
                    RenderScriptCams(false, true, 500, true, true)
                end
            end,
            canClose = true,
        })

        PrevFunc.startPreview(Ped, vehicle)
    end
end
RegisterNetEvent(getScript()..":client:Preview:Menu", PrevFunc.Main.Menu)

PrevFunc.Main.MultiMenu = function(data)
    local validMods, Menu, icon, disabled, Ped = {}, {}, "fa-solid fa-rotate-left", false, PlayerPedId()

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
        for i = 1, GetNumVehicleMods(vehicle, data.id) do
            local txt = (GetVehicleMod(vehicle, data.id) == (i - 1)) and locale("common", "stockLabel") or ""
            validMods[i] = { id = (i - 1), name = GetLabelText(GetModTextLabel(vehicle, data.id, (i - 1))), install = txt }
        end
    end

    if GetVehicleMod(vehicle, data.id) == -1 then
        icon         = "fas fa-check"
        disabled     = true
    end

    if IsCamActive(camTable[currentCam]) then
        Menu[#Menu+1] = {
            icon = "fas fa-camera",
            header = "",
            txt    = "Class: "..carMeta["class"]
                    ..br..locale("checkDetails", "plateLabel")..": "..carMeta["plate"]
                    ..br..locale("checkDetails", "valueLabel")..carMeta["price"]
                    ..br..carMeta["dist"],
            onSelect = function()
                PrevFunc.changeCamAngle()
                PrevFunc.Main.MultiMenu(data)
            end,
        }
    end

    Menu[#Menu+1] = {
        icon         = icon,
        isMenuHeader = disabled,
        disabled     = (Config.System.Menu == "ox" and disabled),
        header       = "0 - "..locale("common", "stockLabel"),
        txt          = (GetVehicleMod(vehicle, data.id) == -1 and locale("common", "stockLabel") or ""),
        onSelect     = function()
            PrevFunc.Main.MultiApply({ id = -1, mod = data.id, name = data.name })
        end,
        refresh      = true,
    }

    for k, v in pairs(validMods) do
        local icon = ""
        local disabled = false

        if GetVehicleMod(vehicle, data.id) == v.id then
            icon = "fas fa-check"
            disabled = true
        end

        Menu[#Menu+1] = {
            icon         = icon,
            isMenuHeader = disabled,
            header       = k.." - "..v.name,
            txt          = v.install,
            onSelect     = function()
                PrevFunc.Main.MultiApply({
                    id = tostring(v.id),
                    mod = data.id,
                    name = data.name
                })
            end,
            refresh = true,
        }
    end

    openMenu(Menu, {
        header    = carMeta["search"],
        headertxt = data.name.." "..locale("common", "optionsCount")..(#validMods + 1).." ]",
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

PrevFunc.Main.MultiApply = function(data)
    local Ped        = PlayerPedId()
    local coords     = GetEntityCoords(Ped)
    local returndata = { id = data.mod, name = data.name }

    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    local modName = GetLabelText(GetModTextLabel(vehicle, data.mod, tonumber(data.id)))
    if modName == "NULL" then
        modName = locale("common", "stockLabel")
    end

    if GetVehicleMod(vehicle, data.mod) ~= tonumber(data.id) then
        SetVehicleMod(vehicle, data.mod, tonumber(data.id))
    end

    PrevFunc.Main.MultiMenu(returndata)
end

PrevFunc.Main.Apply = function(data)
    local Ped = PlayerPedId()
    if IsPedInAnyVehicle(Ped, false) then
        vehicle = GetVehiclePedIsIn(Ped, false)
    end

    local label   = GetModTextLabel(vehicle, 48, tonumber(data.id))
    local modName = GetLabelText(label)

    if data.old then
        if modName == "NULL" then
            modName = locale("liveryMod", "oldMod")
        end
        if GetVehicleLivery(vehicle) == tonumber(data.id) then
            triggerNotify(nil, data.id.." "..locale("common", "alreadyInstalled"), "error")
            PrevFunc.Livery.Menu()
            return
        end
    else
        if modName == "NULL" then
            modName = locale("common", "stockLabel")
        end
        if GetVehicleMod(vehicle, 48) == tonumber(data.id) then
            triggerNotify(nil, modName.." "..locale("common", "alreadyInstalled"), "error")
            PrevFunc.Livery.Menu()
            return
        end
    end

    if data.old then
        if tonumber(data.id) == 0 then
            SetVehicleMod(vehicle, 48, -1, false)
            SetVehicleLivery(vehicle, 0)
        else
            SetVehicleMod(vehicle, 48, -1, false)
            SetVehicleLivery(vehicle, tonumber(data.id))
        end
    else
        if tonumber(data.id) == -1 then
            SetVehicleMod(vehicle, 48, -1, false)
            SetVehicleLivery(vehicle, -1)
        else
            SetVehicleMod(vehicle, 48, tonumber(data.id), false)
            SetVehicleLivery(vehicle, -1)
        end
    end

    if data.close then
        PrevFunc.Livery.Menu( { close = true } )
    else
        PrevFunc.Livery.Menu()
    end
    oldlivery = nil
end