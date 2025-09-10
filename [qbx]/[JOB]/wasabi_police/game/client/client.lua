-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if not wsb then return print((Strings.no_wsb):format(GetCurrentResourceName())) end
playerLoaded, isDead, isBusy, disableKeys, cuffProp, isCuffed, inMenu, isRagdoll, cuffTimer, escorting, escorted, GSRData =
    nil, nil, nil, nil, nil, nil, nil, nil, {}, {}, {}, {}
QBCore = nil
RadarPostProp, ClosestSpeedTrap, SpeedTraps, JailTime, InJail = nil, nil, {}, 0, false
CCTVCameras, TrackingPlayers = {}, {}
OnlinePoliceCount = 0
local oldJob = nil
if wsb.framework == 'qb' then QBCore = exports['qb-core']:GetCoreObject() end


RegisterNetEvent('wasabi_police:tackled', function(targetId)
    getTackled(targetId)
end)

RegisterNetEvent('wasabi_police:tackle', function()
    tacklePlayer()
end)

AddEventHandler('wasabi_bridge:onPlayerLogout', function()
    if wsb.hasGroup(Config.policeJobs) and wsb.isOnDuty() then
        TriggerServerEvent('wasabi_police:addPoliceCount', false)
    end
end)

AddEventHandler('wasabi_bridge:onPlayerSpawn', function()
    isDead = false
    if escorted.active then
        TriggerServerEvent('wasabi_police:escortPlayerStop', escorted.pdId, true)
        escorted.active = nil
        escorted.pdId = nil
    end
    if Config.UseRadialMenu then
        DisableRadial(false)
    end
end)

AddEventHandler('wasabi_bridge:onPlayerLogout', function()
    InJail = false
    SendNUIMessage({ action = 'jailCounter' })
end)

AddEventHandler('wasabi_bridge:onPlayerDeath', function()
    --    isDead = true
    if RadarPostProp and DoesEntityExist(RadarPostProp) then
        DeleteEntity(RadarPostProp)
        RadarPostProp = nil
    end
    if isCuffed and not Config.handcuff.cuffDeadPlayers then
        uncuffed()
    end
    if escorting?.active then
        escorting.active = nil
        escorting.target = nil
    end
    if escorted?.active then
        TriggerServerEvent('wasabi_police:escortPlayerStop', escorted.pdId, true)
        escorted.active = nil
        escorted.pdId = nil
    end
    if Config.UseRadialMenu then
        DisableRadial(true)
    end
end)

--PersistentCuff and update PoliceCount
RegisterNetEvent('wasabi_bridge:playerLoaded', function()
    playerLoaded = true
    PersistentCuffCheck()
    CheckJailTime()
    SpeedTraps = InitializeSpeedTraps()
    CCTVCameras = InitializeCCTVCameras()
    if wsb.hasGroup(Config.policeJobs) then
        if wsb.isOnDuty() then
            TriggerServerEvent('wasabi_police:addPoliceCount', true)
        end
        if Config.GPSBlips.enabled and not Config.GPSBlips.item then
            if wsb.framework == 'qb' and wsb.isOnDuty() then
                TriggerServerEvent('wasabi_police:addOfficerToGPS')
            elseif wsb.framework ~= 'qb' then
                TriggerServerEvent('wasabi_police:addOfficerToGPS')
            end
        end
    end
    TriggerServerEvent('wasabi_police:getPoliceOnline')
end)



RegisterNetEvent('police:SetCopCount', function(count)
    OnlinePoliceCount = count
end)

local function getPoliceOnline()
    return OnlinePoliceCount
end

exports('getPoliceOnline', getPoliceOnline)

AddEventHandler('wasabi_police:searchPlayer', function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    local coords = GetEntityCoords(wsb.cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    else
        searchPlayer(player)
    end
end)

AddEventHandler('wasabi_police:grantLicense', function()
    local job, grade = wsb.hasGroup(Config.policeJobs)
    if not job or not grade then return end
    if tonumber(grade) < Config.GrantWeaponLicenses.minGrade then
        TriggerEvent('wasabi_bridge:notify', Strings.grade_too_low, Strings.grade_too_low_desc, 'error')
        return
    end
    local coords = GetEntityCoords(wsb.cache.ped)
    local closestPlayers = wsb.getNearbyPlayers(vector3(coords.x, coords.y, coords.z), 10.0)
    local Options = {}
    local playerList = {}
    local nearbyPlayers
    if #closestPlayers < 1 then goto continue end
    for i = 1, #closestPlayers do
        playerList[#playerList + 1] = {
            id = GetPlayerServerId(closestPlayers[i])
        }
    end
    nearbyPlayers = wsb.awaitServerCallback('wasabi_police:getPlayerData', playerList)
    for _, v in pairs(nearbyPlayers) do
        Options[#Options + 1] = {
            icon = 'user',
            title = v.name,
            description = Strings.player_id .. ' ' .. v.id,
            event = 'wasabi_police:weaponLicense',
            args = { id = v.id }
        }
    end
    ::continue::
    local selfName = (wsb.framework == 'qb') and
        (wsb.playerData.charinfo.firstname .. ' ' .. wsb.playerData.charinfo.lastname) or
        (wsb.playerData.firstName .. ' ' .. wsb.playerData.lastName)
    Options[#Options + 1] = {
        icon = 'user',
        title = selfName .. ' (' .. Strings.license_self .. ')',
        description = Strings.player_id .. ' ' .. wsb.cache.serverId,
        event = 'wasabi_police:weaponLicense',
        args = { id = wsb.cache.serverId }
    }

    wsb.showMenu({
        id = 'grant_license_menu',
        color = Config.UIColor,
        title = Strings.select_player,
        position = Config.GrantWeaponLicenses.menuPosition,
        options = Options
    })
end)

AddEventHandler('wasabi_police:spawnVehicle', function(data)
    inMenu = false
    local model = data.model
    local category = Config.Locations[data.station].vehicles.options[data.grade][data.model].category
    local spawnLoc = Config.Locations[data.station].vehicles.spawn[category]
    if not IsModelInCdimage(GetHashKey(model)) then
        print('Vehicle model not found: ' .. model)
    else
        local nearbyVehicles = wsb.getNearbyVehicles(vec3(spawnLoc.coords.x, spawnLoc.coords.y, spawnLoc.coords.z), 6.0,
            true)
        if #nearbyVehicles > 0 then
            TriggerEvent('wasabi_bridge:notify', Strings.spawn_blocked, Strings.spawn_blocked_desc, 'error')
            return
        end
        DoScreenFadeOut(800)
        while not IsScreenFadedOut() do
            Wait(100)
        end
        wsb.stream.model(model, 9000)
        local vehicle = CreateVehicle(GetHashKey(model), spawnLoc.coords.x, spawnLoc.coords.y, spawnLoc.coords.z,
            spawnLoc.heading, true, false)
        TaskWarpPedIntoVehicle(wsb.cache.ped, vehicle, -1)
        if Config.customCarlock then
            model = GetEntityModel(vehicle)
            local plate = GetVehicleNumberPlateText(vehicle)
            wsb.giveCarKeys(plate, model, vehicle)
        end
        SetModelAsNoLongerNeeded(model)
        DoScreenFadeIn(800)
    end
end)

AddEventHandler('gameEventTriggered', function(event, data)
    if event ~= 'CEventNetworkEntityDamage' then return end
    local playerPed = wsb.cache.ped
    local victim, victimDied = data[1], data[4]
    if not IsPedAPlayer(victim) then return end
    local player = PlayerId()
    if victimDied then return end
    if not IsPedAPlayer(victim) or NetworkGetPlayerIndexFromPed(victim) ~= player then return end
    if escorting.active then
        TriggerServerEvent('wasabi_police:releasePlayer', escorting.target)
        escorting.active = nil
        escorting.target = nil
    end
end)

RegisterNetEvent('wasabi_police:trackPlayer', function()
    local job, grade = wsb.hasGroup(Config.policeJobs)
    if not job or not grade then return end
    if not wsb.isOnDuty() then return end
    if not Config.TrackingBracelet.jobs[job] or tonumber(grade or 0) < Config.TrackingBracelet.jobs[job] then return end
    local coords = GetEntityCoords(wsb.cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        return 
    end
    TaskTurnPedToFaceEntity(wsb.cache.ped, GetPlayerPed(player), 2000)
    player = GetPlayerServerId(player)
    local state = Player(player).state.tracking
    local label = state and Strings.stop_tracking or Strings.start_tracking
    if not state then 
        local hasItem = wsb.awaitServerCallback('wasabi_police:itemCheck', Config.TrackingBracelet.item)
        if Config.TrackingBracelet.item and not hasItem or hasItem < 1 then
            TriggerEvent('wasabi_bridge:notify', Strings.no_tracking_bracelet, Strings.no_tracking_bracelet_desc, 'error')
            return
        end
    end 
    Wait(2000)
    wsb.stream.animDict('anim@amb@clubhouse@tutorial@bkr_tut_ig3@')
    TaskPlayAnim(wsb.cache.ped, 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 8.0, -8.0, -1, 1, 0, false, false, false)
    if wsb.progressUI({
        duration = 4000,
        label = label,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
        }}, 'progressCircle') then
        TriggerServerEvent('wasabi_police:addPlayerToTracking', player)
    end
    ClearPedTasks(wsb.cache.ped)
end)

RegisterNetEvent('wasabi_police:addTrackingProp', function()
    AttachTrackingProp()
    TriggerEvent('wasabi_bridge:notify', Strings.got_tracking_bracelet, Strings.got_tracking_bracelet_desc, 'success')    
    HandleTrackingProp()
end)

RegisterNetEvent('wasabi_police:removeTrackingProp', function()
    if DoesEntityExist(TrackingBracelet) then
        DeleteEntity(TrackingBracelet)
        TrackingBracelet = nil
    end
    TriggerEvent('wasabi_bridge:notify', Strings.removed_tracking_bracelet, Strings.removed_tracking_bracelet_desc, 'success')
end)

local activeBlips = {}
RegisterNetEvent('wasabi_police:refreshTrackingData', function(data)
    if not data or not next(data) then return end
    for i = 1, #data do
        local target = data[i]
        if activeBlips[target.target] then
            RemoveBlip(activeBlips[target.target])
            activeBlips[target.target] = nil
        end
        activeBlips[target.target] = CreateBlip(target.coords, Config.TrackingBracelet.blip.sprite,
            Config.TrackingBracelet.blip.color,
            Config.TrackingBracelet.blip.label:format(target.name), Config.TrackingBracelet.blip.scale, false, nil, false)
    end
end)

RegisterNetEvent('wasabi_police:removeTrackedPlayer', function(target)
    if activeBlips[target] then
        RemoveBlip(activeBlips[target])
        activeBlips[target] = nil
    end
end)

RegisterNetEvent('wasabi_police:arrested', function(pdId, type)
    isBusy = true
    local escaped
    local pdPed = GetPlayerPed(GetPlayerFromServerId(pdId))
    wsb.stream.animDict('mp_arrest_paired')
    AttachEntityToEntity(wsb.cache.ped, pdPed, 11816, -0.1, 0.45, 0.0, 0.0, 0.0, 20.0, false, false, false, false, 20,
        false)
    TaskPlayAnim(wsb.cache.ped, 'mp_arrest_paired', 'crook_p2_back_left', 8.0, -8.0, 5500, 33, 0, false, false, false)
    if Config.handcuff.skilledEscape.enabled then
        if wsb.skillCheck({ difficulty = Config.handcuff.skilledEscape.difficulty, color = Config.UIColor and Config.UIColor or nil }) then
            escaped = true
        end
    end
    FreezeEntityPosition(pdPed, true)
    Wait(2000)
    DetachEntity(wsb.cache.ped, true, false)
    FreezeEntityPosition(pdPed, false)
    RemoveAnimDict('mp_arrest_paired')
    if not escaped then
        if IsPedInAnyVehicle(wsb.cache.ped, true) then TaskLeaveVehicle(wsb.cache.ped, wsb.cache.vehicle, 16) end
        handcuffed(type)
    end
    isBusy = false
end)

RegisterNetEvent('wasabi_police:arrest', function()
    isBusy = true
    wsb.stream.animDict('mp_arrest_paired')
    TaskPlayAnim(wsb.cache.ped, 'mp_arrest_paired', 'cop_p2_back_left', 8.0, -8.0, 3400, 33, 0, false, false, false)
    Wait(3000)
    isBusy = false
end)

local handCuffing = false
RegisterNetEvent('wasabi_police:handcuffPlayer', function(args)
    if handCuffing then return end
    handCuffing = true
    local approved = IsTriggerApproved(GetInvokingResource())
    local hasItem = true
    if Config.handcuff?.cuffItem?.enabled and Config.handcuff?.cuffItem?.required then
        hasItem = wsb.awaitServerCallback('wasabi_police:itemCheck', Config.handcuff.cuffItem.item)
        if not approved then approved = (hasItem and hasItem > 0) end
    end
    if not approved then return end
    if isCuffed then return end
    if wsb.cache.vehicle then
        handCuffing = false
        TriggerEvent('wasabi_bridge:notify', Strings.in_vehicle, Strings.in_vehicle_desc, 'error')
        return
    end
    local type = args?.type or args?.args?.type or Config.handcuff.defaultCuff or 'hard'
    local coords = GetEntityCoords(wsb.cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player or GetVehiclePedIsIn(GetPlayerPed(player), false) ~= 0 then
        handCuffing = false
        local error_message, error_message_desc = (not player and Strings.no_nearby) or Strings.in_vehicle,
            (not player and Strings.no_nearby_desc) or Strings.in_vehicle_desc
        TriggerEvent('wasabi_bridge:notify', error_message, error_message_desc, 'error')

        return
    end
    handcuffPlayer(GetPlayerServerId(player), type)
    SetTimeout(7000, function()
        handCuffing = false
    end)
end)

RegisterNetEvent('wasabi_police:uncuffAnim', function(target)
    local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
    local targetCoords = GetEntityCoords(targetPed)
    if escorting?.active then
        escorting.active = nil
        escorting.target = nil
    end
    TaskTurnPedToFaceCoord(wsb.cache.ped, targetCoords.x, targetCoords.y, targetCoords.z, 2000)
    Wait(2000)
    TaskStartScenarioInPlace(wsb.cache.ped, 'PROP_HUMAN_PARKING_METER', 0, true)
    Wait(2000)
    ClearPedTasks(wsb.cache.ped)
end)

RegisterNetEvent('wasabi_police:lockpickHandcuffs', function()
    if not Config.handcuff?.lockpicking?.enabled then return end
    local coords = GetEntityCoords(wsb.cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player then return end
    local sId = GetPlayerServerId(player)
    if not wsb.awaitServerCallback('wasabi_police:isCuffed', sId) then return end
    local playerPed = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(playerPed)
    TaskTurnPedToFaceCoord(wsb.cache.ped, playerCoords.x, playerCoords.y, playerCoords.z, 2000)
    Wait(2000)
    TaskStartScenarioInPlace(wsb.cache.ped, 'PROP_HUMAN_PARKING_METER', 0, true)
    if wsb.skillCheck({ difficulty = Config.handcuff.lockpicking.difficulty, color = Config.UIColor and Config.UIColor or nil }) then
        TriggerServerEvent('wasabi_police:lockpickHandcuffs', sId)
        TriggerEvent('wasabi_bridge:notify', Strings.success, Strings.lockpick_handcuff_success, 'success')
    else
        TriggerEvent('wasabi_bridge:notify', Strings.failed, Strings.lockpick_handcuff_fail, 'error')
        local random = math.random(1, 100)
        if random <= Config.handcuff.lockpicking.breakChance then
            TriggerServerEvent('wasabi_police:breakLockpick')
            TriggerEvent('wasabi_bridge:notify', Strings.lockpick_broke, Strings.lockpick_broke_desc, 'error')
        end
    end
    ClearPedTasks(wsb.cache.ped)
end)

RegisterNetEvent('wasabi_police:uncuff', function()
    uncuffed()
end)

RegisterNetEvent('wasabi_police:stopEscorting', function(targetId)
    if not escorting.active or escorting.target ~= targetId then return end
    escorting.active = nil
    escorting.target = nil
end)

AddEventHandler('wasabi_police:escortPlayer', function()
    local approved = IsTriggerApproved(GetInvokingResource())
    if not approved then return end
    local coords = GetEntityCoords(wsb.cache.ped)
    local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    else
        escortPlayer(GetPlayerServerId(player))
    end
end)

AddEventHandler('wasabi_police:lockpickVehicle', function()
    local coords = GetEntityCoords(wsb.cache.ped)
    local vehicle = wsb.getClosestVehicle(vec3(coords.x, coords.y, coords.z), 5.0, false)
    if not vehicle or not DoesEntityExist(vehicle) then
        TriggerEvent('wasabi_bridge:notify', Strings.vehicle_not_found, Strings.vehicle_not_found_desc, 'error')
    else
        local vehCoords = GetEntityCoords(vehicle)
        local dist = #(vec3(coords.x, coords.y, coords.z) - vec3(vehCoords.x, vehCoords.y, vehCoords.z))
        if dist < 2.5 then
            lockpickVehicle(vehicle)
        else
            TriggerEvent('wasabi_bridge:notify', Strings.too_far, Strings.too_far_desc, 'error')
        end
    end
end)

AddEventHandler('wasabi_police:impoundVehicle', function()
    local coords = GetEntityCoords(wsb.cache.ped)
    local vehicle = wsb.getClosestVehicle(vec3(coords.x, coords.y, coords.z), 5.0, false)
    if not vehicle or not DoesEntityExist(vehicle) then
        TriggerEvent('wasabi_bridge:notify', Strings.vehicle_not_found, Strings.vehicle_not_found_desc, 'error')
    else
        local vehCoords = GetEntityCoords(vehicle)
        local dist = #(vec3(coords.x, coords.y, coords.z) - vec3(vehCoords.x, vehCoords.y, vehCoords.z))
        if dist < 2.5 then
            impoundVehicle(vehicle)
        else
            TriggerEvent('wasabi_bridge:notify', Strings.too_far, Strings.too_far_desc, 'error')
        end
    end
end)

AddEventHandler('wasabi_police:vehicleInfo', function()
    local coords = GetEntityCoords(wsb.cache.ped)
    local vehicle = wsb.getClosestVehicle(vec3(coords.x, coords.y, coords.z), 5.0, false)
    if not vehicle or not DoesEntityExist(vehicle) then
        TriggerEvent('wasabi_bridge:notify', Strings.vehicle_not_found, Strings.vehicle_not_found_desc, 'error')
    else
        local vehCoords = GetEntityCoords(vehicle)
        local dist = #(vec3(coords.x, coords.y, coords.z) - vec3(vehCoords.x, vehCoords.y, vehCoords.z))
        if dist < 3.5 then
            vehicleInfoMenu(vehicle)
        else
            TriggerEvent('wasabi_bridge:notify', Strings.too_far, Strings.too_far_desc, 'error')
        end
    end
end)

AddEventHandler('wasabi_police:openBossMenu', function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    wsb.openBossMenu()
end)

AddEventHandler('wasabi_police:weaponLicense', function(data)
    GiveWeaponLicense(data.args and data.args.id or data.id)
end)

RegisterNetEvent('wasabi_police:escortedPlayer', function(pdId)
    if isCuffed or deathCheck(GetPlayerServerId(PlayerId())) then
        escorted.active = not escorted.active
        escorted.pdId = pdId
    end
end)

RegisterNetEvent('wasabi_police:setEscort', function(targetId)
    escorting.active = not escorting.active
    escorting.target = targetId
end)

RegisterNetEvent('wasabi_police:seizeCash', function()
    if not wsb.hasGroup(Config.policeJobs) then return end
    local coords = GetEntityCoords(wsb.cache.ped)
    local target = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 5.0, false)
    if not target then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    else
        TriggerServerEvent('wasabi_police:seizeCash', GetPlayerServerId(target))
    end
end)

RegisterNetEvent('wasabi_police:putInVehicle', function()
    if isCuffed or deathCheck(GetPlayerServerId(PlayerId())) then
        if escorted.active then
            escorted.active = nil
            escorted.pdId = nil
            Wait(1000)
        end
        local coords = GetEntityCoords(wsb.cache.ped)
        local vehicle = wsb.getClosestVehicle(vec3(coords.x, coords.y, coords.z), 5.0, false)
        if not vehicle or not DoesEntityExist(vehicle) then return end
        local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)
        for i = maxSeats - 1, 0, -1 do
            if IsVehicleSeatFree(vehicle, i) then
                freeSeat = i
                break
            end
        end
        if freeSeat then
            --    FreezeEntityPosition(wsb.cache.ped, false)
            TaskWarpPedIntoVehicle(wsb.cache.ped, vehicle, freeSeat)
            FreezeEntityPosition(wsb.cache.ped, true)
        end
    end
end)

RegisterNetEvent('wasabi_police:takeFromVehicle', function(policeID)
    if IsPedSittingInAnyVehicle(wsb.cache.ped) then
        local vehicle = GetVehiclePedIsIn(wsb.cache.ped, false)
        if deathCheck(GetPlayerServerId(PlayerId())) then
            local pdPed = GetPlayerPed(GetPlayerFromServerId(policeID))
            if not pdPed then goto continue end
            local offsetCoords = GetOffsetFromEntityInWorldCoords(pdPed, 0.1, 0.0, 0.0)
            FreezeEntityPosition(wsb.cache.ped, false)
            SetEntityCoords(wsb.cache.ped, offsetCoords.x, offsetCoords.y, offsetCoords.z, false, false, false, false)
            return
        end
        :: continue ::
        TaskLeaveVehicle(wsb.cache.ped, vehicle, 64)
        FreezeEntityPosition(wsb.cache.ped, false)
    end
end)

AddEventHandler('wasabi_police:inVehiclePlayer', function()
    local approved = IsTriggerApproved(GetInvokingResource())
    if not approved then return end
    local coords = GetEntityCoords(wsb.cache.ped)
    local player = wsb.getClosestPlayer(coords, 4.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
    else
        TriggerServerEvent('wasabi_police:inVehiclePlayer', GetPlayerServerId(player))
    end
end)

AddEventHandler('wasabi_police:outVehiclePlayer', function()
    local approved = IsTriggerApproved(GetInvokingResource())
    if not approved then return end
    local coords = GetEntityCoords(wsb.cache.ped)
    local player = wsb.getClosestPlayer(coords, 4.0, false)
    if not player then
        TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        return
    end

    local vehicle = GetVehiclePedIsIn(wsb.cache.ped, false)
    local speed = GetEntitySpeed(vehicle)
    if speed > 0.1 then return end

    if IsPedSittingInAnyVehicle(wsb.cache.ped) then return end -- to prevent someone in a vehicle to remove target player from the vehicle

    TriggerServerEvent('wasabi_police:outVehiclePlayer', GetPlayerServerId(player))
end)

AddEventHandler('wasabi_police:vehicleInteractions', function()
    vehicleInteractionMenu()
end)

AddEventHandler('wasabi_police:placeObjects', function()
    placeObjectsMenu()
end)

AddEventHandler('wasabi_police:radarPosts', function()
    RadarPostsMenu()
end)

AddEventHandler('wasabi_police:createRadarPost', function()
    CreateRadarPost()
end)

AddEventHandler('wasabi_police:placeRadarPost', function(data)
    PlaceRadarPost(data.prop)
end)

AddEventHandler('wasabi_police:manageRadarPost', function(data)
    ManageRadarPost(data.id)
end)

AddEventHandler('wasabi_police:renameSpeedTrap', function(data)
    RenameSpeedTrap(data.id)
end)

RegisterNetEvent('wasabi_police:updateSpeedTrapName', function(id, name)
    UpdateSpeedTrapName(id, name)
end)

AddEventHandler('wasabi_police:cctvCameras', function()
    CCTVMenu()
end)

AddEventHandler('wasabi_police:trackingBracelet', function()
    TrackingBraceletMenu()
end)

AddEventHandler('wasabi_police:toggleTrackingBracelet', function(data)
    TriggerServerEvent('wasabi_police:toggleTrackingBracelet', data.target)
end)

AddEventHandler('wasabi_police:createCCTVCamera', function()
    CreateCCTVCamera()
end)

AddEventHandler('wasabi_police:placeCCTVCamera', function(data)
    PlaceCCTVCamera(data.prop)
end)

AddEventHandler('wasabi_police:manageCCTVCamera', function(data)
    ManageCCTVCamera(data.id)
end)

AddEventHandler('wasabi_police:renameCCTVCamera', function(data)
    RenameCCTVCamera(data.id)
end)

RegisterNetEvent('wasabi_police:updateCCTVCameraName', function(id, name)
    UpdateCCTVCameraName(id, name)
end)

AddEventHandler('wasabi_police:viewCCTVCamera', function(data)
    ViewCCTVCamera(data.id)
end)

AddEventHandler('wasabi_police:spawnProp', function(index)
    local prop = Config.Props[index]
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(wsb.cache.ped, 0.0, 2.0, 0.55))
    local obj = CreateObjectNoOffset(prop.model, x, y, z, true, false, false)
    SetEntityHeading(obj, GetEntityHeading(wsb.cache.ped))
    PlaceObjectOnGroundProperly(obj)
    if prop.freeze ~= false then
        FreezeEntityPosition(obj, true)
    end
end)

AddEventHandler('wasabi_police:licenseMenu', function(data)
    if not wsb.hasGroup(Config.policeJobs) then return end
    openLicenseMenu(data)
end)

AddEventHandler('wasabi_police:purchaseArmoury', function(data)
    if not wsb.hasGroup(Config.policeJobs) then return end
    local data = data
    data.quantity = 1
    if data.multiple then
        local input = wsb.inputDialog(Strings.armoury_quantity_dialog, { Strings.quantity }, Config.UIColor)
        if not input then return end
        local input1 = tonumber(input[1])
        if type(input1) ~= 'number' then return end
        local quantity = math.floor(input1)
        if quantity < 1 then
            TriggerEvent('wasabi_bridge:notify', Strings.invalid_amount, Strings.invalid_amount_desc, 'error')
        else
            data.quantity = quantity
        end
    end
    local canPurchase = wsb.awaitServerCallback('wasabi_police:canPurchase', data)
    if canPurchase then
        TriggerEvent('wasabi_bridge:notify', Strings.success, Strings.successful_purchase_desc, 'success')
    else
        TriggerEvent('wasabi_bridge:notify', Strings.lacking_funds, Strings.lacking_funds_desc, 'error')
    end
end)

AddEventHandler('wasabi_police:checkId', function(targetId)
    if not wsb.hasGroup(Config.policeJobs) then return end
    if targetId and type(targetId) == 'table' then targetId = nil end
    if not targetId then
        local coords = GetEntityCoords(wsb.cache.ped)
        local player = wsb.getClosestPlayer(coords, 4.0, false)
        if not player then
            TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        else
            checkPlayerId(GetPlayerServerId(player))
        end
    else
        checkPlayerId(targetId)
    end
end)

AddEventHandler('wasabi_police:revokeLicense', function(data)
    RevokeWeaponLicense(data.targetId, data.license)
    TriggerEvent('wasabi_bridge:notify', Strings.license_revoked, Strings.license_revoked_desc, 'success')
    Wait(420) -- lul
    checkPlayerId(data.targetId)
end)

AddEventHandler('wasabi_police:manageId', function(data)
    manageId(data)
end)

AddEventHandler('wasabi_police:gsrTest', function()
    GSRTestNearbyPlayer()
end)

AddEventHandler('wasabi_police:toggleDuty', function(stationId)
    local job, grade = wsb.hasGroup(Config.policeJobs)
    if not job then
        if wsb.framework == 'esx' then
            local jobs = Config.policeJobs
            if type(jobs) == 'table' then
                for i = 1, #jobs do
                    job, grade = wsb.hasGroup('off' .. jobs[i])
                    if job then break end
                end
            else
                job, grade = wsb.hasGroup('off' .. jobs)
            end
        end
    end
    if not job then return end
    if wsb.framework == 'qb' then
        wsb.playerData.job.onduty = not wsb.playerData.job.onduty
    end
    TriggerServerEvent('wasabi_police:svToggleDuty', stationId.args)
end)

CreateThread(function()
    while true do
        if isCuffed then
            Wait(0)
            DisablePlayerFiring(wsb.cache.playerId, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
            DisableControlAction(0, 75, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            if isCuffed == 'hard' then
                for i = 30, 35 do
                    DisableControlAction(0, i, true)
                end
            end
        else
            Wait(1500)
        end
    end
end)

-- Arrested Loop
local deathByPass = Config.handcuff.cuffDeadPlayers
CreateThread(function()
    while true do
        local sleep = 1500
        if isCuffed then
            sleep = 0
            local deathCheck = deathByPass and deathCheck(wsb.cache.serverId)
            if not IsEntityPlayingAnim(wsb.cache.ped, 'mp_arresting', 'idle', 3) and not LocalPlayer.state.inTrunk and not deathCheck then
                TaskPlayAnim(wsb.cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
                if not IsEntityPlayingAnim(wsb.cache.ped, 'mp_arresting', 'idle', 3) then
                    Wait(3000)
                    TaskPlayAnim(wsb.cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
                    if not IsEntityPlayingAnim(wsb.cache.ped, 'mp_arresting', 'idle', 3) then
                        Wait(2000)
                        TaskPlayAnim(wsb.cache.ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
                    end
                end
            end
            if LocalPlayer.state.inTrunk and IsEntityPlayingAnim(wsb.cache.ped, 'mp_arresting', 'idle', 3) then
                ClearPedTasks(wsb.cache.ped)
            end
            if deathCheck then
                if DoesEntityExist(cuffProp) then
                    SetEntityAsMissionEntity(cuffProp, true, true)
                    DetachEntity(cuffProp, false, false)
                    DeleteObject(cuffProp)
                end
            end
            if not deathCheck and (not cuffProp or not DoesEntityExist(cuffProp)) then
                wsb.stream.model('p_cs_cuffs_02_s', 7500)
                local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(wsb.cache.ped, 0.0, 3.0, 0.5))
                cuffProp = CreateObjectNoOffset(`p_cs_cuffs_02_s`, x, y, z, true, false, false)
                SetModelAsNoLongerNeeded(`p_cs_cuffs_02_s`)
                AttachEntityToEntity(cuffProp, wsb.cache.ped, GetPedBoneIndex(wsb.cache.ped, 57005), 0.04, 0.06, 0.0,
                    -85.24, 4.2,
                    -106.6, true, true, false, true, 1, true)
            end
        elseif cuffProp then
            if DoesEntityExist(cuffProp) then
                SetEntityAsMissionEntity(cuffProp, true, true)
                DetachEntity(cuffProp, false, false)
                DeleteObject(cuffProp)
                ClearPedTasks(wsb.cache.ped)
            end
            cuffProp = nil
        end
        if isRagdoll then
            sleep = 0
            SetPedToRagdoll(wsb.cache.ped, 1000, 1000, 0, false, false, false)
        end
        Wait(sleep)
    end
end)

RegisterNetEvent('wasabi_police:releasePlayerFromEscort', function(pdID)
    if pdID ~= escorted.pdId then return end
    alrEscorted = false
    escorted.active = nil
    isBusy = nil
    ClearPedTasks(wsb.cache.ped)
    DetachEntity(wsb.cache.ped, true, false)
end)

-- Escorting loop
CreateThread(function()
    local alrEscorting, textUI
    while true do
        local sleep = 1500
        if escorting?.active then
            sleep = 0
            local targetPed = GetPlayerPed(GetPlayerFromServerId(escorting.target))
            if not textUI then
                wsb.showTextUI(Strings.stop_escorting_interact)
                textUI = true
            end
            if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not deathCheck(escorting.target) then
                if not alrEscorting then
                    wsb.stream.animDict('amb@code_human_wander_drinking_fat@beer@male@base')
                    TaskPlayAnim(wsb.cache.ped, 'amb@code_human_wander_drinking_fat@beer@male@base', 'static', 8.0, 1.0,
                        -1,
                        49, 0, false, false, false)
                    alrEscorting = true
                    RemoveAnimDict('amb@code_human_wander_drinking_fat@beer@male@base')
                elseif alrEscorting and not IsEntityPlayingAnim(wsb.cache.ped, 'amb@code_human_wander_drinking_fat@beer@male@base', 'static', 3) then
                    wsb.stream.animDict('amb@code_human_wander_drinking_fat@beer@male@base')
                    TaskPlayAnim(wsb.cache.ped, 'amb@code_human_wander_drinking_fat@beer@male@base', 'static', 8.0, 1.0,
                        -1,
                        49, 0, false, false, false)
                    RemoveAnimDict('amb@code_human_wander_drinking_fat@beer@male@base')
                else
                    sleep = 1500
                end
            elseif DoesEntityExist(targetPed) and deathCheck(escorting.target) then
                if not alrEscorting then
                    wsb.stream.animDict('missfinale_c2mcs_1')
                    TaskPlayAnim(wsb.cache.ped, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 8.0, -8.0, -1, 49, 0, false,
                        false, false)
                    RemoveAnimDict('missfinale_c2mcs_1')
                    alrEscorting = true
                elseif alrEscorting and not IsEntityPlayingAnim(wsb.cache.ped, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 3) then
                    wsb.stream.animDict('missfinale_c2mcs_1')
                    TaskPlayAnim(wsb.cache.ped, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 8.0, -8.0, -1, 49, 0, false,
                        false, false)
                    RemoveAnimDict('missfinale_c2mcs_1')
                end
            else
                alrEscorting = nil
                escorting.active = nil
                ClearPedTasks(wsb.cache.ped)
            end
            if IsPedArmed(wsb.cache.ped, 1) or IsPedArmed(wsb.cache.ped, 2) or IsPedArmed(wsb.cache.ped, 4) then
                TriggerEvent('wasabi_bridge:notify', Strings.cant_wield, Strings.cant_wield_desc, 'error')
                SetCurrentPedWeapon(wsb.cache.ped, `WEAPON_UNARMED`, false)
            end
            if IsControlJustReleased(0, 38) or IsDisabledControlJustReleased(0, 38) or IsPedRagdoll(wsb.cache.ped) then
                alrEscorting = nil
                escorting.active = nil
                ClearPedTasks(wsb.cache.ped)
                TriggerServerEvent('wasabi_police:releasePlayer', escorting.target)
            end
            sleep = 0
            DisableControlAction(0, 22, true)
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 25, true)
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
            DisablePlayerFiring(PlayerId(), true)
        elseif textUI then
            wsb.hideTextUI()
            textUI = false
        elseif alrEscorting then
            alrEscorting = nil
            escorting.active = nil
            ClearPedTasks(wsb.cache.ped)
        else
            sleep = 1500
        end
        Wait(sleep)
    end
end)

-- Being escorted loop
CreateThread(function()
    local alrEscorted
    while true do
        local sleep = 1500
        local isDead = deathByPass and deathCheck(wsb.cache.serverId)
        if escorted?.active and isCuffed and not isDead then
            sleep = 0
            local pdPed = GetPlayerPed(GetPlayerFromServerId(escorted.pdId))
            if DoesEntityExist(pdPed) and IsPedOnFoot(pdPed) and not IsPedDeadOrDying(pdPed, true) then
                if not alrEscorted then
                    AttachEntityToEntity(wsb.cache.ped, pdPed, 11816, 0.26, 0.48, 0.0, 0.0, 0.0, 0.0, false, false, false,
                        false, 2, true)
                    alrEscorted = true
                    isBusy = true
                else
                    sleep = 500
                end
                if IsPedWalking(pdPed) then
                    if not IsEntityPlayingAnim(wsb.cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', 3) then
                        wsb.stream.animDict('anim@move_m@prisoner_cuffed')
                        TaskPlayAnim(wsb.cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', 8.0, -8, -1, 1, 0.0, false,
                            false,
                            false)
                    end
                elseif IsPedRunning(pdPed) or IsPedSprinting(pdPed) then
                    if not IsEntityPlayingAnim(wsb.cache.ped, 'anim@move_m@trash', 'run', 3) then
                        wsb.stream.animDict('anim@move_m@trash')
                        TaskPlayAnim(wsb.cache.ped, 'anim@move_m@trash', 'run', 8.0, -8, -1, 1, 0.0, false, false, false)
                    end
                elseif IsEntityPlayingAnim(wsb.cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', 3) or IsEntityPlayingAnim(wsb.cache.ped, 'anim@move_m@trash', 'run', 3) then
                    StopAnimTask(wsb.cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', -8.0)
                    StopAnimTask(wsb.cache.ped, 'anim@move_m@trash', 'run', -8.0)
                end
            else
                alrEscorted = false
                escorted.active = nil
                isBusy = nil
                DetachEntity(wsb.cache.ped, true, false)
            end
        elseif escorted?.active and deathCheck(GetPlayerServerId(PlayerId())) then
            local pdPed = GetPlayerPed(GetPlayerFromServerId(escorted.pdId))
            if not alrEscorted then
                wsb.stream.animDict('nm')
                ClearPedTasks(wsb.cache.ped)
                AttachEntityToEntity(wsb.cache.ped, pdPed, 0, 0.33, 0.0, 0.70, -0.20, 0.0, 200.0, false, false, false,
                    false,
                    2, false)
                TaskPlayAnim(wsb.cache.ped, 'nm', 'firemans_carry', 8.0, -8.0, -1, 33, 0, false, false, false)
                RemoveAnimDict('nm')
                alrEscorted = true
            elseif alrEscorted and not IsEntityPlayingAnim(wsb.cache.ped, 'nm', 'firemans_carry', 3) then
                wsb.stream.animDict('nm')
                TaskPlayAnim(wsb.cache.ped, 'nm', 'firemans_carry', 8.0, -8.0, -1, 33, 0, false, false, false)
                RemoveAnimDict('nm')
            end
        elseif alrEscorted then
            alrEscorted = nil
            isBusy = nil
            DetachEntity(wsb.cache.ped, true, false)
            if IsEntityPlayingAnim(wsb.cache.ped, 'anim@move_m@prisoner_cuffed', 'walk', 3) or
                IsEntityPlayingAnim(wsb.cache.ped, 'anim@move_m@trash', 'run', 3) or
                IsEntityPlayingAnim(wsb.cache.ped, 'nm', 'firemans_carry', 3) then
                ClearPedTasks(wsb.cache.ped)
            end
        else
            sleep = 1500
        end
        Wait(sleep)
    end
end)

-- GSR thread
if Config.GSR.enabled then
    local GSRLoopBreak, GSRLoopRunning, GSRTextUI = false, false, false
    CreateThread(function()
        while true do
            local sleep = 1500
            if IsPedArmed(wsb.cache.ped, 4) then
                sleep = 0
                if IsPedShooting(wsb.cache.ped) then
                    GSRData.positive = true
                    TriggerServerEvent('wasabi_police:setGSR', true)
                    if Config.GSR.autoClean then
                        GSRData.timer = Config.GSR.autoClean
                        if GSRLoopRunning then GSRLoopBreak = true end
                        CreateThread(function()
                            while GSRData?.positive do
                                if GSRLoopBreak then
                                    GSRLoopRunning = false
                                    GSRLoopBreak = false
                                    break
                                end
                                GSRLoopRunning = true
                                Wait(1000)
                                if GSRData.timer == 0 then
                                    GSRData.positive = nil
                                    TriggerServerEvent('wasabi_police:setGSR', false)
                                else
                                    GSRData.timer = GSRData.timer - 1
                                end
                            end
                        end)
                    end
                end
            elseif Config.GSR.cleanInWater and GSRData?.positive and IsEntityInWater(wsb.cache.ped) then
                sleep = 0
                if not GSRTextUI then
                    wsb.showTextUI(Strings.gsr_wash_ui)
                    GSRTextUI = true
                end
                if IsControlJustReleased(0, 38) then
                    wsb.hideTextUI()
                    if wsb.progressUI({
                            duration = Config.GSR.timeToClean,
                            position = 'bottom',
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                                move = true,
                            },
                            anim = {
                                dict = 'missheist_agency3aig_23',
                                clip = 'urinal_sink_loop'
                            },
                        }, 'progressCircle') then
                        if GSRData?.positive then GSRData.positive = nil end
                        GSRLoopBreak = false
                        GSRLoopRunning = false
                        GSRTextUI = false
                        TriggerServerEvent('wasabi_police:setGSR', false)
                        TriggerEvent('wasabi_bridge:notify', Strings.hands_clean, Strings.hands_clean_desc, 'success')
                    else
                        TriggerEvent('wasabi_bridge:notify', Strings.cancelled, Strings.cancelled_desc, 'error')
                        GSRTextUI = false
                    end
                end
            elseif GSRTextUI then
                wsb.hideTextUI()
                GSRTextUI = false
            end
            Wait(sleep)
        end
    end)
end

if wsb.framework == 'qb' then
    AddStateBagChangeHandler('isLoggedIn', '', function(_bagName, _key, value, _reserved, _replicated)
        if value then
            wsb.playerData = QBCore.Functions.GetPlayerData()
        end
        wsb.playerLoaded = value
    end)
end

-- Main thread
CreateThread(function()
    while not wsb.playerLoaded do Wait(500) end
    oldJob = wsb.playerData.job
    if Config.UseRadialMenu then
        AddRadialItems()
    end
    if Config.useTarget then
        local pdJobs = JobArrayToTarget(Config.policeJobs)
        local options = {}
        if Config.searchPlayers then
            local id = #options + 1
            options[id] = {
                num = id,
                event = 'wasabi_police:searchPlayer',
                icon = 'fas fa-magnifying-glass',
                label = Strings.search_player,
                canInteract = function()
                    if not wsb.isOnDuty() then return false end
                    return true
                end,
                job = pdJobs,
                groups = pdJobs,
            }
        end
        if Config.seizeCash.enabled then
            local id = #options + 1
            options[id] = {
                num = id,
                event = 'wasabi_police:seizeCash',
                icon = 'fas fa-sack-dollar',
                label = Strings.seize_cash_title,
                canInteract = function()
                    if not wsb.isOnDuty() then return false end
                    return true
                end,
                job = pdJobs,
                groups = pdJobs,
            }
        end
        options[#options + 1] = {
            num = #options + 1,
            event = 'wasabi_police:checkId',
            icon = 'fas fa-id-card',
            label = Strings.check_id,
            canInteract = function()
                if not wsb.isOnDuty() then return false end
                return true
            end,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            args = { type = 'hard' },
            event = 'wasabi_police:handcuffPlayer',
            icon = 'fas fa-bandage',
            label = Strings.handcuff_hard_player,
            canInteract = function()
                if not wsb.isOnDuty() then return false end
                return true
            end,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            args = { type = 'soft' },
            event = 'wasabi_police:handcuffPlayer',
            icon = 'fas fa-bandage',
            label = Strings.handcuff_soft_player,
            canInteract = function()
                if not wsb.isOnDuty() then return false end
                return true
            end,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            event = 'wasabi_police:escortPlayer',
            icon = 'fas fa-hand-holding-hand',
            label = Strings.escort_player,
            canInteract = function()
                if not wsb.isOnDuty() then return false end
                return true
            end,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            event = 'wasabi_police:inVehiclePlayer',
            icon = 'fas fa-arrow-right-to-bracket',
            label = Strings.put_in_vehicle,
            canInteract = function()
                if not wsb.isOnDuty() then return false end
                return true
            end,
            job = pdJobs,
            groups = pdJobs,
        }
        options[#options + 1] = {
            num = #options + 1,
            event = 'wasabi_police:outVehiclePlayer',
            icon = 'fas fa-arrow-right-from-bracket',
            label = Strings.take_out_vehicle,
            canInteract = function()
                if not wsb.isOnDuty() then return false end
                return true
            end,
            job = pdJobs,
            groups = pdJobs,
        }
        if Config.TrackingBracelet.enabled then
            options[#options + 1] = {
                num = #options + 1,
                event = 'wasabi_police:trackPlayer',
                icon = 'fas fa-map-pin',
                label = Strings.tracking_bracelet,
                canInteract = function()
                    if not wsb.isOnDuty() then return false end
                    return true
                end,
                job = pdJobs,
                groups = pdJobs,
            }
        end
        wsb.target.player({
            distance = 2.0,
            options = options
        })
        wsb.target.vehicle({
            distance = 2.0,
            options = {
                {
                    num = 1,
                    event = 'wasabi_police:inVehiclePlayer',
                    icon = 'fas fa-arrow-right-to-bracket',
                    label = Strings.put_in_vehicle,
                    job = pdJobs,
                    groups = pdJobs,
                    canInteract = function()
                        if not wsb.isOnDuty() then return false end
                        return escorting and escorting.active and escorting.target and true or false
                    end
                },
                {
                    num = 2,
                    event = 'wasabi_police:outVehiclePlayer',
                    icon = 'fas fa-arrow-right-from-bracket',
                    label = Strings.take_out_vehicle,
                    job = pdJobs,
                    groups = pdJobs,
                    canInteract = function()
                        if not wsb.isOnDuty() then return false end
                        local coords = GetEntityCoords(wsb.cache.ped)
                        local player = wsb.getClosestPlayer(vec3(coords.x, coords.y, coords.z), 2.0, false)
                        return player and IsPedInAnyVehicle(GetPlayerPed(player), false) and true or false
                    end
                },
            }
        })
    end
    for k, v in pairs(Config.Locations) do
        if v.blip.enabled then
            CreateBlip(v.blip.coords, v.blip.sprite, v.blip.color, v.blip.string, v.blip.scale, false, 'coords', true)
        end
        if v?.clockInAndOut?.enabled then
            if v.clockInAndOut.target.enabled then
                local jobLock = v.clockInAndOut.jobLock and { v.clockInAndOut.jobLock } or Config.policeJobs
                if wsb.framework == 'esx' then
                    for i = 1, #jobLock do
                        jobLock[#jobLock + 1] = 'off' .. jobLock[i]
                    end
                end
                wsb.target.boxZone(k .. '_toggleduty', v.clockInAndOut.target.coords, v.clockInAndOut.target.width,
                    v.clockInAndOut.target.length, {
                        heading = v.clockInAndOut.target.heading,
                        minZ = v.clockInAndOut.target.minZ,
                        maxZ = v.clockInAndOut.target.maxZ,
                        job = JobArrayToTarget(jobLock),
                        options = {
                            {
                                event = 'wasabi_police:toggleDuty',
                                args = k,
                                icon = 'fa-solid fa-business-time',
                                label = v.clockInAndOut.target.label,
                                distance = v.clockInAndOut.target.distance or 2.0,
                                job = JobArrayToTarget(jobLock),
                                groups = JobArrayToTarget(jobLock)
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    local point = wsb.points.new({
                        coords = v.clockInAndOut.coords,
                        distance = v.clockInAndOut.distance,
                        job = v.clockInAndOut.jobLock or Config.policeJobs,
                        nearby = function(self)
                            if not self.isClosest or (self.currentDistance > v.clockInAndOut.distance) then return end
                            local hasJob
                            local jobName, jobGrade = wsb.hasGroup(self.job)
                            if jobName then
                                hasJob = jobName
                            elseif wsb.framework == 'esx' then
                                local pJobs = {}
                                if type(self.job) == 'table' then
                                    --replace the loop of self.job with new table
                                    for _, v in ipairs(self.job) do
                                        pJobs[#pJobs + 1] = 'off' .. v
                                    end
                                else
                                    pJobs[#pJobs + 1] = self.job
                                    pJobs[#pJobs + 1] = 'off' .. self.job
                                end
                                jobName, jobGrade = wsb.hasGroup(pJobs)
                                if jobName then hasJob = jobName end
                            end
                            if hasJob then
                                if not textUI then
                                    wsb.showTextUI(v.clockInAndOut.label)
                                    textUI = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    TriggerServerEvent('wasabi_police:svToggleDuty', k)
                                end
                            end
                        end,

                        onExit = function()
                            if textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                    })
                end)
            end
        end
        if v.bossMenu.enabled then
            if v.bossMenu?.target?.enabled then
                local pJob, _pGrade = wsb.hasGroup(Config.policeJobs)
                if v.bossMenu.jobLock and pJob then
                    if pJob ~= v.bossMenu.jobLock then pJob = nil end
                end
                if pJob then
                    wsb.target.boxZone(k .. '_pdboss', v.bossMenu.target.coords, v.bossMenu.target.width,
                        v.bossMenu.target.length, {
                            heading = v.bossMenu.target.heading,
                            minZ = v.bossMenu.target.minZ,
                            maxZ = v.bossMenu.target.maxZ,
                            job = pJob,
                            options = {
                                {
                                    event = 'wasabi_police:openBossMenu',
                                    icon = 'fa-solid fa-briefcase',
                                    label = v.bossMenu.target.label,
                                    distance = v.bossMenu.target.distance or 2.0,
                                    job = pJob,
                                    groups = pJob
                                }
                            }
                        })
                end
            else
                CreateThread(function()
                    local textUI
                    local point = wsb.points.new({
                        coords = v.bossMenu.coords,
                        distance = v.bossMenu.distance,
                        nearby = function(self)
                            if not self.isClosest or (self.currentDistance > v.bossMenu.distance) then return end
                            local hasJob
                            local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                            if jobName then hasJob = jobName end
                            if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                                if not wsb.isOnDuty() then hasJob = nil end
                            end
                            if hasJob then
                                if v.bossMenu.jobLock then
                                    if hasJob == v.bossMenu.jobLock then
                                        if not textUI then
                                            wsb.showTextUI(v.bossMenu.label)
                                            textUI = true
                                        end
                                        if IsControlJustReleased(0, 38) then
                                            wsb.openBossMenu(hasJob)
                                        end
                                    end
                                else
                                    if not textUI then
                                        wsb.showTextUI(v.bossMenu.label)
                                        textUI = true
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        wsb.openBossMenu(hasJob)
                                    end
                                end
                            end
                        end,

                        onExit = function()
                            if textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                    })
                end)
            end
        end
        if v.cloakroom.enabled then
            CreateThread(function()
                local textUI
                local point = wsb.points.new({
                    coords = v.cloakroom.coords,
                    distance = v.cloakroom.range,
                    nearby = function(self)
                        if not self.isClosest or (self.currentDistance > v.cloakroom.range) then return end
                        local hasJob
                        local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                        if jobName then hasJob = jobName end
                        if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                            if not wsb.isOnDuty() then hasJob = nil end
                        end
                        if hasJob and v.cloakroom.jobLock then
                            if hasJob == v.cloakroom.jobLock then
                                if not textUI then
                                    wsb.showTextUI(v.cloakroom.label)
                                    textUI = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    openOutfits(k)
                                end
                            end
                        elseif hasJob and not v.cloakroom.jobLock then
                            if not textUI then
                                wsb.showTextUI(v.cloakroom.label)
                                textUI = true
                            end
                            if IsControlJustReleased(0, 38) then
                                openOutfits(k)
                            end
                        end
                    end,

                    onExit = function()
                        if textUI then
                            wsb.hideTextUI()
                            textUI = nil
                        end
                    end
                })
            end)
        end

        if v.personalLocker.enabled then
            if v.personalLocker.target.enabled then
                if wsb.framework == 'esx' then
                    for i = 1, #Config.policeJobs do
                        Config.policeJobs[#Config.policeJobs + 1] = 'off' .. Config.policeJobs[i]
                    end
                end
                wsb.target.boxZone(k .. '_personallocker', v.personalLocker.target.coords, v.personalLocker.target.width,
                    v.personalLocker.target.length, {
                        heading = v.personalLocker.target.heading,
                        minZ = v.personalLocker.target.minZ,
                        maxZ = v.personalLocker.target.maxZ,
                        job = JobArrayToTarget(Config.policeJobs),
                        options = {
                            {
                                event = 'wasabi_police:personalLocker',
                                icon = 'fa-solid fa-archive',
                                label = v.personalLocker.target.label,
                                distance = v.personalLocker.target.distance or 2.0,
                                job = JobArrayToTarget(Config.policeJobs),
                                groups = JobArrayToTarget(Config.policeJobs),
                                station = k
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    local point = wsb.points.new({
                        coords = v.personalLocker.coords,
                        distance = v.personalLocker.range,
                        nearby = function(self)
                            if not self.isClosest or (self.currentDistance > v.personalLocker.range) then return end
                            local hasJob
                            local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                            if jobName then hasJob = jobName end
                            if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                                if not wsb.isOnDuty() then hasJob = nil end
                            end
                            if hasJob and v.personalLocker.jobLock then
                                if hasJob == v.personalLocker.jobLock then
                                    if not textUI then
                                        wsb.showTextUI(v.personalLocker.label)
                                        textUI = true
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        OpenPersonalStash(k)
                                    end
                                end
                            elseif hasJob and not v.personalLocker.jobLock then
                                if not textUI then
                                    wsb.showTextUI(v.personalLocker.label)
                                    textUI = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    OpenPersonalStash(k)
                                end
                            end
                        end,

                        onExit = function()
                            if textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                    })
                end)
            end
        end

        if v.evidenceLocker and v.evidenceLocker.enabled then
            if v.evidenceLocker.target.enabled then
                if wsb.framework == 'esx' then
                    for i = 1, #Config.policeJobs do
                        Config.policeJobs[#Config.policeJobs + 1] = 'off' .. Config.policeJobs[i]
                    end
                end
                wsb.target.boxZone(k .. 'evidencelocker', v.evidenceLocker.target.coords, v.evidenceLocker.target.width,
                    v.evidenceLocker.target.length, {
                        heading = v.evidenceLocker.target.heading,
                        minZ = v.evidenceLocker.target.minZ,
                        maxZ = v.evidenceLocker.target.maxZ,
                        job = JobArrayToTarget(Config.policeJobs),
                        options = {
                            {
                                event = 'wasabi_police:evidenceLocker',
                                icon = 'fa-solid fa-archive',
                                label = v.evidenceLocker.target.label,
                                distance = v.evidenceLocker.target.distance or 2.0,
                                job = JobArrayToTarget(Config.policeJobs),
                                groups = JobArrayToTarget(Config.policeJobs),
                                station = k
                            }
                        }
                    })
            else
                CreateThread(function()
                    local textUI
                    local point = wsb.points.new({
                        coords = v.evidenceLocker.coords,
                        distance = v.evidenceLocker.range,
                        nearby = function(self)
                            if not self.isClosest or (self.currentDistance > v.evidenceLocker.range) then return end
                            local hasJob
                            local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                            if jobName then hasJob = jobName end
                            if v?.clockInAndOut?.enabled and wsb.framework == 'qb' then
                                if not wsb.isOnDuty() then hasJob = nil end
                            end
                            if hasJob and v.evidenceLocker.jobLock then
                                if hasJob == v.evidenceLocker.jobLock then
                                    if not textUI then
                                        wsb.showTextUI(v.evidenceLocker.label)
                                        textUI = true
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        OpenEvidenceLocker(k)
                                    end
                                end
                            elseif hasJob and not v.evidenceLocker.jobLock then
                                if not textUI then
                                    wsb.showTextUI(v.evidenceLocker.label)
                                    textUI = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    OpenEvidenceLocker(k)
                                end
                            end
                        end,

                        onExit = function()
                            if textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end
                    })
                end)
            end
        end

        if v.armoury.enabled then
            if v.armoury.target.enabled then
                if wsb.framework == 'esx' then
                    for i = 1, #Config.policeJobs do
                        Config.policeJobs[#Config.policeJobs + 1] = 'off' .. Config.policeJobs[i]
                    end
                end
                wsb.target.boxZone(k .. '_armoury', v.armoury.target.coords, v.armoury.target.width,
                    v.armoury.target.length, {
                        heading = v.armoury.target.heading,
                        minZ = v.armoury.target.minZ,
                        maxZ = v.armoury.target.maxZ,
                        job = JobArrayToTarget(Config.policeJobs),
                        options = {
                            {
                                event = 'wasabi_police:armouryMenu',
                                icon = 'fa-solid fa-archive',
                                label = v.armoury.target.label,
                                distance = v.armoury.target.distance or 2.0,
                                job = JobArrayToTarget(Config.policeJobs),
                                groups = JobArrayToTarget(Config.policeJobs),
                                station = k,
                                

                            }
                        }
                    })
            else
                CreateThread(function()
                    local ped
                    local textUI
                    local point = wsb.points.new({
                        coords = v.armoury.coords,
                        distance = 30,
                        onEnter = function(self)
                            if not ped and v.armoury.ped then
                                wsb.stream.animDict('mini@strip_club@idles@bouncer@base')
                                wsb.stream.model(v.armoury.ped, 7500)
                                ped = CreatePed(28, v.armoury.ped, v.armoury.coords.x, v.armoury.coords.y,
                                    v.armoury.coords
                                    .z,
                                    v.armoury.heading, false, false)
                                FreezeEntityPosition(ped, true)
                                SetEntityInvincible(ped, true)
                                SetBlockingOfNonTemporaryEvents(ped, true)
                                TaskPlayAnim(ped, 'mini@strip_club@idles@bouncer@base', 'base', 8.0, 0.0, -1, 1, 0, false,
                                    false,
                                    false)
                            end
                        end,

                        nearby = function(self)
                            if self.currentDistance <= 2 then
                                if not textUI then
                                    wsb.showTextUI(v.armoury.label)
                                    textUI = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    if not wsb.hasGroup(Config.policeJobs) then return end
                                    textUI = nil
                                    wsb.hideTextUI()
                                    armouryMenu(k)
                                end
                            elseif self.currentDistance >= 2.2 and textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                        end,

                        onExit = function(self)
                            if textUI then
                                wsb.hideTextUI()
                                textUI = nil
                            end
                            if ped then
                                local model = GetEntityModel(ped)
                                SetModelAsNoLongerNeeded(model)
                                DeletePed(ped)
                                SetPedAsNoLongerNeeded(ped)
                                RemoveAnimDict('mini@strip_club@idles@bouncer@base')
                                ped = nil
                            end
                        end

                    })
                end)
            end
        end
        if v.vehicles.enabled then
            CreateThread(function()
                local zone = v.vehicles.zone
                local textUI
                local landPoint = wsb.points.new({
                    coords = zone.coords,
                    distance = zone.range,
                    nearby = function(self)
                        if not self.isClosest or (self.currentDistance > v.vehicles.zone.range) then return end
                        local hasJob
                        local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                        if jobName then hasJob = jobName end
                        if v.clockInAndOut.enabled and wsb.framework == 'qb' then
                            if not wsb.isOnDuty() then hasJob = nil end
                        end
                        if hasJob then
                            if v.vehicles.jobLock and hasJob ~= v.vehicles.jobLock then return end
                            if not inMenu and not IsPedInAnyVehicle(wsb.cache.ped, false) then
                                if not textUI then
                                    wsb.showTextUI(zone.label)
                                    textUI = true
                                end
                                if IsControlJustReleased(0, 38) then
                                    textUI = nil
                                    wsb.hideTextUI()
                                    openVehicleMenu(k)
                                end
                            elseif not inMenu and IsPedInAnyVehicle(wsb.cache.ped, false) then
                                if not textUI then
                                    textUI = true
                                    wsb.showTextUI(zone.return_label)
                                end
                                if IsControlJustReleased(0, 38) then
                                    textUI = nil
                                    wsb.hideTextUI()
                                    if DoesEntityExist(wsb.cache.vehicle) then
                                        DoScreenFadeOut(800)
                                        while not IsScreenFadedOut() do Wait(100) end
                                        SetEntityAsMissionEntity(wsb.cache.vehicle, false, false)
                                        if Config.customCarlock then
                                            local plate = GetVehicleNumberPlateText(wsb.cache.vehicle)
                                            local model = GetEntityModel(wsb.cache.vehicle)
                                            wsb.removeCarKeys(plate, model, wsb.cache.vehicle)
                                        end
                                        if Config.AdvancedParking then
                                            exports['AdvancedParking']:DeleteVehicle(wsb.cache.vehicle, false)
                                        else
                                            DeleteVehicle(wsb.cache.vehicle)
                                        end
                                        DoScreenFadeIn(800)
                                    end
                                end
                            end
                        end
                    end,

                    onExit = function(self)
                        if textUI then
                            wsb.hideTextUI()
                            textUI = nil
                        end
                    end
                })

                local airPoint = wsb.points.new({
                    coords = v.vehicles.spawn.air.coords,
                    distance = 10,
                    nearby = function(self)
                        if not self.isClosest or (self.currentDistance > v.clockInAndOut.distance) then return end
                        local hasJob
                        local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
                        if jobName then hasJob = jobName end
                        if v.clockInAndOut.enabled and wsb.framework == 'qb' then
                            if not wsb.isOnDuty() then hasJob = nil end
                        end
                        if hasJob and IsPedInAnyVehicle(wsb.cache.ped, false) then
                            if not textUI then
                                textUI = true
                                wsb.showTextUI(zone.return_label)
                            end
                            if IsControlJustReleased(0, 38) then
                                textUI = nil
                                wsb.hideTextUI()
                                if DoesEntityExist(wsb.cache.vehicle) then
                                    DoScreenFadeOut(800)
                                    while not IsScreenFadedOut() do Wait(100) end
                                    SetEntityAsMissionEntity(wsb.cache.vehicle, false, false)
                                    if Config.customCarlock then
                                        local plate = GetVehicleNumberPlateText(wsb.cache.vehicle)
                                        local model = GetEntityModel(wsb.cache.vehicle)
                                        wsb.removeCarKeys(plate, model, wsb.cache.vehicle)
                                    end
                                    if Config.AdvancedParking then
                                        exports['AdvancedParking']:DeleteVehicle(wsb.cache.vehicle, false)
                                    else
                                        DeleteVehicle(wsb.cache.vehicle)
                                    end
                                    DoScreenFadeIn(800)
                                end
                            end
                        end
                    end,

                    onExit = function()
                        if textUI then
                            wsb.hideTextUI()
                            textUI = nil
                        end
                    end
                })
            end)
        end
    end
end)


local function adjustHeading(entity, degrees)
    local currentHeading = GetEntityHeading(entity)
    local newHeading = currentHeading + degrees

    if newHeading >= 360 then
        newHeading = newHeading - 360
    elseif newHeading < 0 then
        newHeading = newHeading + 360
    end

    SetEntityHeading(entity, newHeading)
end


-- Radar Post
if Config.RadarPosts and Config.RadarPosts.enabled then
    CreateThread(function()
        local textUI = false
        local previousProp = nil
        local setDistance = 1.5
        while wsb.playerData?.job == nil do Wait(500) end
        while true do
            local sleep = 1500
            if RadarPostProp then
                sleep = 0
                if previousProp and previousProp ~= RadarPostProp then
                    if DoesEntityExist(previousProp) then
                        SetEntityDrawOutline(previousProp, false)
                        setDistance = 1.5
                        DeleteEntity(previousProp)
                    end
                    previousProp = RadarPostProp
                end
                if not DoesEntityExist(RadarPostProp) then
                    RadarPostProp = nil
                    if textUI then
                        wsb.hideTextUI()
                        setDistance = 1.5
                        textUI = false
                    end
                else
                    DisableControlAction(0, 45, true)
                    DisableControlAction(0, 140, true)
                    DisableControlAction(0, 177, true)
                    DisableControlAction(0, 200, true)
                    DisablePlayerFiring(PlayerId(), true)

                    if not textUI then
                        wsb.showTextUI(Strings.ui_radar_post_place)
                        SetEntityDrawOutline(RadarPostProp, true)
                        SetEntityDrawOutlineColor(3, 144, 252, 255)
                        textUI = true
                    end

                    local groundPosition = GetCoordsInFrontOfPed(setDistance)
                    SetEntityCoords(RadarPostProp, groundPosition.x, groundPosition.y, groundPosition.z, false, false,
                        false, false)
                    PlaceObjectOnGroundProperly(RadarPostProp)

                    if IsDisabledControlPressed(0, 45) then -- Rotate
                        adjustHeading(RadarPostProp, 10)
                        Wait(10)
                    end

                    if IsDisabledControlJustPressed(0, 177) then -- Cancel
                        SetPauseMenuActive(false)
                        SetEntityDrawOutline(RadarPostProp, false)
                        DeleteEntity(RadarPostProp)
                        RadarPostProp = nil
                        textUI = false
                        setDistance = 1.5
                        wsb.hideTextUI()
                    end

                    if IsControlPressed(0, 172) then -- Arrow Up
                        setDistance = setDistance + 0.1
                        if setDistance > 10 then setDistance = 10 end
                    end

                    if IsControlPressed(0, 173) then -- Arrow Down
                        setDistance = setDistance - 0.1
                        if setDistance < 1.5 then setDistance = 1.5 end
                    end

                    if IsControlJustPressed(0, 38) and RadarPostProp then
                        local objectCoords = GetEntityCoords(RadarPostProp)
                        local objHeading = GetEntityHeading(RadarPostProp)
                        local model = GetEntityModel(RadarPostProp)
                        local configIndex = 0
                        for i = 1, #Config.RadarPosts.options do
                            if model == Config.RadarPosts.options[i].prop or model == joaat(Config.RadarPosts.options[i].prop) then
                                configIndex = i
                                local input = wsb.inputDialog(Strings.new_speed_trap, { Strings.name, Strings
                                    .speed_limit, Strings.detection_radius }, Config.UIColor)
                                if not input or #input < 3 then
                                    TriggerEvent('wasabi_bridge:notify', Strings.incorrect_input,
                                        Strings.incorrect_input_cancel,
                                        'error')
                                    goto continue
                                end

                                input[2] = tonumber(input[2])
                                input[3] = tonumber(input[3])                                
                                if not input[2] or input[2] < 5 then
                                    TriggerEvent('wasabi_bridge:notify', Strings.incorrect_input,
                                        Strings.incorrect_input_speed, 'error')
                                else
                                    local created = wsb.awaitServerCallback('wasabi_police:addSpeedTrap', objectCoords,
                                        objHeading,
                                        configIndex, input)

                                    if created then
                                        TriggerEvent('wasabi_bridge:notify', Strings.radar_post,
                                            Strings.radar_post_placed,
                                            'success')
                                    else
                                        TriggerEvent('wasabi_bridge:notify', Strings.radar_post,
                                            Strings.radar_post_failed,
                                            'error')
                                    end
                                end
                            end
                        end
                        :: continue ::
                        SetEntityDrawOutline(RadarPostProp, false)
                        DeleteObject(RadarPostProp)
                        RadarPostProp = nil
                        textUI = false
                        setDistance = 1.5
                        wsb.hideTextUI()
                    end
                end
            elseif previousProp then
                if DoesEntityExist(previousProp) then
                    SetEntityDrawOutline(previousProp, false)
                    DeleteEntity(previousProp)
                end
                previousProp = nil
            end
            Wait(sleep)
        end
    end)
end

-- CCTV Cameras
if Config.CCTVCameras and Config.CCTVCameras.enabled then
    CreateThread(function()
        local textUI = false
        local previousProp = nil

        while true do
            local sleep = 1500
            if CCTVCameraProp then
                sleep = 0
                if previousProp and previousProp ~= CCTVCameraProp then
                    if DoesEntityExist(previousProp) then
                        SetEntityDrawOutline(previousProp, false)
                        DeleteEntity(previousProp)
                    end
                    previousProp = CCTVCameraProp
                end
                if not DoesEntityExist(CCTVCameraProp) then
                    CCTVCameraProp = nil
                    if textUI then
                        wsb.hideTextUI()
                        textUI = false
                    end
                else
                    DisableControlAction(0, 45, true)
                    DisableControlAction(0, 140, true)
                    DisableControlAction(0, 177, true)
                    DisableControlAction(0, 200, true)
                    DisablePlayerFiring(PlayerId(), true)

                    if not textUI then
                        wsb.showTextUI('E - Place \n Q - Rotate  \n BACK - Cancel')
                        SetEntityDrawOutline(CCTVCameraProp, true)
                        SetEntityDrawOutlineColor(3, 144, 252, 255)
                        textUI = true
                    end

                    local flag = 511
                    local hit, entityHit, endCoords, distance, lastEntity, entityType
                    local playerCoords = GetEntityCoords(wsb.cache.ped)
                    hit, entityHit, endCoords = RayCastFromCam(flag, 4, 25)
                    distance = #(playerCoords - endCoords)

                    if entityHit ~= 0 and entityHit ~= lastEntity then
                        local success, result = pcall(GetEntityType, entityHit)
                        entityType = success and result or 0
                    end

                    if entityType == 0 then
                        local _flag = flag == 511 and 26 or 511
                        local _hit, _entityHit, _endCoords = RayCastFromCam(_flag, 4, 25)
                        local _distance = #(playerCoords - _endCoords)

                        if _distance < distance then
                            flag, hit, entityHit, endCoords, distance = _flag, _hit, _entityHit, _endCoords, _distance

                            if entityHit ~= 0 then
                                local success, result = pcall(GetEntityType, entityHit)
                                entityType = success and result or 0
                            end
                        end
                    end

                    SetEntityCoords(CCTVCameraProp, endCoords.x, endCoords.y, endCoords.z, false, false,
                        false, false)
                    if IsDisabledControlPressed(0, 44) then -- Rotate
                        adjustHeading(CCTVCameraProp, 5)
                        Wait(10)
                    end

                    if IsDisabledControlJustPressed(0, 177) then -- Cancel
                        SetPauseMenuActive(false)
                        SetEntityDrawOutline(CCTVCameraProp, false)
                        DeleteEntity(CCTVCameraProp)
                        CCTVCameraProp = nil
                        textUI = false
                        wsb.hideTextUI()
                    end

                    if IsControlJustPressed(0, 38) and CCTVCameraProp then
                        local objectCoords = GetEntityCoords(CCTVCameraProp)
                        local objHeading = GetEntityHeading(CCTVCameraProp)
                        local model = GetEntityModel(CCTVCameraProp)
                        local configIndex = 0
                        for i = 1, #Config.CCTVCameras.options do
                            if model == Config.CCTVCameras.options[i].prop or model == joaat(Config.CCTVCameras.options[i].prop) then
                                configIndex = i
                                local input = wsb.inputDialog(Strings.new_cctv, { Strings.name }, Config.UIColor)
                                if not input or not input[1] then
                                    TriggerEvent('wasabi_bridge:notify', Strings.incorrect_input,
                                        Strings.incorrect_input_cancel,
                                        'error')
                                    goto continue
                                end
                                local created = wsb.awaitServerCallback('wasabi_police:addccctvCamera', objectCoords,
                                    objHeading,
                                    configIndex, input)

                                if created then
                                    TriggerEvent('wasabi_bridge:notify', Strings.cctv,
                                        Strings.cctv_placed,
                                        'success')
                                else
                                    TriggerEvent('wasabi_bridge:notify', Strings.cctv,
                                        Strings.cctv_failed,
                                        'error')
                                end
                            end
                        end
                        :: continue ::
                        SetEntityDrawOutline(CCTVCameraProp, false)
                        DeleteObject(CCTVCameraProp)
                        CCTVCameraProp = nil
                        textUI = false
                        wsb.hideTextUI()
                    end
                end
            elseif previousProp then
                if DoesEntityExist(previousProp) then
                    SetEntityDrawOutline(previousProp, false)
                    DeleteEntity(previousProp)
                end
                previousProp = nil
            end
            Wait(sleep)
        end
    end)
end

function CameraThread()
    CreateThread(function()
        local count = 0
        while CreatedCamera do
            local sleep = 5
            SetTimecycleModifier("scanline_cam_cheap")
            SetTimecycleModifierStrength(1.5)
            DisplayRadar(false)
            DisableAllControlActions(0)
            if Config.CCTVCameras and next(Config.CCTVCameras.EnabledKeys) then
                for _, keys in pairs(Config.CCTVCameras.EnabledKeys) do
                    EnableControlAction(0, keys, true)
                end
            end
            -- CLOSE CAMERAS
            if IsControlJustPressed(1, 177) then
                CloseCamera()
            end

            if LocalPlayer.state.dead then
                CloseCamera()
            end

            -- CAMERA ROTATION CONTROLS
            CameraRotation()
            if CameraIndex and CameraIndex.destory then
                CloseCamera()
            end
            count = count + sleep
            if count > 1000 then
                count = 0
                SendNUIMessage({
                    action = 'updateCameraTime',
                    time = string.format("%02d:%02d", GetClockHours(), GetClockMinutes())
                })
            end
            Wait(sleep)
        end
    end)
end

-- Prop placement loop
CreateThread(function()
    while wsb.playerData?.job == nil do Wait(500) end
    local movingProp = false
    function isEntityProp(ent)
        local model = GetEntityModel(ent)
        for id, data in ipairs(Config.Props) do
            if model == data.model then return true, id end
        end
    end

    while true do
        local wait = 2500
        local hasJob
        local jobName, jobGrade = wsb.hasGroup(Config.policeJobs)
        if jobName then hasJob = jobName end
        if wsb.framework == 'qb' then
            while not wsb.playerLoaded do Wait(500) end
            if not wsb.isOnDuty() then hasJob = nil end
        end
        local ped = wsb.cache.ped
        local pcoords = GetEntityCoords(ped)
        if hasJob and not IsPedInAnyVehicle(ped, false) then
            if (not movingProp) then
                local objPool = GetGamePool('CObject')
                for i = 1, #objPool do
                    local ent = objPool[i]
                    local prop, index = isEntityProp(ent)
                    if (prop) then
                        local dist = #(GetEntityCoords(ent) - pcoords)
                        if dist < 1.75 then
                            wait = 0
                            ShowHelpNotification(Strings.prop_help_text)
                            if IsControlJustPressed(1, 51) then
                                RequestNetworkControl(ent)
                                movingProp = ent
                                local c, r = vec3(0.0, 1.0, -1.0), vec3(0.0, 0.0, 0.0)
                                AttachEntityToEntity(movingProp, ped, ped, c.x, c.y, c.z, r.x, r.y, r.z, false, false,
                                    false, false, 2, true)
                                break
                            elseif IsControlJustPressed(1, 47) then
                                RequestNetworkControl(ent)
                                DeleteObject(ent)
                                break
                            end
                        end
                    end
                end
            else
                wait = 0
                ShowHelpNotification(Strings.prop_help_text2)
                if IsControlJustPressed(1, 51) then
                    RequestNetworkControl(movingProp)
                    DetachEntity(movingProp, false, false)
                    PlaceObjectOnGroundProperly(movingProp)
                    FreezeEntityPosition(movingProp, true)
                    movingProp = false
                end
            end
        end
        Wait(wait)
    end
end)

-- Spike strip functionality
if Config.spikeStripsEnabled then
    CreateThread(function()
        local spikes = `p_ld_stinger_s`
        while true do
            local sleep = 1500
            local coords = GetEntityCoords(wsb.cache.ped)
            if not IsPedInAnyVehicle(wsb.cache.ped, false) then
                sleep = 1500
            else
                local obj = GetClosestObjectOfType(coords.x, coords.y, coords.z, 100.0, spikes, false, false, false)
                if DoesEntityExist(obj) then
                    sleep = 0
                    local vehicle = GetVehiclePedIsIn(wsb.cache.ped, false)
                    local objCoords = GetEntityCoords(obj)
                    local dist = #(vec3(coords.x, coords.y, coords.z) - vec3(objCoords.x, objCoords.y, objCoords.z))
                    if dist < 3.0 then
                        for i = 0, 7 do
                            if not IsVehicleTyreBurst(vehicle, i, false) then
                                SetVehicleTyreBurst(vehicle, i, true, 1000)
                            end
                        end
                        sleep = 1500
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

if Config.tackle.enabled then
    RegisterCommand('tacklePlayer', function()
        attemptTackle()
    end)
    TriggerEvent('chat:removeSuggestion', '/tacklePlayer')
    RegisterKeyMapping('tacklePlayer', Strings.key_map_tackle, 'keyboard', Config.tackle.hotkey)
end

if Config.handcuff.hotkey then
    RegisterCommand('cuffPlayer', function()
        if not wsb.hasGroup(Config.policeJobs) then return end
        TriggerEvent('wasabi_police:handcuffPlayer')
    end)
    TriggerEvent('chat:removeSuggestion', '/cuffPlayer')
    RegisterKeyMapping('cuffPlayer', Strings.key_map_cuff, 'keyboard', Config.handcuff.hotkey)
end

if Config.GSR.enabled and Config.GSR.command then
    RegisterCommand(Config.GSR.command, function()
        GSRTestNearbyPlayer()
    end)
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not wsb?.playerLoaded then return end
    PersistentCuffCheck()
    if Config.Jail.BuiltInPrison.enabled and Config.Jail.BuiltInPrison.persistentJail then
        CheckJailTime()
    end
    if not Config.UseRadialMenu then return end
    AddRadialItems()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    DeleteAllSpeedTraps()
end)

AddEventHandler('wasabi_police:personalLocker', function(data)
    OpenPersonalStash(data.station)
end)

AddEventHandler('wasabi_police:evidenceLocker', function(data)
    OpenEvidenceLocker(data.station)
end)

AddEventHandler('wasabi_police:armouryMenu', function(data)
    armouryMenu(data.station)
end)

RegisterNetEvent('wasabi_police:alertDialog', function(data)
    data.color = Config.UIColor
    wsb.alertDialog(data)
end)

RegisterNetEvent('wasabi_police:initSpeedTraps', function(traps)
    SpeedTraps = traps
    for i = 1, #SpeedTraps do
        local trap = SpeedTraps[i]
        trap.point = AddSpeedTrapPoint(trap, i)
        if Config.RadarPosts.blip.enabled then
            trap.coords = vec3(trap.coords.x, trap.coords.y, trap.coords.z)
            trap.blip = CreateBlip(trap.coords, Config.RadarPosts.blip.sprite, Config.RadarPosts.blip.color,
                Config.RadarPosts.blip.label, Config.RadarPosts.blip.scale, false, 'coords', Config.RadarPosts.blip
                .short)
        end
    end
end)

RegisterNetEvent('wasabi_police:initCCTVCameras', function(cameras)
    CCTVCameras = cameras
    for i = 1, #CCTVCameras do
        local camera = CCTVCameras[i]
        camera.point = AddCCTVCameraPoint(camera, i)
        if Config.CCTVCameras.blip.enabled then
            camera.coords = vec3(camera.coords.x, camera.coords.y, camera.coords.z)
            camera.blip = CreateBlip(camera.coords, Config.CCTVCameras.blip.sprite, Config.CCTVCameras.blip.color,
                Config.CCTVCameras.blip.label, Config.CCTVCameras.blip.scale, false, 'coords', Config.CCTVCameras.blip
                .short)
        end
    end
end)

RegisterNetEvent('wasabi_police:addNewSpeedTrap', function(speedTrap)
    local tblKey = #SpeedTraps + 1
    SpeedTraps[tblKey] = speedTrap
    SpeedTraps[tblKey].point = AddSpeedTrapPoint(speedTrap, tblKey)
    if Config.RadarPosts.blip.enabled then
        SpeedTraps[tblKey].blip = CreateBlip(vec3(speedTrap.coords.x, speedTrap.coords.y, speedTrap.coords.z),
            Config.RadarPosts.blip.sprite, Config.RadarPosts.blip.color,
            Config.RadarPosts.blip.label, Config.RadarPosts.blip.scale, false, 'coords', Config.RadarPosts.blip.short)
    end
end)

RegisterNetEvent('wasabi_police:removeSpeedTrap', function(id)
    if type(id) == 'table' then
        TriggerServerEvent('wasabi_police:removeSpeedTrap', id.id)
        return
    end
    local newTraps = {}
    for i = 1, #SpeedTraps do
        if SpeedTraps[i].id == id then
            if SpeedTraps[i].point then
                SpeedTraps[i].point:remove()
            end
            if SpeedTraps[i].object then
                DeleteEntity(SpeedTraps[i].object)
            end
            if SpeedTraps[i].blip then
                RemoveBlip(SpeedTraps[i].blip)
            end
        else
            newTraps[#newTraps + 1] = SpeedTraps[i]
        end
    end
    SpeedTraps = newTraps
    ClosestSpeedTrap = nil
end)

RegisterNetEvent('wasabi_police:repairCCTVCamera', function(data)
    local camera = GetCCTVCameraById(data.id)
    if not camera then return end

    if not ClosestCCTVCamera or (CCTVCameras[ClosestCCTVCamera] and CCTVCameras[ClosestCCTVCamera].id ~= data.id) then
        TriggerEvent('wasabi_bridge:notify', Strings.cctv, Strings.cctv_not_closest, 'info')
        return
    end
    if not camera.destory then
        TriggerEvent('wasabi_bridge:notify', Strings.cctv, Strings.cctv_not_broken, 'info')
        return
    end
    if camera.object then
        local maxHealth = GetEntityMaxHealth(camera.object)
        SetEntityHealth(camera.object, maxHealth)
    end
    local repaired = wsb.awaitServerCallback('wasabi_police:repairCCTVCameraById', data.id)
    if repaired then
        TriggerEvent('wasabi_bridge:notify', Strings.cctv, Strings.cctv_repaired, 'success')
    else
        TriggerEvent('wasabi_bridge:notify', Strings.cctv, Strings.cctv_repair_failed, 'error')
    end
end)

RegisterNetEvent('wasabi_police:updateCCTVCameraRepair', function(id, destroy)
    local camera = GetCCTVCameraById(id)
    if not camera then return end
    camera.destory = destroy
end)

RegisterNetEvent('wasabi_police:addNewCCTVCamera', function(cctv)
    local tblKey = #CCTVCameras + 1
    CCTVCameras[tblKey] = cctv
    CCTVCameras[tblKey].point = AddCCTVCameraPoint(cctv, tblKey)
    if Config.CCTVCameras.blip.enabled then
        CCTVCameras[tblKey].blip = CreateBlip(vec3(cctv.coords.x, cctv.coords.y, cctv.coords.z),
            Config.CCTVCameras.blip.sprite, Config.CCTVCameras.blip.color,
            Config.CCTVCameras.blip.label, Config.CCTVCameras.blip.scale, false, 'coords', Config.CCTVCameras.blip.short)
    end
end)

RegisterNetEvent('wasabi_police:removeCCTVCamera', function(id)
    if type(id) == 'table' then
        TriggerServerEvent('wasabi_police:removeCCTVCamera', id.id)
        return
    end
    local newCameras = {}
    for i = 1, #CCTVCameras do
        if CCTVCameras[i].id == id then
            if CCTVCameras[i].point then
                CCTVCameras[i].point:remove()
            end
            if CCTVCameras[i].object then
                DeleteEntity(CCTVCameras[i].object)
            end
            if CCTVCameras[i].blip then
                RemoveBlip(CCTVCameras[i].blip)
            end
        else
            newCameras[#newCameras + 1] = CCTVCameras[i]
        end
    end
    CCTVCameras = newCameras
    ClosestCCTVCamera = nil
end)

--Update Cop Counter
RegisterNetEvent('wasabi_bridge:setJob', function(JobInfo)
    if not oldJob then
        oldJob = JobInfo
        return
    end

    local function isInList(str, tbl)
        for _, value in ipairs(tbl) do
            if value == str then
                return true
            end
        end
        return false
    end
    if isInList(oldJob.name, Config.policeJobs) and not isInList(JobInfo.name, Config.policeJobs) then
        TriggerServerEvent('wasabi_police:addPoliceCount', false)
        oldJob = JobInfo
        if Config.UseRadialMenu then
            RemoveRadialItems()
        end
        return
    end

    if not isInList(oldJob.name, Config.policeJobs) and isInList(JobInfo.name, Config.policeJobs) then
        if wsb.isOnDuty() then
            TriggerServerEvent('wasabi_police:addPoliceCount', true)
        end
        oldJob = JobInfo
        if Config.UseRadialMenu then
            AddRadialItems()
        end
        return
    end

    if oldJob.name == JobInfo.name and isInList(JobInfo.name, Config.policeJobs) then
        if not isInList(JobInfo.name, Config.policeJobs) then return end
        if wsb.framework == 'qb' then
            if oldJob.onduty == JobInfo.onduty then return end
            if oldJob.onduty and not JobInfo.onduty then
                TriggerServerEvent('wasabi_police:addPoliceCount', false)
                if Config.UseRadialMenu then
                    RemoveRadialItems()
                end
            elseif not oldJob.onduty and JobInfo.onduty then
                TriggerServerEvent('wasabi_police:addPoliceCount', true)
                if Config.UseRadialMenu then
                    AddRadialItems()
                end
            end
        end
    end

    oldJob = JobInfo
end)

RegisterCommand('pdJobMenu', function()
    openJobMenu()
end, false)

AddEventHandler('wasabi_police:pdJobMenu', function()
    openJobMenu()
end)

TriggerEvent('chat:removeSuggestion', '/pdJobMenu')

RegisterKeyMapping('pdJobMenu', Strings.key_map_job, 'keyboard', Config.jobMenu)

if Config.Jail.enabled and Config.Jail.jail == 'qb' then
    RegisterNetEvent('wasabi_police:qbPrisonJail', function(time)
        if isCuffed then uncuffed() end
        if escorted and escorted.active then
            local ped = PlayerPedId()
            TriggerServerEvent('wasabi_police:escortPlayerStop', escorted.pdId, true)
            escorted.active = nil
            escorted.pdId = nil
            DetachEntity(ped, true, false)
        end
        TriggerEvent('prison:client:Enter', time)
    end)
end

function CheckJailTime()
    if not Config.Jail.BuiltInPrison.persistentJail then return end

    while not wsb?.playerLoaded or not wsb?.playerData do Wait(1000) end

    JailTime = false

    if wsb.framework == 'esx' then
        JailTime = wsb.awaitServerCallback('wasabi_police:jailCheck')
    elseif wsb.framework == 'qb' then
        JailTime = wsb.playerData.metadata.injail or false
    end
    if JailTime ~= 0 then
        TriggerServerEvent('wasabi_police:server:sendToJail', nil, JailTime)
    end
end

local function inPrison(time)
    InJail, JailTime = true, time
    CreateThread(function()
        while JailTime > 0 and InJail do
            SendNUIMessage({
                action = 'jailCounter',
                header = Strings.jail_countdown_header,
                sentence = Strings.jail_countdown_sentence:format(JailTime),
                color = Config.JailUIColor
            })
            Wait(60000) -- 1 minute
            if JailTime > 0 and InJail then
                JailTime -= 1
                if JailTime <= 0 then
                    JailTime = 0
                    SendNUIMessage({ action = 'jailCounter' })
                    TriggerEvent('wasabi_bridge:notify', Strings.jail_time_up, Strings.jail_time_up_desc, 'success')
                end
                TriggerServerEvent("wasabi_police:setJailStatus", JailTime)
            end
        end
    end)
end

RegisterNetEvent('wasabi_police:jailPlayer', function(time)
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    local randomStartPosition = Config.Jail.BuiltInPrison.spawn[math.random(1, #Config.Jail.BuiltInPrison.spawn)]
    SetEntityCoords(wsb.cache.ped, randomStartPosition.coords.x, randomStartPosition.coords.y,
        randomStartPosition.coords.z - 0.9, false, false, false, false)
    SetEntityHeading(wsb.cache.ped, randomStartPosition.coords.w)
    Wait(500)
    DoScreenFadeIn(500)
    TriggerEvent('wasabi_police:changeClothes', Config.Jail.BuiltInPrison.jailOutfit)
    inPrison(time)
end)

RegisterNetEvent('wasabi_police:releaseFromJail', function()
    DoScreenFadeOut(500)
    while not IsScreenFadedOut() do
        Wait(10)
    end
    InJail = false
    JailTime = 0
    SetEntityCoords(wsb.cache.ped, Config.Jail.BuiltInPrison.release.x, Config.Jail.BuiltInPrison.release.y,
        Config.Jail.BuiltInPrison.release.z - 0.9, false, false, false, false)
    SetEntityHeading(wsb.cache.ped, Config.Jail.BuiltInPrison.release.w)
    TriggerEvent('wasabi_police:changeClothes', 'civ_wear')
    DoScreenFadeIn(500)
    Wait(500)
end)
if wsb.framework == 'qb' then -- QBCore Compatibility
    local checkIfDead = function(id)
        local isDead = wsb.awaitServerCallback('wasabi_police:isPlayerDead', id)
        return isDead
    end
    RegisterNetEvent('police:client:RobPlayer', function()
        local ped = wsb.cache.ped
        local coords = GetEntityCoords(ped)
        local closestPlayer = wsb.getClosestPlayer(coords, 2.5, false)
        if closestPlayer then
            local targetPed = GetPlayerPed(closestPlayer)
            local targetId = GetPlayerServerId(closestPlayer)
            if IsEntityPlayingAnim(targetPed, 'missminuteman_1ig_2', 'handsup_base', 3) or IsEntityPlayingAnim(targetPed, 'mp_arresting', 'idle', 3) or checkIfDead(targetId) then
                if wsb.progressUI({
                        duration = math.random(5000, 7000),
                        label = Strings.robbing_player,
                        position = 'bottom',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                            combat = true,
                        },
                        anim = {
                            dict = 'random@shop_robbery',
                            clip = 'robbery_action_b'
                        },
                    }, 'progressCircle') then
                    wsb.inventory.openPlayerInventory(targetId)
                else
                    TriggerEvent('wasabi_bridge:notify', Strings.cancelled_action, Strings.cancelled_action_desc, 'error')
                end
            end
        else
            TriggerEvent('wasabi_bridge:notify', Strings.no_nearby, Strings.no_nearby_desc, 'error')
        end
    end)

    RegisterNetEvent('police:client:CuffPlayerSoft', function()
        TriggerEvent('wasabi_police:handcuffPlayer')
    end)

    RegisterNetEvent('police:client:PutPlayerInVehicle', function()
        TriggerEvent('wasabi_police:inVehiclePlayer')
    end)

    RegisterNetEvent('police:client:SetPlayerOutVehicle', function()
        TriggerEvent('wasabi_police:outVehiclePlayer')
    end)

    RegisterNetEvent('police:client:EscortPlayer', function()
        TriggerEvent('wasabi_police:escortPlayer')
    end)

    RegisterNetEvent('police:client:SearchPlayer', function()
        TriggerEvent('wasabi_police:searchPlayer')
    end)

    -- QB-Radialmenu Object Spawn compatibility
    if GetResourceState('qb-radialmenu') == 'started' then
        local function SpawnProp(prop)
            local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(wsb.cache.ped, 0.0, 2.0, 0.55))
            local obj = CreateObjectNoOffset(prop.model, x, y, z, true, false, false)
            SetEntityHeading(obj, GetEntityHeading(wsb.cache.ped))
            PlaceObjectOnGroundProperly(obj)
            
            if prop.freeze ~= false then
                FreezeEntityPosition(obj, true)
            end
        end
    
        RegisterNetEvent('police:client:spawnCone', function()
            SpawnProp(Config.Objects.cone)
        end)
    
        RegisterNetEvent('police:client:spawnBarrier', function()
            SpawnProp(Config.Objects.barrier)
        end)
    
        RegisterNetEvent('police:client:spawnRoadSign', function()
            SpawnProp(Config.Objects.roadsign)
        end)
    
        RegisterNetEvent('police:client:spawnTent', function()
            SpawnProp(Config.Objects.tent)
        end)
    
        RegisterNetEvent('police:client:spawnLight', function()
            SpawnProp(Config.Objects.light)
        end)
    
        RegisterNetEvent('police:client:SpawnSpikeStrip', function()
            SpawnProp(Config.Objects.spikeStrip)
        end)
    end
end

if Config.billingSystem == 'qb' then
    RegisterNetEvent('wasabi_police:sendQBEmail', function(data)
        TriggerServerEvent('qb-phone:server:sendNewMail', data)
    end)
end
