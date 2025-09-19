SV = {}

SV.getPlayer = function(src)
    if Config.Core == "ESX" then
        return ESX.GetPlayerFromId(src)
    elseif Config.Core == "QB-Core" then
        return QBCore.Functions.GetPlayer(src)
    end
end

SV.getIdentifier = function(xPlayer)
    if Config.Core == "ESX" then
        return xPlayer.identifier
    elseif Config.Core == "QB-Core" then
        return xPlayer.PlayerData.citizenid
    end
end

SV.getMoney = function(xPlayer, moneyType)
    if Config.Core == "ESX" then
        local moneyType = moneyType == 'cash' and 'money' or moneyType
        return xPlayer.getAccount(moneyType).money
    elseif Config.Core == "QB-Core" then
        return xPlayer.Functions.GetMoney(moneyType)
    end
end

SV.addMoney = function(xPlayer, moneyType, count)
    if Config.Core == "ESX" then
        local moneyType = moneyType == 'cash' and 'money' or moneyType == 'dirty' and 'black_money' or moneyType
        xPlayer.addAccountMoney(moneyType, count)
    elseif Config.Core == "QB-Core" then
        xPlayer.Functions.AddMoney(moneyType, count)
    end
end

SV.removeMoney = function(xPlayer, moneyType, count)
    if Config.Core == "ESX" then
        local moneyType = moneyType == 'cash' and 'money' or moneyType
        xPlayer.removeAccountMoney(moneyType, count)
    elseif Config.Core == "QB-Core" then
        xPlayer.Functions.RemoveMoney(moneyType, count)
    end
end

SV.getItemCount = function(xPlayer, name, metadata)
    if GetResourceState('ox_inventory') == 'started' then
        if Config.Core == "ESX" then
            return exports.ox_inventory:GetItemCount(xPlayer.source, name)
        elseif Config.Core == "QB-Core" then
            return exports.ox_inventory:GetItemCount(xPlayer.PlayerData.source, name)
        end        
    else
        if Config.Core == "ESX" then
            return xPlayer.getInventoryItem(name).count
        elseif Config.Core == "QB-Core" then
            return xPlayer.Functions.GetItemByName(name) and xPlayer.Functions.GetItemByName(name).amount or 0
        end
    end
end

SV.addItem = function(src, xPlayer, name, count, metadata)
    if GetResourceState('ox_inventory') == 'started' then
        exports.ox_inventory:AddItem(src, name, count, metadata, nil)

    elseif GetResourceState('qs-inventory') == 'started' then
        exports['qs-inventory']:AddItem(src, name, count, false, metadata)

    else
        if Config.Core == "ESX" then
            xPlayer.addInventoryItem(name, count)

        elseif Config.Core == "QB-Core" then
            xPlayer.Functions.AddItem(name, count, false, metadata)

        end
    end
    
end

SV.removeItem = function(src, xPlayer, name, count)
    if Config.Core == "ESX" then
        xPlayer.removeInventoryItem(name, count)
    elseif Config.Core == "QB-Core" then
        xPlayer.Functions.RemoveItem(name, count)
    end
end



--  ▄▀▄ █▄ █ █   ▀▄▀   █▀ ▄▀▄ █▀▄   ██▀ ▄▀▀ ▀▄▀
--  ▀▄▀ █ ▀█ █▄▄  █    █▀ ▀▄▀ █▀▄   █▄▄ ▄██ █ █
if Config.Core == "ESX" then
    RegisterNetEvent('vms_driveschoolv2:sv:loadLicensesWithRestartScript', function()
        local src = source
        local xPlayer = SV.getPlayer(src)
        if xPlayer then
            TriggerEvent('esx_license:getLicenses', src, function(licenses)
                TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src, licenses)
            end)
        end
    end)

    AddEventHandler(Config.PlayerLoaded, function(source)
        local src = source
        Citizen.Wait(8000)
        TriggerEvent('esx_license:getLicenses', src, function(licenses)
            TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src, licenses)
        end)
    end)
end


--  ▄▀▄ █▀▄ █▀▄   █   █ ▄▀▀ ██▀ █▄ █ ▄▀▀ ██▀
--  █▀█ █▄▀ █▄▀   █▄▄ █ ▀▄▄ █▄▄ █ ▀█ ▄██ █▄▄
RegisterNetEvent('vms_driveschoolv2:sv:addLicense', function(passed, type)
    local src = source
    if not startedExam[src] or startedExam[src] ~= type then
        return
    end

    if Config.UseVMSCityHall then
        local isSuspended, suspendedTime = exports['vms_cityhall']:isLicenseSuspended(src, type)
        if isSuspended then
            return
        end
    end

    if passed then
        if Config.LicensesResource == 'buty-license' then
            local xPlayer = SV.getPlayer(src)
            local xIdentifier = SV.getIdentifier(xPlayer)
            exports['Buty-license']:AddLicense(xIdentifier, 'driving', type)
            TriggerClientEvent('vms_driveschoolv2:notification', src, TRANSLATE('success_practical'), 'success')
        else
            if Config.Core == "ESX" then
                TriggerEvent('esx_license:addLicense', src, type, function()
                    TriggerEvent('esx_license:getLicenses', src, function(licenses)
                        TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src, licenses)
                        if Config.AddLicenseItem and (type == Config.Licenses.Practical["A"].name or type == Config.Licenses.Practical["B"].name or type == Config.Licenses.Practical["C"].name) then
                            local xPlayer = SV.getPlayer(src)
                            local itemsCount = SV.getItemCount(xPlayer, Config.LicenseItem)
                            if itemsCount >= 1 then
                                SV.removeItem(src, xPlayer, Config.LicenseItem, 1)
                            end

                            --# Getting all player licenses
                            local types = ""
                            for k, v in pairs(licenses) do
                                if v.type == Config.Licenses.Practical["A"].name then
                                    types = types .. "A "
                                elseif v.type == Config.Licenses.Practical["B"].name then
                                    types = types .. "B "
                                elseif v.type == Config.Licenses.Practical["C"].name then
                                    types = types .. "C "
                                end
                            end
                            --#

                            SV.addItem(src, xPlayer, Config.LicenseItem, 1, {
                                firstname = xPlayer.get('firstName'),            -- HERE YOU CAN ADJUST METADATA
                                lastname = xPlayer.get('lastName'),              -- HERE YOU CAN ADJUST METADATA
                                birthdate = xPlayer.get('dateofbirth'),          -- HERE YOU CAN ADJUST METADATA
                                type = types                                     -- HERE YOU CAN ADJUST METADATA
                            })
                        end
                        TriggerClientEvent('vms_driveschoolv2:notification', src, TRANSLATE('success_practical'), 'success')
                    end)
                end)
                
            elseif Config.Core == "QB-Core" then
                local xPlayer = SV.getPlayer(src)
                local licenses = xPlayer.PlayerData.metadata['licences']
                licenses[type] = true
                xPlayer.Functions.SetMetaData('licences', licenses)
                if Config.AddLicenseItem and (type == Config.Licenses.Practical["A"].name or type == Config.Licenses.Practical["B"].name or type == Config.Licenses.Practical["C"].name) then
                    local itemsCount = SV.getItemCount(xPlayer, Config.LicenseItem)
                    if itemsCount >= 1 then
                        SV.removeItem(src, xPlayer, Config.LicenseItem, 1)
                    end
    
                    SV.addItem(src, xPlayer, Config.LicenseItem, 1, {
                        firstname = xPlayer.PlayerData.charinfo.firstname,        -- HERE YOU CAN ADJUST METADATA
                        lastname = xPlayer.PlayerData.charinfo.lastname,          -- HERE YOU CAN ADJUST METADATA
                        birthdate = xPlayer.PlayerData.charinfo.birthdate,        -- HERE YOU CAN ADJUST METADATA
                        type = (licenses[Config.Licenses.Practical["A"].name] and "A" or "") .. (licenses[Config.Licenses.Practical["B"].name] and "B" or "") .. (licenses[Config.Licenses.Practical["C"].name] and "C" or "")  -- HERE YOU CAN ADJUST METADATA
                    })
                end
                xPlayer.Functions.Save()
                TriggerClientEvent('vms_driveschoolv2:cl:getLicenses', src)
                TriggerClientEvent('vms_driveschoolv2:notification', src, TRANSLATE('success_practical'), 'success')
            end
        end
    else
        TriggerClientEvent('vms_driveschoolv2:notification', src, TRANSLATE('failed_practical'), 'error')
    end

    startedExam[src] = nil
    examEntities[src] = nil
end)