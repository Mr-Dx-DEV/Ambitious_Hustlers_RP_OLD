--[[
    Configurable company system, you can create multiple files
    and adapt them to your company system. These are the ones we recommend
    that we bring by default, but you can integrate others.

    Enable Config.Debug to be able to see the log inside Debug.
]]

if Config.Society ~= 'crm-banking' then
    return
end

function AddMoneyToSociety(src, societyName, societyPaid)
    Debug('Society system (CRM-Banking), id: ' .. src .. ', society name: ' .. societyName .. ', Paid: ' .. societyPaid)
    exports["crm-banking"]:crm_add_money(societyName, societyPaid)
end
