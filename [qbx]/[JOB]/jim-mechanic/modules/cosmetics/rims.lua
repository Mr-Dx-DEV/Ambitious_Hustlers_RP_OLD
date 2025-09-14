Rims = {}

--==========================================================
-- Check Rims
--==========================================================
Rims.Menu = function()
    local Menu, Ped = {}, PlayerPedId()
    local vehicle = nil

    if Config.Main.CosmeticsJob then
        if not Helper.haveCorrectItemJob() then return end
    end
    if not Helper.enforceSectionRestricton("cosmetics") then return end
    if not Helper.canWorkHere() then return end
    if not Helper.isInCar() then return end
    if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then return end

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end
    local plate = Helper.getTrimmedPlate(vehicle)
    if Helper.isCarParked(plate) then
        triggerNotify(nil, "Vehicle is hard parked", "error")
        return
    end

    local above = isVehicleLift(vehicle)
    if not above and not Helper.lookAtWheel(vehicle) then return end
    if not Helper.enforceClassRestriction(searchCar(vehicle).class) then return end

    if DoesEntityExist(vehicle) then
        local cycle = IsThisModelABike(GetEntityModel(vehicle))
        local headertxt = ""

        if not cycle then
            headertxt =
                br..locale("common", "currentInstalled")..": "..br..
                (isOx() and br or "")..
                (
                    GetVehicleMod(vehicle, 23) == -1
                    and locale("common", "stockLabel")
                    or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23)))
                )
                .." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")"
        end

        if not cycle then
            -- Menu to set back to "Stock" rims
            Menu[#Menu + 1] = {
                icon        = (GetVehicleMod(vehicle, 23) ~= -1) and "fa-solid fa-rotate-left" or nil,
                isMenuHeader= (GetVehicleMod(vehicle, 23) == -1 and GetVehicleMod(vehicle, 24) == -1),
                header      = locale("common", "stockLabel"),
                txt         = (GetVehicleMod(vehicle, 23) == -1) and locale("common", "currentInstalled"),
                onSelect    = function()
                    Rims.Apply({ mod = -1, wheeltype = 0 })
                end,
            }

            Helper.getDefalutHandling(vehicle, plate)

            -- Option to toggle custom tires if not stock
            if GetVehicleMod(vehicle, 23) ~= -1 then
                Menu[#Menu + 1] = {
                    isMenuHeader= (GetVehicleMod(vehicle, 23) == -1 and GetVehicleMod(vehicle, 24) == -1),
                    header      = locale("rimsMod", "customTires"),
                    txt         = GetVehicleModVariation(vehicle, 23)
                                  and locale("common", "installedMsg"):gsub("%!", "")
                                  or locale("common", "notInstalled"),
                    onSelect    = function()
                        Rims.toggleCustomTires()
                    end,
                }
            end

            -- Loop over each wheel type
            for k, v in pairs(wheelType) do
                Menu[#Menu+1] = {
                    arrow   = true,
                    header  = v,
                    onSelect= function()
                        Rims.ChooseMenu({ wheeltype = k, bike = false })
                    end,
                }
            end
        end

        if cycle then
            -- Bike rim options
            Menu[#Menu+1] = {
                arrow   = true,
                header  = locale("rimsMod", "frontWheel"),
                onSelect= function()
                    Rims.ChooseMenu({ wheeltype = 6, bike = false })
                end,
            }
            Menu[#Menu+1] = {
                arrow   = true,
                header  = locale("rimsMod", "backWheel"),
                onSelect= function()
                    Rims.ChooseMenu({ wheeltype = 6, bike = true })
                end,
            }
        end

        Helper.propHoldCoolDown("rims")
        openMenu(Menu, {
            header    = searchCar(vehicle).name,
            headertxt = headertxt,
            canClose  = true,
            onExit    = function()
                Helper.removePropHoldCoolDown()
            end,
        })
    end
end

RegisterNetEvent(getScript()..":client:Rims:Check", function()
    Rims.Menu()
end)

--==========================================================
-- Choose Rim Type
--==========================================================
Rims.ChooseMenu = function(data)
    local Ped = PlayerPedId()
    local vehicle = nil
    if Config.Main.CosmeticsJob then
        if not Helper.haveCorrectItemJob() then return end
    end
    if not Helper.enforceSectionRestricton("cosmetics") then return end
    if not Helper.canWorkHere() then return end
    if not Helper.isInCar() then return end
    if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then return end

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end

    local above = isVehicleLift(vehicle)
    if not above and not Helper.lookAtWheel(vehicle) then return end
    if not Helper.enforceClassRestriction(searchCar(vehicle).class) then return end

    local validMods = {}

    if DoesEntityExist(vehicle) then
        originalWheel = GetVehicleWheelType(vehicle)
        SetVehicleWheelType(vehicle, tonumber(data.wheeltype))

        for i = 1, (GetNumVehicleMods(vehicle, 23) + 1) do
            local modIndex = (i - 1)
            local modName  = GetLabelText(GetModTextLabel(vehicle, 23, modIndex))

            if not validMods[modName] then
                validMods[modName] = {}
                validMods[modName][#validMods[modName] + 1] = { id = modIndex, name = modName }
            else
                -- If this mod name already exists, treat it as a variation
                if validMods[modName][1] then
                    local name = modName
                    if modName == "NULL" then
                        name = modName.." ("..modIndex..")"
                    end
                    validMods[modName][#validMods[modName] + 1] = { id = modIndex, name = name.." - Var "..(#validMods[modName] + 1) }
                else
                    validMods[modName][#validMods[modName] + 1] = { id = validMods[modName].id, name = validMods[modName].name.." - Var 1" }
                    validMods[modName][#validMods[modName] + 1] = { id = modIndex, name = modName.." - Var "..(#validMods[modName] + 1) }
                end
            end
        end

        if validMods["NULL"] then
            validMods[locale("rimsMod", "customRims")] = validMods["NULL"]
            validMods["NULL"] = nil
        end

        local Menu = {}
        local headertxt =
            locale("rimsMod", "menuHeader")
            ..br.."("..wheelType[data.wheeltype]..")"
            --..br..(isOx() and br or "")
            --..locale("common", "currentInstalled")..":"..br..(isOx() and br or "")
            --..(
            --    GetVehicleMod(vehicle, 23) == -1
            --    and locale("common", "stockLabel")
            --    or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, 23))
            --)
            --.." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")")

        if data.wheeltype == 6 then
            Menu[#Menu + 1] = {
                icon        = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) ~= -1) and "fa-solid fa-rotate-left" or "",
                isMenuHeader= (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1),
                header      = locale("common", "stockLabel"),
                txt         = (GetVehicleMod(vehicle, (data.bike == true and 24 or 23)) == -1) and locale("common", "stockLabel"),
                onSelect    = function()
                    Rims.Apply({
                        mod       = -1,
                        wheeltype = 6,
                        bike      = data.bike
                    })
                end,
            }
        end

        for k, v in pairsByKeys(validMods) do
            Menu[#Menu + 1] = {
                arrow   = true,
                header  = k,
                txt     = locale("common", "optionsCount")..#validMods[k],
                onSelect= function()
                    Rims.subMenu({
                        mod       = v.id,
                        wheeltype = data.wheeltype,
                        wheeltable= validMods[k],
                        bike      = data.bike,
                        label     = wheelType[data.wheeltype]
                    })
                end,
            }
        end

        SetVehicleWheelType(vehicle, originalWheel)
        Helper.propHoldCoolDown("rims")

        openMenu(Menu, {
            header    = searchCar(vehicle).name,
            headertxt = headertxt,
            onBack    = function()
                Rims.Menu()
            end,
        })
    end
end

--==========================================================
-- Submenu for a Specific Rim Type
--==========================================================
Rims.subMenu = function(data)
    local Menu, Ped = {}, PlayerPedId()
    local vehicle = nil
    if Config.Main.CosmeticsJob then
        if not Helper.haveCorrectItemJob() then return end
    end
    if not Helper.enforceSectionRestricton("cosmetics") then return end
    if not Helper.canWorkHere() then return end
    if not Helper.isInCar() then return end
    if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then return end

    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end

    local above = isVehicleLift(vehicle)
    if not above and not Helper.lookAtWheel(vehicle) then return end
    if not Helper.enforceClassRestriction(searchCar(vehicle).class) then return end

    if DoesEntityExist(vehicle) then
        local headertxt =
            locale("rimsMod", "menuHeader")
            ..br.."("..data.label..")"
            ..br..(isOx() and br or "")
            --..br..(isOx() and br or "")
            --..locale("common", "currentInstalled")..": "
            --..br..(isOx() and br or "")
            --..(
            --    GetVehicleMod(vehicle, (data.bike and 24 or 23)) == -1
            --    and locale("common", "stockLabel")
            --    or GetLabelText(GetModTextLabel(vehicle, 23, GetVehicleMod(vehicle, (data.bike and 24 or 23))))
            --)
            --.." - ("..wheelType[(GetVehicleWheelType(vehicle))]..")"

        for i = 1, #data.wheeltable do
            Menu[#Menu + 1] = {
                icon = (
                    (GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id)
                    and (GetVehicleWheelType(vehicle) == data.wheeltype)
                ) and "fas fa-check",
                isMenuHeader = (
                    (GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id)
                    and (GetVehicleWheelType(vehicle) == data.wheeltype)
                ),
                header = data.wheeltable[i].name,
                txt    = (
                    (GetVehicleMod(vehicle, (data.bike and 24 or 23)) == data.wheeltable[i].id)
                    and (GetVehicleWheelType(vehicle) == data.wheeltype)
                ) and locale("common", "stockLabel"),
                onSelect = function()
                    Rims.Apply({
                        mod       = data.wheeltable[i].id,
                        wheeltype = data.wheeltype,
                        wheeltable= data.wheeltable,
                        bike      = data.bike,
                        label     = data.label
                    })
                end,
            }
        end

        Helper.propHoldCoolDown("rims")
        openMenu(Menu, {
            header    = searchCar(vehicle).name,
            headertxt = headertxt,
            onBack    = function()
                Rims.ChooseMenu({
                    wheeltype = data.wheeltype,
                    bike      = data.bike
                })
            end,
        })
    end
end

--==========================================================
-- Apply Rims
--==========================================================
Rims.Apply = function(data)
    Helper.removePropHoldCoolDown()
    Wait(10)

    local Ped     = PlayerPedId()
    local item    = Items["rims"]
    local coords  = GetEntityCoords(Ped)
    local vehicle = Helper.getClosestVehicle(coords)
    pushVehicle(vehicle)

    local above = isVehicleLift(vehicle)
    if not above and not Helper.lookAtWheel(vehicle) then return end
    local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))

    local emote = {
        anim = above and "idle_b" or "machinic_loop_mechandplayer",
        dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        flag = above and 1 or 8
    }

    playAnim(emote.dict, emote.anim, nil, emote.flag, Ped, nil)

    if not Config.SkillChecks.rims or skillCheck() then

        if progressBar({
            label = locale("common", "actionInstalling")..": "..item.label,
            time  = math.random(3000, 7000),
            cancel= true,
            cam   = cam
        }) then
            SetVehicleModKit(vehicle, 0)
            SetVehicleWheelType(vehicle, tonumber(data.wheeltype))

            if not data.bike then
                SetVehicleMod(vehicle, 23, tonumber(data.mod), GetVehicleModVariation(vehicle, 23))
            else
                SetVehicleMod(vehicle, 24, tonumber(data.mod), false)
            end

            Helper.addCarToUpdateLoop(vehicle)

            if Config.Overrides.CosmeticItemRemoval then
                removeItem("rims", 1)
            else
                if data.mod == -1 then
                    Rims.Menu(data)
                else
                    Rims.ChooseMenu(data)
                end
            end

            sendLog(item.label.."(rims) changed ["..Helper.getTrimmedPlate(vehicle).."]")
            triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
        else
            triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
        end
    end
    Helper.removePropHoldCoolDown()
end

--==========================================================
-- Apply Custom Tires
--==========================================================
Rims.toggleCustomTires = function()
    Helper.removePropHoldCoolDown()
    Wait(10)

    local Ped     = PlayerPedId()
    local item    = Items["rims"]
    local coords  = GetEntityCoords(Ped)
    local vehicle = Helper.getClosestVehicle(coords)
    pushVehicle(vehicle)

    local above = isVehicleLift(vehicle)
    if not above and not Helper.lookAtWheel(vehicle) then return end
    local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))

    local emote = {
        anim = above and "idle_b" or "machinic_loop_mechandplayer",
        dict = above and "amb@prop_human_movie_bulb@idle_a" or "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        flag = above and 1 or 8
    }


    if progressBar({
        label = locale("common", "actionInstalling")..": "..item.label,
        time  = math.random(3000,5000),
        cancel= true,
        anim  = emote.anim,
        dict  = emote.dict,
        flag  = emote.flag,
        cam   = cam
    }) then
        SetVehicleModKit(vehicle, 0)
        SetVehicleMod(vehicle, 23, GetVehicleMod(vehicle, 23), not GetVehicleModVariation(vehicle, 23))
        Helper.addCarToUpdateLoop(vehicle)
        Rims.Menu()
        triggerNotify(nil, item.label.." "..locale("common", "installedMsg"), "success")
    else
        triggerNotify(nil, item.label.." "..locale("common", "installationFailed"), "error")
    end
    Helper.removePropHoldCoolDown()
end