--==========================================================
-- Paint
--==========================================================
Paints = {}
Paints.Effects = {}

local sprayfx  = nil
spraycan = nil
Ped      = nil

Paints.Effects.Spray = function(color)
    loadPtfxDict("core")
    UseParticleFxAssetNextCall("core")
    sprayfx = StartParticleFxLoopedOnEntity("ent_amb_steam", spraycan, 0.0, 0.13, 0.0, 90.0, 90.0, 0.0, 0.2, 0.0, 0.0, 0.0)
    SetParticleFxLoopedAlpha(sprayfx, 255.0)
    SetParticleFxLoopedColour(sprayfx, color[1] / 255, color[2] / 255, color[3] / 255)
end

Paints.Effects.StopSpray = function()
    StopParticleFxLooped(sprayfx, 0)
    sprayfx = nil
end

--==========================================================
-- Check Paint
--==========================================================
RegisterNetEvent(getScript()..":client:Paints:Check", function()
    Paints.Menu()
end)

Paints.Menu = function()
    if Config.Main.CosmeticsJob then
        if not Helper.haveCorrectItemJob() then return end
    end
    if not Helper.enforceSectionRestricton("paints") then return end
    if not Helper.canWorkHere() then return end

    Ped = PlayerPedId()
    local coords = GetEntityCoords(Ped)
    if not Helper.isAnyVehicleNear(coords) then return end

    local vehicle
    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
        lookEnt(vehicle)
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
        pushVehicle(vehicle)
    end

    local plate = Helper.getTrimmedPlate(vehicle)
    if Helper.isCarParked(plate) then
        triggerNotify(nil, "Vehicle is hard parked", "error")
        return
    end

    if not Helper.enforceClassRestriction(searchCar(vehicle).class) then return end
    if PrevFunc.getInPreview() then
        triggerNotify(nil, locale("previewSettings", "previewNotAllowed"), "error")
        return
    end
    if Helper.isVehicleLocked(vehicle) then return end
	if not Helper.enforceVehicleOwned(plate) then return end


    if DoesEntityExist(vehicle) then
        local vehPrimaryColour,   vehSecondaryColour = GetVehicleColours(vehicle)
        local vehPearlescentColour, vehWheelColour   = GetVehicleExtraColours(vehicle)
        local interiorColor       = GetVehicleInteriorColor(vehicle)
        local dashboardColor      = GetVehicleDashboardColour(vehicle)

        -- Translate paint IDs to names
        for k, v in pairs(Loc[Config.Lan]) do
            local name = tostring(k)
            if name == "vehicleResprayOptionsClassic"
               or name == "vehicleResprayOptionsMatte"
               or name == "vehicleResprayOptionsMetals"
               or name == "vehicleResprayOptionsChameleon"
            then
                for _, paint in pairs(v) do
                    local text = ""
                    if k == "vehicleResprayOptionsClassic" then
                        text = locale("paintOptions", "metallicFinish")
                    elseif k == "vehicleResprayOptionsMatte" then
                        text = locale("paintOptions", "matteFinish")
                    end

                    if vehPrimaryColour == paint.id then
                        vehPrimaryColour = text.." "..paint.name
                    end
                    if vehSecondaryColour == paint.id then
                        vehSecondaryColour = text.." "..paint.name
                    end
                    if vehPearlescentColour == paint.id then
                        vehPearlescentColour = text.." "..paint.name
                    end
                    if vehWheelColour == paint.id then
                        vehWheelColour = text.." "..paint.name
                    end
                    if interiorColor == paint.id then
                        interiorColor = text.." "..paint.name
                    end
                    if dashboardColor == paint.id then
                        dashboardColor = text.." "..paint.name
                    end
                end
            end
        end

        local stockText = locale("common", "stockLabel")
        if type(vehPrimaryColour) == "number" then    vehPrimaryColour    = stockText end
        if type(vehSecondaryColour) == "number" then  vehSecondaryColour  = stockText end
        if type(vehPearlescentColour) == "number" then
            vehPearlescentColour = stockText
        end
        if type(vehWheelColour) == "number" then
            vehWheelColour = stockText
        end
        if type(interiorColor) == "number" then
            interiorColor = stockText
        end
        if type(dashboardColor) == "number" then
            dashboardColor = stockText
        end

        local PaintMenu = {}

        -- If you're not inside a vehicle, show exterior paint options
        if not IsPedInAnyVehicle(Ped, false) then
            PaintMenu[#PaintMenu + 1] = {
                arrow   = true,
                header  = locale("paintOptions", "primaryColor"),
                txt     = locale("common", "currentInstalled")..": "..br..vehPrimaryColour,
                onSelect= function()
                    Paints.subMenu(locale("paintOptions", "primaryColor"))
                end,
            }
            PaintMenu[#PaintMenu + 1] = {
                arrow   = true,
                header  = locale("paintOptions", "secondaryColor"),
                txt     = locale("common", "currentInstalled")..": "..br..vehSecondaryColour,
                onSelect= function()
                    Paints.subMenu(locale("paintOptions", "secondaryColor"))
                end,
            }
            PaintMenu[#PaintMenu + 1] = {
                arrow   = true,
                header  = locale("paintOptions", "pearlescent"),
                txt     = locale("common", "currentInstalled")..": "..br..vehPearlescentColour,
                onSelect= function()
                    Paints.subMenu(locale("paintOptions", "pearlescent"))
                end,
            }
            PaintMenu[#PaintMenu + 1] = {
                arrow   = true,
                header  = locale("paintOptions", "wheelColor"),
                txt     = locale("common", "currentInstalled")..": "..br..vehWheelColour,
                onSelect= function()
                    Paints.subMenu(locale("paintOptions", "wheelColor"))
                end,
            }
        else
            -- If you are inside a vehicle, show interior paint options
            PaintMenu[#PaintMenu + 1] = {
                arrow   = true,
                header  = locale("paintOptions", "interiorColor"),
                txt     = locale("common", "currentInstalled")..": "..br..interiorColor,
                onSelect= function()
                    Paints.subMenu(locale("paintOptions", "interiorColor"))
                end,
            }
            PaintMenu[#PaintMenu + 1] = {
                arrow   = true,
                header  = locale("paintOptions", "dashboardColor"),
                txt     = locale("common", "currentInstalled")..": "..br..dashboardColor,
                onSelect= function()
                    Paints.subMenu(locale("paintOptions", "dashboardColor"))
                end,
            }
        end

        openMenu(PaintMenu, {
            header    = searchCar(vehicle).name,
            headertxt = locale("paintOptions", "menuHeader"),
            canClose  = true,
            onExit    = function() end,
        })
    end
end

--==========================================================
-- Choose Paint
--==========================================================
Paints.subMenu = function(data)
    local restrictionTable = {}

    if Config.Main.CosmeticsJob then
        if not Helper.haveCorrectItemJob() then return end
    end
    if not Helper.canWorkHere() then return end

    local coords = GetEntityCoords(Ped)
    if not Helper.isAnyVehicleNear(coords) then return end

    local vehicle
    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
        pushVehicle(vehicle)
    end

    if DoesEntityExist(vehicle) then
        local PaintMenu = {}

        if data == locale("paintOptions", "primaryColor") or data == locale("paintOptions", "secondaryColor") then
            local colorPrimary, colorSecondary = GetVehicleColours(vehicle)
            local tableData = {
                [locale("paintOptions", "primaryColor")]   = { { GetVehicleCustomPrimaryColour(vehicle) }, colorPrimary },
                [locale("paintOptions", "secondaryColor")] = { { GetVehicleCustomSecondaryColour(vehicle) }, colorSecondary }
            }
            local r, g, b = tableData[data][1][1], tableData[data][1][2], tableData[data][1][3]

            PaintMenu[#PaintMenu+1] = {
                arrow   = true,
                header  = locale("paintRGB", "rgbPickerLabel"),
                txt     = "[ "..r..", "..g..", "..b.." ]",
                onSelect= function()
                    Paints.RGB.Menu({ paint = data })
                end,
            }
            PaintMenu[#PaintMenu+1] = {
                arrow   = true,
                header  = locale("paintRGB", "hexPickerLabel"),
                txt     = "[ #"..Helper.rgbToHex(r, g, b):upper().." ]",
                onSelect= function()
                    Paints.RGB.Menu({ paint = data, hex = true })
                end,
            }
        end

        PaintMenu[#PaintMenu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "classicFinish"),
            onSelect= function()
                Paints.pickColour({ paint = data, finish = locale("paintOptions", "classicFinish") })
            end,
        }
        PaintMenu[#PaintMenu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "metallicFinish"),
            onSelect= function()
                Paints.pickColour({ paint = data, finish = locale("paintOptions", "metallicFinish") })
            end,
        }
        PaintMenu[#PaintMenu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "matteFinish"),
            onSelect= function()
                Paints.pickColour({ paint = data, finish = locale("paintOptions", "matteFinish") })
            end,
        }
        PaintMenu[#PaintMenu+1] = {
            arrow   = true,
            header  = locale("paintOptions", "metalsFinish"),
            onSelect= function()
                Paints.pickColour({ paint = data, finish = locale("paintOptions", "metalsFinish") })
            end,
        }
        if data.restrict then
            for i = 1, #data.restrict do
                restrictionTable[data.restrict[i]] = true
            end
        end

        if not (data.restrict and restrictionTable["chameleon"]) then
            if Config.Overrides.ChameleonPaints
               and (data ~= locale("paintOptions", "interiorColor") and data ~= locale("paintOptions", "dashboardColor"))
            then
                PaintMenu[#PaintMenu+1] = {
                    arrow   = true,
                    header  = locale("paintOptions", "chameleonFinish"),
                    onSelect= function()
                        Paints.pickColour({ paint = data, finish = locale("paintOptions", "chameleonFinish") })
                    end,
                }
            end
        end

        openMenu(PaintMenu, {
            header    = searchCar(vehicle).name,
            headertxt = locale("paintOptions", "menuHeader")..br..(isOx() and br or "")..data,
            onBack    = function()
                Paints.Menu()
            end,
        })
    end
end

--==========================================================
-- Choose Specific Paint
--==========================================================
Paints.pickColour = function(data)
    local coords = GetEntityCoords(Ped)
    if not Helper.isAnyVehicleNear(coords) then return end

    local vehicle
    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
        pushVehicle(vehicle)
    end

    local vehPrimaryColour,   vehSecondaryColour   = GetVehicleColours(vehicle)
    local vehPearlescentColour, vehWheelColour     = GetVehicleExtraColours(vehicle)
    local colourTable = {
        [locale("paintOptions", "primaryColor")]   = vehPrimaryColour,
        [locale("paintOptions", "secondaryColor")] = vehSecondaryColour,
        [locale("paintOptions", "pearlescent")]     = vehPearlescentColour,
        [locale("paintOptions", "wheelColor")]     = vehWheelColour,
        [locale("paintOptions", "dashboardColor")] = GetVehicleDashboardColour(vehicle),
        [locale("paintOptions", "interiorColor")]  = GetVehicleInteriorColour(vehicle),
    }

    local colourCheck = colourTable[data.paint]

    if DoesEntityExist(vehicle) then
        local PaintMenu = {}
        local installed = nil
        local paintTable = {
            [locale("paintOptions", "classicFinish")]   = Loc[Config.Lan].vehicleResprayOptionsClassic,
            [locale("paintOptions", "metallicFinish")]  = Loc[Config.Lan].vehicleResprayOptionsClassic,
            [locale("paintOptions", "matteFinish")]     = Loc[Config.Lan].vehicleResprayOptionsMatte,
            [locale("paintOptions", "metalsFinish")]    = Loc[Config.Lan].vehicleResprayOptionsMetals,
            [locale("paintOptions", "chameleonFinish")] = Loc[Config.Lan].vehicleResprayOptionsChameleon,
        }

        for k, v in pairs(paintTable[data.finish]) do
            local icon     = ""
            local disabled = false

            if colourCheck == v.id then
                installed = locale("common", "currentInstalled")
                icon      = "fas fa-check"
                disabled  = true
            else
                installed = ""
            end

            PaintMenu[#PaintMenu + 1] = {
                icon         = icon,
                isMenuHeader = disabled,
                header       = k.." - "..v.name..(debugMode and " ("..v.id..")" or ""),
                txt          = installed,
                onSelect     = function()
                    Paints.Apply({
                        paint  = data.paint,
                        id     = v.id,
                        name   = v.name,
                        finish = data.finish
                    })
                end,
            }
        end

        openMenu(PaintMenu, {
            header    = searchCar(vehicle).name,
            headertxt = locale("paintOptions", "menuHeader")..br..(isOx() and br or "")..data.finish.." "..data.paint,
            onBack    = function()
                Paints.subMenu(data.paint)
            end,
        })
    end
end

--==========================================================
-- Apply Paint
--==========================================================
Paints.Apply = function(data)
    local Ped = PlayerPedId()
    local coords = GetEntityCoords(Ped)
    local vehicle

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
        lookEnt(vehicle)
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
        pushVehicle(vehicle)
    end
    local plate = Helper.getTrimmedPlate(vehicle)
    local above = isVehicleLift(vehicle)
    local cam = not above and createTempCam(GetOffsetFromEntityInWorldCoords(Ped, 2.0, -0.3, 0.8), vehicle)

    local vehPrimaryColour, vehSecondaryColour = GetVehicleColours(vehicle)
    local vehPearlescentColour, vehWheelColour = GetVehicleExtraColours(vehicle)
    local paintTable = {
        [locale("paintOptions", "primaryColor")]   = vehPrimaryColour,
        [locale("paintOptions", "secondaryColor")] = vehSecondaryColour,
        [locale("paintOptions", "pearlescent")]     = vehPearlescentColour,
        [locale("paintOptions", "wheelColor")]     = vehWheelColour,
    }
    local colourCheck = paintTable[data.finish]
    local inside = (data.paint == locale("paintOptions", "interiorColor") or data.paint == locale("paintOptions", "dashboardColor"))

    if inside then
        SetVehicleDoorOpen(vehicle, 0, false, false)
    end

    local origProps = getVehicleProperties(vehicle)

    if colourCheck == data.id then
        triggerNotify(nil, data.finish.." "..data.name.." "..locale("common", "alreadyInstalled"), "error")
        Paints.pickColour(data)
    elseif colourCheck ~= data.id then
        if data.paint ~= locale("paintOptions", "dashboardColor") and data.paint ~= locale("paintOptions", "interiorColor") then
            startTempCam(cam)
        end

        -- SPRAY CAN ANIMS --
        spraycan = makeProp({ prop = "ng_proc_spraycan01b", coords = vec4(0.0, 0.0, 0.0, 0.0) }, 0, 1)
        AttachEntityToEntity(spraycan, Ped, GetPedBoneIndex(Ped, 57005), 0.11, 0.05, -0.06, 28.0, 30.0, 0.0, true, true, false, true, 1, true)

        playAnim("weapons@holster_1h", "unholster", -1, 2)
        Wait(GetAnimDuration("weapons@holster_1h", "unholster") * 1000)

        playAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", nil, inside and 17 or 1)

        local previousCoords = GetWorldPositionOfEntityBone(Ped, GetPedBoneIndex(Ped, 57005))

        if Config.SkillChecks.paints then
            if not skillCheck() then
                local newCoords = GetWorldPositionOfEntityBone(Ped, GetPedBoneIndex(Ped, 57005))
                local movementVec = (previousCoords - newCoords) * 2
                DetachEntity(spraycan, true, true)
                Wait(10)
                SetEntityVelocity(spraycan, movementVec * -10.0) -- scale for effect
                SetEntityAngularVelocity(spraycan, math.random(-5,5)+0.0, math.random(-5,5)+20.0, math.random(-5,5)+0.0)
                triggerNotify(nil, locale("paintOptions", "menuHeader").." "..locale("common", "installationFailed"), "error")
                Helper.removePropHoldCoolDown()

                CreateThread(function()
                    Wait(4000)
                    destroyProp(spraycan)
                    spraycan = nil
                end)
                stopTempCam()
                return
            end
        else
            Wait(6000)
        end

        stopAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar")

        local color = { 255, 255, 255 }
        playAnim(isVehicleLift(vehicle) and "amb@prop_human_movie_bulb@idle_a" or "switch@franklin@lamar_tagging_wall",
                 isVehicleLift(vehicle) and "idle_b" or "lamar_tagging_exit_loop_lamar", -1, inside and 17 or 1, nil, 2.0)
        Wait(500)

        Paints.Effects.Spray(color)
        if data.paint == locale("paintOptions", "primaryColor") then
            SetVehicleColours(vehicle, data.id, vehSecondaryColour)
            color[1], color[2], color[3] = GetVehicleCustomPrimaryColour(vehicle)
        elseif data.paint == locale("paintOptions", "secondaryColor") then
            SetVehicleColours(vehicle, vehPrimaryColour, data.id)
            color[1], color[2], color[3] = GetVehicleCustomSecondaryColour(vehicle)
        end

        SetVehicleColours(vehicle, vehPrimaryColour, vehSecondaryColour)
        Wait(500)

        local continue = true
        if progressBar({
            label = locale("common", "actionInstalling")..": "..data.paint.." "..data.finish.." "..data.name,
            time = 10000,
            cancel = true
        }) then
            SetVehicleModKit(vehicle, 0)

            sendLog(Items["paintcan"].label.."(paintcan) - "..data.paint.." "..data.finish.." "..data.name.." installed ["..plate.."]")

            if data.paint == locale("paintOptions", "primaryColor") then
                ClearVehicleCustomPrimaryColour(vehicle)
                SetVehicleColours(vehicle, 131, vehSecondaryColour)
            elseif data.paint == locale("paintOptions", "secondaryColor") then
                ClearVehicleCustomSecondaryColour(vehicle)
                SetVehicleColours(vehicle, vehPrimaryColour, 131)
            elseif data.paint == locale("paintOptions", "pearlescent") then
                SetVehicleExtraColours(vehicle, 131, vehWheelColour)
            elseif data.paint == locale("paintOptions", "wheelColor") then
                SetVehicleExtraColours(vehicle, vehPearlescentColour, 131)
            elseif data.paint == locale("paintOptions", "dashboardColor") then
                SetVehicleDashboardColour(vehicle, 131)
            elseif data.paint == locale("paintOptions", "interiorColor") then
                SetVehicleInteriorColour(vehicle, 131)
            end
        else
            setVehicleProperties(vehicle, origProps)
            continue = false
        end

        Paints.Effects.StopSpray()

        if continue then
            -- Switch can anim
            Wait(500)
            stopAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar")

            playAnim("weapons@holster_1h", "holster", -1, 2)
            Wait(250)
            DetachEntity(spraycan)
            SetEntityCoords(spraycan, 0, 0, 0)

            Wait(750)
            playAnim("weapons@holster_1h", "unholster", -1, 2)
            Wait(150)
            AttachEntityToEntity(spraycan, Ped, GetPedBoneIndex(Ped, 57005), 0.11, 0.05, -0.06, 28.0, 30.0, 0.0, true, true, false, true, 1, true)

            Wait(350)
            playAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", -1, inside and 17 or 1)
            Wait(6000)
            stopAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar")

            playAnim(isVehicleLift(vehicle) and "amb@prop_human_movie_bulb@idle_a" or "switch@franklin@lamar_tagging_wall",
                     isVehicleLift(vehicle) and "idle_b" or "lamar_tagging_exit_loop_lamar", -1, inside and 17 or 1, nil, 2.0)
            Wait(500)

            Paints.Effects.Spray(color)
            local installTime = math.random(25000, 35000)

            if progressBar({
                label = locale("common", "actionInstalling")..": "..data.paint.." "..data.finish.." "..data.name,
                time = installTime,
                cancel = false
            }) then
                SetVehicleModKit(vehicle, 0)
                sendLog(Items["paintcan"].label.."(paintcan) - "..data.paint.." "..data.finish.." "..data.name.." installed ["..plate.."]")

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

                Helper.addCarToUpdateLoop(vehicle)
                triggerNotify(nil, data.paint.." "..data.finish.." "..data.name.." "..locale("common", "installedMsg"), "success")

                if Config.Overrides.CosmeticItemRemoval then
                    removeItem("paintcan", 1)
                else
                    Paints.pickColour(data)
                end
            else
                triggerNotify(nil, locale("paintOptions", "menuHeader").." "..locale("common", "installationFailed"), "error")
                Paints.pickColour(data)
            end
        else
            setVehicleProperties(vehicle, origProps)
        end

        destroyProp(spraycan)
        spraycan = nil
        Helper.removePropHoldCoolDown()
        stopTempCam()
        Paints.Effects.StopSpray()
    end

    if inside then
        SetVehicleDoorShut(vehicle, 0, true)
    end
end