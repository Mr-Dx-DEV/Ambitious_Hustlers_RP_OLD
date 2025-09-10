-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
local found = GetResourceState('qb-core')
if found ~= 'started' and found ~= 'starting' then return end

QBCore = exports['qb-core']:GetCoreObject()
WSB = {}
WSB.framework, WSB.playerLoaded, WSB.playerData = 'qb', nil, {}
---@diagnostic disable: duplicate-set-field

function WSB.getCore()
    return QBCore
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SwitchHandler('isLoggedIn', WSB.playerData or {})
    TriggerEvent('wasabi_bridge:onPlayerSpawn')
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    SwitchHandler('isLoggedOut')
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName or not LocalPlayer.state.isLoggedIn then return end
    SwitchHandler('start')
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    if not job or not job.name then return end
    SwitchHandler('setJob', job)
end)

AddEventHandler('gameEventTriggered', function(event, data)
    if event ~= 'CEventNetworkEntityDamage' then return end
    local playerPed = PlayerPedId()
    local victim, victimDied = data[1], data[4]
    if not IsPedAPlayer(victim) then return end
    local player = PlayerId()
    if victimDied and NetworkGetPlayerIndexFromPed(victim) == player and (IsPedDeadOrDying(victim, true) or IsPedFatallyInjured(victim)) then
        local deathCause = GetPedCauseOfDeath(playerPed)
        local data = {
            deathCause = deathCause,
            victimCoords = GetEntityCoords(victim)
        }
        TriggerEvent('wasabi_bridge:onPlayerDeath', data)
    end
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(newPlayerData)
    if not source or source == '' or GetInvokingResource() then return end
    SwitchHandler('QBCore:Player:SetPlayerData', newPlayerData)
end)

---@diagnostic disable: duplicate-set-field
function WSB.serverCallback(name, cb, ...)
    Callback(name, false, cb, ...)
end


function WSB.awaitServerCallback(name, ...)
    local results = { Callback.awaitResponse(name, false, ...) }
    return table.unpack(results)
end

function WSB.registerCallback(name, fn)
    Callback.register(name, function(source, ...)
         local responded = false
         local response = nil
         
         local cb = function(...)
             responded = true
             response = {...}
         end
         
         local ok, ret = pcall(function(...) 
             return table.pack(fn(source, cb, ...)) 
         end, ...)
 
         if responded then
             return table.unpack(response)
         elseif ret ~= nil then
             return table.unpack(ret, 1, ret.n)
         end
 
         if not ok then
             print(("[wsb] callback %s threw an error: %s"):format(name, ret))
         end
     end)
 end

-- function WSB.awaitServerCallback(name, ...)
--     local args = { ... }
--     local promise = promise.new() 
--     QBCore.Functions.TriggerCallback(name, function(...)
--         promise:resolve(table.pack(...)) 
--     end, table.unpack(args))
--     local result = Citizen.Await(promise)
--     return table.unpack(result, 1, result.n)
-- end

function WSB.hasGroup(filter)
    local groups = { 'job', 'gang' }
    local type = type(filter)

    if type == 'string' then
        for i = 1, #groups do
            local data = WSB.playerData[groups[i]]

            if data and data.name == filter then
                return data.name, data.grade.level
            end
        end
    else
        local tabletype = table.type(filter)

        if tabletype == 'hash' then
            for i = 1, #groups do
                local data = WSB.playerData[groups[i]]
                local grade
                if data then grade = filter[data.name] end

                if data and grade and grade <= data.grade.level then
                    return data.name, data.grade.level
                end
            end
        elseif tabletype == 'array' then
            for i = 1, #filter do
                local group = filter[i]

                for j = 1, #groups do
                    local data = WSB.playerData[groups[j]]

                    if data and data.name == group then
                        return data.name, data.grade.level
                    end
                end
            end
        end
    end
end

function WSB.getGroup()
    if not WSB.playerLoaded then return end
    local data = WSB.playerData['job']
    return data.name, data.grade.level
end

function WSB.isOnDuty()
    if not WSB.playerLoaded then return end
    WSB.playerData = QBCore.Functions.GetPlayerData()
    return WSB.playerData.job.onduty
end

local qbx = GetResourceState('qbx_management')
local isQbxStarted = qbx == 'started'

function WSB.openBossMenu(_job)
    if isQbxStarted then
        exports.qbx_management:OpenBossMenu('job')
    else
        TriggerEvent('qb-bossmenu:client:OpenMenu')
    end
end

function WSB.getGender()
    if not WSB.playerLoaded then return 0 end
    return (WSB.playerData.charinfo.gender or 0)
end

function WSB.isPlayerDead()
    if not WSB.playerLoaded then return end
    WSB.playerData = QBCore.Functions.GetPlayerData()
    return (WSB.playerData.metadata.isdead or WSB.playerData.metadata.inlaststand)
end

function WSB.isPlayerHandcuffed()
    if not WSB.playerLoaded then return end
    WSB.playerData = QBCore.Functions.GetPlayerData()
    return WSB.playerData.metadata.ishandcuffed and true or false
end
