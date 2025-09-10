if Config.Clothing ~= "esx_skin" then return end
RegisterNetEvent("snipe-menu:client:revertClothing", function()
    local p = promise.new()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        p:resolve(skin)
    end)
    local skin = Citizen.Await(p)
    TriggerEvent('skinchanger:loadSkin', skin)
end)