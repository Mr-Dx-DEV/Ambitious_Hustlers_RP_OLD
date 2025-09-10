

-- ███████ ██    ██ ███████ ███    ██ ████████ ███████ 
-- ██      ██    ██ ██      ████   ██    ██    ██      
-- █████   ██    ██ █████   ██ ██  ██    ██    ███████ 
-- ██       ██  ██  ██      ██  ██ ██    ██         ██ 
-- ███████   ████   ███████ ██   ████    ██    ███████

RegisterNetEvent("snipe-menu:client:teleportMarker", function()
    if hasAdminPerms then
        local WaypointHandle = GetFirstBlipInfoId(8)

        if DoesBlipExist(WaypointHandle) then
            local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

            for height = 1, 1000 do
                SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                if foundGround then
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    break
                end

                Citizen.Wait(5)
            end
        end
    else
        TriggerServerEvent("snipe-menu:server:sendLogs", "exploit", Config.Locales["teleport_exploit_event"])
    end
end)

RegisterNetEvent("snipe-menu:client:removeStress", function(id)
    local p = promise.new()
    TriggerCallback("snipe-adminmenu:server:isAdmin", function(isAdmin)
        p:resolve(isAdmin)
    end, id)
    local isAdmin = Citizen.Await(p)
    if isAdmin then
        TriggerServerEvent("hud:server:RelieveStress", 100) -- this is qbcore event to remove stress (that particular event is in qb-hud/server.lua)
    else
        TriggerServerEvent("snipe-menu:server:sendLogs", "exploit", Config.Locales["stress_exploit_event"])
    end
end)

RegisterNetEvent("snipe-menu:client:teleporttoplayer", function(coords)
    if hasAdminPerms then
        SetPedCoordsKeepVehicle(PlayerPedId(), coords.x, coords.y, coords.z)
    else
        TriggerServerEvent("snipe-menu:server:sendLogs", "exploit", Config.Locales["teleport_exploit_event"])
    end
end)

RegisterNetEvent("snipe-menu:client:toggleDev", function()
    if hasAdminPerms then
        TriggerEvent("qb-admin:client:ToggleDevmode") -- used to toggle the dev mode ui on hud if you use ps-hud
    end
end)

RegisterNetEvent("snipe-menu:client:reviveInRadius", function(coords)
    if #(GetEntityCoords(PlayerPedId()) - coords) < Config.ReviveRadiusDistance then
        RevivePlayer()
    end
end)

-- ███    ██  ██████  ████████ ██ ███████ ██    ██ 
-- ████   ██ ██    ██    ██    ██ ██       ██  ██  
-- ██ ██  ██ ██    ██    ██    ██ █████     ████   
-- ██  ██ ██ ██    ██    ██    ██ ██         ██    
-- ██   ████  ██████     ██    ██ ██         ██



local function isAdmin()
    return hasAdminPerms
end

exports('isAdmin', isAdmin)


local function forceCloseAdminMenu()
    SendNUIMessage({
        action = "forceClose"
    })
    SetNuiFocus(false, false)
    adminMenuOpen = false
end

RegisterNetEvent("snipe-menu:client:forceCloseAdminMenu", function()
    forceCloseAdminMenu()
end)

exports('forceCloseAdminMenu', forceCloseAdminMenu)



function ShowTextUI(text)
    lib.showTextUI(text, {
        position = "right-center",
        icon = "fa-solid fa-circle-info",
        style = {
            borderRadius = 0.1,
            backgroundColor = '#000000',
            color = 'white'
        }
    })
end