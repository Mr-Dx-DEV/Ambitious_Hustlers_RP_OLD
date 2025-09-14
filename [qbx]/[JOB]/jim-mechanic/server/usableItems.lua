
--if not isStarted(OXInv) then
onResourceStart(function()
	if Config.vehFailure.repairKits then
		createUseableItem("repairkit", function(source, item)
			TriggerClientEvent(getScript()..":vehFailure:RepairVehicle", source, { client = { item = item.name, full = false } })
		end)

		createUseableItem("advancedrepairkit", function(source, item)
			TriggerClientEvent(getScript()..":vehFailure:RepairVehicle", source, { client = { item = item.name, full = true } })
		end)
	end
	--- HARNESS Stuff ---
	if Config.Harness.HarnessControl == true then
		createUseableItem("harness", function(source, item) TriggerClientEvent(getScript()..":client:applyHarness", source, { client = { remove = false } }) end)
	end

	---==[[ PREVIEW BOARD ITEM ]]==---
	createUseableItem("mechboard", function(source, item, data)
		if isStarted(ESXExport) then
			item = data
			item.info = item.metadata["info"]
		elseif isStarted(OXInv) then
			item.info = item.metadata["info"]
		end
		item.info = item.info.info or item.info
		if item.info["vehlist"] == nil then
			triggerNotify("MechBoard", "The board is empty, don't spawn this item", "error", source)
		else
			TriggerClientEvent(getScript()..":client:giveList", source, item)
		end
	end)

	---==[[ PURGE COLOUR SERVER STUFF ]]==---
	createUseableItem("noscolour", function(source, item)
		TriggerClientEvent(getScript()..":client:NOS:rgbORhex", source)
	end)

	--Create Usable Items
	for k, v in pairs({
		["car_armor"] = ":client:applyArmour",
		["turbo"] = ":client:applyTurbo",
		["headlights"] = ":client:applyXenons",
		["underglow_controller"] = ":client:neonMenu",
		["mechanic_tools"] = ":client:Repair:Check",
		["rims"] = ":client:Rims:Check",
		["paintcan"] = ":client:Paints:Check",
		["tires"] = ":client:Tires:Check",
		["ducttape"] = ":quickrepair",
		["bprooftires"] = ":client:applyBulletProof",
		["drifttires"] = ":client:applyDrift",
		["antilag"] = ":client:applyAntiLag",
		["underglow"] = ":client:applyUnderglow",
		["manual"] = Config.Overrides.manualTransmisson and ":client:applyManual" or "",
		["stancerkit"] = ":client:stancerMenu",
	}) do
		if v ~= "" then
			createUseableItem(k, function(source, item)
				TriggerClientEvent(getScript()..v, source, { client = { remove = false } } )
			end)
		end
	end

	if Config.NOS.enable then
		createUseableItem("nos", function(source, item)
			TriggerClientEvent(getScript()..":client:applyNOS", source)
		end)
	end

	for _, v in pairs({
		"exhaust", "hood", "rollcage", "bumper",
		"externals", "livery", "internals", "roof",
		"spoiler", "skirts", "customplate", "seat",
		"tint_supplies", "horn" })
	do
		createUseableItem(v, function(source, item)
			TriggerClientEvent(getScript()..":client:Cosmetic:Check", source, { name = item.name } )
		end)
	end

	createUseableItem("cleaningkit", function(source, item)
		TriggerClientEvent(getScript()..":client:cleanVehicle", source, true)
	end)

	createUseableItem("toolbox", function(source, item)
		TriggerClientEvent(getScript()..":client:Menu", source, true)
	end)

	createUseableItem("sparetire", function(source, item)
		TriggerClientEvent(getScript()..":client:wheelRepair", source)
	end)

	for i = 1, 5 do
		createUseableItem("suspension"..i, function(source, item)
			TriggerClientEvent(getScript()..":client:applySuspension", source, { client = { level = i-1, remove = false, } })
		end)
		createUseableItem("engine"..i, function(source, item)
			TriggerClientEvent(getScript()..":client:applyEngine", source, { client = { level = i-1, remove = false, } })
		end)
	end
	for i = 1, 4 do
		createUseableItem("transmission"..i, function(source, item)
			TriggerClientEvent(getScript()..":client:applyTransmission", source, { client = { level = i-1, remove = false, } })
		end)
	end
	for i = 1, 3 do
		createUseableItem("brakes"..i, function(source, item) TriggerClientEvent(getScript()..":client:applyBrakes", source, { client = { level = i-1, remove = false, } }) end)
		if Config.Repairs.ExtraDamages then
			createUseableItem("oilp"..i, function(source, item) TriggerClientEvent(getScript()..":client:applyExtraPart", source, { client = { level = i, mod = "oilp", remove = false } }) end)
			createUseableItem("drives"..i, function(source, item) TriggerClientEvent(getScript()..":client:applyExtraPart", source, { client = { level = i, mod = "drives", remove = false } }) end)
			createUseableItem("cylind"..i, function(source, item) TriggerClientEvent(getScript()..":client:applyExtraPart", source, { client = { level = i, mod = "cylind", remove = false } }) end)
			createUseableItem("cables"..i, function(source, item) TriggerClientEvent(getScript()..":client:applyExtraPart", source, { client = { level = i, mod = "cables", remove = false } }) end)
			createUseableItem("fueltank"..i, function(source, item) TriggerClientEvent(getScript()..":client:applyExtraPart", source, { client = { level = i, mod = "fueltank", remove = false } }) end)
		end
	end

end, true)