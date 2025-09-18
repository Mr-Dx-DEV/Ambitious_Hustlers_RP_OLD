CreateThread(function()
    while true do
        Wait(500)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for k, v in pairs(Config.SpawnNPCList) do
            if #(pos - v.pos) < v.renderDistance then
                if not v.entity then
                    local entity = CreateLocalPed(v.model, v.pos)
                    SetEntityCoordsNoOffset(entity, v.pos)
                    FreezeEntityPosition(entity, true)
                    SetEntityHeading(entity, v.heading)

                    SetEntityAsMissionEntity(entity)
                    SetBlockingOfNonTemporaryEvents(entity, true)
                    FreezeEntityPosition(entity, true)
                    SetEntityInvincible(entity, true)

                    v.entity = entity

                    if v.anim then
                        Animation.Play(entity, v.anim)
                    end
                end
            else
                if v.entity then
                    DeleteEntity(v.entity)
                    v.entity = nil
                end
            end
        end
    end
end, "spawning NPC")

AddEventHandler("onResourceStop", function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    for k, v in pairs(Config.SpawnNPCList) do
        if DoesEntityExist(v.entity) then
            DeleteEntity(v.entity)
        end
    end
end)
