onResourceStart(function()
	local itemCache = {}
	local emoteCache = {}
	for _, v in pairs(Locations) do
		if v.Box then
			if not isStarted(OXInv) then
				createUseableItem(v.Box[1].item, function(source, item)
					TriggerClientEvent(getScript()..':openGrabBox', source, item)
				end)
			end
		end
	end

	if isStarted("jim-consumables") or isStarted("jim-consumables-main") then -- double check
		Wait(10)
		for item, info in pairsByKeys(Consumables) do
			if itemCache[item] then
				print("Skipping: "..itemCache[item].." has already loaded item: "..item)
			else
				itemCache[item] = "Consumables"
				TriggerEvent("jim-consumables:server:syncAddItem", item, info)
			end
		end

		for emote, info in pairsByKeys(Emotes) do
			if emoteCache[emote] then
				print("Skipping: "..emoteCache[emote].." has already loaded item: "..emote)
			else
				emoteCache[emote] = "sharedEmotes"
				TriggerEvent("jim-consumables:server:syncAddEmote", emote, info)
			end
		end

		debugPrint("^2Loaded ^3"..countTable(itemCache).."^2 consumable items into jim-consumables^1")
		debugPrint("^2Loaded ^3"..countTable(emoteCache).."^2 emotes into jim-consumables^1")
	end
end, false)

onResourceStart(function()
	for k in pairsByKeys(Consumables) do -- scan through consumables and make them usable
		createUseableItem(k, function(source, item)
			TriggerClientEvent(getScript()..':client:Consume', source, {
				client = {
					item = item.name,
					type = Consumables[k].type
				}
			})
		end)
	end
end, true)