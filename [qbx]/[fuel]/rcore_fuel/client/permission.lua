function IsPlayerInGroup(groups, acePermission)
    local promise_ = promise:new()
    callCallback("rcore_fuel:hasPermission", function(cb)
        promise_:resolve(cb)
    end, groups, acePermission)

    return Citizen.Await(promise_)
end