if not Config.Gloves.enabled then return end

function IsWearingGloves()
    local model = GetEntityModel(PlayerPedId())
    if Gloves[model] then
        local component = GetPedDrawableVariation(PlayerPedId(), 3)
        return lib.table.contains(Gloves[model], component) -- check if the component is in the table
    else
        return false -- if the model is not present in shared/gloves.lua, it will return false
    end
end

exports('IsWearingGloves', IsWearingGloves)