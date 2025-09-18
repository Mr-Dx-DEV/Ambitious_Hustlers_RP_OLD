-- I will leave here what is suppose to be inside so you can get idea how to work with this
if Config.DisablePaymentModal then
    -- this will display the UI for picking bank/cash
    RegisterNetEvent("rcore_fuel:requestPaymentModal", function(cash, bank)
        SetNuiFocus(true, true)
        SendNUIMessage({
            type = "showpaytype",
            cash = cash,
            bank = bank,
        })
    end)

    -- this is result from the NUI
    RegisterNUICallback("payment", function(data, cb)
        SetNuiFocus(false, false)
        TriggerServerEvent("rcore_fuel:payForFuel", data.type)
        cb(true)
    end)
end