RegisterNetEvent("rcore_fuel:setEmployeeStatus", function(identifier, status)
    local modal = GetCompanyModal(identifier)

    if modal.DoesExists() then
        if modal.IsSourceOwner(source) then
            modal.SetForEmployeeOnlyStatus(status)
            modal.Save()
            UpdateConfigForClient(-1, identifier)
        end
    end
end)