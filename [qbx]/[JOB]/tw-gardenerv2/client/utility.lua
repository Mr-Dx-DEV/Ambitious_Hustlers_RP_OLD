local RequestId = 0
local serverRequests = {}
targetLoaded = false
showBar = false
TriggerServerCallback = function(eventName, ...)
    local prom = promise.new()

    local requestId = RequestId
    serverRequests[requestId] = function(...)
        prom:resolve(...)
    end
    TriggerServerEvent("tworst-gardenerv2:triggerServerCallback", eventName, requestId,
        GetInvokingResource() or "unknown", ...)
    RequestId = RequestId + 1


    return Citizen.Await(prom)
end

RegisterNetEvent("tworst-gardenerv2:serverCallback", function(requestId, invoker, ...)
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
    TriggerServerEvent('tworst-gardenerv2:loadData')
    Player = {
        Group = {
            [xPlayer.job.name] = xPlayer.job.grade,
        },
    }

    Loaded = true

    TriggerEvent('interact:groupsChanged', Player.Group)
end)


RegisterNetEvent('esx:onPlayerLogout', function()
    Player = table.wipe(Player)

    TriggerEvent('interact:groupsChanged', {})
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    TriggerServerEvent('tworst-gardenerv2:loadData')
end)

AddEventHandler("vRP:Active", function()
    Wait(1000)
    TriggerServerEvent('tworst-gardenerv2:loadData')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    Player = table.wipe(Player)

    TriggerEvent('interact:groupsChanged', {})
end)


RegisterNetEvent('esx:setPlayerData', function(key, value)
    if not Loaded or GetInvokingResource() ~= 'es_extended' then return end

    if key ~= 'job' then return end

    Player.Group = { [value.name] = value.grade }

    TriggerEvent('interact:groupsChanged', Player.Group)
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
        TriggerServerEvent('tworst-gardenerv2:loadData')
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

        if not Player.Group then return end

        Player.Group[Player.job] = nil
        Player.Group[job.name] = job.grade.level
        Player.job = job.name

        TriggerEvent('interact:groupsChanged', Player.Group)
    else
        local PlayerData = Core.Functions.GetPlayerData()
        jobData.jobname = PlayerData["job"].name
        jobData.job_grade_name = PlayerData["job"].label
        jobData.job_grade = PlayerData["job"].grade.level

        Player = {
            Group = {
                [PlayerData.job.name] = PlayerData.job.grade.level,
            },
            job = PlayerData.job.name,
        }
        TriggerEvent('interact:groupsChanged', Player.Group)
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
    if Config.Gardenerv2['blip']['show'] then
        blips = AddBlipForCoord(tonumber(Config.Gardenerv2['coords'].intreactionCoords.x),
            tonumber(Config.Gardenerv2['coords'].intreactionCoords.y),
            tonumber(Config.Gardenerv2['coords'].intreactionCoords.z))
        SetBlipSprite(blips, Config.Gardenerv2['blip'].blipType)
        SetBlipDisplay(blips, 4)
        SetBlipScale(blips, Config.Gardenerv2['blip'].blipScale)
        SetBlipColour(blips, Config.Gardenerv2['blip'].blipColor)
        SetBlipAsShortRange(blips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring(Config.Gardenerv2['blip'].blipName))
        EndTextCommandSetBlipName(blips)
    end
end

function canOpen()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        return false
    end
    if Config.Gardenerv2['job'] then
        if Config.Gardenerv2['job'] ~= 'all' and Config.Gardenerv2['job'] ~= jobData.jobname then
            Config.sendNotification(Config.NotificationText['wrongjob'].text, Config.NotificationText['wrongjob'].type)
            return false
        end
    end
    return true
end

function spawnPed()
    if Config.Gardenerv2.coords.ped then
        WaitForModel(Config.Gardenerv2.coords.pedHash)
        local createNpc = CreatePed("PED_TYPE_PROSTITUTE", Config.Gardenerv2.coords.pedHash,
            Config.Gardenerv2.coords.pedCoords.x, Config.Gardenerv2.coords.pedCoords.y,
            Config.Gardenerv2.coords.pedCoords.z - 0.98, Config.Gardenerv2.coords.pedHeading, false, false)
        FreezeEntityPosition(createNpc, true)
        SetEntityInvincible(createNpc, true)
        SetBlockingOfNonTemporaryEvents(createNpc, true)
    end
end

function DrawText3D(x, y, z, text)
    if not text then text = "Metin yok" end -- Eğer metin yoksa varsayılan değer ver
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
    AddTextComponentSubstringPlayerName("Gardenerv2 : " .. id)
    EndTextCommandSetBlipName(blip)
end

RegisterNetEvent('tworst-gardenerv2:openMenu', function()
    if canOpen() then
        openGardenerv2Menu()
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
                exports['qb-target']:RemoveZone("tw-gardenerv2_1" .. 1)
            elseif Config.InteractionHandler == "ox-target" then
                exports['ox_target']:removeZone('tw-gardenerv2_1')
            elseif Config.InteractionHandler == "drawtext" then
                Config.drawTextActive = false
            end
        else
            -- Aktif hale getirme işlemleri
            if Config.InteractionHandler == "qb-target" then
                exports['qb-target']:AddBoxZone("tw-gardenerv2_1" .. 1,
                    vector3(Config.Gardenerv2.coords.intreactionCoords.x,
                        Config.Gardenerv2.coords.intreactionCoords.y,
                        Config.Gardenerv2.coords.intreactionCoords.z), 1.5,
                    1.5,
                    {
                        name = "tw-gardenerv2_1" .. 1,
                        debugPoly = false,
                        heading = -20,
                        minZ = Config.Gardenerv2.coords.intreactionCoords.z - 2,
                        maxZ = Config.Gardenerv2.coords.intreactionCoords.z + 2,
                    }, {
                        options = {
                            {
                                type = "client",
                                event = "tworst-gardenerv2:openMenu",
                                icon = 'fas fa-credit-card',
                                label = Locales[Config.Locale]['openJobMenu']
                            },
                        },
                        distance = 2
                    })
            elseif Config.InteractionHandler == "ox-target" then
                local data = {
                    name = 'tw-gardenerv2_1',
                    radius = 2.0,
                    icon = 'fas fa-credit-card',
                    label = Locales[Config.Locale]['openJobMenu'],
                    event = 'tworst-gardenerv2:openMenu',
                    handler = false
                }
                addBoxToTarget(
                    vector3(Config.Gardenerv2.coords.intreactionCoords.x, Config.Gardenerv2.coords.intreactionCoords.y,
                        Config.Gardenerv2.coords.intreactionCoords.z), data)
            elseif Config.InteractionHandler == "drawtext" then
                Config.drawTextActive = true
                Citizen.CreateThread(function()
                    while Config.drawTextActive do
                        local wait = 1500
                        local playerPed = PlayerPedId()
                        local coords = GetEntityCoords(playerPed)
                        local distance = #(coords - Config.Gardenerv2.coords.intreactionCoords)
                        if distance < 1.5 then
                            wait = 0
                            DrawText3D(Config.Gardenerv2.coords.intreactionCoords.x,
                                Config.Gardenerv2.coords.intreactionCoords.y,
                                Config.Gardenerv2.coords.intreactionCoords.z + 1.0,
                                Locales[Config.Locale]['pedDrawText'])
                            if IsControlJustReleased(0, 38) then
                                if canOpen() then
                                    openGardenerv2Menu()
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


local isPlayAnim = false
function PlayAnim(dataName)
    local playerPed = PlayerPedId()
    if dataName == 'trimAnimation' then
        LoadAnimation('anim@mp_radio@garage@medium')
        TaskPlayAnim(playerPed, 'anim@mp_radio@garage@medium', 'idle_a', 8.0, -8.0, -1, 2, 0, false, false, false)
        showProgressBar(Locales[Config.Locale]['bushPruningBar'], 4.3)
        NuiMessage('playSound', { sound = 'trimAnimation.ogg' })
        FreezeEntityPosition(playerPed, true)
        Wait(4500)
        ClearPedTasksImmediately(playerPed)
        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)
        return true
    elseif dataName == 'takeBranch' then
        showProgressBar(Locales[Config.Locale]['takeBranch'], 0.9)
        LoadAnimation('veh@common@bicycle@ps')
        TaskPlayAnim(playerPed, 'veh@common@bicycle@ps', 'pickup', 8.0, -8.0, -1, 2, 0, false, false, false)
        FreezeEntityPosition(playerPed, true)
        Wait(900)
        ClearPedTasksImmediately(playerPed)
        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)
        return true
    elseif dataName == 'vehicletoPed' then
        LoadAnimation('anim@amb@nightclub@mini@drinking@drinking_shots@ped_c@normal')
        showProgressBar(Locales[Config.Locale]['receivingMaterials'], 3.3)
        TaskPlayAnim(playerPed, 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_c@normal', 'pickup', 8.0, -8.0, -1,
            2, 0, false, false, false)
        FreezeEntityPosition(playerPed, true)
        Wait(3300)
        ClearPedTasksImmediately(playerPed)
        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)
        return true
    elseif dataName == 'pedtoVehicle' then
        LoadAnimation('anim@amb@nightclub@mini@drinking@drinking_shots@ped_c@normal')
        showProgressBar(Locales[Config.Locale]['putBackMaterials'], 2.2)
        TaskPlayAnim(playerPed, 'anim@amb@nightclub@mini@drinking@drinking_shots@ped_c@normal', 'pickup', 8.0, -8.0, -1,
            2, 0, false, false, false)
        FreezeEntityPosition(playerPed, true)
        Wait(2200)
        ClearPedTasksImmediately(playerPed)
        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)
        return true
    elseif dataName == 'ladderDown' then
        ClearPedTasksImmediately(playerPed)
        FreezeEntityPosition(playerPed, true)
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HAMMERING", -1, -1)
        showProgressBar(Locales[Config.Locale]['ladderDown'], 2.4)
        Wait(2500)
        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)
        ClearAreaOfObjects(GetEntityCoords(PlayerPedId()), 1.0, 0)
        return true
    elseif dataName == 'ladderUp' then
        LoadAnimation("anim@amb@clubhouse@tutorial@bkr_tut_ig3@")
        ClearPedTasksImmediately(playerPed)
        FreezeEntityPosition(playerPed, true)
        TaskPlayAnim(playerPed, "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, 1.0, -1,
            1, 0, false, false, false)
        showProgressBar(Locales[Config.Locale]['ladderUp'], 2.5)
        Wait(2500)
        ClearPedTasks(playerPed)
        FreezeEntityPosition(playerPed, false)
        return true
    end
end

function showProgressBar(title, time)
    if showBar then return end
    showBar = true
    if Config.Vorp then
        exports["vorp-ui"]:progressBar({
            label = title,
            duration = time * 1000,
            canCancel = false,
        })
    else
        NuiMessage('showProgressBar', { label = title, time = time })
    end
    Citizen.SetTimeout(time * 1000, function()
        showBar = false
    end)
end

function carryLadder()
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        RequestAnimDict("anim@heists@box_carry@")
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "walk", 4.0, 4.0, -1, 51, 0, false, false, false)
end

function carryObject()
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        RequestAnimDict("anim@heists@box_carry@")
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 4.0, 4.0, -1, 51, 0, false, false, false)
end

function carryWateringcan()
    while (not HasAnimDictLoaded("anim@heists@narcotics@trash")) do
        RequestAnimDict("anim@heists@narcotics@trash")
        Citizen.Wait(100)
    end
    TaskPlayAnim(PlayerPedId(), "anim@heists@narcotics@trash", "idle", 4.0, 4.0, -1, 51, 0, false, false, false)
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

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if isPlacingObject then
            if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3) then
                carryObject()
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if isPlacingWateringcan then
            if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@narcotics@trash", "idle", 3) then
                carryWateringcan()
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if isPlacingLadder then
            if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "walk", 3) then
                carryLadder()
            end
        end
    end
end)

function CreateCamera()
    local invehicle = IsPedInAnyVehicle(PlayerPedId(), false)
    if invehicle then return end

    local defaultCoords = Config.Gardenerv2.coords.pedCoords
    local defaultHeading = Config.Gardenerv2.coords.pedHeading
    local offset = vector3(0.0, -2.3, 0.2)
    local coords = defaultCoords + offset

    RenderScriptCams(true, true, 500, true, true)
    DestroyCam(cam, false)

    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
        SetCamActive(cam, true)
        RenderScriptCams(true, true, 500, true, true)
        SetCamCoord(cam, coords.x, coords.y, coords.z + 0.2)
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
        if openUI and not Config.closeInvisable then
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
        SetCamRot(cam, 5.0, 0.0, GetEntityHeading(PlayerPedId())) -- Change here
        SetCamNearClip(cam, 0.1)                                  -- Adjust the near clip distance
        SetCamFarClip(cam, 1000.0)                                -- Adjust the far clip distance
        SetCamFov(cam, 40.0)                                      -- Adjust the field of view
        SetCamDofFnumberOfLens(camera, 24.0)                      -- Number of lens in the camera's focus
        SetCamDofFocalLengthMultiplier(camera, 50.0)              -- Focal length of the camera's lens
        local heading = GetEntityHeading(PlayerPedId())
        SetEntityHeading(PlayerPedId(), heading + 180.0)
    end
end

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
    end
    targetLoaded = true
end)


local function CheckPlayerHandObjects()
    if playerHandObject.trimmer or playerHandObject.ladder or playerHandObject.flower or playerHandObject.wateringcan or playerHandObject.branch then
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
                Config.sendNotification(Locales[Config.Locale]['cantentervehicle'], 'error')
            end
        end
    end
end)


function FindZForCoords(x, y, z)
    local object = CreateProp(GetHashKey("prop_anim_cash_note"), x, y, z, true, true, false)
    PlaceObjectOnGroundProperly(object)
    local objectCoords = GetEntityCoords(object)
    DeleteEntity(object)
    return objectCoords.z
end

local deliveryThread = nil

function ToggleVehicleDeliveryInteraction(state)
    if state then
        local function setupDeliveryCoords()
            if CoopDataClient and CoopDataClient.roomSetting then
                if CoopDataClient.roomSetting.jobDeliverCoords then
                    return vector3(CoopDataClient.roomSetting.jobDeliverCoords.x,
                        CoopDataClient.roomSetting.jobDeliverCoords.y, CoopDataClient.roomSetting.jobDeliverCoords.z)
                elseif CoopDataClient.roomSetting.Mission and CoopDataClient.roomSetting.Mission.jobDeliverCoords then
                    return vector3(CoopDataClient.roomSetting.Mission.jobDeliverCoords.x,
                        CoopDataClient.roomSetting.Mission.jobDeliverCoords.y,
                        CoopDataClient.roomSetting.Mission.jobDeliverCoords.z)
                elseif CoopDataClient.roomSetting.intreactionCoords then
                    return vector3(
                        Config.Gardenerv2.coords.intreactionCoords.x,
                        Config.Gardenerv2.coords.intreactionCoords.y,
                        Config.Gardenerv2.coords.intreactionCoords.z
                    )
                end
            end
            return nil
        end

        jobDeliverCoordsInteraction = setupDeliveryCoords()
        local attempts = 0

        while not jobDeliverCoordsInteraction and attempts < 10 do
            Wait(1000)
            attempts += 1
            jobDeliverCoordsInteraction = setupDeliveryCoords()
        end

        if not jobDeliverCoordsInteraction then
            if Config.Debug then
                print("Araç teslim noktası belirlenemedi. Lütfen işi tekrar başlatın.")
            end
            return false
        end

        VehicleDeliveryInteraction = true

        if not deliveryThread then
            deliveryThread = true
            Citizen.CreateThread(function()
                while deliveryThread do
                    Wait(0)

                    local playerPed = PlayerPedId()
                    local currentVehicle = GetVehiclePedIsIn(playerPed, false)
                    local currentPlate = GetVehicleNumberPlateText(currentVehicle)
                    local vehicles = getVehicle() or {}
                    local isPlayerInRegisteredVehicle = false
                    local allVehiclesInZone = true

                    -- Eğer araç listesi boşsa, zone kontrolü geçersiz
                    if #vehicles == 0 then
                        allVehiclesInZone = false
                    end

                    for _, vehData in ipairs(vehicles) do
                        if vehData.plate == currentPlate then
                            isPlayerInRegisteredVehicle = true
                        end

                        local veh = NetworkGetEntityFromNetworkId(vehData.netID)
                        if not veh or veh == 0 or not DoesEntityExist(veh) then
                            if Config.Debug then
                                print("Araç bulunamadı (uzakta veya silinmiş): ", vehData.netID, vehData.plate)
                            end
                            allVehiclesInZone = false
                            break
                        else
                            local vehCoords = GetEntityCoords(veh)
                            local dist = #(vehCoords - jobDeliverCoordsInteraction)

                            if dist > 10.0 then
                                allVehiclesInZone = false
                                break
                            end
                        end
                    end

                    local serverID = GetPlayerServerId(PlayerId())
                    local isOwner = CoopDataClient and CoopDataClient.roomSetting and
                        tostring(CoopDataClient.roomSetting.ownersrc) == tostring(serverID)

                    if Config.Debug then
                        print('Araç zone kontrolü - Toplam araç:', #vehicles, 'Zone içinde:', allVehiclesInZone,
                            'Kayıtlı araçta:', isPlayerInRegisteredVehicle)
                    end
                    if isOwner and isPlayerInRegisteredVehicle and allVehiclesInZone and IsPedInAnyVehicle(playerPed, false) and not isInteracting then
                        local playerCoords = GetEntityCoords(playerPed)
                        local dist = #(playerCoords - jobDeliverCoordsInteraction)
                        if dist < 10.0 then
                            DrawText3D(jobDeliverCoordsInteraction.x, jobDeliverCoordsInteraction.y,
                                jobDeliverCoordsInteraction.z + 1.5, '[E] - ' ..
                                Locales[Config.Locale]['deliveryVehicle'])

                            if IsControlJustReleased(0, 38) then
                                StartInteraction()
                                TriggerServerEvent('tworst-gardenerv2:server:LeaveVehicle',
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
    elseif not state and VehicleDeliveryInteraction then
        VehicleDeliveryInteraction = false
        deliveryThread = false
    end
end
