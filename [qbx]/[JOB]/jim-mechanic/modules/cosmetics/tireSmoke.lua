TireSmoke = {}

RegisterNetEvent(getScript()..":client:Tires:Check", function()
    TireSmoke.Menu()
end)

TireSmoke.Menu = function()
    local Ped = PlayerPedId()
    if Config.Main.CosmeticsJob then
        if not Helper.haveCorrectItemJob() then return end
    end
    if not Helper.canWorkHere() then return end
    if not Helper.isInCar() then return end
    if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then return end
    local vehicle = nil
    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end
    local plate = Helper.getTrimmedPlate(vehicle)
    if Helper.isCarParked(plate) then
        triggerNotify(nil, "Vehicle is hard parked", "error")
        return
    end
    if DoesEntityExist(vehicle) then
        if not Helper.lookAtWheel(vehicle) then return end
        if Helper.isVehicleLocked(vehicle) then return end
        if not Helper.enforceVehicleOwned(plate) then return end

        local r, g, b = GetVehicleTyreSmokeColor(vehicle)

        Helper.propHoldCoolDown("tyre")
        local Menu = {}
        Menu[#Menu+1] = {
            icon = "fas fa-palette",
            header = locale("smokeSettings", "customRGB"),
            onSelect = function()
                TireSmoke.RGBMenu(vehicle)
            end,
        }
        Menu[#Menu+1] = {
            icon = "fa-solid fa-rotate-left",
            header = locale("smokeSettings", "removeSmoke"),
            txt = ((r == 0) and (g == 0) and (b == 0)) and locale("common", "stockLabel"),
            onSelect = function()
                TireSmoke.Apply({ R = 0, G = 0, B = 0 })
            end,
        }
        for _, v in pairs(Loc[Config.Lan].vehicleNeonOptions) do
            local isInstalled = ((r == v.R) and (g == v.G) and (b == v.B))
            Menu[#Menu+1] = {
                isMenuHeader = isInstalled,
                header = v.name,
                txt = isInstalled and locale("common", "currentInstalled") or nil,
                onSelect = not isInstalled and (function()
                    TireSmoke.Apply({ R = v.R, G = v.G, B = v.B })
                end) or nil,
            }
        end
        openMenu(Menu, {
            header = searchCar(vehicle).name,
            headertxt = locale("smokeSettings", "menuHeader"),
            canClose = true,
            onExit = function()
                Helper.removePropHoldCoolDown()
            end,
        })
    end
end

TireSmoke.RGBMenu = function(vehicle)
    local r, g, b = GetVehicleTyreSmokeColor(vehicle)

    local dialog = createInput(
        locale("smokeSettings", "customRGB"), {
            ((Config.System.Menu == "ox") and { type = "color", label = "RGB:", format = "rgb", default = "rgb("..r..", "..g..", "..b..")" }) or nil,
            ((Config.System.Menu == "qb") and { type = "number", isRequired = true, name = "Red", text = "R", description = "R", min = 0, max = 255 }) or nil,
            ((Config.System.Menu == "qb") and { type = "number", isRequired = true, name = "Green", text = "G", description = "G", min = 0, max = 255 }) or nil,
            ((Config.System.Menu == "qb") and { type = "number", isRequired = true, name = "Blue", text = "B", description = "B", min = 0, max = 255 }) or nil,
        }
    )
    if dialog then
        if Config.System.Menu == "ox" then
            dialog[1] = Helper.convertOxRGB(dialog[1])
            r, g, b   = tonumber(dialog[1][1]) or r, tonumber(dialog[1][2]) or g, tonumber(dialog[1][3]) or b
        else
            if not (dialog.R or dialog[1]) or not (dialog.G or dialog[2]) or not (dialog.B or dialog[3]) then return end
            r = tonumber(dialog.Red   or r)
            g = tonumber(dialog.Green or g)
            b = tonumber(dialog.Blue  or b)
        end

        local data = {
            R = r,
            G = g,
            B = b
        }
        TireSmoke.Apply(data)
    end
end

TireSmoke.Apply = function(data)
    local item = Items["tires"]
    local Ped = PlayerPedId()
    local vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
    pushVehicle(vehicle)
    local above = isVehicleLift(vehicle)
    local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))
    spraying = true
    local r, g, b = GetVehicleTyreSmokeColor(vehicle)
    if r == data.R and g == data.G and b == data.B then
        triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
        TireSmoke.Menu()
    else
        time = math.random(3000,5000)
        local fwd = GetEntityForwardVector(Ped)
        local coords = GetEntityCoords(Ped) + fwd * 0.5 + vec3(0.0, 0.0, -0.5)
        CreateThread(function()
            while spraying do
                RequestNamedPtfxAsset("scr_recartheft")
                while not HasNamedPtfxAssetLoaded("scr_recartheft") do Wait(0) end
                local heading = GetEntityHeading(vehicle)
                UseParticleFxAssetNextCall("scr_recartheft")
                SetParticleFxNonLoopedColour(data.R / 255, data.G / 255, data.B / 255)
                SetParticleFxNonLoopedAlpha(1.0)
                local spray = StartNetworkedParticleFxNonLoopedAtCoord("scr_wheel_burnout", GetEntityCoords(Ped), 0.0, 0.0, heading+180.0, 0.6, 0.0, 0.0, 0.0)
                Wait(500)
            end
        end)
        Helper.removePropHoldCoolDown()

        playAnim("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", nil, 8, Ped, nil)

        if not Config.SkillChecks.tireSmoke or skillCheck() then
            if progressBar({
                label = locale("common", "actionInstalling")..": "..item.label,
                time = math.random(5000,8000),
                cancel = true,
                cam = cam
            }) then
                SetVehicleModKit(vehicle, 0)
                if Helper.checkToggleVehicleMod(vehicle, 20, true) then
                    sendLog(item.label.."(rims) - {"..data.R ..", "..data.G..", "..data.B.."} installed ["..Helper.getTrimmedPlate(vehicle).."]")
                    SetVehicleTyreSmokeColor(vehicle, data.R, data.G, data.B)
                    Helper.addCarToUpdateLoop(vehicle)
                    if Config.Overrides.CosmeticItemRemoval == true then
                        removeItem("tires", 1)
                    else
                        TireSmoke.Menu()
                    end
                    triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
                else
                    triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
                end
            else
                triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
            end
        end
        Helper.removePropHoldCoolDown()
        spraying = false
    end
end