if Config.Framework == 0 then
    ESX = {}

    ESX.GetPlayerFromId = function(source)
        local player = {}
        ---------
        player.getMoney = function()
            -- implement your money getter
            return 99999999
        end
        ---------
        player.removeMoney = function(money)
            -- implement your remove money logic here
        end
        ---------
        return player
    end
end