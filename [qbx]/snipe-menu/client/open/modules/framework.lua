AddEventHandler("onResourceStart", function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end
    Wait(1000) -- Wait for other resources to load
    PopulateData()
end)