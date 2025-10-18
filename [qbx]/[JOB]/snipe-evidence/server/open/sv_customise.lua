function ShowNotification(source, msg, type)
    if Config.Notify == "qb" then
        TriggerClientEvent('QBCore:Notify', source, msg, type)
    elseif Config.Notify == "ox" then
        TriggerClientEvent('ox_lib:notify', source, {type = type, description = msg})
    elseif Config.Notify == "esx" then
        TriggerClientEvent('esx:showNotification', source, msg)
    elseif Config.Notify == "okok" then
        TriggerClientEvent('okokNotify:Alert', source, "Bundles", msg, 5000, type)
    end
end

local pouchAllowedItems = {
    ["collected_evidence_bag"] = true,
    -- add items you want to allow in the pouch here
}

local hook = exports.ox_inventory:registerHook("swapItems", function(payload)
    if payload.action == "swap" and (startsWith(tostring(payload.fromInventory), "pouchevidence_") or startsWith(tostring(payload.toInventory), "pouchevidence_")) then
        return false
    end

    if startsWith(payload.toInventory, "pouchevidence_") and not pouchAllowedItems[payload.fromSlot.name] then
        return false
    end

    return true
end)