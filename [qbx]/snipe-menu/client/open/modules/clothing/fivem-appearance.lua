if not Config.Clothing ~= "fivem-appearance" then return end
RegisterNetEvent("snipe-menu:client:revertClothing", function()
    TriggerEvent("fivem-appearance:client:reloadSkin")
end)
