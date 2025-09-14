function createTarget(type, targets, id, loc, bossroles, stashCraft)
	if not targets or not targets[1] then return end
	for i, target in ipairs(targets) do
		local name = getScript()..":"..id..":"..type.."["..i.."]"
		if target.prop then -- If spawning a prop, make entity target instead (ignores depth and width stuff)
			makeDistProp({ prop = target.prop.model, coords = target.prop.coords }, true, false)
		end
		if type == "Poles" then
			local prop = makeProp({
				prop = "prop_strip_pole_01",
				coords = target.coords - vec4(0.00, 0.29, 0.40, 0) },
				1, 0
			)
			SetEntityAlpha(prop, 0)
			DisableCamCollisionForEntity(prop)
		end

		if type == "Strippers" then
			local rand = math.random(1,3)
			local randped = math.random(1,2)
			makePed("CSB_Stripper_0"..randped, target.coords, true, true, nil, { "mini@strip_club@private_dance@part"..rand, "priv_dance_p"..rand })
			target.coords -= vec4(0,0, 1.0, 0)
		end


		local coords = target.prop and target.prop.coords or target.coords

		local options = { {
			action = function(data)
				if type == "Stash" then
					openStash({
						job = loc.job,
						gang = loc.gang,
						stash = target.stashName,
						label = target.stashLabel..(loc.StashCraft == target.stashName and "*" or ""),
						coords = coords.xyz,
						maxWeight = target.maxWeight or 400000,
						slots = target.slots or 10
					})

				elseif type == "Shop" then
					openShop({
						job = loc.job,
						gang = loc.gang,
						shop = target.shopName,
						items = target.items,
						coords = coords.xyz
					})

				elseif type == "BeerTap" then
					beerTapMenu({
						job = loc.job,
						gang = loc.gang,
						menu = target.Menu,
						coords = coords.xyz,
						stash = target.stash
					})

				elseif type == "Crafting" then
					craftingMenu({
						job = loc.job,
						gang = loc.gang,
						craftable = target.craftable,
						coords = coords.xyz,
						stashName = stashCraft
					})

				elseif type == "PublicStash" then
					openStash({
						stash = target.stashName,
						label = target.stashLabel,
						coords = coords.xyz,
						maxWeight = target.maxWeight or 400000,
						slots = target.slots or 10
					})
					if target.prop then

						debugPrint("^6Debug^7: ^2Waiting for inventory to close^1")
						Wait(1000)

						while isInventoryOpen() do
							Wait(10)
						end -- Wait for inventory to close
						debugPrint("^6Debug^7: ^2Inventory Closed^7, ^2getting stash info^7")

						local tempStashInfo = triggerCallback(getScript()..':server:GetStashItems', target.stashName)

						if countTable(tempStashInfo) > 0 then
							debugPrint("^6Debug^7: ^2Stash not empty^7, ^2Asking server to ^3add ^2Stash Prop Indicator^1")
							TriggerServerEvent(getScript()..":server:StashPropHandle", target, data, false)

						else
							debugPrint("^6Debug^7: ^2Stash empty^7, ^2Asking server to ^3remove ^2Stash Prop Indicator")
							TriggerServerEvent(getScript()..":server:StashPropHandle", target, data, true)

						end
					end

				elseif type == "BossStash" then
					openStash({
						stash = target.stashName,
						label = target.stashLabel,
						coords = coords.xyz,
						maxWeight = target.maxWeight or 400000,
						slots = target.slots or 10
					})

				elseif type == "Payments" then
					billPlayer({
						job = loc.job,
						gang = loc.gang,
						coords = coords.xyz,
						img = loc.logo
					})

				elseif type == "Clockin" then
					toggleDuty()

				elseif type == "BossMenus" then
					openBossMenu(
						loc.gang and true or false,
						loc.job or loc.gang
					)

				elseif type == "WashHands" then
					washHands({
						coords = coords
					})

				elseif type == "Toilets" then
					useToilet({
						sitcoords = vec4(coords.x, coords.y, coords.z+0.5, coords.w),
						urinal = target.urinal
					})

				elseif type == "Doors" then
					useDoor({
						telecoords = target.telecoords
					})

				elseif type == "Box" then
					GrabBox(target)

				elseif type == "PersonalStash" then
					local citizenId = getPlayer().citizenId

					if isStarted(OXInv) then
						currentToken = triggerCallback(AuthEvent)
						Wait(100)

						TriggerServerEvent(getScript()..":server:makeOXStash",
							target.stashName .. citizenId,
							"Personal Storage ("..target.stashName .. citizenId..")",
							target.slots or 10,
							target.maxWeight or 400000,
							citizenId,
							target.coords,
							currentToken
						)
						currentToken = nil
					end
					openStash({
						stash = target.stashName..citizenId,
						label = "Personal Storage ("..target.stashName .. citizenId..")",
						coords = coords.xyz,
						maxWeight = target.maxWeight or 400000,
						slots = target.slots or 10
					})

				elseif type == "Outfit" then
					TriggerEvent("qb-clothing:client:openOutfitMenu")

				elseif type == "Chairs" then
					SitChair({
						loc = coords,
						stand = target.stand
					})
				elseif type == "Menu" then

					exports["jim-imagedisplay"]:showJobMenu(id.."_"..(loc.job or loc.gang))

				elseif type == "Poles" then
					PoleDance({
						loc = target.coords,
						pole = math.random(1, 3)
					})

				elseif type == "DanceTables" then
					TableDance({
						loc = target.coords
					})

				elseif type == "Strippers" then
					PayStrep({
						ped = data,
						job = loc.job,
					})

				elseif type == "DuiSign" then
					DuiSelect({
						name = id,
						texn = target["tex"].texn,
						texd = target["tex"].texd,
						size = target["tex"].size,
						url = target.url
					})
				end
			end,
			icon = target.icon or (type == "DuiSign" and "fas fa-circle-check" or "fas fa-chair"),
			label = (target.label or  type == "DuiSign" and locale("targetinfo", "duiAdd") or (((type == "Poles" or type == "DanceTables") and locale("targetinfo", "dance")) or locale("targetinfo", "sit")))..(debugMode and " ["..name.."]" or "")..((loc.StashCraft and loc.StashCraft == target.stashName) and "*" or ""),
			job = ((type == "BossMenus" or type == "BossStash" or type == "DuiSign") and bossroles) or ((type ~= "Toilets" and type ~= "WashHands" and type ~= "PublicStash" and type ~= "Chairs" and type ~= "Menu" and type ~= "Poles" and type ~= "Strippers" and type ~= "DanceTables") and loc.job or nil),
			gang = ((type == "BossMenus" or type == "BossStash" or type == "DuiSign") and bossroles) or ((type ~= "Toilets" and type ~= "WashHands" and type ~= "PublicStash" and type ~= "Chairs" and type ~= "Menu" and type ~= "Poles" and type ~= "Strippers" and type ~= "DanceTables") and loc.gang or nil),
		}, }
		-- extra conditonal options
		if type == "Payments" then
            if Config.General.showClockInTill and not loc.gang then
                options[#options+1] = {
					action = function()
						toggleDuty()
					end,
					job = loc.job,
					gang = loc.gang,
					icon = "fas fa-user-check",
					label = locale("targetinfo", "duty")..(debugMode and " ["..name.."]" or ""),
				}
            end
            if Config.General.showBossMenuTill then
                options[#options+1] = {
					action = function()
						openBossMenu(
							loc.gang and true or false,
							loc.job or loc.gang
						)
					end,
					job = loc.job and bossroles or nil,
					gang = loc.gang and bossroles or nil,
					icon = "fas fa-list",
					label = locale("targetinfo", "open_bossmenu")..(debugMode == true and " ["..name.."]" or ""),
				}
            end
		elseif type == "Menu" then
			options[#options+1] = {
				action = function()
					exports["jim-imagedisplay"]:addJobMenuLink(id.."_"..(loc.job or loc.gang))
				end,
				job = loc.job and bossroles,
				gang = loc.gang and bossroles,
				icon = "fas fa-file-circle-plus",
				label = "Add Food Menu Image"..(loc.debug and " ["..name.."]" or ""),
			}

        elseif type == "PersonalStash" then
            options[#options+1] = {
				action = function()
					TriggerEvent("qb-clothing:client:openOutfitMenu")
				end,
				job = loc.job,
				gang = loc.gang,
				icon = "fas fa-tshirt",
				label = locale("targetinfo", "open_wardrobe")..(debugMode and " ["..name.."]" or ""),
			}
		elseif type == "BossMenus" then
			if Locations[id].Menu then
				options[#options+1] = {
					action = function()
						exports["jim-imagedisplay"]:addJobMenuLink(id.."_"..(loc.job or loc.gang)) end,
						job = loc.job and bossroles,
						gang = loc.gang and bossroles,
						icon = "fas fa-file-circle-plus",
						label = "Add Food Menu Image"..(loc.debug and " ["..name.."]" or ""),
					}
			end

		elseif type == "DuiSign" then
			options[#options+1] = {
				action = function()
					TriggerServerEvent(getScript()..":Server:ChangeDUI", {
						name = id,
						texn = target["tex"].texn,
						texd = target["tex"].texd,
						size = target["tex"].size,
						url = target.preset
					})
				end,
				icon = "fas fa-circle-minus",
				label = locale("targetinfo", "duiReset"),
				job = loc.job,
				gang = loc.gang
			}
			options[#options+1] = {
				action = function()
					TriggerServerEvent(getScript()..":Server:ClearDUI", {
						name = id,
						texn = target["tex"].texn,
						texd = target["tex"].texd,
						url = "-"
					})
				end,
				icon = "fas fa-circle-xmark",
				label = locale("targetinfo", "duiClear"),
				job = loc.job,
				gang = loc.gang
			}
		end
		-- create target
		if target.prop then -- If spawning a prop, make entity target instead (ignores depth and width stuff)
			local width, depth, height = GetPropDimensions(target.prop.model)
			local coordAdjustment = target.prop.coords - vec4(0, 0, 1.03, 0)
			createBoxTarget({
				name,
				vec3(coordAdjustment.x, coordAdjustment.y, coordAdjustment.z),
				width + 0.1,
				depth + 0.1,
				{
					name = name,
					heading = coords.w - 90.0,
					debugPoly = debugMode,
					minZ = coordAdjustment.z - ((height + 0.1) / 2),
					maxZ = coordAdjustment.z + ((height + 0.1) / 2),
				}
			}, options, 2.0)
		else
			createBoxTarget({
				name,
				vec3(coords.x, coords.y, coords.z - ((type == "Chairs" or type == "Poles") and 1.03 or 0.0)),
				target.width or 0.6,
				target.depth or 0.6,
				{
					name = name,
					heading = coords.w,
					debugPoly = debugMode,
					minZ = target.minZ or (coords.z - ((type == "Chairs" or type == "Poles") and 1.03 or 0.5)),
					maxZ = target.maxZ or ((coords.z - ((type == "Chairs" or type == "Poles") and 1.03 or 0.0)) + 1)
				}}, options, 2.0)
		end
	end
end