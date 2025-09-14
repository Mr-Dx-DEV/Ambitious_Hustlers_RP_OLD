vehDatabase = "player_vehicles"
if isStarted(ESXExport) then vehDatabase = "owned_vehicles"
elseif isStarted(OXCoreExport) then vehDatabase = "vehicles" end

-- Check for vehicle ownership --
HelperServer.isVehicleOwned = function(plate)
	if vehiclesOwned[plate] == true then
		return true
	else
		local result = MySQL.query.await("SELECT 1 from "..vehDatabase.." WHERE plate = ?", { plate })
		if json.encode(result) ~= "[]" then
			vehiclesOwned[plate] = true
			return true
		else
			return false
		end
	end
end
exports("IsVehicleOwned", function(plate)
	return HelperServer.isVehicleOwned(plate)
end)

createCallback(getScript()..":callback:checkVehicleOwner", function(source, plate)
	local result = HelperServer.isVehicleOwned(plate)
	if result then return true else return false end
end)

HelperServer.UpdateVehicleMilage = function(plate, distAdd)
	if plate == nil or distAdd == nil then return end
    if not vehicleDist[plate] then
        vehicleDist[plate] = HelperServer.GetVehicleMilage(plate)
    end
    vehicleDist[plate] += distAdd
	if HelperServer.isVehicleOwned(plate) then
		debugPrint("^5SQL^7: ^3UpdateDrivingDistance^7: ^2Travel distance ^7- [^6"..plate.."^7]: ^6"..vehicleDist[plate].."^7")
		MySQL.Async.execute("UPDATE "..vehDatabase.." SET traveldistance = ? WHERE plate = ?", { vehicleDist[plate], plate })
	end
end

RegisterNetEvent(getScript()..":server:UpdateDrivingDistance", function(plate, distAdd)
	if plate == nil or distAdd == nil then return end
    HelperServer.UpdateVehicleMilage(plate, distAdd)
end)

HelperServer.SetVehicleMilage = function(plate, mileage)
	if plate == nil or mileage == nil then return end
    if not vehicleDist[plate] then
        vehicleDist[plate] = mileage
    end
	vehicleDist[plate] = mileage
	if HelperServer.isVehicleOwned(plate) then
		debugPrint("^5SQL^7: ^3SetDrivingDistance^7: ^2Travel distance ^7- [^6"..plate.."^7]: ^6"..mileage.."^7")
		MySQL.Async.execute("UPDATE "..vehDatabase.." SET traveldistance = ? WHERE plate = ?", { mileage, plate })
	end
end
exports("SetMilage", function(plate, mileage)
	return HelperServer.SetVehicleMilage(plate, mileage)
end)

RegisterNetEvent(getScript()..":server:SetDrivingDistance", function(plate, mileage)
	if plate == nil or mileage == nil then return end
    HelperServer.SetVehicleMilage(plate, mileage)
end)

HelperServer.GetVehicleMilage = function(plate)
	if not plate then return 0 end
	-- if locale cache is found, send that
    if vehicleDist[plate] then
        return vehicleDist[plate]
    else
		-- if vehicle is owned, grab milage from database
		if HelperServer.isVehicleOwned(plate) then
			local result = MySQL.scalar.await("SELECT traveldistance FROM "..vehDatabase.." WHERE plate = ?", { plate })
			vehicleDist[plate] = result or 0
			return vehicleDist[plate]
		else
			-- if not owned, generate a random number and cache it
			vehicleDist[plate] = math.random(100,10000)
			return vehicleDist[plate]
		end
    end
end
exports("GetMilage", function(plate)
	return HelperServer.GetVehicleMilage(plate)
end)

createCallback(getScript()..":callback:distGrab", function(source, plate)
	return HelperServer.GetVehicleMilage(plate)
end)

---==[[ SAVE MODS/COMPONENTS ]]==---

HelperServer.updateVehicleDatabase = function(props, plate)
	props.plate = plate
	if HelperServer.isVehicleOwned(plate) then
		debugPrint("^5SQL^7: ^3updateVehicle^7: [^3"..props.model.."^7] - [^3"..plate.."^7]")
		if isStarted(ESXExport) then
			MySQL.Async.execute("UPDATE "..vehDatabase.." SET vehicle = ? WHERE plate = ?", { json.encode(props), plate })
		elseif isStarted(OXCoreExport) then
			local result = MySQL.query.await("SELECT data FROM "..vehDatabase.." WHERE plate = ?", { plate })
			local data = {
				properties = props,
				lockStatus = json.decode(result[1]["data"]).lockStatus
			}
			MySQL.Async.execute("UPDATE "..vehDatabase.." SET data = ? WHERE plate = ?", { json.encode(data), plate })
		elseif isStarted(QBExport) or isStarted(QBXExport) then
			MySQL.Async.execute("UPDATE "..vehDatabase.." SET mods = ?, engine = ?, body = ?, fuel = ? WHERE plate = ? AND hash = ?", { json.encode(props), props.engineHealth, props.bodyHealth, props.fuelLevel, plate, props.model }, function(result)
				if result == 0 then
					print("^1SQL ERROR^7: ^1Failed Update - Couldn't find row with the Plate: ^7"..plate.."^1 AND model: ^7"..props.model.."^1 in database^7.")
				else
					debugPrint("^5SQL^7: Vehicle updated successfully.")
				end
			end)
		end
	end
end

RegisterNetEvent(getScript()..":server:updateVehicle", function(props, plate)
	HelperServer.updateVehicleDatabase(props, plate)
end)

HelperServer.updateVehicleComponents = function(mechDamages, plate)
	debugPrint("^5SQL^7: ^3saveStatus^7: ^2Save Extra Damages^7 - [^6"..plate.."^7]: ")
	jsonPrint(mechDamages)
	if isStarted(ESXExport) then
		MySQL.Async.execute("UPDATE "..vehDatabase.." SET status = ? WHERE plate = ?", { json.encode(mechDamages), plate })
	elseif isStarted(OXCoreExport) then
		MySQL.Async.execute("UPDATE "..vehDatabase.." SET status = ? WHERE plate = ?", { json.encode(mechDamages), plate })
	elseif isStarted(QBExport) or isStarted(QBXExport) then
		MySQL.Async.execute("UPDATE "..vehDatabase.." SET status = ? WHERE plate = ?", { json.encode(mechDamages), plate })
	end
end

RegisterNetEvent(getScript()..":server:saveStatus", function(mechDamages, plate)
	HelperServer.updateVehicleComponents(mechDamages, plate)
end)

-- Wrapper function for qb-mechanicjob
RegisterNetEvent("qb-mechanicjob:server:SaveVehicleProps", function(vehicleProps)
	if HelperServer.isVehicleOwned(vehicleProps.plate) then
		MySQL.update("UPDATE "..vehDatabase.." SET mods = ? WHERE plate = ?", { json.encode(vehicleProps), vehicleProps.plate })
	end
end)

---==[[ LOAD VALUES WHEN CAR IS SPAWNED ]] ==---
RegisterNetEvent(getScript()..":server:loadStatus", function(props, vehicle)
	if props and type(props.xenonColor) == "table" then
		TriggerEvent(getScript()..":server:ChangeXenonColour", vehicle, { r = props.xenonColor[1], g = props.xenonColor[2], b = props.xenonColor[3] })
	end
	if not VehicleStatus[props.plate] then
		local result = MySQL.Sync.fetchAll("SELECT status FROM "..vehDatabase.." WHERE plate = ?", { props.plate })
		if result[1] and tostring(result[1].status) ~= "null" and tostring(result[1].status) ~= "0" and tostring(result[1].status) ~= "1" then
			local status = json.decode(result[1].status) or {}
			if Config.Repairs.ExtraDamages then
				for _, v in pairs({"oil", "axle", "spark", "battery", "fuel"}) do
					debugPrint("^5Debug^7: ^3loadStatus^7: [^6"..props.plate.."^7] ^2Setting damage of ^6"..v.."^2 to^7: ^4"..(status[v] or 100).."^7")
					TriggerEvent(getScript()..":server:updateVehicleStatus", vehicle, v, (status[v] or 100))
				end
			end
			for _, v in pairs({"harness", "antiLag", "carwax"}) do
				debugPrint("^5Debug^7: ^3loadStatus^7: [^6"..props.plate.."^7] ^2Setting ^6"..v.."^2 to^7: ^4"..(status[v] or 0).."^7")
				TriggerEvent(getScript()..":server:updateVehicleStatus", vehicle, v, (status[v] or 0))
			end
			Entity(NetworkGetEntityFromNetworkId(vehicle)).state:set("entityVehicleStatus", { plate = props.plate, }, true)
		end
	else
		while vehicle == 0 and vehicle == nil do Wait(10)
			debugPrint("^5Debug^7: ^2Waiting for entity to exist^7")
		end
		debugPrint("^5Debug^7: ^2Ensuring statebag for entity using cached data^7")
        Entity(NetworkGetEntityFromNetworkId(vehicle)).state:set("vehicleStatus", { plate = props.plate, VehicleStatus = VehicleStatus[props.plate] }, true)
        Entity(NetworkGetEntityFromNetworkId(vehicle)).state:set("entityVehicleStatus", { plate = props.plate, }, true)
	end
end)

---==[[ DUPE EXPLOIT KICK ]]==---
RegisterNetEvent(getScript()..":server:DupeWarn", function(item, message)
	local src = source
	dupeWarn(src, item, message)
end)

---==[[ PREVIEW FUNCTIONS AND EXPLOIT FIX ]]==---
RegisterNetEvent(getScript()..":server:preview", function(active, vehicle, plate)
	local src = source
	if active then
		debugPrint("^5Debug^7: ^3Preview: ^2Player^7(^4"..src.."^7) - ^3"..getPlayer(src).name.."^2 Started previewing^7")
		Previewing[src] = { active = active, vehicle = vehicle, plate = plate }
	else
		debugPrint("^5Debug^7: ^3Preview: ^2Player^7(^4"..src.."^7) - ^3"..getPlayer(src).name.."^2 Stopped previewing^7")
		Previewing[src] = nil
	end
end)

RegisterNetEvent(getScript()..":server:TestHorn", function(vehId)
	TriggerClientEvent(getScript()..":client:TestHorn", -1, vehId)
end)

AddEventHandler("playerDropped", function()
	local src = source
	if Previewing[src] then
		debugPrint("^5SQL^7: ^3Preview: ^2Player dropped while previewing^7, ^2Removing vehicles to prevent saving^7")
		DeleteEntity(NetworkGetEntityFromNetworkId(Previewing[src].vehicle))
		print("Deleting Vehicle")
	end
	Previewing[src] = nil
end)

---==[[ CASH FOR REPAIRS ]]==---
RegisterNetEvent(getScript()..":chargeCash", function(cost, society)
	chargePlayer(cost, "cash", source)

	debugPrint("^5Debug^7: ^3chargeCash^7: ^2Adding ^7$^6"..(math.ceil(cost - (cost / 4))).." ^2to account ^7'^6"..society.."^7'")

	fundSociety(society, math.ceil(cost - (cost / 4)))
end)

---==[[ SEND TO DISCORD LOG STUFF ]]==---
function sendToDiscord(color, name, message, footer, htmllist, info)
	local embed = { { ["color"] = color, ["thumbnail"] = { ["url"] = info.thumb }, ["title"] = "**"..name.."**", ["description"] = message, ["footer"] = { ["text"] = footer }, ["fields"] = htmllist, } }
	PerformHttpRequest(info.htmllink, function(err, text, headers) end, 'POST', json.encode({ username = info.shopName:sub(4), embeds = embed }), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent(getScript()..":server:discordLog", function(info)
	local src = source
	local Player = getPlayer(src)
	local htmllist = {}
	local count = 0
	for i = 1, #info["modlist"] do
		htmllist[#htmllist+1] = {
			["name"] = info["modlist"][i]["item"],
			["value"] = info["modlist"][i]["type"],
			["inline"] = true
		}
		count += 1
		if count == 25 then
			sendToDiscord(
				info.colour,
				"New Order".." - "..Player.name,
				info["veh"]:gsub("%<br>", "").." - "..info["vehplate"],
				"Preview Report"..info.shopName,
				htmllist,
				info
			)
			htmllist = {}
			count = 0
		elseif count == #info["modlist"] - 25 then
			sendToDiscord(
				info.colour,
				"Continued".." - "..Player.name,
				info["veh"]:gsub("%<br>", "").." - "..info["vehplate"],
				"Preview Report"..info.shopName,
				htmllist,
				info
			)
		end
	end
	if #info["modlist"] <= 25 then
		sendToDiscord(
			info.colour,
			"New Order".." - "..Player.name,
			info["veh"]:gsub("%<br>", "").." - "..info["vehplate"],
			"Preview Report"..info.shopName,
			htmllist,
			info
		)
	end
end)

RegisterNetEvent(getScript()..":server:ChangeXenonColour", function(vehicleNetId, newColour)
	local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
	debugPrint("^5Debug^7: ^2Recieving xenonColour for ^3"..vehicle.."^7", json.encode(newColour))
    if vehicle and DoesEntityExist(vehicle) then
        if newColour then
            -- Set new colour
            Entity(vehicle).state:set("xenonColour", newColour, true)
        else
            -- Clear statebag when no color provided
            Entity(vehicle).state:set("xenonColour", nil, true)
        end
    end
end)

---==[[ CRAFTING SERVER STUFF ]]==---
local function isJobRole(job)
	for _, v in pairs(Config.Main.JobRoles) do
		if job == v then
			return true
		end
	end
	return false
end

if isServer() then
	onResourceStart(function()
		for locKey, location in pairs(Locations) do
			if location.Enabled then
				if isJobRole(location.job or location.gang) then
					for index, _ in pairs(location.Stash) do
						local info = Locations[locKey].Stash[index]
						local name = (location.job or location.gang).."_Safe"
						if not Config.Main.Stash.sharedStash then
							name = name.."_"..locKey
						end

						if Config.Main.Stash.uniqueStash then
							name = name.."_"..index
						end

						registerStash(name, (location.blip and location.blip.label or "").." "..(info.stashLabel or "Mech Stash").." ".."("..index..")"..(debugMode and " - ["..name.."]" or ""), info.slots or 50, info.maxWeight or 4000000)
						if not Config.Main.Stash.uniqueStash then break end
					end
					if location.BossStash then
						for index, _ in pairs(location.BossStash) do
							local info = Locations[locKey].BossStash[index]
							registerStash(info.stashName, info.stashLabel..(debugMode and " ["..info.stashName.."]" or ""), info.slots, info.maxWeight)
						end
					end
				else
					print("^1Location has role, but it wasn't found in Config.Main.JobRoles, skipping.^7")
				end
			end
		end
		registerShop("nosShop", locale("storeMenu", "nosItems"), Stores.NosItems.items, nil)
		registerShop("toolShop", locale("storeMenu", "mechanicTools"), Stores.ToolItems.items, nil)
		registerShop("repairShop", locale("storeMenu", "repairItems"), Stores.RepairItems.items, nil)
		registerShop("performShop", locale("storeMenu", "performanceItems"), Stores.PerformItems.items, nil)
		registerShop("cosmeticShop", locale("storeMenu", "cosmeticItems"), Stores.CosmeticItems.items, nil)
	end, true)
end

RegisterNetEvent(getScript()..":server:updateDefVehStats", function(plate, props)
	if not defVehStats[plate] then
		defVehStats[plate] = props
	else
		for k, v in pairs(props) do
			if defVehStats[plate][k] ~= v then defVehStats[plate][k] = v end
		end
	end
end)

RegisterNetEvent(getScript()..":server:updateCar", function(netId, props)
	TriggerClientEvent(getScript()..":client:ReceiveCarUpdateSync", -1, netId, props, source)
end)

RegisterNetEvent(getScript()..":server:changePlate", function(vehicle, plate)
	SetVehicleNumberPlateText(NetworkGetEntityFromNetworkId(vehicle), plate)
end)

---==[[ CALLBACKS ]]==---
createCallback(getScript()..":callback:checkDefVehStats", function(source, plate)
	if defVehStats and plate then
		if defVehStats[plate] then return defVehStats[plate] else return 0 end
	else return 0 end
end)

createCallback(getScript()..":callback:mechCheck", function(source)
    local result = false
    local dutyList = {}
    for _, v in pairs(Config.Main.JobRoles) do
		dutyList[tostring(v)] = false
	end

    for _, playerId in pairsByKeys(GetPlayers()) do
        for _, v in pairs(Config.Main.JobRoles) do
            local hasJob, onDuty = hasJob(v, playerId)
            if hasJob and onDuty then
                dutyList[tostring(v)] = true
            end
        end
    end
    for _, v in pairs(dutyList) do if v then result = true end end
    return result
end)

