canDisplayRadar = false

RegisterNetEvent("rcore_fuel:hideHud", function()
    if Config.HideHud then
        if not IsRadarHidden() then
            canDisplayRadar = true
            DisplayRadar(false)
        end

        ExecuteCommand("hud")
    end
end)

RegisterNetEvent("rcore_fuel:showHud", function()
    if Config.HideHud then
        ExecuteCommand("hud")

        Wait(100)

        if canDisplayRadar then
            canDisplayRadar = false
            DisplayRadar(true)
        end
    end
end)