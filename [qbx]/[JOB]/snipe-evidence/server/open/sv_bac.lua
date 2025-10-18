if not Config.BAC.enabled then return end

local BACLevelforIdentifiers = {}

function SyncBAC(source)
    local identifier = GetPlayerFrameworkIdentifier(source)
    if not identifier then
        return
    end
    local value = BACLevelforIdentifiers[identifier]
    if not value then
        value = 0
        BACLevelforIdentifiers[identifier] = 0
    end
    Player(source).state:set('baclevel', value, true)
end

RegisterNetEvent('snipe-evidence:client:BACValue', function(value)
    local src = source
    local identifier = GetPlayerFrameworkIdentifier(src)
    if not identifier then
        return
    end
    if not BACLevelforIdentifiers[identifier] then
        BACLevelforIdentifiers[identifier] = 0
    end
    BACLevelforIdentifiers[identifier] = BACLevelforIdentifiers[identifier] + value
    Player(src).state:set('baclevel', value, true)
end)

RegisterNetEvent("snipe-evidence:server:toggleBACLevel", function(add, level)
    local src = source
    local identifier = GetPlayerFrameworkIdentifier(src)
    if not identifier then
        return
    end
    if not BACLevelforIdentifiers[identifier] then
        BACLevelforIdentifiers[identifier] = 0
    end
    if add then
        BACLevelforIdentifiers[identifier] = BACLevelforIdentifiers[identifier] + level
    else
        BACLevelforIdentifiers[identifier] = BACLevelforIdentifiers[identifier] - level
    end
    if BACLevelforIdentifiers[identifier] < 0 then
        BACLevelforIdentifiers[identifier] = 0
    end
    Player(src).state:set('baclevel', BACLevelforIdentifiers[identifier], true)
end)

RegisterNetEvent("snipe-evidence:server:RemoveBACLevel", function(level)
    local src = source
    local identifier = GetPlayerFrameworkIdentifier(src)
    if not identifier then
        return
    end
    if not BACLevelforIdentifiers[identifier] then
        BACLevelforIdentifiers[identifier] = 0
    end
    BACLevelforIdentifiers[identifier] = BACLevelforIdentifiers[identifier] - level
    Player(src).state:set('baclevel', BACLevelforIdentifiers[identifier], true)
end)

AddEventHandler('snipe-evidence:server:removeBAC', function()
    local src = source
    local identifier = GetPlayerFrameworkIdentifier(src)
    if not identifier then
        return
    end
    if BACLevelforIdentifiers[identifier] then
        BACLevelforIdentifiers[identifier] = nil
    end
end)