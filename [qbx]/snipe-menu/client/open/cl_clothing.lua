-- Functions to player admin clothes

function SetPlayerAdminClothes()
    if not Config.AdminClothes then return end
    -- male clothing
    if GetEntityModel(PlayerPedId()) == `mp_m_freemode_01` then
        SetPedComponentVariation(PlayerPedId(), 11, 55, 0, 2) -- top
        SetPedComponentVariation(PlayerPedId(), 8, 58, 0, 2) -- under top
        SetPedComponentVariation(PlayerPedId(), 4, 35, 0, 2) -- pants
        SetPedComponentVariation(PlayerPedId(), 6, 25, 0, 2) -- shoes
    end

    -- female clothing
    if GetEntityModel(PlayerPedId()) == `mp_f_freemode_01` then
        SetPedComponentVariation(PlayerPedId(), 11, 48, 0, 2) -- top
        SetPedComponentVariation(PlayerPedId(), 8, 58, 0, 2) -- under top
        SetPedComponentVariation(PlayerPedId(), 4, 34, 0, 2) -- pants
        SetPedComponentVariation(PlayerPedId(), 6, 25, 0, 2) -- shoes
    end
end

function ResetPlayerClothes()
    if not Config.AdminClothes then return end
    TriggerEvent("snipe-menu:client:revertClothing")
end