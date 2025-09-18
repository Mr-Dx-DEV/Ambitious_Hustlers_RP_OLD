local RequestId = 0
local serverRequests = {}
showBar = false

TriggerServerCallback = function(eventName, ...)
    local prom = promise.new()

    local requestId = RequestId
    serverRequests[requestId] = function(...)
        prom:resolve(...)
    end
    TriggerServerEvent(_event('triggerServerCallback'), eventName, requestId, GetInvokingResource() or "unknown", ...)
    RequestId = RequestId + 1


    return Citizen.Await(prom)
end


RegisterNetEvent(_event('serverCallback'), function(requestId, invoker, ...)
    if not serverRequests[requestId] then
        return print(("[^1ERROR^7] Server Callback with requestId ^5%s^7 Was Called by ^5%s^7 but does not exist.")
            :format(requestId, invoker))
    end

    serverRequests[requestId](...)
    serverRequests[requestId] = nil
end)

jobData = {
    jobname = nil,
    job_grade_name = nil,
    job_grade = nil,
    job_label = nil
}

local Player = {}
local Loaded = false

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer)
    Wait(1000)
    TriggerServerEvent(_event('server:loadData'))

    Loaded = true
end)


RegisterNetEvent('esx:onPlayerLogout', function()
    Player = table.wipe(Player)
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    TriggerServerEvent(_event('server:loadData'))
end)

AddEventHandler("vRP:Active", function()
    Wait(1000)
    TriggerServerEvent(_event('server:loadData'))
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    Player = table.wipe(Player)
end)


RegisterNetEvent('esx:setPlayerData', function(key, value)
    if not Loaded or GetInvokingResource() ~= 'es_extended' then return end

    if key ~= 'job' then return end
end)


CreateThread(function()
    Core, Config.Framework = GetCore()
    spawnPed()
    createBlips()
    SetPlayerJob()
end)

AddEventHandler('onResourceStop', function(resource)
    if (GetCurrentServerEndpoint() == nil) then
        return
    end
    if (resource == GetCurrentResourceName()) then
        TriggerServerEvent(_event('server:loadData'))
        ClearPedTasks(PlayerPedId())
    end
end)

function SetPlayerJob()
    while Core == nil do
        Wait(0)
    end
    Wait(500)
    while not nuiLoaded do
        Wait(50)
    end
    WaitPlayer()

    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local PlayerData = Core.GetPlayerData()
        jobData.jobname = PlayerData.job.name
        jobData.job_grade_name = PlayerData.job.label
        jobData.job_grade = tonumber(PlayerData.job.grade)
    else
        local PlayerData = Core.Functions.GetPlayerData()
        jobData.jobname = PlayerData["job"].name
        jobData.job_grade_name = PlayerData["job"].label
        jobData.job_grade = PlayerData["job"].grade.level
    end
end

function WaitPlayer()
    if Config.Framework == "esx" or Config.Framework == 'oldesx' then
        while Core == nil do
            Wait(0)
        end
        while Core.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.GetPlayerData().job == nil do
            Wait(0)
        end
    else
        while Core == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData().metadata == nil do
            Wait(0)
        end
    end
end

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    Wait(1000)
    SetPlayerJob()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(data)
    Wait(1000)
    SetPlayerJob()
end)

local blips = {}

function createBlips()
    if Config.Job['blip']['show'] then
        blips = AddBlipForCoord(tonumber(Config.Job['coords'].intreactionCoords.x),
            tonumber(Config.Job['coords'].intreactionCoords.y),
            tonumber(Config.Job['coords'].intreactionCoords.z))
        SetBlipSprite(blips, Config.Job['blip'].blipType)
        SetBlipCategory(blips, 2) -- 2: Places category
        SetBlipDisplay(blips, 4)
        SetBlipScale(blips, Config.Job['blip'].blipScale)
        SetBlipColour(blips, Config.Job['blip'].blipColor)
        SetBlipAsShortRange(blips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Job['blip'].blipName)
        EndTextCommandSetBlipName(blips)
    end
end

function canOpen()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        return false
    end
    if Config.Job['job'] then
        if Config.Job['job'] ~= 'all' and Config.Job['job'] ~= jobData.jobname then
            Config.sendNotification(Config.NotificationText['wrongjob'].text, Config.NotificationText['wrongjob'].type)
            return false
        end
    end
    return true
end

function spawnPed()
    if Config.Job.coords.ped then
        WaitForModel(Config.Job.coords.pedHash)
        local createNpc = CreatePed("PED_TYPE_PROSTITUTE", Config.Job.coords.pedHash, Config.Job.coords.pedCoords.x,
            Config.Job.coords.pedCoords.y, Config.Job.coords.pedCoords.z - 0.98, Config.Job.coords.pedHeading, false,
            false)
        FreezeEntityPosition(createNpc, true)
        SetEntityInvincible(createNpc, true)
        SetBlockingOfNonTemporaryEvents(createNpc, true)
    end
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 250
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function SetBlipAttributes(blip, id)
    SetBlipSprite(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 26)
    ShowNumberOnBlip(blip, id)
    SetBlipShowCone(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(base.resource .. " : " .. id)
    EndTextCommandSetBlipName(blip)
end

RegisterNetEvent(_event('openMenu'), function()
    if canOpen() then
        openJobMenu()
    end
end)

function WaitForModel(model)
    if not IsModelValid(model) then
        return
    end

    if not HasModelLoaded(model) then
        RequestModel(model)
    end

    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
end

Citizen.CreateThread(function()
    Config.OpenTrigger = function(bool)
        if not bool then
            if Config.InteractionHandler == "qb-target" then
                exports['qb-target']:RemoveZone(base.resource .. "_1" .. 1)
            elseif Config.InteractionHandler == "ox-target" then
                exports['ox_target']:removeZone(base.resource .. "_1")
            elseif Config.InteractionHandler == "drawtext" then
                Config.drawTextActive = false
            end
        else
            if Config.InteractionHandler == "qb-target" then
                exports['qb-target']:AddBoxZone(base.resource .. "_1" .. 1,
                    vector3(Config.Job.coords.intreactionCoords.x,
                        Config.Job.coords.intreactionCoords.y,
                        Config.Job.coords.intreactionCoords.z), 1.5,
                    1.5,
                    {
                        name = base.resource .. "_1" .. 1,
                        debugPoly = false,
                        heading = -20,
                        minZ = Config.Job.coords.intreactionCoords.z - 2,
                        maxZ = Config.Job.coords.intreactionCoords.z + 2,
                    }, {
                        options = {
                            {
                                type = "client",
                                event = _event('openMenu'),
                                icon = 'fas fa-credit-card',
                                label = Locales[Config.Locale]['openJobMenu'],
                            },
                        },
                        distance = 2
                    })
            elseif Config.InteractionHandler == "ox-target" then
                local data = {
                    name = base.resource .. "_1",
                    radius = 2.0,
                    icon = 'fas fa-credit-card',
                    label = Locales[Config.Locale]['openJobMenu'],
                    event = _event('openMenu'),
                    handler = false
                }
                addBoxToTarget(
                    vector3(Config.Job.coords.intreactionCoords.x, Config.Job.coords.intreactionCoords.y,
                        Config.Job.coords.intreactionCoords.z), data)
            elseif Config.InteractionHandler == "drawtext" then
                Config.drawTextActive = true
                Citizen.CreateThread(function()
                    while Config.drawTextActive do
                        local wait = 1500
                        local playerPed = PlayerPedId()
                        local coords = GetEntityCoords(playerPed)
                        local distance = #(coords - Config.Job.coords.intreactionCoords)
                        if distance < 1.5 then
                            wait = 0
                            DrawText3D(Config.Job.coords.intreactionCoords.x,
                                Config.Job.coords.intreactionCoords.y,
                                Config.Job.coords.intreactionCoords.z + 1.0,
                                Locales[Config.Locale]['pedDrawText'])
                            if IsControlJustReleased(0, 38) then
                                if canOpen() then
                                    openJobMenu()
                                end
                            end
                        end
                        Citizen.Wait(wait)
                    end
                end)
            end
        end
    end
end)

CreateThread(function()
    if Config.InteractionHandler == "ox-target" then
        AddModelToTarget = function(model, data)
            exports.ox_target:addModel(model, {
                name = data.name,
                event = data.event,
                icon = data.icon,
                label = data.label,
                canInteract = data.handler
            })
        end
        AddCoordsToTarget = function(coords, data)
            exports.ox_target:addSphereZone({
                coords = coords,
                radius = data.radius or 2.0,
                options = {
                    {
                        name = data.name,
                        event = data.event,
                        icon = data.icon,
                        label = data.label,
                        canInteract = data.handler
                    }
                }
            })
        end
        addBoxToTarget = function(coords, data)
            exports.ox_target:addBoxZone({
                coords = coords,
                radius = data.radius or 2.0,
                options = {
                    {
                        name = data.name,
                        event = data.event,
                        icon = data.icon,
                        label = data.label,
                        canInteract = data.handler
                    }
                }
            })
        end
        addBoxLocalEntity = function(entities, options)
            exports.ox_target:addLocalEntity(entities, options)
        end
        removeBoxLocalEntity = function(entities)
            exports.ox_target:removeLocalEntity(entities)
        end
        -- Network Entity Functions for ox-target
        addNetworkEntityTarget = function(netId, options)
            if not NetworkDoesNetworkIdExist(netId) then return nil end

            -- ox-target options format düzenlemesi
            local formattedOptions = {}
            for i, option in ipairs(options) do
                formattedOptions[i] = {
                    name = option.label,
                    icon = option.icon,
                    label = option.label,
                    onSelect = function(data)
                        -- ox-target'da entity'ye erişim için güvenli yöntem
                        local targetEntity = NetworkGetEntityFromNetworkId(netId) -- Network ID'den entity al
                        if type(data) == "table" then
                            targetEntity = data.entity or data.ent or targetEntity
                        end

                        if option.action and targetEntity then
                            option.action(targetEntity)
                        end
                    end,
                    canInteract = function(targetEntity, distance, coords, name, bone)
                        if option.canInteract then
                            return option.canInteract(targetEntity, distance, coords)
                        end
                        return true
                    end
                }
            end

            -- Network entity için addEntity kullan
            exports.ox_target:addEntity(netId, formattedOptions)
            return netId
        end
        removeNetworkEntityTarget = function(netId, interactionId)
            if not NetworkDoesNetworkIdExist(netId) then return end
            exports.ox_target:removeEntity(netId)
        end
        -- Coordinate-based Interaction Functions for ox-target
        addCoordinateInteraction = function(data)
            local zoneName = data.name or data.id
            local zoneId = exports.ox_target:addSphereZone({
                name = zoneName,
                coords = data.coords,
                radius = data.distance or 2.0,
                debug = Config.Debug or false,
                options = {
                    {
                        name = data.options[1].label,
                        icon = data.options[1].icon,
                        label = data.options[1].label,
                        onSelect = function(targetData)
                            if data.options[1].action then
                                data.options[1].action()
                            end
                        end,
                        canInteract = function(entity, distance, coords, name, bone)
                            if data.options[1].canInteract then
                                return data.options[1].canInteract()
                            end
                            return true
                        end
                    }
                }
            })

            -- Zone ID'sini döndür, bu sayede doğru zone'u silebiliriz
            return zoneId
        end
        removeCoordinateInteraction = function(interactionId)
            if interactionId and interactionId ~= true then
                -- ox-target'da removeZone fonksiyonu zone ID'si veya zone name'i ile çalışır
                if type(interactionId) == "number" then
                    -- Zone ID ile silme
                    exports.ox_target:removeZone(interactionId)
                else
                    -- Zone name ile silme
                    exports.ox_target:removeZone(interactionId)
                end
            end
        end
    elseif Config.InteractionHandler == "qb-target" then
        AddModelToTarget = function(model, data)
            exports['qb-target']:AddTargetModel({ model }, {
                options = {
                    {
                        event = data.event,
                        icon = data.icon,
                        label = data.label,
                        canInteract = data.handler
                    },
                },
                distance = 2.5,
            })
        end
        AddCoordsToTarget = function(coords, data)
            exports['qb-target']:AddCircleZone(data.name, coords, data.radius or 2.0, {
                name = data.name,
                useZ = true,
            }, {
                options = {
                    {
                        event = data.event,
                        icon = data.icon,
                        label = data.label,
                        canInteract = data.handler
                    }
                },
                distance = data.radius or 2.0
            })
        end
        addBoxToTarget = function(coords, data)
            exports['qb-target']:AddBoxZone(data.name, coords, data.radius or 2.0, {
                name = data.name,
                useZ = true,
            }, {
                options = {
                    {
                        event = data.event,
                        icon = data.icon,
                        label = data.label,
                        canInteract = data.handler
                    }
                },
                distance = data.radius or 2.0
            })
        end
        addBoxLocalEntity = function(entities, options)
            for key, option in pairs(options) do
                option.action = option.onSelect
            end
            exports['qb-target']:AddTargetEntity(entities, {
                options = options,
            })
        end
        removeBoxLocalEntity = function(entities)
            exports['qb-target']:RemoveTargetEntity(entities)
        end
        -- Network Entity Functions for qb-target
        addNetworkEntityTarget = function(netId, options)
            if not NetworkDoesNetworkIdExist(netId) then return nil end
            local entity = NetworkGetEntityFromNetworkId(netId)
            if not DoesEntityExist(entity) then return nil end

            -- qb-target options format düzenlemesi
            local formattedOptions = {}
            for i, option in ipairs(options) do
                formattedOptions[i] = {
                    type = "client",
                    icon = option.icon,
                    label = option.label,
                    action = option.action,
                    canInteract = option.canInteract
                }
            end

            exports['qb-target']:AddTargetEntity(entity, {
                options = formattedOptions,
                distance = 2.5
            })
            return entity
        end
        removeNetworkEntityTarget = function(netId, interactionId)
            if not NetworkDoesNetworkIdExist(netId) then return end
            local entity = NetworkGetEntityFromNetworkId(netId)
            if DoesEntityExist(entity) then
                exports['qb-target']:RemoveTargetEntity(entity)
            end
        end
        -- Coordinate-based Interaction Functions for qb-target
        addCoordinateInteraction = function(data)
            local zoneName = data.name or data.id
            exports['qb-target']:AddCircleZone(zoneName, data.coords, data.distance or 2.0, {
                name = zoneName,
                useZ = true,
                debugPoly = Config.Debug or false,
            }, {
                options = {
                    {
                        type = "client",
                        icon = data.options[1].icon,
                        label = data.options[1].label,
                        action = function()
                            if data.options[1].action then
                                data.options[1].action()
                            end
                        end,
                        canInteract = function()
                            if data.options[1].canInteract then
                                return data.options[1].canInteract()
                            end
                            return true
                        end
                    }
                },
                distance = data.distance or 2.0
            })
            return zoneName
        end
        removeCoordinateInteraction = function(interactionId)
            if interactionId and interactionId ~= true then
                -- qb-target'da RemoveZone fonksiyonu zone name'i ile çalışır
                exports['qb-target']:RemoveZone(interactionId)
            end
        end
    end
    targetLoaded = true
end)

local function CheckPlayerHandObjects()
    if playerHandObject.object then
        return true
    end
    return false
end

Citizen.CreateThread(function()
    local sleep = 2000
    while true do
        Citizen.Wait(sleep)
        local isJobing = CoopDataClient and CoopDataClient.roomSetting and true or false
        if isJobing then
            sleep = 0
            local playerPed = PlayerPedId()
            if GetIsTaskActive(playerPed, 160) and CheckPlayerHandObjects() then
                ClearPedTasks(playerPed)
                ClearPedSecondaryTask(playerPed)
                Config.sendNotification(Locales[Config.Locale]['cantentervehicle'])
            end
        end
    end
end)


function showProgressBar(title, time)
    if showBar then return end
    showBar = true
    NuiMessage('showProgressBar', { label = title, time = time })
    Citizen.SetTimeout(time * 1000, function()
        showBar = false
    end)
end

function LoadAnimation(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
end

function PlayEffect(dict, particleName, entity, off, rot, time, cb)
    CreateThread(function()
        RequestNamedPtfxAsset(dict)
        while not HasNamedPtfxAssetLoaded(dict) do
            Wait(0)
        end
        UseParticleFxAssetNextCall(dict)
        Wait(10)
        local particleHandle = StartParticleFxLoopedOnEntity(particleName, entity, off.x, off.y, off.z, rot.x, rot.y,
            rot.z, 1.0)
        SetParticleFxLoopedColour(particleHandle, 0, 255, 0, 0)
        Wait(time)
        StopParticleFxLooped(particleHandle, false)
        cb()
    end)
end

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

function GetVehicles()
    return GetGamePool('CVehicle')
end

function GetVehiclesInArea(coords, maxDistance)
    return EnumerateEntitiesWithinDistance(GetVehicles(), false, coords, maxDistance)
end

function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
    local nearbyEntities = {}

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        local playerPed = PlayerPedId()
        coords = GetEntityCoords(playerPed)
    end
    for k, entity in pairs(entities) do
        local distance = #(coords - GetEntityCoords(entity))

        if distance <= maxDistance then
            nearbyEntities[#nearbyEntities + 1] = isPlayerEntities and k or entity
        end
    end
    return nearbyEntities
end

function v2(coords) return vec3(coords.x, coords.y, 0.0) end

function CreateProp(modelHash, ...)
    if not IsModelInCdimage(modelHash) then
        return
    end
    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(0) end
    local obj = CreateObject(modelHash, ...)
    SetModelAsNoLongerNeeded(modelHash)
    return obj
end

function GiveJobClothing()
    if Config.ChangeClothesSystem then
        local gender
        if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then
            gender = 'male'
        elseif GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01") then
            gender = 'female'
        else
            return
        end
        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerEvent("esx_skin:setLastSkin", skin)
        end)

        local clothes = Config.JobClothes[gender]
        if clothes then
            for _, cloth in ipairs(clothes) do
                for part, id in pairs(cloth) do
                    if part ~= "texture" then
                        ChangeClothes(part, id, cloth.texture)
                    end
                end
            end
        end
    end
end

function ChangeClothes(key, value, texture)
    local playerPed = PlayerPedId()
    value = tonumber(value)
    texture = tonumber(texture)

    if key == 'jacket' then
        SetPedComponentVariation(playerPed, 11, value, texture, 2)
    end
    if key == 'shirt' then
        SetPedComponentVariation(playerPed, 8, value, texture, 2)
    end
    if key == 'arms' then
        SetPedComponentVariation(playerPed, 3, value, texture, 2)
    end
    if key == 'legs' then
        SetPedComponentVariation(playerPed, 4, value, texture, 2)
    end
    if key == 'shoes' then
        SetPedComponentVariation(playerPed, 6, value, texture, 2)
    end
    if key == 'mask' then
        SetPedComponentVariation(playerPed, 1, value, texture, 2)
    end
    if key == 'chain' then
        SetPedComponentVariation(playerPed, 7, value, texture, 2)
    end
    if key == 'decals' then
        SetPedComponentVariation(playerPed, 10, value, texture, 2)
    end
    if key == 'helmet' then
        SetPedPropIndex(playerPed, 0, value, texture, 2)
    end
    if key == 'glasses' then
        SetPedPropIndex(playerPed, 1, value, texture, 2)
    end
    if key == 'watches' then
        SetPedPropIndex(playerPed, 6, value, texture, 2)
    end
    if key == 'bracelets' then
        SetPedPropIndex(playerPed, 7, value, texture, 2)
    end
end

function RefreshSkin()
    Config.RefreshSkin()
end

--- Yields the current thread until a non-nil value is returned by the function.
---@generic T
---@param cb fun(): T?
---@param errMessage string?
---@param timeout? number | false Error out after `~x` ms. Defaults to 1000, unless set to `false`.
---@return T
---@async
function waitForClient(cb, errMessage, timeout)
    local value = cb()
    if value ~= nil then return value end

    if timeout or timeout == nil then
        if type(timeout) ~= 'number' then timeout = 1000 end
    end

    local startTime = timeout and GetGameTimer()

    while value == nil do
        Wait(0)

        if timeout then
            local elapsed = GetGameTimer() - startTime
            if elapsed > timeout then
                return error(('%s (waited %.1fms)'):format(errMessage or 'failed to resolve callback', elapsed), 2)
            end
        end

        value = cb()
    end

    return value
end

local isPlayAnim = false
function PlayAnim(dataName)
    local playerPed = PlayerPedId()

    if dataName == 'failMinigame' then
        LoadAnimation("ragdoll@human")
        TaskPlayAnim(playerPed, 'ragdoll@human', "electrocute", 8.0, 1.0, -1, 1, 0, false, false, false)
        FreezeEntityPosition(playerPed, true)
        SetTimeout(2800, function()
            ClearPedTasksImmediately(playerPed)
            FreezeEntityPosition(playerPed, false)
        end)
    elseif dataName == 'ladderUp' then
        LoadAnimation("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        ClearPedTasksImmediately(playerPed)
        FreezeEntityPosition(playerPed, true)
        TaskPlayAnim(playerPed, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 1.0, -1,
            1, 0, false, false, false)
        Wait(2500)

        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)
    elseif dataName == 'ladderDown' then
        ClearPedTasksImmediately(playerPed)
        FreezeEntityPosition(playerPed, true)
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HAMMERING", -1, -1)

        Wait(2500)

        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)

        ClearAreaOfObjects(GetEntityCoords(PlayerPedId()), 1.0, 0)
    end
end

function LoadParticleLib(dict)
    if not HasNamedPtfxAssetLoaded(dict) then
        RequestNamedPtfxAsset(dict)
        while not HasNamedPtfxAssetLoaded(dict) do
            Citizen.Wait(0)
        end
    end
    UseParticleFxAssetNextCall(dict)
end

function CreateCamera()
    local invehicle = IsPedInAnyVehicle(PlayerPedId(), false)
    if invehicle then return end

    local defaultCoords = Config.Job.coords.pedCoords
    local defaultHeading = Config.Job.coords.pedHeading
    local offset = vector3(-1.5, 1.8, 0.3)
    local coords = defaultCoords + offset

    RenderScriptCams(true, true, 500, true, true)
    DestroyCam(cam, false)

    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)
        SetCamCoord(cam, coords.x, coords.y, coords.z)
        SetCamRot(cam, 5.0, 0.0, defaultHeading - 180.0)
        SetCamNearClip(cam, 0.1)
        SetCamFarClip(cam, 1000.0)
        SetCamFov(cam, 20.0)
        SetCamDofFnumberOfLens(cam, 24.0)
        SetCamDofFocalLengthMultiplier(cam, 50.0)
    end
end

Citizen.CreateThread(function()
    local wait = 1000
    while true do
        Citizen.Wait(wait)
        if openUI or camera and not Config.closeInvisable then
            wait = 0
            SetEntityAlpha(PlayerPedId(), 0, false)
            SetLocalPlayerInvisibleLocally(true)
        end
    end
end)

function ExitCamera()
    SetEntityAlpha(PlayerPedId(), 255, false)
    RenderScriptCams(false, true, 500, true, true)
    DestroyCam(cam, false)
    ClearFocus()
    cam = nil
end

function CreateFinishCamera()
    local invehicle = IsPedInAnyVehicle(PlayerPedId(), false)
    if invehicle then return end
    local coords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), -0.3, -2.0, 0.0)

    RenderScriptCams(true, true, 500, true, true)
    DestroyCam(cam, false)
    if (not DoesCamExist(cam)) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)
        SetCamCoord(cam, coords.x, coords.y, coords.z + 0.2)
        SetCamRot(cam, 5.0, 0.0, GetEntityHeading(PlayerPedId()))
        SetCamNearClip(cam, 0.1)
        SetCamFarClip(cam, 1000.0)
        SetCamFov(cam, 40.0)
        SetCamDofFnumberOfLens(camera, 24.0)
        SetCamDofFocalLengthMultiplier(camera, 50.0)
        local heading = GetEntityHeading(PlayerPedId())
        SetEntityHeading(PlayerPedId(), heading + 180.0)
    end
end

function TriggerCallback(name, data)
    local incomingData = false
    local status = 'UNKOWN'
    local counter = 0
    while Core == nil do
        Wait(0)
    end
    if Config.Framework == 'esx' then
        Core.TriggerServerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    else
        Core.Functions.TriggerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    end
    CreateThread(function()
        while incomingData == 'UNKOWN' do
            Wait(1000)
            if counter == 4 then
                status = 'FAILED'
                incomingData = false
                break
            end
            counter = counter + 1
        end
    end)

    while status == 'UNKOWN' do
        Wait(0)
    end
    return incomingData
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if playerHandObject and (playerHandObject.pipe or playerHandObject.valve) then
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
        end
    end
end)

local deliveryThread = nil

function ToggleVehicleDeliveryInteraction(state)
    if state then
        local function setupDeliveryCoords()
            if CoopDataClient and CoopDataClient.roomSetting then
                -- Check primary location
                if CoopDataClient.roomSetting.jobDeliverCoords then
                    local coords = CoopDataClient.roomSetting.jobDeliverCoords
                    if coords.x and coords.y and coords.z then
                        return vector3(coords.x, coords.y, coords.z)
                    end
                end

                -- Check mission location
                if CoopDataClient.roomSetting.Mission and CoopDataClient.roomSetting.Mission.jobDeliverCoords then
                    local coords = CoopDataClient.roomSetting.Mission.jobDeliverCoords
                    if coords.x and coords.y and coords.z then
                        return vector3(coords.x, coords.y, coords.z)
                    end
                end

                -- Check global jobDeliverCoords
                if jobDeliverCoords then
                    if type(jobDeliverCoords) == "vector4" or type(jobDeliverCoords) == "vector3" then
                        return vector3(jobDeliverCoords.x, jobDeliverCoords.y, jobDeliverCoords.z)
                    elseif type(jobDeliverCoords) == "table" and jobDeliverCoords.x and jobDeliverCoords.y and jobDeliverCoords.z then
                        return vector3(jobDeliverCoords.x, jobDeliverCoords.y, jobDeliverCoords.z)
                    end
                end
            end
            return nil
        end

        jobDeliverCoordsInteraction = setupDeliveryCoords()

        if not jobDeliverCoordsInteraction then
            local attempts = 0
            while not jobDeliverCoordsInteraction and attempts < 10 do
                Wait(1000)
                attempts += 1
                jobDeliverCoordsInteraction = setupDeliveryCoords()

                if attempts >= 5 and CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.intreactionCoords then
                    jobDeliverCoordsInteraction = vector3(
                        Config.Job.coords.intreactionCoords.x,
                        Config.Job.coords.intreactionCoords.y,
                        Config.Job.coords.intreactionCoords.z
                    )
                    break
                end
            end

            if not jobDeliverCoordsInteraction then
                if Config.Debug then
                    print("Araç teslim noktası belirlenemedi. Lütfen işi tekrar başlatın.")
                end
                return
            end
        end

        -- Thread zaten varsa oluşturma
        if not deliveryThread then
            deliveryThread = true
            Citizen.CreateThread(function()
                while deliveryThread do
                    Wait(0)

                    local playerPed = PlayerPedId()
                    local playerVeh = GetVehiclePedIsIn(playerPed, false)
                    local playerCoords = GetEntityCoords(playerPed)
                    local vehicles = getVehicle()

                    local serverID = GetPlayerServerId(PlayerId())
                    local isOwner = CoopDataClient and CoopDataClient.roomSetting and
                        tostring(CoopDataClient.roomSetting.ownersrc) == tostring(serverID)

                    local isInRegisteredVehicle = false
                    local allVehiclesInZone = true

                    for _, vehData in ipairs(vehicles) do
                        local veh = NetworkGetEntityFromNetworkId(vehData.netID)
                        if veh and DoesEntityExist(veh) then
                            local vehCoords = GetEntityCoords(veh)
                            if #(vehCoords - jobDeliverCoordsInteraction) > 10.0 then
                                allVehiclesInZone = false
                                break
                            end
                        else
                            allVehiclesInZone = false
                            break
                        end

                        if playerVeh and vehData.plate == GetVehicleNumberPlateText(playerVeh) then
                            isInRegisteredVehicle = true
                        end
                    end

                    if isOwner and isInRegisteredVehicle and allVehiclesInZone and IsPedInAnyVehicle(playerPed, false) and not isInteracting then
                        local dist = #(playerCoords - jobDeliverCoordsInteraction)
                        if dist < 10.0 then
                            DrawText3D(jobDeliverCoordsInteraction.x, jobDeliverCoordsInteraction.y,
                                jobDeliverCoordsInteraction.z + 1.5, 'E - ' .. Locales[Config.Locale]['deliveryVehicle'])

                            if IsControlJustReleased(0, 38) then -- E tuşu
                                StartInteraction()
                                TriggerServerEvent(_event('server:LeaveVehicle'),
                                    CoopDataClient.roomSetting.owneridentifier)
                                clearMissionData()
                                Citizen.SetTimeout(1000, function()
                                    EndInteraction()
                                end)
                            end
                        end
                    end
                end
            end)
        end
    else
        deliveryThread = false -- Thread kapatılıyor
    end
end

local lastCoords = {}
GetRandomCoordInCircle = function(coord, radiusNumber, count)
    local coordstable = {}
    local minDistance = 1.0
    for i = 1, tonumber(count) do
        local radius = tonumber(radiusNumber) or 75.0
        local coords = vector3(coord.x, coord.y, coord.z + 0.1)
        local x, y, z = GenerateRandomCoords(coords, radius, minDistance, i, coordstable)
        if x ~= nil and y ~= nil and z ~= nil then
            table.insert(coordstable, vector3(x, y, z))
        end
    end
    lastCoords = coordstable
    return coordstable
end

function GenerateRandomCoords(coords, radius, minDistance, attempt, coordstable)
    local x, y, z
    repeat
        x = coords.x + math.random(-radius, radius)
        y = coords.y + math.random(-radius, radius)
        z = FindZForCoords(x, y, coords.z)
    until not IsTooCloseToLastCoords(x, y, minDistance)
    return x, y, z
end

function IsTooCloseToLastCoords(x, y, minDistance)
    for _, existingCoord in ipairs(lastCoords) do
        local distance = GetDistanceBetweenCoords2(existingCoord.x, existingCoord.y, x, y)
        if distance < minDistance then
            return true
        end
    end
    return false
end

function GetDistanceBetweenCoords2(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

local effect = false
local effectId = false
function CreateSmokeEffect(coords)
    RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded("core") do
        Citizen.Wait(1)
    end
    UseParticleFxAssetNextCall("core")
    effect = StartParticleFxLoopedAtCoord("ent_dst_elec_fire_sp", coords.x, coords.y, coords.z, 0.0, 0.0, 0.0,
        1.0, false, false, false, false)
    effectId = true

    Citizen.CreateThread(function()
        while effectId do
            Citizen.Wait(3000)

            StopParticleFxLooped(effect, 0)
            UseParticleFxAssetNextCall("core")
            effect = StartParticleFxLoopedAtCoord("ent_dst_elec_fire_sp", coords.x, coords.y, coords.z, 0.0, 0.0,
                0.0, 1.0, false, false, false, false)
        end
    end)

    return effect
end

function RemoveSmokeEffect(effect)
    if effect then
        StopParticleFxLooped(effect, false)
        RemoveParticleFx(effect, false)
        effect = nil
        effectId = false
    else
        StopParticleFxLooped(effect, false)
        RemoveParticleFx(effect, false)
        effect = nil
        effectId = false
    end
end
