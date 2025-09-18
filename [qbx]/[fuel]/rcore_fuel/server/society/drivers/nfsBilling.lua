if Config.SocietySystem == Society.NFS_BILLING then
    local resourceName = SocietyResourceName[Society.NFS_BILLING]

    function GetMoneyFromSociety(society)
        return math.ceil(exports[resourceName]:getSocietyBalance(society))
    end

    function RemoveMoneyFromSociety(money, society)
        exports[resourceName]:withdrawSociety(society, math.ceil(money))
    end

    function GiveMoneyToSociety(money, society)
        exports[resourceName]:depositSociety(society, math.ceil(money))
    end
end