if not Config.GSR.enabled then return end

function ApplyGSR()
    if not LocalPlayer.state.gsrstate then
        TriggerServerEvent('snipe-evidence:client:GSRState', true)
    end
end

local function CheckGSR()
    if not CanAccess() then
        ShowNotification(Locales["no_access"], "error")
        return
    end

    local players = lib.getNearbyPlayers(GetEntityCoords(cache.ped), 5.0, false)
    if not players then 
        ShowNotification(Locales["no_nearby_players"], "error")
        return
    end
    if #players == 0 then 
        ShowNotification(Locales["no_nearby_players"], "error")
        return
    end
    local otherPlayerId = NetworkGetPlayerIndexFromPed(players[1].ped)
    local nearbyPlayerId = GetPlayerServerId(otherPlayerId)
    local p = promise.new()
    DoProgress(function(result)
        p:resolve(result)
    end, Config.Progress["checking_gsr"])
    local progressComplete = Citizen.Await(p)
    if not progressComplete then return end

    local state = Player(nearbyPlayerId).state.gsrstate

    ShowNotification(state and Locales["gsr_positive"] or Locales["gsr_negative"], "info")
end

exports('CheckGSR', CheckGSR)

RegisterCommand(Config.GSR.command, function()
    CheckGSR()
end)

if Config.GSR.allowcleaningGSRInWater then
    local WaitFrames = 1000
    CreateThread(function()
        while true do
            Wait(WaitFrames)
            if LocalPlayer.state.gsrstate then
                if IsEntityInWater(cache.ped) then
                    WaitFrames = 3
                    DrawText3D(GetEntityCoords(cache.ped), "[E] to Clean GSR", 0.4, 1)
                    if IsControlJustReleased(0, 38) then
                        DoProgress(function(result)
                            if result then
                                TriggerServerEvent('snipe-evidence:client:GSRState', false)
                                ShowNotification(Locales["gsr_cleaned"], "success")
                            end
                        end, Config.Progress["cleaning_gsr"])
                    end
                end
            else
                WaitFrames = 1000
            end
        end
    end)
end