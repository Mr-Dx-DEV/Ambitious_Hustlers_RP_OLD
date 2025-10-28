if GetConvarInt('ox_target:defaults', 1) ~= 1 then return end

local api = require 'client.api'
local GetEntityBoneIndexByName = GetEntityBoneIndexByName
local GetEntityBonePosition_2 = GetEntityBonePosition_2
local GetVehicleDoorLockStatus = GetVehicleDoorLockStatus

local bones = {
    [0] = 'dside_f',
    [1] = 'pside_f',
    [2] = 'dside_r',
    [3] = 'pside_r'
}

---@param vehicle number
---@param door number
local function toggleDoor(vehicle, door)
    if GetVehicleDoorLockStatus(vehicle) ~= 2 then
        if GetVehicleDoorAngleRatio(vehicle, door) > 0.0 then
            SetVehicleDoorShut(vehicle, door, false)
        else
            SetVehicleDoorOpen(vehicle, door, false, false)
        end
    end
end

---@param entity number
---@param coords vector3
---@param door number
---@param useOffset boolean?
---@return boolean?
local function canInteractWithDoor(entity, coords, door, useOffset)
    if not GetIsDoorValid(entity, door) or GetVehicleDoorLockStatus(entity) > 1 or IsVehicleDoorDamaged(entity, door) or cache.vehicle then return end

    if useOffset then return true end

    local boneName = bones[door]

    if not boneName then return false end

    local boneId = GetEntityBoneIndexByName(entity, 'door_' .. boneName)

    if boneId ~= -1 then
        return #(coords - GetEntityBonePosition_2(entity, boneId)) < 0.5 or
            #(coords - GetEntityBonePosition_2(entity, GetEntityBoneIndexByName(entity, 'seat_' .. boneName))) < 0.72
    end
end

local function onSelectDoor(data, door)
    local entity = data.entity

    if NetworkGetEntityOwner(entity) == cache.playerId then
        return toggleDoor(entity, door)
    end

    TriggerServerEvent('ox_target:toggleEntityDoor', VehToNet(entity), door)
end

RegisterNetEvent('ox_target:toggleEntityDoor', function(netId, door)
    local entity = NetToVeh(netId)
    toggleDoor(entity, door)
end)

api.addGlobalVehicle({
    {
        name = 'ox_target:driverF',
        icon = 'fa-solid fa-car-side',
        label = locale('toggle_front_driver_door'),
        bones = { 'door_dside_f', 'seat_dside_f' },
        distance = 2,
        canInteract = function(entity, distance, coords, name)
            return canInteractWithDoor(entity, coords, 0)
        end,
        onSelect = function(data)
            onSelectDoor(data, 0)
        end
    },
    {
        name = 'ox_target:passengerF',
        icon = 'fa-solid fa-car-side',
        label = locale('toggle_front_passenger_door'),
        bones = { 'door_pside_f', 'seat_pside_f' },
        distance = 2,
        canInteract = function(entity, distance, coords, name)
            return canInteractWithDoor(entity, coords, 1)
        end,
        onSelect = function(data)
            onSelectDoor(data, 1)
        end
    },
    {
        name = 'ox_target:driverR',
        icon = 'fa-solid fa-car-side',
        label = locale('toggle_rear_driver_door'),
        bones = { 'door_dside_r', 'seat_dside_r' },
        distance = 2,
        canInteract = function(entity, distance, coords)
            return canInteractWithDoor(entity, coords, 2)
        end,
        onSelect = function(data)
            onSelectDoor(data, 2)
        end
    },
    {
        name = 'ox_target:passengerR',
        icon = 'fa-solid fa-car-side',
        label = locale('toggle_rear_passenger_door'),
        bones = { 'door_pside_r', 'seat_pside_r' },
        distance = 2,
        canInteract = function(entity, distance, coords)
            return canInteractWithDoor(entity, coords, 3)
        end,
        onSelect = function(data)
            onSelectDoor(data, 3)
        end
    },
    {
        name = 'ox_target:bonnet',
        icon = 'fa-solid fa-car',
        label = locale('toggle_hood'),
        offset = vec3(0.5, 1, 0.5),
        distance = 2,
        canInteract = function(entity, distance, coords)
            return canInteractWithDoor(entity, coords, 4, true)
        end,
        onSelect = function(data)
            onSelectDoor(data, 4)
        end
    },
    {
        name = 'ox_target:trunk',
        icon = 'fa-solid fa-car-rear',
        label = locale('toggle_trunk'),
        offset = vec3(0.5, 0, 0.5),
        distance = 2,
        canInteract = function(entity, distance, coords, name)
            return canInteractWithDoor(entity, coords, 5, true)
        end,
        onSelect = function(data)
            onSelectDoor(data, 5)
        end
    },
    {
        name = 'ox_target:inVehiclePlayer',
        icon = 'fa-solid fa-car-rear',
        label = 'Put In Vehicle',
        distance = 2,
        canInteract = function(entity, distance, coords, name)
            return canInteractWithDoor(entity, coords, 5, true)
        end,
        onSelect = function(data)
             TriggerEvent('wasabi_police:inVehiclePlayer')
        end
    },
    {
        name = 'ox_target:outVehiclePlayer',
        icon = 'fa-solid fa-car-rear',
        label = 'Take Out of Vehcile',
        distance = 2,
        canInteract = function(entity, distance, coords, name)
            return canInteractWithDoor(entity, coords, 5, true)
        end,
        onSelect = function(data)
             TriggerEvent('wasabi_police:outVehiclePlayer')
        end
    }
})

api.addGlobalPlayer({
    {
        name = 'ox_target:escortPlayer',
        icon = 'fa-solid fa-hand-holding-hand',
        label = 'Escort Player',
        distance = 2,
        canInteract = function(entity, distance, coords, name)
            local playerData = QBCore.Functions.GetPlayerData()
            if playerData and playerData.job and playerData.job.name == 'police' then
                return false -- police can't see "Rob Player"
            end
            return true 
        end,
        onSelect = function(data)
            TriggerEvent('wasabi_police:escortPlayer')
        end
    },
    {
        name = 'ox_target:escortOrRobPlayer',
        icon = 'fa-solid fa-hand-holding-hand',
        label = 'Rob Player',
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local playerData = QBCore.Functions.GetPlayerData()
            if playerData and playerData.job and playerData.job.name == 'police' then
                return false -- police can't see "Rob Player"
            end
            if not IsPedAPlayer(entity) then return false end

            local targetPlayer = NetworkGetPlayerIndexFromPed(entity)
            if not targetPlayer then return false end

            local serverId = GetPlayerServerId(targetPlayer)
            local isDead = exports.wasabi_ambulance:isPlayerDead(serverId)
            local isHandsUp = IsEntityPlayingAnim(entity, "random@mugging3", "handsup_standing_base", 3)

            return isDead or isHandsUp
        end,
        onSelect = function(data)
            TriggerEvent('police:client:RobPlayer')
        end
    }
})
