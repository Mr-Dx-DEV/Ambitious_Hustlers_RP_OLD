function SaveAllCompanies()
    for k, v in pairs(Config.ShopList) do
        local modal = GetCompanyModal(k)
        modal.Save()
    end
end

CreateThread(function()
    while true do
        Wait(1000 * 60 * Config.SaveCompaniesMinutesInterval)
        SaveAllCompanies()
    end
end, "Saving all companies")

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end

    SaveAllCompanies()
end)