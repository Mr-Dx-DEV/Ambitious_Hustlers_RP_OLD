if Config.Clothing ~= "illenium-appearance" then return end
RegisterNetEvent("snipe-menu:client:revertClothing", function()
    TriggerEvent("illenium-appearance:client:reloadSkin")
end)