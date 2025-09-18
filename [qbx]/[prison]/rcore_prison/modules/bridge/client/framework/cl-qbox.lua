CreateThread(function()
    if Config.Framework == Framework.QBOX then
        local QBCore = nil
        local EnforcePlayerLoaded = false

        local success = pcall(function()
            QBCore = exports[Framework.QBCore]:GetCoreObject()
        end)
    
        if not success then
            success = pcall(function()
                QBCore = exports[Framework.QBCore]:GetSharedObject()
            end)
        end
    
        if not success then
            local breakPoint = 0
            while not QBCore do
                Wait(100)
                TriggerEvent('QBCore:GetObject', function(obj)
                    QBCore = obj
                end)
    
                breakPoint = breakPoint + 1
                if breakPoint == 25 then
                    dbg.critical('Could not load the sharedobject, are you sure it is called \'QBCore:GetObject\'?')
                    break
                end
            end
        end
    
        Framework.object = QBCore

        function HandleInventoryOpenState(state)
            local ply = LocalPlayer
        
            if not ply then
                return
            end
        
            ply.state:set('inv_busy', state)
        end

        function Framework.showHelpNotification(text)
            DisplayHelpTextThisFrame(text, false)
            BeginTextCommandDisplayHelp(text)
            EndTextCommandDisplayHelp(0, false, false, -1)
        end
    
        function Framework.sendNotification(message, type)
            TriggerEvent('QBCore:Notify', message, type, 5000)
        end

        function Framework.isInJob()
            if Framework.job and Config.Jobs[Framework.job.name] then
                return true
            end

            return false
        end

        function AwaitPlayerLoad()
            Wait(1000)

            local identity = FindTargetResource and FindTargetResource('identity') or nil
            local multichar = FindTargetResource and FindTargetResource('multicharacter') or nil

            if not identity then
                identity = 'IDENTITY_NOT_FOUND'
            end

            if not multichar then
                multichar = 'MULTICHAR_NOT_FOUND'
            end

            dbg.debug('AwaitPlayerLoad: Checking server enviroment: \nIdentity: %s \nMultichar: %s', identity, multichar)

            if type(LocalPlayer.state['isLoggedIn']) == "boolean" then
                repeat
                    Wait(500)
                    dbg.debug(
                        'AwaitPlayerLoad: Awaiting to player load as active character via method: LocalPlayer.state.isLoggedIn')
                until LocalPlayer.state['isLoggedIn']
            elseif QBCore then
                local size = 0
                local playerData = QBCore.Functions.GetPlayerData()

                if type(playerData) == "table" then
                    repeat
                        Wait(500)
                        playerData = QBCore.Functions.GetPlayerData()
                        size = table.size(playerData)
                        dbg.debug('AwaitPlayerLoad: Awaiting to player load as active character via method: PlayerData')
                    until size and size > 0
                end
            else
                dbg.debug('AwaitPlayerLoad: Any of framework related helper functions, not found: loading fallback solution.')
            end

            dbg.debug('AwaitPlayerLoad: Requesting player load, since player is found as active!')

            CachePlayerData()

            TriggerServerEvent('rcore_prison:server:requestPlayerLoaded')
        end

        function CachePlayerData()
            if not QBCore then
                return
            end

            local playerData = QBCore.Functions.GetPlayerData()
            local retval = {}
             
            if playerData and playerData.job then
                retval = {
                    job = playerData.job,
                    identifier = playerData.citizenid,
                }
            end

            if retval and next(retval) then
                if retval.identifier then
                    Framework.identifier = retval.identifier
                end

                Framework.setJob({
                    name = retval.job.name,
                    gradeName = retval.job.grade.name,
                    grade = retval.job.grade.level,
                    duty = retval.job.onduty,
                    isBoss = retval.job.isboss
                })
            end
        end

        local isActive = false

        RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
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


        RegisterNetEvent('rcore_prison:client:playerLoaded')
        AddEventHandler('rcore_prison:client:playerLoaded', function(jobData)
            dbg.debug('Framework - job: Updating player job data [customEvent]')
            Framework.setJob({
                name = jobData.name,
                gradeName = jobData.grade,
                grade = jobData.grade,
                isOnDuty = jobData.onDuty,
                isBoss = jobData.isBoss
            })
        end)

        RegisterNetEvent(Config.FrameworkEvents['QBCore:Client:OnJobUpdate'])
        AddEventHandler(Config.FrameworkEvents['QBCore:Client:OnJobUpdate'], function(updatedJobData)
            dbg.debug('Framework - job: Updating player job data!')
            Framework.setJob({
                name = updatedJobData.name,
                gradeName = updatedJobData.grade.name,
                grade = updatedJobData.grade.level,
                isOnDuty = updatedJobData.onduty,
                isBoss = updatedJobData.isboss
            })
        end)

        function Framework.setJob(job)
            Framework.job = job
        end
    end    
end, "cl-qbox code name: Phoenix")