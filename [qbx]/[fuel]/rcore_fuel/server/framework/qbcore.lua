if not SharedObject.GetPlayerFromId and SharedObject.Functions then
    SharedObject.RegisterUsableItem = function(itemName, callBack)
        SharedObject.Functions.CreateUseableItem(itemName, callBack)
    end

    SharedObject.GetPlayerFromId = function(source)
        local self = {}
        local player = SharedObject.Functions.GetPlayer(source)
        ---------
        if not player then
            return nil
        end
        ---------
        self.getPlayerActiveSlot = function()
            return PlayerActiveSlots[source]
        end
        ---------
        self.source = source
        ---------
        self.identifier = player.PlayerData.citizenid
        ---------
        self.license = player.PlayerData.license
        ---------
        local gradeName = "none"
        local gradeLevel = -1

        self.job = {
            name = player.PlayerData.job.name,
            label = player.PlayerData.job.label,
            isboss = player.PlayerData.job.isboss,
            grade = {
                name = gradeName,
                level = gradeLevel
            }
        }
        ---------
        self.FrameworkPlayerData = function()
            return player
        end
        ---------
        self.get = function(key)
            local dispatchList = {
                ["firstName"] = function()
                    return player.PlayerData.charinfo.firstname
                end,
                ["lastName"] = function()
                    return player.PlayerData.charinfo.lastname
                end,
            }
            return dispatchList[key]()
        end
        ---------
        self.getMoney = function()
            return player.Functions.GetMoney("cash")
        end
        ---------
        self.getAccount = function(type)
            return {
                money = player.Functions.GetMoney(type) or 0
            }
        end
        ---------
        self.addMoney = function(money)
            player.Functions.AddMoney("cash", money)
        end
        ---------
        self.addAccountMoney = function(type, money)
            if type == "money" then
                type = "cash"
            end
            player.Functions.AddMoney(type, money)
        end
        ---------
        self.removeAccountMoney = function(type, money)
            if type == "money" then
                type = "cash"
            end
            player.Functions.RemoveMoney(type, money)
        end
        ---------
        self.removeMoney = function(money)
            player.Functions.RemoveMoney("cash", money)
        end
        ---------
        return self
    end
end