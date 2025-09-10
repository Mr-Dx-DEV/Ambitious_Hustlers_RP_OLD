-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

-- Modify this to for how vehicle keys are added to your server (If applicable)

-- Add car keys
function WSB.giveCarKeys(plate, _model, _vehicle)
    if GetResourceState('wasabi_carlock') == 'started' then
        return exports.wasabi_carlock:GiveKey(plate) -- Leave like this if using wasabi_carlock
    end

    if GetResourceState('qb-vehiclekeys') == 'started' then
        return TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
    end
end

function WSB.removeCarKeys(plate, _model, _vehicle)
    if GetResourceState('wasabi_carlock') == 'started' then
        return exports.wasabi_carlock:RemoveKey(plate)
    end
end

exports('giveCarKeys', WSB.giveCarKeys)     -- Export for use in other scripts
exports('removeCarKeys', WSB.removeCarKeys) -- Export for use in other scripts
