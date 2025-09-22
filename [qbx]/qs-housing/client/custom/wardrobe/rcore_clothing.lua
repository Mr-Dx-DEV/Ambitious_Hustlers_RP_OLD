if Config.Wardrobe ~= 'rcore_clothing' then
    return
end

function openWardrobe()
    TriggerEvent('rcore_clothing:openChangingRoom')
end
