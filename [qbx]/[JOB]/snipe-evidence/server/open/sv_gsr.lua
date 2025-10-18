if not Config.GSR.enabled then return end

local GSRStatesforIdentifiers = {}

function SyncGSR(source)
    local identifier = GetPlayerFrameworkIdentifier(source)
    if not identifier then
        return
    end
    local state = GSRStatesforIdentifiers[identifier]
    if state == nil then
        state = false
    end
    Player(source).state:set('gsrstate', state, true)
end

RegisterNetEvent('snipe-evidence:client:GSRState', function(state)
    local src = source
    local identifier = GetPlayerFrameworkIdentifier(src)
    if not identifier then
        return
    end
    if not GSRStatesforIdentifiers[identifier] then
        GSRStatesforIdentifiers[identifier] = false
    end
    GSRStatesforIdentifiers[identifier] = state
    Player(src).state:set('gsrstate', state, true)
end)

