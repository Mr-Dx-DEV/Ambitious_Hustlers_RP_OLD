RegisterNetEvent("rcore_fuel:setOpenStatus", function(identifier, status)
    local modal = GetCompanyModal(identifier)

    if modal.DoesExists() then
        if modal.IsSourceOwner(source) then
            modal.SetOpenStatus(status)
            modal.Save()
            UpdateConfigForClient(-1, identifier)
        end
    end
end)