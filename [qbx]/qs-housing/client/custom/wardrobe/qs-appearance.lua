if Config.Wardrobe ~= 'qs-appearance' then
    return
end

function openWardrobe()
    TriggerEvent('clothing:openOutfitMenu')
end
