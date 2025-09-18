if Config.Framework == 2 then
    QBCore = Config.GetQBCoreObject()
    ESX = {}

    ESX.GetPlayerFromId = function(source)
        local xPlayer = {}
        local qbPlayer = QBCore.Functions.GetPlayer(source)
        ---------
        xPlayer.getMoney = function()
            return qbPlayer.Functions.GetMoney("cash")
        end
        ---------
        xPlayer.removeMoney = function(money)
            qbPlayer.Functions.RemoveMoney("cash", money)
        end
        ---------
        return xPlayer
    end
end