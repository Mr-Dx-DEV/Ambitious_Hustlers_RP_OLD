---==[[ SLASH COMMANDS ]]==---
onResourceStart(function()
	registerCommand("preview", { locale("serverFunctions", "checkVehicleMods"), {}, false, function(source) TriggerClientEvent(getScript()..":client:Preview:Menu", source) end })

	registerCommand("checkveh", { "Check Performance", {}, false, function(source) TriggerClientEvent(getScript()..":client:Menu", source, false) end })
	registerCommand("showodo", { "Odometer", {}, false, function(source) TriggerClientEvent(getScript()..":ShowOdo", source) end })
	registerCommand("checkdamage", { locale("serverFunctions", "checkVehicleDamage"), {}, false, function(source) TriggerClientEvent(getScript()..":client:Repair:Check", source, true) end })
	registerCommand("checkmods", { locale("serverFunctions", "checkVehicleMods"), {}, false, function(source) TriggerClientEvent(getScript()..":client:CosmeticList", source) end })
	registerCommand("flipvehicle", { locale("serverFunctions", "flipNearestVehicle"), {}, false, function(source) TriggerClientEvent(getScript()..":client:flipvehicle", source) end })
	registerCommand("cleancar", { locale("serverFunctions", "cleanVehicle"), {}, false, function(source) TriggerClientEvent(getScript()..":client:cleanVehicle", source, true) end})
	registerCommand("hood", { locale("serverFunctions", "toggleHood"), {}, false, function(source) TriggerClientEvent(getScript()..":client:openDoor", source, nil, 4) end })
	registerCommand("trunk", { locale("serverFunctions", "toggleTrunk"), {}, false, function(source) TriggerClientEvent(getScript()..":client:openDoor", source, nil, 5) end })
	registerCommand("door", {
		locale("serverFunctions", "toggleDoor"),
		{{name="1-4", help="Door ID"}},
		true,
		function(source, args)
			local arg = args["1-4"] or args[1]
			TriggerClientEvent(getScript()..":client:openDoor", source, arg)
		end
	})

	if Config.Harness.HarnessControl then
		registerCommand("seat", {
			locale("serverFunctions", "changeSeat"),
			{{name="id", help="Seat ID"}},
			true,
			function(source, args)
				local arg = args["id"] or args[1]
				TriggerClientEvent(getScript()..":client:seat", source, arg)
			end
		})
	end

	if isStarted(OXLibExport) then  -- if ox_lib allow previewRGB
		registerCommand("previewrgb", { locale("serverFunctions", "checkVehicleMods"), {}, false, function(source) TriggerClientEvent(getScript()..":client:Preview:RGBPaintMenu", source) end })
	end

	if Config.vehFailure.fixCommand then
		registerCommand("fix", {"Repair your vehicle (Admin Only)", {}, false, function(source)
			TriggerClientEvent(getScript()..":client:fixEverything", source)
		end, "admin"})
	end
	registerCommand("adminCustoms", { "Modify the current vehicle", {}, false, function(source)
		TriggerClientEvent(getScript()..":AdminCustoms", source)
	end, "admin"})

end, true)