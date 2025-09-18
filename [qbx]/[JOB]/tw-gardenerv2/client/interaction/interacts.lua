local interactions = customRequire 'client/interaction/interactions'
local utils = customRequire 'client/interaction/utils'
local playerState = LocalPlayer.state
local disableInteraction = false

-- CACHE
local SetDrawOrigin = SetDrawOrigin
local DrawSprite = DrawSprite
local ClearDrawOrigin = ClearDrawOrigin
local Wait = Wait
local IsControlJustPressed = IsControlJustPressed
local SetScriptGfxAlignParams = SetScriptGfxAlignParams
local ResetScriptGfxAlign = ResetScriptGfxAlign
local IsNuiFocused = IsNuiFocused
local IsPedDeadOrDying = IsPedDeadOrDying
local IsPedCuffed = IsPedCuffed
local GetScreenCoordFromWorldCoord = GetScreenCoordFromWorldCoord
local GetGameTimer = GetGameTimer

local selected, unselected, interact, pin = 'selected', 'unselected', 'interact', 'pin'

local currentSelection = 0
local currentInteraction = 0
local CurrentTarget = 0
local currentAlpha = 255


local cachedCoords = {}
local lastFrameTime = 0
local frameInterval = 0
local performanceConfig = {
    minInterval = 0, 
    maxInterval = 32,
    cleanupInterval = 5000, 
    lastCleanup = 0
}

local function createOption(coords, option, id, width, showDot, alpha)
    if not coords or not option then return end
    utils.drawOption(coords, option.label, 'tw_gardenerv2_txd', currentSelection == id and selected or unselected, id - 1, width, showDot, alpha)
end

local math_max = math.max
local math_min = math.min

local nearby, nearbyAmount = {}, 0

local function CreateInteractions()
    local currentTime = GetGameTimer()
    
    if currentTime - lastFrameTime < frameInterval then
        return
    end
    lastFrameTime = currentTime
    
    if currentTime - performanceConfig.lastCleanup > performanceConfig.cleanupInterval then
        clearCache()
        performanceConfig.lastCleanup = currentTime
    end

    local targetInterval = math.min(
        performanceConfig.maxInterval,
        math.max(performanceConfig.minInterval, nearbyAmount * 2)
    )
    frameInterval = math.floor((frameInterval + targetInterval) / 2)

    for i = 1, nearbyAmount do
        local interaction = nearby[i]
        if not interaction then goto continue end

        local coords = cachedCoords[interaction.id]
        if not coords then
            coords = interaction.coords or utils.getCoordsFromInteract(interaction)
            if coords then
                cachedCoords[interaction.id] = coords
            else
                goto continue
            end
        end

        local isPrimary = i == 1

        if isPrimary and currentInteraction ~= interaction.id then
            currentInteraction = interaction.id
            currentAlpha = 255
            currentSelection = 1
        end

        local onScreen, screenX, screenY, screenZ = GetScreenCoordFromWorldCoord(coords.x, coords.y, coords.z)
        if not onScreen then goto continue end

        local isClose = isPrimary and (interaction.curDist <= interaction.interactDst) and (not interaction.entity or interaction.ignoreLos or interaction.entity == CurrentTarget)

        if isPrimary and currentAlpha < 0 then
            local options = interaction.options
            local alpha = currentAlpha * -1


            SetScriptGfxAlignParams(0.0, 0.0, 0.0, 0.0)
            SetDrawOrigin(coords.x, coords.y, coords.z)
            
            DrawSprite('tw_gardenerv2_txd', interact, 0, 0, 0.0185, 0.03333333333333333, 0, 255, 255, 255, alpha)
            
            local optionAmount = #options
            if optionAmount > 0 then
                local showDot = optionAmount > 1

                for j = 1, optionAmount do
                    createOption(coords, options[j], j, interaction.width, showDot, alpha)
                end

                if currentSelection > optionAmount then
                    currentSelection = optionAmount
                end


                if IsControlJustPressed(0, 172) or IsControlJustPressed(0, 15) then
                    if currentSelection > 1 then currentSelection -= 1 end
                elseif IsControlJustPressed(0, 173) or IsControlJustPressed(0, 14) then
                    if currentSelection < optionAmount then currentSelection += 1 end
                elseif IsControlJustPressed(0, 38) and isClose then
                    local option = options[currentSelection]
                    if option then
                        if option.action then
                            pcall(option.action, interaction.entity, interaction.coords, option.args, interaction.serverId)
                        elseif option.serverEvent then
                            TriggerServerEvent(option.serverEvent, option.args, interaction.serverId)
                        elseif option.event then
                            TriggerEvent(option.event, option, interaction.serverId)
                        end
                    end
                end
            end

            ResetScriptGfxAlign()
        else
            SetDrawOrigin(coords.x, coords.y, coords.z + 0.05)
            DrawSprite('tw_gardenerv2_txd', pin, 0, 0, 0.010, 0.025, 0, 255, 255, 255, isPrimary and currentAlpha or 255)
        end

        ClearDrawOrigin()

        if isPrimary then
            if isClose then
                currentAlpha = math_max(-255, currentAlpha - 10)
            else
                currentAlpha = math_min(255, currentAlpha + 10)
            end
        end

        ::continue::
    end
end


function clearCache()
    for k in pairs(cachedCoords) do
        cachedCoords[k] = nil
    end
end


local function isOnActiveJob()
    if CoopDataClient and CoopDataClient.roomSetting then
        if CoopDataClient.roomSetting.startJob or CoopDataClient.roomSetting.finishJob then
            return true
        end
    end
    return false
end


local function isDisabled()
    if not isOnActiveJob() then
        return true
    end

    if playerState.interactionsDisabled then
        return true
    end

    if Config.Disable.onDeath and (IsPedDeadOrDying(PlayerPedId()) or playerState.isDead) then
        return true
    end

    if Config.Disable.onNuiFocus and IsNuiFocused() then
        return true
    end
    
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if CoopDataClient and CoopDataClient.roomSetting then
        if vehicle ~= 0 and Config.Disable.onVehicle then
            return true
        end
    end

    if Config.Disable.onHandCuff and IsPedCuffed(PlayerPedId()) then
        return true
    end

    return false
end

CreateThread(function ()
    RequestStreamedTextureDict('tw_gardenerv2_txd')
    while not HasStreamedTextureDictLoaded('tw_gardenerv2_txd') do Wait(100) end
    
    while true do
        if isOnActiveJob() and nearbyAmount > 0 and not disableInteraction then
            CreateInteractions()
            Wait(math.max(0, frameInterval - 16))
        else
            if next(nearby) then
                clearCache()
                nearby, nearbyAmount = {}, 0
                CurrentTarget = 0
            end
            Wait(1000)
        end
    end
end)


local getCurrentTarget = customRequire 'client/interaction/raycast'
local threadTimer = GetConvarInt('interact_thread', 500)
local lastCheckTime = 0

CreateThread(function()
    while true do
        if isOnActiveJob() then
            local currentTime = GetGameTimer()
            local timeDiff = currentTime - lastCheckTime
            
            if timeDiff >= threadTimer then
                lastCheckTime = currentTime
                
                disableInteraction = isDisabled()
                if disableInteraction then
                    if next(nearby) then
                        nearby, nearbyAmount = {}, 0
                        CurrentTarget = 0
                        clearCache()
                    end
                else
                    CurrentTarget = getCurrentTarget() or 0
                    nearby, nearbyAmount = interactions.getNearbyInteractions()
                end
            end
            
            Wait(math.min(threadTimer, math.max(100, timeDiff)))
        else
            if next(nearby) then
                clearCache()
                nearby, nearbyAmount = {}, 0
                CurrentTarget = 0
            end
            Wait(1000)
        end
    end
end)