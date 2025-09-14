-- Vehicle Helpers
Helper.isInCar = function()
	if IsPedSittingInAnyVehicle(PlayerPedId()) then
		triggerNotify(nil, locale("generalFunctions", "actionInsideVehicle"), "error")
		return false
	else
        return true
    end
end

Helper.isOutCar = function()
	if not IsPedSittingInAnyVehicle(PlayerPedId()) then
		triggerNotify(nil, locale("generalFunctions", "actionOutsideVehicle"), "error")
		return false
	else
        return true
    end
end

Helper.isVehicleLocked = function(vehicle)
	if GetVehicleDoorLockStatus(vehicle) >= 2 then
		triggerNotify(nil, locale("generalFunctions", "vehicleLocked"), "error")
		return true
	else
        return false
    end
end

local plateCache = {}  -- Global cache table keyed by vehicle (or a unique identifier)
Helper.getTrimmedPlate = function(vehicle)
	-- Fakeplate handling hook area

	if vehicle == nil or vehicle == 0 then
		if debugMode then
			local info = debug.getinfo(2, "Sln") -- Get caller info (level 2)
			print(("^1ERROR^7: ^1Tried to get plate but vehicle was nil/0^7\nCalled from ^3%s:%d^7 in function ^3%s^7"):format(
				info.short_src or "unknown", info.currentline or -1, info.name or "anonymous"
			))
			print(debug.traceback("^5Traceback^7:", 1))
		end
		return "ERROR"
	end

	local plate = GetVehicleNumberPlateText(vehicle)
	if plate == nil or plate == 0 then
		if debugMode then
			local info = debug.getinfo(2, "Sln")
			print(("^1ERROR^7: ^1Plate text was nil/0 from vehicle id ^3%s^7\nCalled from ^3%s:%d^7 in function ^3%s^7"):format(
				tostring(vehicle), info.short_src or "unknown", info.currentline or -1, info.name or "anonymous"
			))
			print(debug.traceback("^5Traceback^7:", 1))
		end
		return "ERROR"
	end

	return trim(plate)
end

Helper.isAnyVehicleNear = function(coords)
	if not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
        triggerNotify(nil, locale("repairActions", "noVehicleNearby"), "error")
        return false
	else
        return true
    end
end

Helper.getClosestVehicle = function(coords)
	local vehicle = 0
	local vehs = { 71, 0, 2, 4, 6, 7, 23, 127, 260, 2146, 2175, 12294, 16834, 16386, 20503, 32768, 67590, 67711, 98309, 100359 }
	for _, v in pairs(vehs) do
		local veh = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, v)
        if veh ~= 0 then
            vehicle = veh
            break
        end
    end
	return vehicle
end

Helper.isVehicleOwned = function(plate)
	local owned = false
	owned = triggerCallback(getScript()..":callback:checkVehicleOwner", plate)
	return owned
end
exports("IsVehicleOwned", Helper.isVehicleOwned)

Helper.enforceVehicleOwned = function(plate)
	if Config.Main.isVehicleOwned then
		if not Helper.isVehicleOwned(plate) then
			triggerNotify(nil, locale("common", "vehicleNotOwned"), "error")
			return false
		else
			return true
		end
	else
		return true
    end
end

Helper.getDamageTable = function(vehicle)
    local veh = { engine = 0, body = 0, windows = {}, doors = {}, wheels = {} }
	veh.engine = GetVehicleEngineHealth(vehicle)
	veh.body = GetVehicleBodyHealth(vehicle)
	for i = 0, 6 do
		veh.windows[i] = IsVehicleWindowIntact(vehicle, i)
	end
	for i = 0, 6 do
		veh.doors[i] = IsVehicleDoorDamaged(vehicle, i)
	end
	for i = 0, 15 do
		if IsVehicleTyreBurst(vehicle, i, false) then
			if IsVehicleTyreBurst(vehicle, i, true) then
				veh.wheels[i] = true
			else
				veh.wheels[i] = false
			end
		end
	end
	return veh
end

Helper.forceCarDamage = function(vehicle, damages)
	damages.engine += 0.0
    damages.body += 0.0
	if damages.engine < 200.0 then damages.engine = 200.0 end
    if damages.engine > 1000.0 then damages.engine = 1000.0 end
	if damages.body < 150.0 then damages.body = 150.0 end
    if damages.body > 1000.0 then damages.body = 1000.0 end
    SetVehicleEngineHealth(vehicle, damages.engine)
    for k, v in pairs(damages.windows) do
        if v then return end
        RemoveVehicleWindow(vehicle, k)
    end
    for k, v in pairs(damages.doors) do
        if not v then return end
        SetVehicleDoorBroken(vehicle, k, true)
    end
	for k in pairs(damages.wheels) do
		SetVehicleTyreBurst(vehicle, 0, damages.wheels[k], 990.0)
	end
end

Helper.lookAtWheel = function(vehicle)
	local found = false
	local Pos = nil
	for _, v in pairs({"wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr"}) do
		Pos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))
		if #(GetEntityCoords(PlayerPedId()) - Pos) <= 1.8 then
			found = true
			break
		end
	end
	if not found then
		triggerNotify(nil, locale("common", "nearWheelWarning"), "error")
		return false
	else
		lookEnt(Pos)
		return true
	end
end

Helper.lookAtEngine = function(vehicle)
	local found = false
	local Pos = nil
	for _, v in pairs({"engine"}) do
		if (#(GetEntityCoords(PlayerPedId()) - GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))) <= 2.0) and (GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v)) ~= vec3(0,0,0)) then
			Pos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, v))
			found = true
			break
		else
			found = true
			Pos = vehicle
		end
	end
	if not found then
		triggerNotify(nil, locale("common", "nearEngineWarning"), "error")
		return false
	else
		lookEnt(Pos)
		return true
	end
end

Helper.isCarParked = function(plate, vehicle)
	local plate = plate
	if not plate and vehicle then
		plate = Helper.getTrimmedPlate(vehicle)
	end
	if isStarted("jim-parking") then
		return exports["jim-parking"]:isCarParked(plate)
	else
		return false
	end
end

Helper.enableManualGears = function(veh, plate)
	-- Enter exports for enabling manual gears on a vehicle here
	-- Default vlad_gears
	TriggerEvent("vlad_gears:activate")
	Wait(50)
	TriggerEvent("vlad_gears:entered_listener")
end

Helper.disableManualGears = function(veh, plate)
	-- Enter exports for disabling manual gears on a vehicle here
	-- Default vlad_gears
	TriggerEvent("vlad_gears:deactivate")
	Wait(50)
	TriggerEvent("vlad_gears:entered_listener")
end

Helper.updateHudNitrous = function(level, hasNitro, toggle)
	if Config.NOS.useExternalHudForNos then
		if isStarted("qb-hud") then
			TriggerEvent("hud:client:UpdateNitrous", level or 0, toggle)
		else
			TriggerEvent("hud:client:UpdateNitrous", level or 0, hasNitro or false, toggle)
		end
	end
end

Helper.getOdoNosValues = function(plate)
	if Config.NOS.enable then
		return VehicleNitrous[plate] and {
			hasNos = true,
			level = VehicleNitrous[plate].level,
			active = NitrousActivated
		} or {
			hasNos = false
		}
	else
		local nosTable = {
			hasNos = false
		}
		-- example, use exports from other nos scripts to send to the speedometer
		--nosTable = {
		--	hasNos = getHasNos(),
		--	level = getNosLevel(),
		-- 	active = getNosActive(),
		--}
		return nosTable
	end
end

Helper.getSeatbeltForOdo = function()
	if Config.Harness.HarnessControl then
		return seatBeltOn()		-- returns true if seatbelt on, false of not
	else
		local getSeatBeltOn = false
		-- example, use exports from other nos scripts to send to the speedometer
		-- getSeatBeltOn = getSeatbeltState()
		return getSeatBeltOn
	end
end

Helper.getHarnessForOdo = function()
	if Config.Harness.HarnessControl then
		return HasHarness()		-- returns true if seatbelt on, false of not
	else
		local getHarnessOn = false
		-- example, use exports from other nos scripts to send to the speedometer
		-- getHarnessOn = getHarnessState()
		return getHarnessOn
	end
end

-- Function to trigger seatbelt stuff in other huds
Helper.externalSeatbeltToggle = function(toggle)

	if isStarted("qbx_hud")  then
		LocalPlayer.state:set("seatbelt", toggle, true) -- qbx_hud
	else
		if isStarted("0r-hud-v3") then
			TriggerEvent('seatbelt:client:ToggleSeatbelt', toggle)
		else
			TriggerEvent("seatbelt:client:ToggleSeatbelt")
		end

	end

	TriggerEvent("codem-blackhudv2:seatbelt:toggle", toggle) -- codem

	if isStarted("esx_hud") and isStarted("es_extended") then	-- esx_hud
		exports["esx_hud"]:SeatbeltState(toggle)
	end

end

-- String Helpers
Helper.convertOxRGB = function(string)
	string = string:gsub("rgb", "["):gsub("%(", '"'):gsub(", ", '", "'):gsub("%)", '"]'):gsub("%s", "")
	string = json.decode(string)
	return string
end

Helper.rgbToHex = function(r, g, b)
	local rgb = (r * 0x10000) + (g * 0x100) + b
	return string.format("%06x", rgb)
end

Helper.HexTorgb = function(hex)
	local hex = hex:gsub("#", "")
	return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
end


Helper.getMilageString = function(plate)
	local dist = triggerCallback(getScript()..":callback:distGrab", plate)
	if dist ~= "" then
		dist = locale("generalFunctions", "distanceLabel").." "..string.format("%05d", math.floor(dist)).." "..(Config.System.distkph and "Km" or "Mi")
	end
    return dist
end

-- Updating mods helpers
-- Debounced vehicle update system using Citizen.SetTimeout with added debug prints

local updateTimers = {}
Helper.addCarToUpdateLoop = function(vehicle)
    if DoesEntityExist(vehicle) and vehicle ~= 0 and vehicle ~= nil then
        local newProps = getVehicleProperties(vehicle)
        setVehicleProperties(vehicle, newProps)
		local plate = Helper.getTrimmedPlate(vehicle)
        if updateTimers[vehicle] then
            debugPrint("^5Debug^7: ^2Vehicle ^7'^4"..plate.."^7' ^2already scheduled^7. ^2Cancelling old timer and updating properties^7.")
            updateTimers[vehicle].mods = newProps
            Citizen.ClearTimeout(updateTimers[vehicle].timerId)
        else
            debugPrint("^5Debug^7: ^2Adding new vehicle ^7'^4"..plate.."^7' ^2to updateTimers^7.")
            updateTimers[vehicle] = { mods = newProps }
        end

        updateTimers[vehicle].timerId = SetTimeout(Config.Overrides.updateServerDelay * 1000, function()
			if updateTimers[vehicle] then
				debugPrint("^5Debug^7: ^2Timer reached end for vehicle ^7'^4"..plate.."^7'.")
				if DoesEntityExist(vehicle) and vehicle ~= 0 and vehicle ~= nil then
					debugPrint("^5Debug^7: ^2Sending update for vehicle ^7'^4"..plate.."^7'^2 to other players^7.")
					Helper.SendCarUpdateSync(vehicle, updateTimers[vehicle].mods)
				else
					debugPrint("^1Error^7: ^2Vehicle ^7'^4"..plate.."^7' ^2no longer exists when timer triggered^7.")
				end
				updateTimers[vehicle] = nil
			end
        end)

        debugPrint("^5Debug^7: ^2Scheduled update for vehicle ^7'^4"..plate.."^7'^2 with delay^7: "..Config.Overrides.updateServerDelay.." seconds")
    else
        debugPrint("^1Error^7: ^2Attempted to schedule update for an ^1invalid ^2vehicle^7.")
    end
end

Helper.SendCarUpdateSync = function(vehicle, mods)
	local plate = Helper.getTrimmedPlate(vehicle)
    if Helper.isVehicleOwned(plate) then
        Helper.saveStatus(vehicle)
        debugPrint("^5Debug^7: ^2Updating database mods for vehicle ^7'^4"..plate.."^7'.")
        TriggerServerEvent(getScript()..":server:updateVehicle", mods, trim(plate))
    else
        debugPrint("^5Debug^7: ^2Vehicle ^7'^3"..plate.."^7' ^2is ^1not ^2owned^7. ^2Skipping database update^7.")
    end
    TriggerServerEvent(getScript()..":server:updateCar", VehToNet(vehicle), mods)
    debugPrint("^5Debug^7: ^2Triggered updateCar event for vehicle ^7'^4" .. plate .. "^7'.")
end

Helper.ReceiveCarUpdateSync = function(netId, props, src)
    debugPrint("^5Debug^7: ^2Received update for vehicle ^7'^4"..props.plate.."^7' ^2from source^7: "..src)
    if src ~= GetPlayerServerId(PlayerId()) then
        local vehicle = ensureNetToVeh(netId)
        if vehicle ~= 0 and DoesEntityExist(vehicle) then
            debugPrint("^5Debug^7: ^2Updating properties for vehicle ^7'^4" .. props.plate .. "^7'.")
            setVehicleProperties(vehicle, props)
        else
            debugPrint("^1Error^7: ^2Vehicle ^7'^4"..props.plate.."^7' ^2does not exist or has an invalid netId.")
        end
    else
        --debugPrint("^5Debug^7: ^2Ignored update from local source for vehicle ^7'^3" .. props.plate .. "^7'.")
    end
end

RegisterNetEvent(getScript()..":client:ReceiveCarUpdateSync", function(vehicle, props, src)
    Helper.ReceiveCarUpdateSync(vehicle, props, src)
end)

-- Job Helpers
Helper.canWorkHere = function()
	if Config.Main.JobLocationRequired then
		local check = false
		if inLocation ~= "" then
			for _, v in pairs(Locations) do
				if inLocation == v.designatedName and hasJob(((v.job and v.job) or (v.gang and v.gang)) or "") then
					check = true
					break
				end
			end
			if not check then
				triggerNotify(nil, locale("generalFunctions", "notThisShop"), "error")
				return false
			end
		else
			triggerNotify(nil, locale("generalFunctions", "shopRestriction"), "error")
			return false
		end
		return check
	else
		return true
	end
end

Helper.canUsePreviewLocation = function()
	if Config.Previews.PreviewLocation then
		if not inPreviewZone then
			triggerNotify(nil, "Can't Check Mods Here", "error")
		end
		return inPreviewZone
	else
		return true
	end
end

Helper.canJobUsePreview = function()
	if Config.Previews.PreviewJob then
		local check = false
		for _, v in pairs(Config.Main.JobRoles) do
			if hasJob(v) then
				check = true
				break
			end
		end
		if not check then
			triggerNotify(nil, locale("generalFunctions", "mechanicOnly"), "error")
			return false
		end
		return check
	else
		return true
	end
end

Helper.haveCorrectItemJob = function()
	if Config.Main.ItemRequiresJob then
		local check = true
        check = false
		for _, v in pairs(Config.Main.JobRoles) do
			if hasJob(v) then
                check = true
                break
            end
		end
		if not check then
            triggerNotify(nil, locale("generalFunctions", "mechanicOnly"), "error")
			return false
        end
		return check
	else
		return true
	end
end

Helper.checkRestriction = function()
	local restrictions = nil
	for _, v in pairs(Locations) do
		if inLocation == v.designatedName and hasJob(((v.job and v.job) or (v.gang and v.gang)) or "") then
			if v.Restrictions and v.Restrictions then
                restrictions = v.Restrictions
				break
            end
		end
	end
	if restrictions ~= nil then
        return restrictions
	else
        return false
    end
end

Helper.enforceSectionRestricton = function(type)
    local Restrictions = Helper.checkRestriction()
	local restrictionTable = {}
	if Config.Main.JobLocationRequired and Restrictions then
        for k, v in pairs (Restrictions.Allow) do
            restrictionTable[v] = true
        end
        if not restrictionTable[type] then
			triggerNotify(nil, "You can't do this!", "error")
			return false
		end
	end
	return true
end

Helper.enforceClassRestriction = function(class)
	local Restrictions = Helper.checkRestriction()
	local restrictionTable = {}
	if Config.Main.JobLocationRequired and Restrictions then
		for k, v in pairs(Restrictions.Vehicle) do
			restrictionTable[v] = true
		end
		if not restrictionTable[class] then
			triggerNotify(nil, "You can't modify "..class.." at this location", "error")
			return false
		end
	end
	return true
end

Helper.removeToMaterials = function(item)
	if not MaterialRecieve[item] then
		print("^1Error^7: ^2Tried to give materials for ^3"..item.." ^2and it wasn't in the MaterialRecieve table^7")
		return
	end
	for recItem, recAmount in pairs(MaterialRecieve[item]) do
		local math = math.random(math.floor((recAmount/2)+0.5), recAmount)
		if math ~= 0 then
			currentToken = triggerCallback(AuthEvent)
			addItem(recItem, math)
			Wait(100)
		end
	end
end

Helper.getValidVehiclePedIsIn = function(ped, attempts, delay)
    attempts, delay = attempts or 10, delay or 100
    local veh
    for i = 1, attempts do
        veh = GetVehiclePedIsIn(ped, false)
        if veh and veh ~= 0 and DoesEntityExist(veh) then
			debugPrint("Found valid vehicle entity id: " .. veh)
			return veh
		end
		debugPrint("Failed to get valid vehicle entity id, attempt: " .. i)
        Wait(delay)
    end
    return nil
end

function trim(value)
    if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end