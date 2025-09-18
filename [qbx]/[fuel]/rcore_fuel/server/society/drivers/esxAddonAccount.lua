if Config.SocietySystem == Society.ESX_ADDON_ACCOUNT then
    local resourceName = SocietyResourceName[Society.ESX_ADDON_ACCOUNT]

    function GetMoneyFromSociety(society)
        local promise = promise:new()

        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            if account then
                promise:resolve(account.money)
            else
                print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(), society))
                promise:resolve(0)
            end
        end)

        return Citizen.Await(promise)
    end

    function RemoveMoneyFromSociety(money, society)
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            if account then
                account.removeMoney(money)
            else
                print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(), society))
            end
        end)
    end

    function GiveMoneyToSociety(money, society)
        TriggerEvent('esx_addonaccount:getSharedAccount', society, function(account)
            if account then
                account.addMoney(money)
            else
                print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(), society))
            end
        end)
    end

    CreateThread(function()
        local tableAccoun = MySQL.Sync.fetchAll("SELECT name FROM `addon_account`", {})

        for key, value in pairs(Config.ShopList) do
            if value.EnableSociety then
                local insert = true
                for k, v in pairs(tableAccoun) do
                    if v.name == value.Job then
                        insert = false
                        break
                    end
                end

                if insert then
                    print("^1[======================]")
                    for i = 0, 5 do
                        print(string.format("^1[%s][Warning!]^7 Society ^1'%s'^7 has been created in mysql! The server need to be restarted in order the addon account work properly!", GetCurrentResourceName(), value.Job))
                    end
                    print("^1[======================]")
                    MySQL.Sync.execute([[ INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES (@name, @name, '1') ]], {
                        ["@name"] = value.Job,
                    })
                end
            end
        end
    end)
    for k, v in pairs(Config.ShopList) do
        if v.EnableSociety then
            TriggerEvent('esx_society:registerSociety', v.Job, v.SocietyLabel, v.Job, v.Job, v.Job, v.Data)
        end
    end
end