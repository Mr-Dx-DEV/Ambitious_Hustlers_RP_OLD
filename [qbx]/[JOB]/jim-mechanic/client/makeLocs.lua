local excludeKeys = { Enabled = true, job = true, gang = true, label = true, autoClock = true, logo = true, blip = true, zones = true, garage = true, booth = true, StashCraft = true }

local makeLocs = false
function makeLoc()
	if makeLocs then return end
	for k, loc in pairs(Locations) do
		if debugMode and Config.System.debugLocation then
			if k ~= Config.System.debugLocation then
				debugMode = true
				loc.Enabled = false
				goto continue
			elseif k == Config.System.debugLocation then
				loc.Enabled = true
			end
		end
		if loc.Enabled then
			Locations[k].designatedName = "MechZone-"..k.."-"..(loc.job or loc.gang)

			local totalTargets = 0
			for key, value in pairs(loc) do
				if not excludeKeys[key] and type(value) == "table" then
					for _ in pairs(value) do totalTargets += 1 end
				end
			end
			debugPrint("^3makeLoc^7: ^2Loading in Location^7: ^5"..k.." ^7- ^2Targets^7: ^6"..totalTargets.."^7")

			local bossroles = {}
			while not Jobs do Wait(10) end
			if not loc.job and not loc.gang then
				print("^1Error^7: ^1Skipping ^1'^4"..k.."^7'. ^2No Job or Gang Set^7")
				goto continue
			end
			if not Jobs[loc.job] and not Gangs[loc.gang] then
				print("^1Error^7: ^1Skipping ^1'^4"..k.."^7'. ^2Can't find the job/gang ^7'^6"..(loc.job or loc.gang).."^7' ^2in ^6Jobs^7")
				goto continue
			end
			bossroles = (loc.job and Jobs[loc.job] or (loc.gang and (Jobs[loc.gang] or Gangs[loc.gang]))) and makeBossRoles(loc.job or loc.gang) or bossroles
			createPoly({
				points = loc.zones,
				name = Locations[k].designatedName,
				onEnter = function()
					repairStashName = {}
					if hasJob(loc.job or loc.gang) then
						for index, _ in pairs(loc.Stash) do
							local name = (loc.job or loc.gang).."_Safe"
							if not Config.Main.Stash.sharedStash then
								name = name.."_"..k
							end

							if Config.Main.Stash.uniqueStash then
								name = name .."_".. index
								repairStashName[index] = name
							else
								repairStashName = name
								break
							end
							debugPrint("Has Job, setting stash name")
						end
					end
					if loc.job ~= nil and hasJob(loc.job) then
						if loc.autoClock and loc.autoClock.exit and not getPlayer().onDuty then
							toggleDuty()
						end
					end

					inLocation = Locations[k].designatedName
					debugPrint("^5Debug^7: ^3Entered ^2Mech Zone^7: (^6"..inLocation.."^7)")
					inPreviewZone = true


					-- If using Carlifts and this has a mlo model to replace
					-- When entering the location, it scans the carlift location for the model that isn't owned by the script
					-- Then hides and removes collision of the MLO model
					if Config.CarLifts.enable and loc.carLift then
						local function EnumerateObjects()
							return coroutine.wrap(function()
								local handle, entity = FindFirstObject()
								if not handle or handle == -1 then return end

								local success
								repeat
									coroutine.yield(entity)
									success, entity = FindNextObject(handle)
								until not success

								EndFindObject(handle)
							end)
						end
						Wait(3000)
						for _, lift in pairs(loc.carLift) do
							for obj in EnumerateObjects() do
								for model = 1, #Config.CarLifts.CarLiftModelReplace do
									if DoesEntityExist(obj) and (GetEntityModel(obj) == Config.CarLifts.CarLiftModelReplace[model]) then
										--debugPrint("found model")
										local objCoords = GetEntityCoords(obj)
										if #(objCoords - vec3(lift.coords.x, lift.coords.y, lift.coords.z)) <= 10.0 then
											local ownerScript = GetEntityScript(obj)
											debugPrint("object owned by: "..tostring(ownerScript))
											-- Check if it's NOT ours (MLO or another script)
											if ownerScript == nil or ownerScript ~= getScript() then
												-- MLO-baked: hide or disable
												SetEntityAlpha(obj, 0, false)
												SetEntityVisible(obj, false, false)
												SetEntityCollision(obj, false, false)
												FreezeEntityPosition(obj, true)
											end
										end
									end
								end
							end
						end
						local liftNetIds = GlobalState.LiftNetIds or {}
						for _, netId in pairs(liftNetIds) do
							local liftObj = ensureNetToEnt(netId)
							if liftObj ~= 0 or DoesEntityExist(liftObj) then
								local stateData = Entity(liftObj).state.liftData
								if stateData then
									local pylonObj = ensureNetToEnt(stateData.pylonNetId)
									if DoesEntityExist(pylonObj) then
										local name = stateData.liftName
										if not createdTargets[pylonObj] then
											createLiftTargets(pylonObj, liftObj, pylonObj, name)
										end
										animateLift(liftObj, pylonObj, stateData)
									end
								end
							end
						end
					end
				end,
				onExit = function()
					if loc.job ~= nil and hasJob(loc.job) then
						if loc.autoClock and loc.autoClock.exit and getPlayer().onDuty then
							toggleDuty()
						end
					end
					repairStashName = ""
					inLocation = ""
					debugPrint("^5Debug^7: ^3Exited ^2Mech Zone^7: (^6"..Locations[k].designatedName.."^7)")
					inPreviewZone = false
				end,
				debug = debugMode,
			})


			if Config.Main.LocationBlips then
				local blip = loc.blip or loc.Blip
				if blip then
					local useCustomBlip = not isStarted("jim-blipcontroller")
						or not Config.blipController
						or Config.blipController.enable == false
						-- Only treat as "custom" if ALL discoverable & onDuty are false
						or (Config.blipController.discoverableBlips == false and Config.blipController.onDutyBlips == false)

					if useCustomBlip then
						makeBlip({
							coords = blip.coords,
							sprite = blip.sprite,
							col = blip.color,
							scale = blip.scale,
							disp = blip.disp,
							category = blip.cat,
							name = loc.label,
							preview = (loc.previewImg and loc.previewImg) or (loc.logo and loc.logo) or nil,
						})
					else
						if Config.blipController.discoverableBlips then
							exports["jim-blipcontroller"]:discoverBlip(
								Locations[k].designatedName,
								{
									coords = blip.coords,
									sprite = blip.sprite,
									col = blip.color,
									scale = blip.scale,
									disp = blip.disp,
									category = blip.cat,
									name = loc.label,
									preview = (loc.previewImg and loc.previewImg) or (loc.logo and loc.logo) or nil,
								}
							)
						end
					end
				end
			end


			if loc.PropAdd and loc.PropAdd[1] then
				for i, target in pairsByKeys(loc.PropAdd) do
					local prop = nil
					if target.model == "prop_strip_pole_01" then
						makeProp({ prop = target.model, coords = target.coords }, true, false)
						SetEntityAlpha(prop, 0) DisableCamCollisionForEntity(prop)
					else
						makeDistProp({ prop = target.model, coords = target.coords }, true, false)
					end
				end
			end
			if loc.PropHide and loc.PropHide[1] then
				for i, target in pairsByKeys(loc.PropHide) do
					CreateModelHide(target.coords.xyz, 2.0, type(target.model) == "string" and GetHashKey(target.model) or target.model, true)
				end
			end

			if Config.Crafting.enable then
				createTarget("Crafting", loc.Crafting, k, loc, bossroles)
			end
			if Config.Crafting.Stores then
				createTarget("Shops", loc.Shop, k, loc, bossroles)
			end
			createTarget("Payments", loc.Payments, k, loc, bossroles)
			createTarget("Outfit", loc.Outfit, k, loc, bossroles)
			createTarget("Stash", loc.Stash, k, loc, bossroles)
			createTarget("PersonalStash", loc.PersonalStash, k, loc, bossroles)
			createTarget("Clockin", loc.Clockin, k, loc, bossroles)
			createTarget("BossMenus", loc.BossMenus, k, loc, bossroles)
			createTarget("BossStash", loc.BossStash, k, loc, bossroles)
			if loc.nosRefill and Config.NOS.enable then
				createTarget("NosRefill", loc.nosRefill, k, loc, bossroles)
			end
			createTarget("ManualRepair", loc.manualRepair, k, loc, bossroles)

			debugPrint("^3makeLoc^7: ^2Success^7!")
		end
		::continue::
	end
	makeLocs = true
end

function createTarget(targetType, targets, id, loc, bossroles, stashCraft)
	if not targets or not targets[1] then return end
	for i, target in pairsByKeys(targets) do
		local name = getScript()..":"..id..":"..targetType.."["..i.."]"
		if target.prop then -- If spawning a prop, make entity target instead (ignores depth and width stuff)
			makeDistProp({ prop = target.prop.model, coords = target.prop.coords }, true, false)
		end
		local coords = target.prop and target.prop.coords or target.coords
		local options = { {
			action = function(data)
				local stashName = (loc.job or loc.gang).."_Safe"
				if targetType == "Stash" then
					if not Config.Main.Stash.sharedStash then
						stashName = stashName .."_".. id
					end
					if Config.Main.Stash.uniqueStash then
						stashName = stashName .."_".. i
					end
					openStash({
						job = loc.job,
						gang = loc.gang,
						stash = stashName,
						label = (target.stashLabel or target.label).."["..stashName.."]",
						coords = coords.xyz,
						slots = target.slots or 50,
						maxWeight = target.maxWeight or 400000,
					})

				elseif targetType == "Shops" then
					local restrict = nil if loc.Restrictions and loc.Restrictions.Allow[1] then restrict = loc.Restrictions.Allow end
					mechStoreMenu({
						job = loc.job or nil,
						gang = loc.gang or nil,
						restrict = restrict
					})


				elseif targetType == "Crafting" then
					local restrict = nil if loc.Restrictions and loc.Restrictions.Allow[1] then restrict = loc.Restrictions.Allow end
					mechCraftingMenu({
						job = loc.job,
						gang = loc.gang,
						coords = coords.xyz,
						restrict = restrict,
						stashName = Config.Crafting.StashCraft and repairStashName
					})


				elseif targetType == "BossStash" then
					openStash({
						stash = target.stashName,
						label = (target.stashLabel or target.label).."["..target.stashName.."]",
						coords = coords.xyz,
						maxWeight = target.maxWeight or 400000,
						slots = target.slots or 10
					})

				elseif targetType == "Payments" then
					billPlayer({
						job = loc.job,
						gang = loc.gang,
						coords = coords.xyz,
						img = loc.logo
					})

				elseif targetType == "Clockin" then
					toggleDuty()

				elseif targetType == "BossMenus" then
					openBossMenu(loc.gang, loc.job or loc.gang)

				elseif targetType == "ManualRepair" then
					ManualRepairBench.Menu({ society = loc.job or loc.gang })

				elseif targetType == "PersonalStash" then
					local citizenId = getPlayer().citizenId
					local stashName = (loc.job or loc.gang)..citizenId

					-- lock OX stash check behind script check
					if isStarted(OXInv) then
						currentToken = triggerCallback(AuthEvent)
						Wait(100)

						TriggerServerEvent(getScript()..":server:makeOXStash",
							stashName,
							"Personal Storage ["..stashName.."]",
							target.slots or 10,
							target.maxWeight or 400000,
							citizenId,
							target.coords,
							currentToken
						)
						currentToken = nil
					end
					openStash({
						stash = stashName,
						coords = coords.xyz,
						label = target.label,
						slots = target.slots or 10,
						maxWeight = target.maxWeight or 400000,
					})

				elseif targetType == "Outfit" then
					TriggerEvent("qb-clothing:client:openOutfitMenu")

				elseif targetType == "NosRefill" then
					Nitrous.NosCanFill({ coords = coords.xyz, tank = type(data) == "table" and data.entity or data, society = loc.job or loc.gang })

				end
			end,
			icon = target.icon or "fas fa-chair",
			label = (target.label or "NEEDS LABEL")..(debugMode and " ["..name.."]" or "")..((loc.StashCraft and loc.StashCraft == target.stashName) and "*" or ""),
			job = loc.job and ((targetType == "BossMenus" or targetType == "BossStash") and bossroles) or ((targetType ~= "PublicStash" and targetType ~= "ManualRepair") and loc.job or nil) or nil,
			gang = loc.gang and ((targetType == "BossMenus" or targetType == "BossStash") and bossroles) or ((targetType ~= "PublicStash" and targetType ~= "ManualRepair") and loc.gang or nil) or nil,
		}, }
		-- extra conditonal options
		if targetType == "Payments" then
            if Config.General.showClockInTill and not loc.gang then
                options[#options+1] = {
					action = function()
						toggleDuty()
					end,
					job = loc.job,
					gang = loc.gang,
					icon = "fas fa-user-check",
					label = "Toggle Duty"..(debugMode and " ["..name.."]" or ""),}
            end
            if Config.General.showBossMenuTill then
				jsonPrint(bossroles)
                options[#options+1] = {
					action = function()
						openBossMenu(loc.gang, loc.job or loc.gang)
					end,
					job = loc.job and bossroles or nil,
					gang = loc.gang and bossroles or nil,
					icon = "fas fa-list",
					label = "Open BossMenu"..(debugMode == true and " ["..name.."]" or ""),
				}
            end
		elseif targetType == "PersonalStash" then
            options[#options+1] = {
				action = function()
					TriggerEvent("qb-clothing:client:openOutfitMenu")
				end,
				job = loc.job,
				gang = loc.gang,
				icon = "fas fa-tshirt",
				label = "Open Wardrobe"..(debugMode and " ["..name.."]" or ""),
			}
		elseif targetType == "BossMenus" then
			options[#options+1] = {
				action = function()
					toggleDuty()
				end,
				job = loc.job,
				gang = loc.gang,
				icon = "fas fa-user-check",
				label = "Toggle Duty"..(debugMode and " ["..name.."]" or ""),}
		end
		-- create target
		if target.prop then -- If spawning a prop, make entity target instead (ignores depth and width stuff)
			local width, depth, height = GetPropDimensions(target.prop.model)
			local coordAdjustment = target.prop.coords - vec4(0, 0, 1.03, 0)
			createBoxTarget({ name, vec3(coordAdjustment.x, coordAdjustment.y, coordAdjustment.z), width + 0.1, depth + 0.1, { name = name, heading = coords.w - 90.0, debugPoly = debugMode, minZ = coordAdjustment.z, maxZ = coordAdjustment.z + (height + 0.2), } }, options, targetType == "ManualRepair" and 10.0 or 2.0)


			-- need to test with ox
			--local width, depth, height = GetPropDimensions(target.prop.model)
			--local coordAdjustment = target.prop.coords - vec4(0, 0, 1.03, 0)
			--createBoxTarget({ name, vec3(coordAdjustment.x, coordAdjustment.y, coordAdjustment.z), width + 0.1, depth + 0.1, { name = name, heading = coords.w - 90.0, debugPoly = debugMode, minZ = coordAdjustment.z - ((height + 0.1) / 2), maxZ = coordAdjustment.z + ((height + 0.1) / 2), } }, options, targetType == "ManualRepair" and 10.0 or 2.0)
		else
			createBoxTarget({ name, vec3(coords.x, coords.y, coords.z - ((type == "Chairs" or type == "Poles") and 1.03 or 0.0)), target.width or 0.6, target.depth or 0.6, { name = name, heading = coords.w, debugPoly = debugMode, minZ = target.minZ or (coords.z - ((type == "Chairs" or type == "Poles") and 1.03 or 0.5)), maxZ = target.maxZ or ((coords.z - ((type == "Chairs" or type == "Poles") and 1.03 or 0.0)) + 1) }}, options, targetType == "ManualRepair" and 10.0 or 2.0)
		end
	end
end