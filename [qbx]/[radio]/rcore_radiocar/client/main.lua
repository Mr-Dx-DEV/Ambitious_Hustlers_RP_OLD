globalOptionsCache = {}
localVolumeMax = 100
isPlayerCloseToMusic = false
disableMusic = false

CreateThread(function()
    local kvpValue = GetResourceKvpInt("max_volume")
    if kvpValue == 0 then
        SetResourceKvpInt("max_volume", 100)
    else
        localVolumeMax = kvpValue
    end

    for k, v in pairs(soundInfo) do
        setVolumeMax(v.id, getVolume(v.id))
    end
end)

RegisterCommand("radiocarvolume", function(source, args, rawCommand)
    local vol = tonumber(args[1])
    if vol ~= nil then
        if vol >= 0 and vol <= 100 then
            localVolumeMax = vol
            ShowNotification(_U("updated_pref_volume", vol), "info")

            for k, v in pairs(soundInfo) do
                setVolumeMax(v.id, getVolume(v.id))
            end
            SetResourceKvpInt("max_volume", vol)
        else
            ShowNotification(_U("pref_vol_argument"), "danger")
        end
    else
        ShowNotification(_U("correct_usage_pref_vol"), "danger")
    end
end, false)

function getDefaultInfo()
    return {
        volume = 1.0,
        url = "",
        id = "",
        position = nil,
        distance = 8,
        playing = false,
        paused = false,
        loop = false,
        isDynamic = false,
        timeStamp = 0,
        maxDuration = 0,
        destroyOnFinish = true,
    }
end

function UpdatePlayerPositionInNUI(force)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)

    if not KilledTimersForNUI or force then
        SendNUIMessage({
            type = "position",
            x = pos.x,
            y = pos.y,
            z = pos.z
        })
    end
end

function GetDistanceForUpdateCoordsInNUI()
    return IsPedInAnyVehicle(PlayerPedId(), false) and 10.0 or 0.1
end

-- highsound needs only number from the identifier for entities and this
-- resource is sending net ID of the entity so we will just simply strip all chars and convert it to
-- number
function ConvertIdentifierToNumber(name)
    name = name:gsub("%D", "")
    return tonumber(name)
end

if not Config.UseExternalxSound then
    -- updating position on html side so we can count how much volume the sound needs.
    CreateThread(function()
        local refresh = Config.RefreshTime
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local lastPos = pos
        local changedPosition = false
        while true do
            Wait(refresh)
            if GetPlayerSpeed() >= 35 then
                Wait(300)
            end

            if not disableMusic and isPlayerCloseToMusic then
                ped = PlayerPedId()
                pos = GetEntityCoords(ped)

                -- we will update position only when player have moved
                if #(lastPos - pos) >= GetDistanceForUpdateCoordsInNUI() then
                    lastPos = pos
                    UpdatePlayerPositionInNUI()
                end

                if changedPosition then
                    UpdatePlayerPositionInNUI()
                    SendNUIMessage({ type = "unmuteAll" })
                end
                changedPosition = false
            else
                if not KilledTimersForNUI then
                    if not changedPosition then
                        changedPosition = true
                        SendNUIMessage({ type = "position", x = -900000, y = -900000, z = -900000 })
                        SendNUIMessage({ type = "muteAll" })
                    end
                    Wait(1000)
                end
            end
        end
    end)

    -- checking if player is close to sound so we can switch bool value to true.
    CreateThread(function()
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)
        while true do
            Wait(500)
            ped = PlayerPedId()
            playerPos = GetEntityCoords(ped)
            isPlayerCloseToMusic = false
            for k, v in pairs(soundInfo) do
                if v.position ~= nil and v.isDynamic then
                    if #(v.position - playerPos) < v.distance + Config.distanceBeforeUpdatingPos then
                        isPlayerCloseToMusic = true
                        break
                    end
                end
            end
        end
    end)

    -- updating timeStamp
    CreateThread(function()
        Wait(1100)

        while true do
            Wait(1000)
            for k, v in pairs(soundInfo) do
                if v.playing or v.wasSilented then
                    if getInfo(v.id).timeStamp ~= nil and getInfo(v.id).maxDuration ~= nil then
                        if getInfo(v.id).timeStamp < getInfo(v.id).maxDuration then
                            getInfo(v.id).timeStamp = getInfo(v.id).timeStamp + 1
                        end
                    end
                end
            end
        end
    end)

    CreateThread(function()
        local ped = PlayerPedId()
        local playerPos = GetEntityCoords(ped)
        local brokenOne = {}
        local allowedToPlay = {}

        if not Config.MaxPlayingSounds then
            Config.MaxPlayingSounds = 6
        end

        while true do
            Wait(500)
            ped = PlayerPedId()
            playerPos = GetEntityCoords(ped)

            local closestMusic = {}
            for k, mData in pairs(soundInfo) do
                table.insert(closestMusic, {
                    id = mData.id,
                    distance = #(playerPos - mData.position),
                })

                allowedToPlay[mData.id] = true
            end
            table.sort(closestMusic, function(a, b)
                return a.distance < b.distance
            end)

            for i = #closestMusic, Config.MaxPlayingSounds + 1, -1 do
                allowedToPlay[closestMusic[i].id] = nil
                closestMusic[i] = nil
            end

            for k, mData in pairs(soundInfo) do
                if mData.position ~= nil and mData.isDynamic then
                    if #(mData.position - playerPos) < (mData.distance + Config.distanceBeforeUpdatingPos) and allowedToPlay[mData.id] then
                        if brokenOne[mData.id] then
                            brokenOne[mData.id] = nil
                            mData.wasSilented = false
                            mData.skipTimestamp = true
                            PlayUrlPos(mData.id, mData.url, mData.volume, mData.position, mData.loop)
                            onPlayStart(mData.id, function()
                                if getInfo(mData.id).maxDuration then
                                    setTimeStamp(mData.id, mData.timeStamp or 0)
                                end
                                Distance(mData.id, mData.distance)
                                SetLowpassSound(mData.id, mData.lowpassStatus)
                            end)
                        end
                    else
                        if not brokenOne[mData.id] then
                            mData.wasSilented = true
                            brokenOne[mData.id] = true
                            DestroySilent(mData.id)
                        end

                        allowedToPlay[mData.id] = nil
                    end
                end
            end
        end
    end)

    CreateThread(function()
        Wait(5000)
        local disableMusic = false
        if GetResourceState(Config.xSoundName) == "missing" or GetResourceState(Config.xSoundName) == "unknown" then
            TriggerEvent('chat:addSuggestion', "/streamermode", "Will enable streamer mode")

            RegisterCommand("streamermode", function(source, args, rawCommand)
                disableMusic = not disableMusic

                if disableMusic then
                    TriggerEvent('chat:addMessage', { args = { "^1[xSound]", Config.Messages["streamer_on"] } })
                else
                    TriggerEvent('chat:addMessage', { args = { "^1[xSound]", Config.Messages["streamer_off"] } })
                end

                TriggerEvent("xsound:streamerMode", disableMusic)
            end, false)
        end
    end)
end