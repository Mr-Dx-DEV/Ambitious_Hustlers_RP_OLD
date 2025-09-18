registerCallback("rcore_fuel:fetchPlayerNamesAround", function(source, cb, companyIdentifier)
    local modal = GetCompanyModal(companyIdentifier)
    local intialPos = GetEntityCoords(GetPlayerPed(source))

    if modal.DoesExists() then
        if modal.IsSourceOwner(source) then
            local names = {}
            for k, v in pairs(GetPlayers()) do
                k = type(v) == "string" and tonumber(v) or v
                if #(intialPos - GetEntityCoords(GetPlayerPed(k))) < 10 and not PlayerCurrentlyInMission[k] then
                    table.insert(names, {
                        id = k,
                        name = GetPlayerCharacterName(k),
                    })
                end
            end
            cb(names)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)