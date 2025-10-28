local seat = 0
function SitChair(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()

    local players = {}
    local activePlayers = GetActivePlayers()
    for i = 1, #activePlayers do
        local ped = GetPlayerPed(activePlayers[i])
        if DoesEntityExist(ped) then players[#players+1] = activePlayers[i] end
    end

    for i = 1, #players do
		local targetdistance = #(GetEntityCoords(GetPlayerPed(players[i])) - data.loc.xyz)
		if targetdistance <= 0.4 then
			triggerNotify(nil, locale("error", "someone_sitting_here"), "error")
			canSit = false
		end
    end

	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(ped)) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		seat = data.stand and vec4(data.stand.x, data.stand.y, data.stand.z - 0.5, data.stand.w or data.loc[4]) or nil
		sitting = true
	end

	Wait(1000)
	--drawText("fas fa-chair", {(Config.System.drawText == "gta" and "~INPUT_CELLPHONE_CANCEL~" or "[Backspace]").." Stand up"}, "g")
	while sitting do
		makeInstructionalButtons({ { text = "Stand up", keys = { 194 } }, })
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				hideText()
				ClearPedTasks(ped)
				if seat then SetEntityCoords(ped, seat) end
				seat = nil
			end
		end
		Wait(0)
		if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
			sitting = false
		end
	end
end

function GrabBox(data)
	if not localDistCheck("Box") then
		return
	end
	if progressBar({
		label = data.prog,
		time = 2000,
		cancel = true,
		dict = "anim@heists@prison_heiststation@cop_reactions",
		anim = "cop_b_idle",
		flag = 32,
	}) then
		TriggerServerEvent(getScript()..":server:requestBoxItem", data.item)
	else
		triggerNotify(nil, "Cancelled")
	end
	stopAnim("anim@heists@prison_heiststation@cop_reactions", "cop_b_idle")
end

function GetNearestPlayer(coords)
	local players = {}
    local activePlayers = GetActivePlayers()
	local result = true
	for i = 1, #activePlayers do
        local ped = GetPlayerPed(activePlayers[i])
        if DoesEntityExist(ped) then players[#players+1] = activePlayers[i] end
    end
    for i = 1, #players do
		local targetdistance = #(GetEntityCoords(GetPlayerPed(players[i])) - coords.xyz)
		if targetdistance <= 0.4 then
			triggerNotify(nil, locale("error", "someone_dance"))
			result = false
			break
		end
    end
	return result
end

local dancing = false
function PoleDance(data)
	local Ped = PlayerPedId()
	if data.pole > 3 then data.pole = math.random(1,3) end

    local canDance = GetNearestPlayer(data.loc)
	if canDance then
		--drawText("fas fa-person-dress", {"[Backspace] Stop Dancing"})
		loadAnimDict('mini@strip_club@pole_dance@pole_dance'..data.pole)
		local scene = NetworkCreateSynchronisedScene(vec3(data.loc.x, data.loc.y, data.loc.z), vec3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(Ped, scene, 'mini@strip_club@pole_dance@pole_dance' .. data.pole, 'pd_dance_0' .. data.pole, 1.5, -4.0, 1, 1, 1148846080, 0)
		NetworkStartSynchronisedScene(scene)
		dancing = true
	end
	local wait = 500
	while dancing do
		Wait(wait)
		if dancing then
			makeInstructionalButtons({ { text = "Stop Dancing", keys = { 194 } }, })
			if IsControlJustReleased(0, 202) then
				if IsEntityPlayingAnim(Ped, "mini@strip_club@pole_dance@pole_dance"..data.pole, "pd_dance_0"..data.pole, 3) then
					dancing = false
					ClearPedTasks(Ped)
				end
			end
			wait = 0
			if not IsEntityPlayingAnim(Ped, "mini@strip_club@pole_dance@pole_dance"..data.pole, "pd_dance_0"..data.pole, 3) then
				dancing = false
			end
		end
	end
	for i = 1, 3 do
		unloadAnimDict("mini@strip_club@pole_dance@pole_dance"..i)
	end
end

function TableDance(data)
	local Ped = PlayerPedId()
    local canDance = GetNearestPlayer(data.loc)
	local dancenumber = math.random(1, 2)

	if canDance then
		loadAnimDict('mini@strip_club@private_dance@part'..dancenumber)
		local scene = NetworkCreateSynchronisedScene(vec3(data.loc.x, data.loc.y, data.loc.z+1), vec3(0.0, 0.0, 0.0), 2, false, true, 1065353216, 0, 1.3)
		NetworkAddPedToSynchronisedScene(PlayerPedId(), scene, 'mini@strip_club@private_dance@part'..dancenumber, 'priv_dance_p'..dancenumber, 1.5, -4.0, 1, 1, 1148846080, 0)
		SetEntityHeading(Ped, data.loc[4])
		NetworkStartSynchronisedScene(scene)
		dancing = true
	end
	local wait = 500
	while dancing do
		Wait(wait)
		if dancing then
			makeInstructionalButtons({ { text = "Stop Dancing", keys = { 194 } }, })
			if IsControlJustReleased(0, 202) then
				if IsEntityPlayingAnim(Ped, "mini@strip_club@private_dance@part"..dancenumber, "priv_dance_p"..dancenumber, 3) then
					dancing = false
					ClearPedTasks(Ped)
				end
			end
			wait = 0
			if not IsEntityPlayingAnim(Ped, "mini@strip_club@private_dance@part"..dancenumber, "priv_dance_p"..dancenumber, 3) then
				dancing = false
			end
		end
	end
	for i = 1, 3 do unloadAnimDict("mini@strip_club@private_dance@part"..i) end
end

local inJacuzzi = false
function makeJacuzzi(loc)
	for i, target in ipairs(loc) do
		local name = getScript()..":"..":Jacuzzi["..i.."]"
		createCirclePoly({
			name = name,
			coords = target.coords,
			radius = 1.25,
			onEnter = function()
				inJacuzzi = true
				CreateThread(function()
					while inJacuzzi do
						Wait(5000)
						TriggerServerEvent('hud:server:RelieveStress', Config.General.JacuzzisStress)
					end
					Wait(100)
				end)
			end,
			onExit = function()
				inJacuzzi = false
			end,
			debug = debugMode,
		})
	end
end

function PayStrep(data)
	local stripper = type(data.ped) == "table" and data.ped.entity or data.ped
	local Ped = PlayerPedId()
	local playerInfo = getPlayer()
	-- Check if player has cash to give
	if playerInfo.cash >= Config.Club.TipCost then
		TriggerServerEvent(getScript()..":server:StrepTip", data)
	else
		triggerNotify(nil, "Not Enough Cash", "error")
		return
	end

	--Spawn money and hand to ped
	local propData = {
		prop = 'prop_anim_cash_note',
		coords = vec4(0,0,0,0)
	}
	local cashProp = makeProp(propData, true, false)
	ClearPedTasks(stripper)
	AttachEntityToEntity(cashProp, Ped, GetPedBoneIndex(Ped, 57005), 0.1, -0.0, 0.0, -180.0, 0.0, 0.0, true, true, false, true, 1, true)
	playAnim("mp_common", "givetake2_b", 0.3, 16, stripper, 1.0)
	playAnim("mp_common", "givetake2_a", -1, 16, Ped, 1.0)

	--Take Money and stop animiation
	Wait(1000)
	AttachEntityToEntity(cashProp, stripper, GetPedBoneIndex(stripper, 57005), 0.1, -0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
	Wait(1000)
	stopAnim("mp_common", "givetake2_b", Ped)
	stopAnim("mp_common", "givetake2_a", stripper)
	destroyProp(cashProp)

	cashProp = nil
	CreateThread(function()
		FreezeEntityPosition(stripper, false)
		if not IsPedHeadingTowardsPosition(stripper, GetEntityCoords(Ped), 20.0) then
			TaskTurnPedToFaceCoord(stripper, GetEntityCoords(Ped), 1500)
			Wait(1600)
		end
		--Blow kiss
		playAnim("anim@mp_player_intselfieblow_kiss", "exit", 0.3, 16, stripper, 1.0)
		Wait(3000)
		--Relieve stress and heal 2hp
		TriggerServerEvent('hud:server:RelieveStress', Config.Club.TipStress)

		local rand = math.random(1,3)
		loadAnimDict("mini@strip_club@private_dance@part"..rand)
		TaskPlayAnim(stripper, "mini@strip_club@private_dance@part"..rand, "priv_dance_p"..rand, 1.0, 1.0, -1, 1, 0.2, 0, 0, 0)
		if not IsPedHeadingTowardsPosition(stripper, GetEntityCoords(Ped), 20.0) then
			TaskTurnPedToFaceCoord(stripper, GetEntityCoords(Ped), 1500)
			Wait(1600)
		end
		FreezeEntityPosition(stripper, true)
	end)
end

local stashProp = {}
RegisterNetEvent(getScript()..":client:StashPropHandle", function(target, data, remove)
	local entity = type(data) == "table" and data.entity or data
	local coords = target.prop and target.prop.coords or target.coords
	if DoesEntityExist(stashProp[target.stashName]) then
		DeleteEntity(stashProp[target.stashName])
		stashProp[target.stashName] = nil
	end
	if not remove then
		if target.prop then
			coords = GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.0, 1.03)
			stashProp[target.stashName] = makeProp({ prop = "prop_paper_bag_01", coords = vec4(coords.x, coords.y, coords.z, GetEntityHeading(entity)) }, true, false)
		else
			stashProp[target.stashName] = makeProp({ prop = "prop_paper_bag_01", coords = vec4(coords.x, coords.y, coords.z+1.23, math.random(1, 359) + 0.0) }, true, false)
		end
	end
end)

-- Beer Tap + Keg features
function dispenserMenu(data)
	CreateThread(function() lookEnt(data.coords) end)
	if not localDistCheck("Dispenser") then
		return
	end

	local tempTable = {}
	local result = {}
	local Menu = {}
	if Config.General.DispenserSystem then
		result = triggerCallback(getScript()..':server:GetStashItems', data.stash) or {}
		jsonPrint(result)
	end
	local stashContents = {}
	for i = 1, #result do
		stashContents[result[i].name] = {
			meta = result[i].metadata or result[i].info or {},
			slot = result[i].slot,
		}
	end
	for k, v in pairs(data.menu) do
		if Config.General.DispenserSystem then
			if v.requiredItem then
				if stashContents[v.requiredItem] then
					tempTable[k] = {
						metadata = {
							durability = stashContents[v.requiredItem].meta and stashContents[v.requiredItem].meta.durability or 0
						},
						slot = stashContents[v.requiredItem].slot,
						requiredItem = v.requiredItem
					}
				else
					tempTable[k] = {
						metadata = { durability = 0 },
						slot = 0,
						requiredItem = nil,
					}
				end
			else
				tempTable[k] = {
					metadata = { durability = 100 },
					slot = 0,
				}
			end
		else
			tempTable[k] = {
				metadata = { durability = 100 },
				slot = 0,
			}
		end
	end

	for k, v in pairsByKeys(tempTable) do
		local prog = v.metadata.durability
		Menu[#Menu+1] = {
			isMenuHeader = prog <= 0,
			arrow = prog > 0,
			icon = invImg(k),
			image = invImg(k),
			header = getItemLabel(k),
			txt = Config.General.DispenserSystem and (prog <= 0 and locale("menu", "needReplace") or locale("menu", "level")..prog.."%") or nil,
			progress = Config.General.DispenserSystem and (prog > 1 and prog or nil) or nil,
			colorScheme = Config.General.DispenserSystem and (prog <= 25 and "red" or (prog <= 50 and "yellow" or "green")) or nil,
			onSelect = function()
				dispenserMulti({
					item = k,
					metadata = v.metadata,
					slot = v.slot,
					stash = data.stash,
					amount = 1,
				})
			end,
		}
	end
	openMenu(Menu, { header = data.label, })
end

-- i hate multicraft -- checks how many it can craft, then checks if you can hold them
function dispenserMulti(data)
	local input = lib.inputDialog('Beer Tap', {
		{ 	type = 'slider',
			label = locale("menu", "how_many"),
			required = true,
			default = 1,
			min = 1,
			max = (data.metadata.durability * 2)
		},
	})
	if input then
		local tempTable = { [data.item] = input[1] }
		local canCarryTable = triggerCallback(getScript()..':server:canCarry', tempTable)
		if canCarryTable[data.item] then
			data.amount = input[1]
			dispenserPour(data)
		else
			triggerNotify(nil, "You can't hold that many", "error")
			return dispenserMulti(data)
		end
	else
		return
	end
end

function dispenserPour(data)
	for i = 1, data.amount do
		local metaUpdate = data.metadata
		if data.requiredItem then
			local randomRemove = 0.5							-- hard set to 0.5 so you get 200 pints in a keg.
			metaUpdate.durability -= randomRemove
		end
		if progressBar({
			label = "Pouring "..getItemLabel(data.item),
			time = math.random(4000, 5000),
			cancel = true,
			dict = CraftingEmotes.Pour.animDict,
			anim = CraftingEmotes.Pour.anim,
			flag = 49,
		}) then
			if data.requiredItem then
				TriggerServerEvent(getScript()..":server:setStashMetaData", { stash = data.stash, slot = data.slot, metadata = metaUpdate })
			end
			TriggerServerEvent(getScript()..":server:requestDispenserItem", data.item)
		else
			break
		end
	end
end

RegisterNetEvent(getScript()..':client:Consume', function(data)
	local name = data.name or data.client.item

	if isStarted("jim-consumables") then -- if jim-consumables is found, reroute to that script
		TriggerServerEvent("jim-consumables:RegisterConsuming", name)	-- trigger server side that consuming is happening
		TriggerEvent("jim-consumables:Consume", name)

	else -- if you dont have jim-consumables, use the simplified consume event
		TriggerServerEvent(getScript()..":RegisterConsuming", name)	-- trigger server side that consuming is happening
		local consumable = Consumables[name]
		if not consumable then
			return print("^1Error^7: ^2Consuamble^7[^5"..name.."^7]^2 info not found check ^7/^2consumables^7")
		end
		local emote = Emotes[consumable.emote]
		if not emote then
			print("^1Error^7: ^2Emote^7[^5"..consumable.emote.."^7]^2 info not found check ^7/^2consumables^7")
		else
			playEmote(emote)
		end
		local progstring = ""
		if consumable.stats then
			progstring = consumable.type == "food" and locale("progressbar", "progress_eat") or locale("progressbar", "progress_drink")
		end
		if progressBar({
			label = progstring..getItemLabel(name).."..",
			time = GetRandomTiming(consumable.time),
			cancel = true,
			icon = name
		}) then

			local hunger = consumable.stats.hunger or nil
			local thirst = consumable.stats.thirst or nil
			local stress = consumable.stress or nil
			if hunger then hunger = GetRandomTiming(hunger) end
			if thirst then thirst = GetRandomTiming(thirst) end
			if stress then stress = GetRandomTiming(stress) end

			TriggerServerEvent(getScript()..":server:finishConsume", { thirst = thirst or 0, hunger = hunger or 0, stress = stress or 0 })

			if type == "alcohol" then
				if checkExportExists("jim_bridge", "addAlcoholCount") then
					exports.jim_bridge:addAlcoholCount(1, stats.canOD)
				else
					alcoholCount = (alcoholCount or 0) + 1
					if alcoholCount > 1 and alcoholCount < 4 then
						TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
					elseif alcoholCount >= 4 then
						TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
						CreateThread(function()
							AlienEffect()
						end)
					end
				end
			end
		else
			TriggerServerEvent(getScript()..":server:stopConsume")
		end
		if emote then
			stopEmote(emote[1], emote[2])
		end
	end
end)

local PlayerProps = {}

function AddPropToPlayer(propName, bone, posX, posY, posZ, rotX, rotY, rotZ)
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
	local prop = makeProp({ prop = propName, coords = vec4(pedCoords.x, pedCoords.y, pedCoords.z, 0.0) }, true, true)
    AttachEntityToEntity(prop, ped, GetPedBoneIndex(ped, bone), posX, posY, posZ, rotX, rotY, rotZ, true, true, false, true, 1, true)
    table.insert(PlayerProps, prop)
    unloadModel(propName)
end

function playEmote(emote)
    if not emote then return end

    local animOptions = emote.AnimationOptions or {}

    local InVehicle = IsPedInAnyVehicle(PlayerPedId(), true)
	local flag = 0
    if InVehicle == 1 then
        flag = 51
    elseif animOptions then
        if animOptions.EmoteMoving then
            flag = 51
        elseif animOptions.EmoteLoop then
            flag = 1
        elseif animOptions.EmoteStuck then
            flag = animOptions.EmoteMoving and 50 or 2
        elseif animOptions.EmoteMoving == false then
            flag = 0
        end
    end
    playAnim(emote[1], emote[2], animOptions.EmoteDuration or -1, flag)

    if animOptions.Prop then AddPropToPlayer(animOptions.Prop, animOptions.PropBone, table.unpack(animOptions.PropPlacement)) end
	if animOptions.SecondProp then AddPropToPlayer(animOptions.SecondProp, animOptions.SecondPropBone, animOptions.SecondPropPlacement) end
end

function stopEmote(animDict, animName)
    stopAnim(animDict, animName)
    for _, prop in ipairs(PlayerProps) do destroyProp(prop) end
    PlayerProps = {}
end
