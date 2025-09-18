if not Config.SocietySystem then
    Config.SocietySystem = Society.AUTOMATIC
end

if Config.SocietySystem == Society.AUTOMATIC then
    local qbBakingResourceName = SocietyResourceName[Society.QB_BANKING]
    if IsResourceOnServer(qbBakingResourceName) then
        local qbBakingResourceVersion = GetResourceMetadata(qbBakingResourceName, "version"):gsub("%D+", "")
        qbBakingResourceVersion = tonumber(qbBakingResourceVersion)
        if (qbBakingResourceVersion or 0) >= 200 then
            Config.SocietySystem = Society.QB_BANKING
        end
    else
        -- older version qb-banking doesnt provide exports needed.
        SocietyResourceName[Society.QB_BANKING] = nil

        for societyKey, societyName in pairs(SocietyResourceName) do
            if IsResourceOnServer(societyName) then
                Config.SocietySystem = societyKey
                break
            end
        end

        -- okokBanking doesnt use exports on esx side, which they should honestly it would make things more easier.
        if Config.SocietySystem == Society.OKOK_BANKING and Config.Framework.Active == Framework.ESX then
            Config.SocietySystem = Society.ESX_ADDON_ACCOUNT
        end
    end
end