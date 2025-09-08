-- { 17movement.net } --
-- QBCore Handlers:
TriggerEvent("__cfx_export_qb-core_GetCoreObject", function(getCore)
    Core = getCore()
    Config.Framework = "QBCore"
end)

TriggerEvent("__cfx_export_es_extended_getSharedObject", function(getCore)
    Core = getCore()
    Config.Framework = "ESX"
end)

CreateThread(function()
    Citizen.Wait(2500) -- Wait Until Core Load
    if Config.Framework == "QBCore" then
        if Config.EnableStress then
            RegisterNetEvent('hud:server:GainStress', function(stressAmount)
                local src = source
                local Player = Core.Functions.GetPlayer(src)

                if not Player then
                    return
                end

                if not Player.PlayerData.metadata['stress'] then
                    Player.PlayerData.metadata['stress'] = 0
                end

                local newStress = Player.PlayerData.metadata['stress'] + stressAmount
                if newStress < 0 then newStress = 0 end
                if newStress > 100 then newStress = 100 end

                Player.Functions.SetMetaData('stress', newStress)
                TriggerClientEvent('hud:client:UpdateStress', src, newStress)
            end)

            RegisterNetEvent('hud:server:RelieveStress', function(stressAmount)
                local src = source
                local Player = Core.Functions.GetPlayer(src)

                if not Player then
                    return
                end

                if not Player.PlayerData.metadata['stress'] then
                    Player.PlayerData.metadata['stress'] = 0
                end

                local newStress = Player.PlayerData.metadata['stress'] - stressAmount

                if newStress < 0 then newStress = 0 end
                if newStress > 100 then newStress = 100 end

                Player.Functions.SetMetaData('stress', newStress)
                TriggerClientEvent('hud:client:UpdateStress', src, newStress)
                TriggerClientEvent('17mov_Hud:ShowNotification', src, Config.Lang['RemovingStress'])
            end)
        end
    elseif Config.Framework == "ESX" then
        if Config.EnableStress then
            RegisterNetEvent('17mov_Hud:GainStress', function(stressAmount)
                local src = source
                TriggerClientEvent("esx_status:add", src, "stress", stressAmount)
                TriggerClientEvent('17mov_Hud:ShowNotification', src, Config.Lang['AddingStress'])
            end)
        end

        -- Society money
        local accounts = {}

        function LoadSocietyAccount(name)
            local p = promise.new()

            TriggerEvent("esx_society:getSocieties", function(societies)
                for k, v in pairs(societies) do
                    if v.account == name then
                        return TriggerEvent('esx_addonaccount:getSharedAccount', v.account, function(account)
                            if account then
                                p:resolve({
                                    account = v.account,
                                    job = v.name,
                                    money = account.money
                                })
                            else
                                p:resolve(nil)
                            end
                        end)
                    end
                end
            end)

            return Citizen.Await(p)
        end

        function RefreshSocietyMoney(jobName, amount)
            if Core.GetExtendedPlayers ~= nil then
                local xPlayers = Core.GetExtendedPlayers('job', jobName)

                for _, xPlayer in pairs(xPlayers) do
                    if xPlayer.job.grade_name == 'boss' then
                        TriggerClientEvent("17mov_Hud:updateSocietyMoney", xPlayer.source, amount)
                    end
                end
            else
                for k, playerId in pairs(GetPlayers()) do
                    local xPlayer = Core.GetPlayerFromId(playerId)

                    if xPlayer then
                        local job = xPlayer.getJob()

                        if job.name == jobName and job.grade_name == 'boss' then
                            TriggerClientEvent("17mov_Hud:updateSocietyMoney", xPlayer.source, amount)
                        end
                    end
                end
            end
        end

        RegisterNetEvent("esx_addonaccount:addMoney", function(name, addingMoney)
            if accounts[name] then
                accounts[name].money = accounts[name].money + addingMoney
            else
                local account = LoadSocietyAccount(name)

                if account then
                    accounts[name] = account
                else
                    return
                end
            end

            RefreshSocietyMoney(accounts[name].job, accounts[name].money)
        end)

        RegisterNetEvent("esx_addonaccount:removeMoney", function(name, removingMoney)
            if accounts[name] then
                accounts[name].money = accounts[name].money - removingMoney
            else
                local account = LoadSocietyAccount(name)

                if account then
                    accounts[name] = account
                else
                    return
                end
            end

            RefreshSocietyMoney(accounts[name].job, accounts[name].money)
        end)

        RegisterNetEvent("esx_addonaccount:setMoney", function(name, newMoney)
            if accounts[name] then
                accounts[name].money = newMoney
            else
                local account = LoadSocietyAccount(name)

                if account then
                    accounts[name] = account
                else
                    return
                end
            end

            RefreshSocietyMoney(accounts[name].job, accounts[name].money)
        end)

        RegisterNetEvent("17mov_Hud:RequestSocietyMoney", function()
            local src = source
            local xPlayer = Core.GetPlayerFromId(src)
            local job = xPlayer.getJob()

            if job.grade_name == 'boss' then
                TriggerEvent("esx_society:getSociety", job.name, function(society)
                    if society then
                        if accounts[society.account] then
                            TriggerClientEvent("17mov_Hud:updateSocietyMoney", src, accounts[society.account].money)
                        else
                            local account = LoadSocietyAccount(name)

                            if account then
                                accounts[society.account] = account

                                TriggerClientEvent("17mov_Hud:updateSocietyMoney", src, accounts[society.account].money)
                            else
                                return
                            end
                        end
                    else
                        TriggerClientEvent("17mov_Hud:updateSocietyMoney", src, nil)
                    end
                end)
            else
                TriggerClientEvent("17mov_Hud:updateSocietyMoney", src, nil)
            end
        end)
    else
        print("STANDALONE MODE - You need to configure all things manually")
    end

    RegisterNetEvent('pma-voice:setPlayerRadio', function(radioChannel)
        TriggerClientEvent("17mov_HUD:pma-Voice:SetRadioChannel", source, radioChannel)
    end)
end)

RegisterNetEvent("17mov_Hud:playSound", function(soundName)
    local ped = GetPlayerPed(source)
    if ped ~= 0 and ped ~= nil then
        TriggerClientEvent("17mov_Hud:playSound", -1, soundName, GetEntityCoords(ped))
    end
end)

if GetCurrentResourceName() ~= "17mov_Hud" then
    CreateThread(function()
        while true do
            print(
            "^5[ERROR]:^0 Because of the auto-installation feature resource name must be 17mov_Hud. Change resource name and try again.")
            Citizen.Wait(1000)
        end
    end)
end
-- { 17movement.net } --
