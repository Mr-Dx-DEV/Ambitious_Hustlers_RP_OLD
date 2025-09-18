if Config.SocietySystem == Society.QB_MANAGEMENT then
    local resourceName = SocietyResourceName[Society.QB_MANAGEMENT]

    function GetMoneyFromSociety(society)
        return math.ceil(exports[resourceName]:GetAccount(society))
    end

    function RemoveMoneyFromSociety(money, society)
        exports[resourceName]:RemoveMoney(society, math.ceil(money))
    end

    function GiveMoneyToSociety(money, society)
        exports[resourceName]:AddMoney(society, math.ceil(money))
    end
end