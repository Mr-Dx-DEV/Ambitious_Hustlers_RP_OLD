local isConsuming = {}

onResourceStart(function()
	local itemCache = {}
	local emoteCache = {}
	for _, v in pairs(Locations) do
		if v.Box and v.Box[1] then
            createUseableItem(v.Box[1].item, function(source, item)
                local src = source
                local coords = GetEntityCoords(GetPlayerPed(src))
                local id = item.info and item.info.id or item.metadata and item.metadata.id
                if id then
                    registerStash(id, item.label..(debugMode and " "..id or ""), nil, nil, nil, coords )
                    TriggerClientEvent(getScript()..':openGrabBox', source, item, {
                        slots = 5,
                        maxWeight = 100000,
                    })
                end
            end)
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
	else
        for k, v in pairs(Consumables) do
            createUseableItem(k, function(source, item)
                local src = source
                if not isConsuming[src] and hasItem(item.name, 1, src) then

                    registerConsume(src, item.name)
                    TriggerClientEvent(getScript()..':Consume', src, item.name)

                end
            end)
        end
    end
end, false)

function registerConsume(src, item)
    -- Start building server sided item return table
    local consumable = Consumables[item]
    isConsuming[src] = {
        item = item,
        packItem = checkPackItem(consumable) or nil
    }
    debugPrint("^5Debug^7: ^2Player ^3"..src.." ^2started consuming ^7'^2"..item.."^7'")
end

RegisterNetEvent(getScript()..":RegisterConsuming", function(item)
    local src = source
    registerConsume(src, item)
end)

-- Return item
function checkPackItem(consumable)
    local result = nil
    if consumable.pack then
        result = {
            item = consumable.pack.item,
            amount = consumable.pack.amount
        }
    end
    return result
end

-- GiveItems
RegisterNetEvent(getScript()..":server:finishConsume", function(needTypes)
    local src = source
	if isConsuming[src] ~= nil then
        removeItem(isConsuming[src].item, 1, src)
        if isConsuming[src].packItem then
            debugPrint("^5Debug^7: ^2Giving player ^3"..src.." ^2Pack items^7")
            local item = isConsuming[src].packItem
            addItem(item.item, item.amount, nil, src)
        end

		if Config.Rewards then
			getRandomReward(isConsuming[src].item, src)
		end

        -- Needs
        if needTypes.thirst then
            debugPrint("^5Debug^7: ^2Thrist^7: [^6"..(needTypes.thirst or 0).."^7]")
            setThirst(src, needTypes.thirst)
        end
        if needTypes.hunger then
            debugPrint("^5Debug^7: ^2Hunger^7: [^6"..(needTypes.hunger or 0).."^7]")
            setHunger(src, needTypes.hunger)
        end
        if needTypes.stress then
            debugPrint("^5Debug^7: ^2Stress^7: [^6"..(needTypes.stress or 0).."^7]")
            setStress(src, needTypes.stress)
        end
        isConsuming[src] = nil
    else
        return
    end
end)

RegisterNetEvent(getScript()..":server:stopConsume", function()
    local src = source
    debugPrint("^5Player stopped consuming early^7", src)
    isConsuming[src] = nil
end)