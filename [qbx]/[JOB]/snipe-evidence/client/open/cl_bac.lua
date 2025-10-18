if not Config.BAC.enabled then return end

local function AddBacLevel(level)
    TriggerServerEvent("snipe-evidence:server:toggleBACLevel", true, level)
    SetTimeout(Config.BAC.removeBACtimer * 60 * 1000, function()
        TriggerServerEvent("snipe-evidence:server:RemoveBACLevel", level)
    end)
end

local function RemoveBacLevel(level)
    TriggerServerEvent("snipe-evidence:server:RemoveBACLevel", level)
end
exports("AddBacLevel", AddBacLevel)
exports("RemoveBacLevel", RemoveBacLevel)

local function UseBacItem(data, slot)
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
    -- dictionary = "amb@world_human_stand_mobile@male@text@enter",
        -- animname = "enter",
    lib.requestAnimDict("amb@world_human_stand_mobile@male@text@enter")
    TaskPlayAnim(cache.ped, "amb@world_human_stand_mobile@male@text@enter", "enter", 8.0, -8.0, 4000, 49, 0, false, false, false)
    ShowBACLevels(Player(nearbyPlayerId).state.baclevel or 0)
end

exports("UseBacItem", UseBacItem)
