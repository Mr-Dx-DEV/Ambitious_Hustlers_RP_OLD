-- Will create a local object
--- @param hash string/integer
--- @param pos vector3
function CreateLocalPed(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    local obj = CreatePed(4, model, pos.x, pos.y, pos.z, 0, false, true)
    SetModelAsNoLongerNeeded(model)
    return obj
end

-- Will create a local object
--- @param hash string/integer
--- @param pos vector3
function CreateNetworkedPed(hash, pos)
    local model
    if tonumber(hash) then
        model = hash
    else
        model = GetHashKey(hash)
    end
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(16)
    end
    local obj = CreatePed(4, model, pos.x, pos.y, pos.z, 0, true, false)
    SetModelAsNoLongerNeeded(model)
    return obj
end