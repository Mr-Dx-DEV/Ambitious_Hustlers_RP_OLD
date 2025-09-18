if Config.SocietySystem == Society.QB_BANKING then
    local resourceName = SocietyResourceName[Society.QB_BANKING]

    function GetMoneyFromSociety(society)
        return math.ceil(exports[resourceName]:GetAccountBalance(society))
    end

    function RemoveMoneyFromSociety(money, society)
        exports[resourceName]:RemoveMoney(society, math.ceil(money))
    end

    function GiveMoneyToSociety(money, society)
        exports[resourceName]:AddMoney(society, math.ceil(money))
    end
end