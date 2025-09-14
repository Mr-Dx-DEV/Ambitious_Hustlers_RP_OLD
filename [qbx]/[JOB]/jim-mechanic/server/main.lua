onResourceStart(function()
	Wait(1000)
	local itemcheck = true
	--Check crafting recipes and their ingredients
	if Config.Crafting.enable then
		for k, v in pairs(Crafting) do
			for i = 1, #v do
				 for l, b in pairs(v[i]) do
					if l ~= "amount" and l ~= "job" then
						if not doesItemExist(l) then
							print("^1ERROR^7: ^2Missing Item from ^4Shared Items^7: '^6"..l.."^7'")
							itemcheck = false
						end
						for j in pairs(b) do
							if not doesItemExist(j) then
								print("^1ERROR^7: ^2Missing Item from ^4Shared Items^7: '^6"..j.."^7'")
								itemcheck = false
							end
						end
					end
				end
			end
		end
	end
	-- Check Stores for missing items
	if Config.Crafting.Stores then
		for _, v in pairs(Stores) do
			for i = 1, #v.items do
				if not doesItemExist(v.items[i].name) then
					print("^1ERROR^7: ^1Missing ^2Item from ^4Shared Items^7: '^6"..v.items[i].name.."^7'")
					itemcheck = false
				end
			end
		end
	end
		-- Check if theres a missing item/mistake in the repair materials
	if not Config.Repairs.FreeRepair then
		local repairTable = { "engine", "body", "oil", "axle", "spark", "battery", "fuel", }
		for _, v in pairs(repairTable) do
			if not Config.Repairs.Parts[v][1] then Config.Repairs.Parts[v] = { Config.Repairs.Parts[v] } end
			for i = 1, #Config.Repairs.Parts[v] do
				local item = Config.Repairs.Parts[v][i].part
				if not doesItemExist(item) then
					print("^1ERROR^7: ^2"..(v:sub(1, 1):upper() .. v:sub(2)).." repair requested a ^1missing ^2item from the Shared^7: '"..item.."^7'")
					ittemcheck = false
				end
			end
		end
	end

	-- Check for "mechboard" item
	if not doesItemExist("mechboard") then
		print("^1ERROR^7: ^2Missing Item from ^4Shared Items^7: '^6mechboard^7'")
		itemcheck = false
	end
	for k, v in pairs(Config.Main.JobRoles) do
		while not Jobs do Wait(10) end
		if not Jobs[v] and not Gangs[v] then
			print("^1ERROR^7: ^4Config^7.^4Main^7.^4Jobroles ^2tried to find the missing job^7: '^6"..v.."^7'")
		end
	end

	--Success message if all there.
	if itemcheck then
		debugPrint("^5Debug^7: ^2All items found in the shared^7!")
	end

	for _, loc in pairs(Locations) do
		if loc.Enabled then
			if loc.job and not Jobs[loc.job] then
				print("^1ERROR^7: ^2Job role not found ^7- '^6"..loc.job.."^7'")
			end
			if loc.gang and (not Jobs[loc.gang] and not Gangs[loc.gang]) then
				print("^1ERROR^7: ^2Gang role not found ^7- '^6"..loc.gang.."^7'")
			end
			if loc.garage and loc.garage.spawn then
				TriggerEvent("jim-jobgarage:server:syncAddLocations", { -- Job Garage creation
					job = loc.job,
					gang = loc.gang,
					garage = loc.garage or {}
				})
			end
			local blip = loc.blip or loc.Blip
			if blip then
				if isStarted("jim-blipcontroller") and Config.blipController and Config.blipController.enable and Config.blipController.onDutyBlips then
					exports["jim-blipcontroller"]:addDutyBlip({
						label = loc.label,
						coords = blip.coords,
						sprite = blip.sprite,
						col = blip.color,
						scale = blip.scale,
						disp = blip.disp,
						preview = (loc.previewImg and loc.previewImg) or (loc.logo and loc.logo) or nil,
					},
					loc.job or loc.gang)
				end
			end
		end
	end
end, true)