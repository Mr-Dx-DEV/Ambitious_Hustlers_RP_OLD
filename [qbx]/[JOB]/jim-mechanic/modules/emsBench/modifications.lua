--===================================================================
-- Apply a Selected Mod
--===================================================================
EmergencyBench.applyMod = function(data, possMods)
    local Ped = PlayerPedId()

    if not data.mod then
        data.mod = -1
    end

    local vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped))
    pushVehicle(vehicle)

    local modName = GetLabelText(GetModTextLabel(vehicle, tonumber(data.id), tonumber(data.mod)))
    if modName == "NULL" or data.plate or data.oldLiv or data.roof or data.window then
        modName = ""
    end

    if data.id and GetVehicleMod(vehicle, tonumber(data.id)) == tonumber(data.mod) then
        triggerNotify(nil, modName.." "..locale("common", "alreadyInstalled"), "error")
        EmergencyBench.ChooseMod(data)
    else
        -- Horn preview
        if data.horn then
            local horn = GetVehicleMod(vehicle, 14)
            SetVehicleMod(vehicle, 14, data.mod)
            StartVehicleHorn(vehicle, 2000, "HELDDOWN", false)
            SetVehicleMod(vehicle, 14, horn)
        end

        if progressBar({
            label = locale("common", "actionInstalling")..": "..modName,
            time  = 1000,
            cancel= true
        }) then
            local feedback = locale("common", "installedMsg"):gsub("!", "")

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
                feedback = locale("common", "installedMsg")
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

            Helper.addCarToUpdateLoop(vehicle)
            EmergencyBench.ChooseMod(data, possMods)
            triggerNotify(nil, feedback, "success")
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

EmergencyBench.ChooseMod = function(data, possMods)
    local validMods, Menu, vehicle, Ped, coords = {}, {}, nil, PlayerPedId(), GetEntityCoords(PlayerPedId())
	if not IsPedInAnyVehicle(Ped, false) then
        vehicle = Helper.getClosestVehicle(coords)
        pushVehicle(vehicle)
    else
        vehicle = GetVehiclePedIsIn(Ped, false)
        pushVehicle(vehicle)
    end
    local stockinstall, stockDisabled, stockIcon = "", false, ""
	if DoesEntityExist(vehicle) then
        --Pick which set of mods to look through
        if data.roofLiv then
            if GetVehicleRoofLivery(vehicle) <= 0 then
                stockinstall = locale("common", "currentInstalled")
                stockDisabled = true
            end
            for i = 0, GetVehicleRoofLiveryCount(vehicle)-1 do
                local txt, disabled, icon = "", false, ""
                if GetVehicleRoofLivery(vehicle) == (i) then
                    txt = locale("common", "currentInstalled")
                    disabled = true
                    icon = "fas fa-check"
                end
                if i ~= 0 then
                    validMods[i] = {
                        mod = i,
                        name = "Livery "..i,
                        roofLiv = true,
                        install = txt,
                        disabled = disabled,
                        icon = icon,
                        header = data.header
                    }
                end
            end
        elseif data.oldLiv then
            if GetVehicleLivery(vehicle) == 0 then
                stockinstall = locale("common", "currentInstalled")
                stockDisabled = true
            end
            for i = 0, GetVehicleLiveryCount(vehicle)-1 do
                local txt, disabled, icon = "", false, ""
                if GetVehicleLivery(vehicle) == (i) then
                    txt = locale("common", "currentInstalled")
                    disabled = true
                    icon = "fas fa-check"
                end
                if i ~= 0 then
                    validMods[i] = {
                        mod = i,
                        name = "Livery "..i..(debugMode and " oldLiv" or ""),
                        oldLiv = true,
                        install = txt,
                        disabled = disabled,
                        icon = icon,
                        header = data.header
                    }
                end
            end
        elseif data.plate then
            if GetVehicleNumberPlateTextIndex(vehicle) <= 0 then
                stockinstall = locale("common", "currentInstalled")
                stockDisabled = true
            end
            for l, b in pairs(Loc[Config.Lan].vehiclePlateOptions) do
                local txt, disabled, icon = "", false, ""
                if GetVehicleNumberPlateTextIndex(vehicle) == b.id then
                    txt = locale("common", "currentInstalled")
                    disabled = true
                    icon = "fas fa-check"
                end
                validMods[l] = {
                    mod = b.id,
                    name = b.name,
                    plate = true,
                    install = txt,
                    disabled = disabled,
                    icon = icon,
                    header = data.header
                }
            end
        elseif data.window then
            if GetVehicleWindowTint(vehicle) <= 0 then
                stockinstall = locale("common", "currentInstalled")
                stockDisabled = true
            end
            for l, b in pairs(Loc[Config.Lan].vehicleWindowOptions) do
                local txt, disabled, icon = "", false, ""
                if GetVehicleWindowTint(vehicle) == b.id then
                    txt = locale("common", "currentInstalled")
                    disabled = true
                    icon = "fas fa-check"
                end
                validMods[l] = {
                    mod = b.id,
                    name = b.name,
                    window = true,
                    install = txt,
                    disabled = disabled,
                    icon = icon,
                    header = data.header
                }
            end
        elseif data.horn then
            if GetVehicleMod(vehicle, 14) == -1 then
                stockinstall = locale("common", "currentInstalled")
                stockIcon = "fas fa-check"
                stockDisabled = true
            end
            for l, b in pairs(Loc[Config.Lan].vehicleHorns) do
                local txt, disabled, icon = "", false, ""
                if GetVehicleMod(vehicle, 14) == b.id then
                    txt = locale("common", "currentInstalled")
                    disabled = true
                    icon = "fas fa-check"
                end
                validMods[l] = {
                    mod = b.id,
                    id = 14,
                    name = b.name,
                    horn = true,
                    install = txt,
                    disabled = disabled,
                    icon = icon,
                    header = data.header
                }
            end
        elseif data.extra then
            for i = 0, 14 do
                if DoesExtraExist(vehicle, i) then
                    hadMod = true
                    if IsVehicleExtraTurnedOn(vehicle, i) then
                        icon = "fas fa-check"
                    else
                        icon = ""
                    end
                    validMods[i] = {
                        mod = i,
                        name = "Extra "..i,
                        extra = true,
                        install = txt,
                        disabled = disabled,
                        icon = icon,
                        header = data.header
                    }
                end
            end
        elseif data.perform then
            for i = 1, possMods[data.id] do  local txt, disabled, icon = "", false, ""
                if GetVehicleMod(vehicle, data.id) == (i-1) then
                    txt = locale("common", "currentInstalled")
                    disabled = true
                    icon = "fas fa-check"
                end
                validMods[i] = {
                    mod = (i-1),
                    id = data.id,
                    name = data.header.." Lvl "..i,
                    perform = true,
                    install = txt,
                    disabled = disabled,
                    icon = icon,
                    header = data.header
                }
            end
        else
            if GetVehicleMod(vehicle, data.id) == -1 then
                stockinstall = locale("common", "currentInstalled")
                stockIcon = "fas fa-check"
                stockDisabled = true

            end
            for i = 1, GetNumVehicleMods(vehicle, data.id) do
                local txt, disabled, icon = "", false, ""
                if GetVehicleMod(vehicle, data.id) == (i-1) then
                    txt = locale("common", "currentInstalled")
                    disabled = true
                    icon = "fas fa-check"
                end
                validMods[i] = {
                    mod = (i - 1),
                    id = data.id,
                    name = GetLabelText(GetModTextLabel(vehicle, data.id, (i - 1))),
                    install = txt,
                    disabled = disabled,
                    icon = icon,
                    header = data.header
                }
            end
        end
        if not data.horn and not data.plate and not data.extra then
            Menu[#Menu+1] = {
                icon = not stockDisabled and "fa-solid fa-rotate-left" or "fas fa-check",
                isMenuHeader = stockDisabled,
                header = "0 - "..locale("common", "stockLabel"), txt = stockinstall,
                onSelect = function()
                    EmergencyBench.applyMod({
                        mod = -1,
                        header = data.header,
                        id = data.id,
                        plate = data.plate,
                        window = data.window,
                        oldLiv = data.oldLiv,
                        roofLiv = data.roofLiv,
                        extra = data.extra,
                        perform = data.perform
                    }, possMods)
                end,
            }
        elseif data.horn then
            data.veh = vehicle
            Menu[#Menu+1] = {
                header = "Test Horn",
                onSelect = function()
                    StartVehicleHorn(data.veh, 2000, "HELDDOWN", true)
                    EmergencyBench.ChooseMod(data, possMods)
                end,
            }
        end
		for l, b in pairsByKeys(validMods) do
			Menu[#Menu+1] = {
                icon = b.icon or "fa-solid fa-rotate-left",
                isMenuHeader = b.disabled,
                disabled = (Config.System.Menu == "ox" and b.disabled),
				header = l.." - "..b.name, txt = b.install,
                onSelect = function()
                    EmergencyBench.applyMod(b, possMods)
                end,
			}
		end
		openMenu(Menu, {
            header = carMeta.search,
            headertxt = locale("policeMenu", "header")
                ..br..(isOx() and br or "")
                ..locale("common", "optionsCount")
                ..#validMods+1,
            onBack = function()
                EmergencyBench.Menu()
            end,
        })
	end
end

EmergencyBench.Toggles = function(data)
    local Ped = PlayerPedId()
	local vehicle = Helper.getClosestVehicle(GetEntityCoords(Ped)) pushVehicle(vehicle)
	if DoesEntityExist(vehicle) then
		SetVehicleModKit(vehicle, 0)
		if progressBar({
            label = locale("common", "actionInstalling").." "..data.header,
            time = 1000,
            cancel = true
        }) then
            if data.id == 16 then
                if GetVehicleMod(vehicle, data.id) < GetNumVehicleMods(vehicle, 16)-1 then
                    Helper.checkSetVehicleMod(vehicle, data.id, GetNumVehicleMods(vehicle, 16)-1)
                    triggerNotify(nil, Items["car_armor"].label.." "..locale("common", "installedMsg"), "success")
                else
                    Helper.checkSetVehicleMod(vehicle, data.id, -1)
                    triggerNotify(nil, Items["car_armor"].label.." "..locale("common", "removedMsg"), "error")
                end
            end
            if data.id == 18 then
                if not IsToggleModOn(vehicle, data.id) then
                    if Helper.checkToggleVehicleMod(vehicle, data.id, true) then
                        Helper.addCarToUpdateLoop(vehicle)
                        triggerNotify(nil, Items["turbo"].label.." "..locale("common", "installedMsg"), "success")
                    else
                        triggerNotify(nil, Items["turbo"].label..locale("common", "installationFailed"), "error")
                    end
                else
                    if Helper.checkToggleVehicleMod(vehicle, data.id, false) then
                        Helper.addCarToUpdateLoop(vehicle)
                        triggerNotify(nil, Items["turbo"].label.." "..locale("common", "removedMsg"), "success")
                    else
                        triggerNotify(nil, Items["turbo"].label..locale("common", "removalFailed"), "error")
                    end
                end
            end
            EmergencyBench.Menu()
        else
            triggerNotify(nil, Item["turbo"].label..locale("common", "removalFailed"), "error")
        end
	end
end