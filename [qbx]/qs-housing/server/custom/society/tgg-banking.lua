if Config.Society ~= 'tgg-banking' then
    return
end

function AddMoneyToSociety(src, societyName, societyPaid)
    Debug('Society system, id: ' .. src .. ', society name: ' .. societyName .. ', Paid: ' .. societyPaid)
    exports['tgg-banking']:AddSocietyMoney(society, amount)
end

