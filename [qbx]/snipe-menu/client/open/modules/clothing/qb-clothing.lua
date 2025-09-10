if Config.Clothing ~= "qb-clothing" then return end
RegisterNetEvent("snipe-menu:client:revertClothing", function()
    TriggerServerEvent("qb-clothing:server:loadPlayerSkin") -- LOADING PLAYER'S CLOTHES
    TriggerServerEvent("qb-clothes:loadPlayerSkin") -- LOADING PLAYER'S CLOTHES
end)