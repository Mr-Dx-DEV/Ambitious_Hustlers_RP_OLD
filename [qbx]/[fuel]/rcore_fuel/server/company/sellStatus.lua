RegisterNetEvent("rcore_fuel:setSellStatus", function(identifier, status, money)
    local modal = GetCompanyModal(identifier)

    if modal.DoesExists() then
        if modal.IsSourceOwner(source) then

            modal.SetForSale(status)

            if money then
                modal.SetCompanyPrice(money)
            end

            modal.Save()
            UpdateConfigForClient(-1, identifier)
        end
    end
end)