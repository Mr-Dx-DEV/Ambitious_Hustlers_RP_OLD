CreateThread(function()
    if Config.Framework == Framework.ESX then
        local ESX = nil
        local EnforcePlayerLoaded = false

        local success, result = pcall(function()
            ESX = exports[Framework.ESX]:getSharedObject()
        end)

        if not success then
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end

        Framework.object = ESX

        function Framework.showHelpNotification(text)
            ESX.ShowHelpNotification(text, true, false)
        end

        function Framework.sendNotification(message, type)
            ESX.ShowNotification(message, type)
        end

        function HandleInventoryOpenState(state)
            local ply = LocalPlayer

            if not ply then
                return
            end
        end

        function AwaitPlayerLoad()
            if not ESX then
                return
            end

            local identity = FindTargetResource and FindTargetResource('identity') or nil
            local multichar = FindTargetResource and FindTargetResource('multicharacter') or nil

            if not identity then
                identity = 'IDENTITY_NOT_FOUND'
            end

            if not multichar then
                multichar = 'MULTICHAR_NOT_FOUND'
            end

            dbg.debug('AwaitPlayerLoad: Checking server enviroment: \nIdentity: %s \nMultichar: %s', identity,
                multichar)

            if type(ESX.GetPlayerData) == "table" then
                local playerData = ESX.GetPlayerData()
                local size = table.size(playerData)

                repeat
                    Wait(500)
                    playerData = ESX.GetPlayerData()
                    size = table.size(playerData)
                    dbg.debug(
                    'AwaitPlayerLoad: Awaiting to player load as active character via method: ESX.GetPlayerData')
                until size and size > 0
            else
                dbg.debug(
                'AwaitPlayerLoad: Any of framework related helper functions, not found: loading fallback solution.')
            end

            if ESX.IsPlayerLoaded then
                while not ESX.IsPlayerLoaded() do
                    Wait(500)
                end
            end

            if ESX.PlayerLoaded then
                while not ESX.PlayerLoaded do
                    Wait(500)
                end
            end
            
            dbg.debug('AwaitPlayerLoad: Requesting player load, since player is found as active!')

            CachePlayerData()

            dbg.playerLoad('AwaitPlayerLoad: Requesting player load, since player is found as active!')

            TriggerServerEvent('rcore_prison:server:requestPlayerLoaded')
        end

        function CachePlayerData()
            local playerData = ESX.GetPlayerData()
            local retval = {}

            if playerData and playerData.job then
                retval = {
                    job = playerData.job,
                    identifier = playerData.identifier
                }
            end

            local duty = false

            if retval and next(retval) then
                if retval.identifier then
                    Framework.identifier = retval.identifier
                end

                Framework.setJob({
                    name = retval.job.name,
                    gradeName = retval.job.grade_name,
                    grade = retval.job.grade,
                    duty = duty,
                    isBoss = retval.job.grade_name == "boss"
                })
            end
        end

        local isActive = false

        RegisterNetEvent('esx:onPlayerLogout', function()
            if source == '' then return end
            if not isActive then return end
            isActive = false
        end)

        CreateThread(function()
            while true do
                if NetworkIsPlayerActive(PlayerId()) and not isActive then
                    isActive = true
                    AwaitPlayerLoad()
                end

                Wait(500)
            end
        end)


        RegisterNetEvent(Config.FrameworkEvents['esx:playerLoaded'])
        AddEventHandler(Config.FrameworkEvents['esx:playerLoaded'], function(data)
            Framework.setJob({
                name = data.job.name,
                gradeName = data.job.grade_name,
                grade = data.job.grade,
                isOnDuty = false,
                isBoss = data.job.grade_name == "boss"
            })
        end)

        RegisterNetEvent(Config.FrameworkEvents['esx:setJob'])
        AddEventHandler(Config.FrameworkEvents['esx:setJob'], function(job)
            dbg.debug('Framework - job: Updating player job data!')
            Framework.setJob({
                name = job.name,
                gradeName = job.grade_name,
                grade = job.grade,
                isOnDuty = false,
                isBoss = job.grade_name == "boss"
            })
        end)

        function Framework.setJob(job)
            Framework.job = job
        end
    end
end, "cl-esx code name: Phoenix")
