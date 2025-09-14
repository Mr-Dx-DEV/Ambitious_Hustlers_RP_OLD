Cosmetics = {}

RegisterNetEvent(getScript()..":client:Cosmetic:Check", function(data)
    Cosmetics.mainMenu(data)
end)

Cosmetics.mainMenu = function(data)
    local validMods, Menu, vehicle, Ped = {}, {}, nil, PlayerPedId()
    local part = data.name
    if Config.Main.CosmeticsJob then
        if not Helper.haveCorrectItemJob() then
            return
        end
    end
    if not Helper.enforceSectionRestricton("cosmetics") then return end
    if not Helper.canWorkHere() then return end
    if not Helper.isInCar() then return end
    if PrevFunc.getInPreview() then
        triggerNotify(nil, locale("previewSettings", "previewNotAllowed"), "error")
        return
    end
    if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then return end
    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
        lookEnt(vehicle)
    end
    local plate = Helper.getTrimmedPlate(vehicle)

    if Helper.isCarParked(plate) then
        triggerNotify(nil, "Vehicle is hard parked", "error")
        return
    end

    if not Helper.enforceClassRestriction(searchCar(vehicle).class) then return end
    if Helper.isVehicleLocked(vehicle) then return end
	if not Helper.enforceVehicleOwned(plate) then return end

    if DoesEntityExist(vehicle) then
        for k, v in pairs(cosmeticTable[part]) do
            cosmeticTable[part][k].part = part
            if GetNumVehicleMods(vehicle, v.id) >= 1 and (not v.oldLiv and not v.roofLiv and not v.plate and not v.extra and not v.window and not v.horn) then
                local installed = GetLabelText(GetModTextLabel(vehicle, v.id, GetVehicleMod(vehicle, v.id)))
                if installed == "NULL" then installed = locale("common", "stockLabel") end
                Menu[#Menu+1] = {
                    arrow = true,
                    header = v.header,
                    txt = "("..(GetNumVehicleMods(vehicle, v.id)+1)..") "..locale("common", "menuInstalledText")..": "..installed,
                    onSelect = function()
                        Cosmetics.subMenu(v)
                    end,
                }
            end
            -- If specific items parameters, show extra categories
            if (v.roofLiv and GetVehicleRoofLiveryCount(vehicle) > 1)
               or (v.oldLiv and GetVehicleLiveryCount(vehicle) > 1)
               or v.plate or v.extra or v.window or v.horn then
                local txt, canDo, extraCount = "", true, 0
                if v.roofLiv then
                    txt = "("..(GetVehicleRoofLiveryCount(vehicle)-1)..") "..locale("common", "menuInstalledText")..": "..GetVehicleRoofLivery(vehicle)
                end
                if v.oldLiv then
                    txt = "("..(GetVehicleLiveryCount(vehicle)-1)..") "..locale("common", "menuInstalledText")..": "..GetVehicleLivery(vehicle)
                end
                if v.plate then
                    for _, b in pairs(Loc[Config.Lan].vehiclePlateOptions) do
                        if GetVehicleNumberPlateTextIndex(vehicle) == b.id then
                            txt = "("..GetNumberOfVehicleNumberPlates(vehicle)..") "..locale("common", "menuInstalledText")..": "..b.name
                            break
                        else
                            txt = "("..GetNumberOfVehicleNumberPlates(vehicle)..") "..locale("common", "menuInstalledText")..": "..locale("common", "stockLabel")
                        end
                    end
                end
                if v.horn then
                    for _, b in pairs(Loc[Config.Lan].vehicleHorns) do
                        if GetVehicleMod(vehicle, 14) == b.id then
                            txt = "("..(#Loc[Config.Lan].vehicleHorns)..") "..locale("common", "menuInstalledText")..": "..b.name
                            break
                        else
                            txt = "("..(#Loc[Config.Lan].vehicleHorns)..") "..locale("common", "menuInstalledText")..": "..locale("common", "stockLabel")
                        end
                    end
                end
                if v.extra then
                    for i = 0, 20 do
                        if DoesExtraExist(vehicle, i) then
                            canDo = true
                            extraCount += 1
                        end
                    end
                    txt = "[ "..extraCount.." "..locale("checkDetails", "optionsLabel").." ]"
                end
                if canDo then
                    Menu[#Menu+1] = {
                        arrow = true,
                        header = v.header,
                        txt = txt,
                        onSelect = function()
                            Cosmetics.subMenu(v)
                        end,
                    }
                end
            end
        end
        if countTable(Menu) ~= 0 then
            Helper.propHoldCoolDown(part)
            openMenu(Menu, {
                header = searchCar(vehicle).name,
                headertxt = locale("checkDetails", "cosmeticsListHeader"),
                canClose = true,
                onExit = function()
                    Helper.removePropHoldCoolDown()
                end,
            })
        else
            triggerNotify(nil, locale("common", "noOptionsAvailable"), "error")
        end
    end
end

Cosmetics.subMenu = function(data)
    local validMods, Menu, vehicle, Ped = {}, {}, nil, PlayerPedId()
    if not Helper.isInCar() then return end
    if not Helper.isAnyVehicleNear(GetEntityCoords(Ped)) then return end
    if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
        pushVehicle(vehicle)
    end
    local stockinstall, stockDisabled = "", false
    if DoesEntityExist(vehicle) then
        if data.roofLiv then
            if GetVehicleRoofLivery(vehicle) <= 0 then
                stockinstall = locale("common", "stockLabel")
                stockDisabled = true
            end
            for i = 0, GetVehicleRoofLiveryCount(vehicle)-1 do
                local txt, disabled, icon = "", false, ""
                if GetVehicleRoofLivery(vehicle) == i then
                    txt = locale("common", "menuInstalledText")
                    disabled = true
                    icon = "fas fa-check"
                end
                if i ~= 0 then
                    validMods[i] = {
                        mod = i,
                        name = locale("common", "liveryPrefix").." "..i,
                        part = data.part,
                        roofLiv = true,
                        install = txt,
                        disabled = disabled,
                        icon = icon
                    }
                end
            end
        elseif data.oldLiv then
            if GetVehicleLivery(vehicle) == 0 then
                stockinstall = locale("common", "stockLabel")
                stockDisabled = true
            end
            for i = 0, GetVehicleLiveryCount(vehicle)-1 do
                local txt, disabled, icon = "", false, ""
                if GetVehicleLivery(vehicle) == i then
                    txt = locale("common", "menuInstalledText")
                    disabled = true
                    icon = "fas fa-check"
                end
                if i ~= 0 then
                    validMods[i] = {
                        mod = i,
                        name = locale("common", "liveryPrefix").." "..i..(debugMode and locale("common", "oldLiverySuffix") or ""),
                        part = data.part,
                        oldLiv = true,
                        install = txt,
                        disabled = disabled,
                        icon = icon
                    }
                end
            end
        elseif data.plate then
            if GetVehicleNumberPlateTextIndex(vehicle) <= 0 then
                stockinstall = locale("common", "stockLabel")
                stockDisabled = true
            end
            for l, b in pairs(Loc[Config.Lan].vehiclePlateOptions) do
                local txt, disabled, icon = "", false, ""
                if GetVehicleNumberPlateTextIndex(vehicle) == b.id then
                    txt = locale("common", "stockLabel")
                    disabled = true
                    icon = "fas fa-check"
                end
                validMods[l] = {
                    mod = b.id,
                    name = b.name,
                    part = data.part,
                    plate = true,
                    install = txt,
                    disabled = disabled,
                    icon = icon
                }
            end
        elseif data.window then
            if GetVehicleWindowTint(vehicle) <= 0 then
                stockinstall = locale("common", "stockLabel")
                stockDisabled = true
            end
            for l, b in pairs(Loc[Config.Lan].vehicleWindowOptions) do
                local txt, disabled, icon = "", false, ""
                if GetVehicleWindowTint(vehicle) == b.id then
                    txt = locale("common", "stockLabel")
                    disabled = true
                    icon = "fas fa-check"
                end
                validMods[l] = {
                    mod = b.id,
                    name = b.name,
                    part = data.part,
                    window = true,
                    install = txt,
                    disabled = disabled,
                    icon = icon
                }
            end
        elseif data.horn then
            local checkHorn = Helper.checkHornMods(vehicle)
            if GetVehicleMod(vehicle, 14) == -1 then
                stockinstall = locale("common", "stockLabel")
                stockDisabled = true
            end
            for l, b in pairs(Loc[Config.Lan].vehicleHorns) do
                if checkHorn[b.id] then
                    local txt, disabled, icon = "", false, ""
                    if GetVehicleMod(vehicle, 14) == b.id then
                        txt = locale("common", "stockLabel")
                        disabled = true
                        icon = "fas fa-check"
                    end
                    validMods[l] = {
                        mod = b.id,
                        id = 14,
                        name = b.name,
                        part = data.part,
                        horn = true,
                        install = txt,
                        disabled = disabled,
                        icon = icon
                    }
                end
            end
        elseif data.extra then
            for i = 0, 14 do
                if DoesExtraExist(vehicle, i) then
                    local icon = ""
                    if IsVehicleExtraTurnedOn(vehicle, i) then
                        icon = "fas fa-check"
                    end
                    validMods[i] = {
                        mod = i,
                        name = locale("common", "extraPrefix").." "..i,
                        extra = true,
                        install = "",
                        part = data.part,
                        disabled = false,
                        icon = icon,
                        header = data.header
                    }
                end
            end
        else
            if GetVehicleMod(vehicle, data.id) == -1 then
                stockinstall = locale("common", "stockLabel")
                stockDisabled = true
            end
            for i = 1, GetNumVehicleMods(vehicle, data.id) do
                local txt, disabled, icon = "", false, ""
                if GetVehicleMod(vehicle, data.id) == (i-1) then
                    txt = locale("common", "stockLabel")
                    disabled = true
                    icon = "fas fa-check"
                end
                validMods[i] = {
                    mod = (i - 1),
                    id = data.id,
                    name = GetLabelText(GetModTextLabel(vehicle, data.id, (i - 1))),
                    part = data.part,
                    install = txt,
                    disabled = disabled,
                    icon = icon
                }
            end
        end
        if not data.horn and not data.plate and not data.extra then
            Menu[#Menu+1] = {
                icon = not stockDisabled and "fa-solid fa-rotate-left" or "fas fa-check",
                isMenuHeader = stockDisabled,
                header = locale("common", "zeroPrefix")..locale("common", "stockLabel"),
                txt = stockinstall,
                onSelect = function()
                    Cosmetics.Apply({
                        mod = -1,
                        id = data.id,
                        part = data.part,
                        plate = data.plate,
                        window = data.window,
                        oldLiv = data.oldLiv,
                        roofLiv = data.roofLiv,
                        extra = data.extra,
                        header = data.header
                    })
                end,
            }
        end
        if data.horn then
            data.veh = vehicle
            Menu[#Menu+1] = {
                header = locale("hornsMod", "testCurrentHorn"),
                icon = "fas fa-circle-play",
                onSelect = function()
                    SetVehicleModKit(data.veh, 0)
                    TriggerServerEvent(getScript()..":server:TestHorn", VehToNet(data.veh))
                    CreateThread(function()
                        Wait(1200)
                        Cosmetics.subMenu(data)
                    end)
                end,
            }
            Menu[#Menu+1] = {
                icon = not stockDisabled and "fa-solid fa-rotate-left" or "fas fa-check",
                isMenuHeader = stockDisabled,
                header = locale("common", "zeroPrefix")..locale("common", "stockLabel"),
                txt = stockinstall,
                onSelect = function()
                    Cosmetics.Apply({
                        mod = -1,
                        id = 14,
                        part = data.part,
                        plate = data.plate,
                        window = data.window,
                        oldLiv = data.oldLiv,
                        roofLiv = data.roofLiv,
                        extra = data.extra,
                        header = data.header
                    })
                end,
            }
        end

        for l, b in pairs(validMods) do
            Menu[#Menu+1] = {
                icon = b.icon,
                isMenuHeader = b.disabled,
                header = l.." - "..b.name,
                txt = b.install,
                onSelect = function()
                    b.header = data.header
                    if data.horn then
                        Cosmetics.HornTestMenu(b, data)
                    else
                        Cosmetics.Apply(b)
                    end
                end,
            }
        end
        openMenu(Menu, {
            header = searchCar(vehicle).name,
            headertxt = data.header..br..(isOx() and br or "")..locale("common", "optionsCount")..countTable(validMods),
            onExit = function()
                Helper.removePropHoldCoolDown()
            end,
            onBack = function() Cosmetics.mainMenu({ name = data.part } ) end,
        })
    end
end

Cosmetics.HornTestMenu = function(b, data)
    local Menu = {}
    Menu[#Menu+1] = {
        header = locale("hornsMod", "testHorn"),
        icon = "fas fa-circle-play",
        onSelect = function()
            local currentId = GetVehicleMod(data.veh, tonumber(b.id))
            Helper.checkSetVehicleMod(data.veh, tonumber(b.id), tonumber(b.mod))
            SetVehicleModKit(data.veh, 0)
            TriggerServerEvent(getScript()..":server:TestHorn", VehToNet(data.veh))
            CreateThread(function()
                Wait(1200)
                Helper.checkSetVehicleMod(data.veh, tonumber(b.id), currentId)
                SetVehicleModKit(data.veh, 0)
                Cosmetics.HornTestMenu(b, data)
            end)
        end,
    }
    Menu[#Menu+1] = {
        header = locale("hornsMod", "applyHorn"),
        icon = "fas fa-wrench",
        onSelect = function()
            b.header = data.header
            Cosmetics.Apply(b)
        end,
    }
    openMenu(Menu, {
        header = b.name,
        onBack = function()
            Cosmetics.subMenu(data)
        end,
    })
end

RegisterNetEvent(getScript()..":client:TestHorn", function(vehId)
    local vehicle = ensureNetToVeh(vehId)
    if vehicle then
        StartVehicleHorn(vehicle, 1500, "HELDDOWN", false)
    end
end)

Cosmetics.Apply = function(data)
    jsonPrint(data)
    local Ped = PlayerPedId()
    Helper.removePropHoldCoolDown()
    Wait(10)
    local emote = { dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flag = 4 }
    if not data.mod then data.mod = -1 end
    local vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
    pushVehicle(vehicle)
    lookEnt(vehicle)
    local plate = Helper.getTrimmedPlate(vehicle)
    local above = isVehicleLift(vehicle)
    local cam = not above and createTempCam(Ped, GetEntityCoords(vehicle))
    local modName = GetLabelText(GetModTextLabel(vehicle, tonumber(data.id), tonumber(data.mod)))
    if modName == "NULL" or (data.plate or data.oldLiv or data.roof or data.window) then
        modName = locale("exteriorMod", "stockMod")
    end
    if (data.plate or data.oldLiv or data.roof or data.window) then
        modName = data.name or ""
    end
    if data.id and GetVehicleMod(vehicle, tonumber(data.id)) == tonumber(data.mod) then
        triggerNotify(nil, modName.." "..locale("common", "alreadyInstalled"), "error")
        Cosmetics.mainMenu(data.part)
    else
        if data.part == "livery" then
            if not above then
                ExecuteCommand("e clean")
                emote = {}
            end
            if not data.oldLiv and not data.roofLiv then
                --SetVehicleLivery(vehicle, data.mod)
                SetVehicleModKit(vehicle, 0)
            end
        end
        if data.part == "roof" or data.part == "spoiler" then
            emote = { task = "WORLD_HUMAN_WELDING" }
        end
        if data.window and not above then
            ExecuteCommand("e maid")
            emote = {}
        end
        if data.horn then
            local horn = GetVehicleMod(vehicle, 14)
            SetVehicleMod(vehicle, 14, data.mod)
            StartVehicleHorn(vehicle, 2000, "HELDDOWN", false)
            SetVehicleMod(vehicle, 14, horn)
        end
        if above then
            emote = { dict = "amb@prop_human_movie_bulb@idle_a", anim = "idle_b", flag = 1 }
        end
        if progressBar({
            label = locale("common", "actionInstalling")..": "..modName,
            time = math.random(5000,8000),
            cancel = true,
            dict = emote.dict,
            anim = emote.anim,
            flag = emote.flag,
            task = emote.task,
            icon = data.part,
            cam = cam
        }) then
            local success = locale("common", "installedMsg"):gsub("!", "")
            if data.roofLiv then
                if data.mod == -1 then data.mod = 0 end
                SetVehicleRoofLivery(vehicle, data.mod)

            elseif data.oldLiv then
                if data.mod == -1 then data.mod = nil end
                SetVehicleLivery(vehicle, data.mod)
                SetVehicleMod(vehicle, 48, -1, false)

            elseif data.plate then
                if data.mod == -1 then data.mod = 0 end
                SetVehicleNumberPlateTextIndex(vehicle, data.mod)

            elseif data.window then
                if data.mod == -1 then data.mod = 0 end
                SetVehicleWindowTint(vehicle, tonumber(data.mod))
                success = locale("common", "installedMsg")

            elseif data.extra then
                local veh = Helper.getDamageTable(vehicle)
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

            else
                if not Helper.checkSetVehicleMod(vehicle, tonumber(data.id), tonumber(data.mod)) then
                    triggerNotify(nil, locale("checkDetails", "unavailable"), "error")
                    return
                end
            end
            sendLog(data.part.." - changed ["..plate.."]")
            Helper.addCarToUpdateLoop(vehicle)
            if data.extra or Config.Overrides.CosmeticItemRemoval == false then
                Cosmetics.subMenu(data)
            else
                removeItem(data.part, 1)
            end
            triggerNotify(nil, success, "success")
        else
            triggerNotify(nil, locale("common", "notInstalled"), "error")
        end
        Helper.removePropHoldCoolDown()
        Wait(500)
        if Config.Overrides.DoorAnimations then
            for i = 0, 5 do
                SetVehicleDoorShut(vehicle, i, false)
            end
        end
    end
end