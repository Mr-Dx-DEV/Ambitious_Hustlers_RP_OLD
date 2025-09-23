-- Notifications / Dispatch Functions
function Notify(message, type, time) -- Change this to your own notification system if you want
    lib.notify({                     -- [ox_lib by default]
        id = 'chopshop-notify',
        title = 'Chop Shop',
        description = message,
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#909296'
        },
        icon = 'car-burst',
        iconColor = '#C53030',
        length = time
    })
end

function DispatchEvent(coords)
    exports['ps-dispatch']:SuspiciousActivity() -- - CHANGE THIS TO YOUR OWN DISPATCH TRIGGERS IF NOT USING PS-DISPATCH

    if Config.EnviAddictions then -- edit here if you are using Envi-Addictions and want to change the addiction amount etc.
        exports['envi-addictions']:AddAddiction('crime', 2)
    end
end

function ShowTextUI(message)
    lib.showTextUI(message)
end

function HideTextUI()
    lib.hideTextUI()
end

Framework.OnPlayerLoaded = function(player)
    Wait(3000)
    Framework.TriggerCallback('envi-chopshop:spawnMachines', function(spawnedMachines)
        if spawnedMachines and spawnedMachines ~= {} then
            for shopName, machines in pairs(spawnedMachines) do
                for machineLabel, netId in pairs(machines) do
                    local entity = NetworkGetEntityFromNetworkId(netId)
                    if DoesEntityExist(entity) then
                    end
                end
            end
        end
    end)
end