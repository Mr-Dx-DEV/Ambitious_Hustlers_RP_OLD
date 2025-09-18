disableFire = false

AddEventHandler("rcore_fuel:OnDispenserEnter", function()
    SetPlayerCanUseCover(PlayerId(), false)
    disableFire = true
end)

AddEventHandler("rcore_fuel:OnDispenserExit", function()
    SetPlayerCanUseCover(PlayerId(), true)
    disableFire = false
end)

CreateThread(function()
    while true do
        Wait(0)
        if disableFire then
            DisablePlayerFiring(PlayerPedId(), true)
        else
            Wait(1000)
        end
    end
end, "disable fire")