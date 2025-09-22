if Config.Wardrobe ~= 'p_appearance' then
    return
end

function openWardrobe()
    exports['p_appearance']:openOutfits()
end
