if Config.Framework == 1 then
    ESX = nil
    PlayerData = {}

    CreateThread(function()
        ESX = GetEsxObject()

        if ESX then
            if ESX.IsPlayerLoaded and ESX.IsPlayerLoaded() then
                PlayerData = ESX.GetPlayerData()
            end
        end
    end)

    RegisterNetEvent(Config.PlayerLoaded)
    AddEventHandler(Config.PlayerLoaded, function(xPlayer)
        PlayerData = xPlayer
    end)

    RegisterNetEvent(Config.SetJob)
    AddEventHandler(Config.SetJob, function(job)
        PlayerData.job = job
    end)

    function isAtJob(name)
        if name == nil then
            return true
        end
        if not PlayerData then
            return false
        end
        return PlayerData.job.name == name
    end
end