-- Will create a local object
--- @param hash string/integer
--- @param pos vector3
function CreateLocalObject(hash, pos)
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

    local entity = CreateObject(model, pos.x, pos.y, pos.z, false, false, false)
    SetEntityCoordsNoOffset(entity, pos.x, pos.y, pos.z)
    return entity
end

-- Will create a networked object
--- @param hash string/integer
--- @param pos vector3
function CreateNetworkedObject(hash, pos)
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
    local entity = CreateObject(model, pos.x, pos.y, pos.z, true, false, false)
    SetEntityCoordsNoOffset(entity, pos.x, pos.y, pos.z)
    return entity
end