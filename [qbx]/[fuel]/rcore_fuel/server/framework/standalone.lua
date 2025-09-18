-- standalone
if not SharedObject.Functions and not SharedObject.GetPlayerFromId then
    function PlayerIdentifier(source)
        local identifier = "none"

        for k, v in ipairs(GetPlayerIdentifiers(source)) do
            if string.match(v, 'license:') then
                identifier = string.sub(v, 9)
                break
            end
        end

        return identifier
    end

    SharedObject.RegisterUsableItem = function(itemName, callBack)
        RegisterCommand(itemName, callBack, false)
    end

    SharedObject.GetPlayerFromId = function(source)
        local self = {}
        ---------
        self.source = source
        ---------
        self.getPlayerActiveSlot = function()
            return PlayerActiveSlots[source]
        end
        ---------
        self.identifier = PlayerIdentifier(source)
        ---------
        self.license = PlayerIdentifier(source)
        ---------
        self.job = {
            name = "none",
            label = "none",
            isboss = false,
            grade = {
                name = "none",
                level = "none"
            }
        }
        ---------
        self.get = function(key)
            local dispatchList = {
                ["firstName"] = function()
                    return GetPlayerName(source)
                end,
                ["lastName"] = function()
                    return ""
                end,
            }
            return dispatchList[key]()
        end
        ---------
        self.getMoney = function()

        end
        ---------
        self.getAccount = function(type)

        end
        ---------
        self.addMoney = function(money)

        end
        ---------
        self.addAccountMoney = function(type, money)

        end
        ---------
        self.removeAccountMoney = function(type, money)

        end
        ---------
        self.removeMoney = function(money)

        end
        ---------
        return self
    end
end