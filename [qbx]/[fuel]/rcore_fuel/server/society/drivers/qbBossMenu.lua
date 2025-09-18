if Config.SocietySystem == Society.QB_BOSSMENU then
    local resourceName = SocietyResourceName[Society.QB_BOSSMENU]

    function GetMoneyFromSociety(society)
        return math.ceil(exports[resourceName]:GetAccount(society))
    end

    function RemoveMoneyFromSociety(money, society)
        TriggerEvent("qb-bossmenu:server:removeAccountMoney", society, math.ceil(money))
    end

    function GiveMoneyToSociety(money, society)
        TriggerEvent("qb-bossmenu:server:addAccountMoney", society, math.ceil(money))
    end
end