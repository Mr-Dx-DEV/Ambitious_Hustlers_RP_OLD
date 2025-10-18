
dna = nil
fingerprint = nil


AddEventHandler("onResourceStop", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        SetNuiFocus(false, false)
    end
end)

AddEventHandler("onResourceStart", function(resourceName)
    if resourceName == GetCurrentResourceName() then
        Wait(1000)
        PopulateData()
    end
end)