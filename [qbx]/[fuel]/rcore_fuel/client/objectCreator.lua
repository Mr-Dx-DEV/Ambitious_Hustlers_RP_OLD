CreateThread(function()
    while true do
        Wait(1000)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for k, v in pairs(Config.SpawnObject) do
            if #(pos - v.pos) < v.renderDistance or (v.isMission and IsTutorialCameraDisplaying()) then
                if not v.entity then
                    local entity = CreateLocalObject(v.model, v.pos)

                    if v.model == "prop_roofpipe_01" then
                        SetEntityCollision(entity, false, false)
                    end

                    FreezeEntityPosition(entity, true)
                    SetEntityHeading(entity, v.heading)

                    if v.rotation then
                        SetEntityRotation(entity, v.rotation)
                    end

                    v.entity = entity
                end
            else
                if v.entity then
                    DeleteEntity(v.entity)
                    v.entity = nil
                end
            end
        end
    end
end, "object creator 1")

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    for k, v in pairs(Config.SpawnObject) do
        if DoesEntityExist(v.entity) then
            DeleteEntity(v.entity)
        end
    end
end)
