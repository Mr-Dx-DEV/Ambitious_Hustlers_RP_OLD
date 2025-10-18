-- this is a very very slow thread running on all clients to cleanup props every 30 minute so if the props do not delete properly, this thread will help with cleanup.
-- this is just a backup thread to make sure props are deleted properly.

local propHashes = {}
for k, v in pairs(Config.Props) do
    propHashes[GetHashKey(v)] = true
end

CreateThread(function()
    while true do
        Wait(30 * 60 * 1000)
        local Objects = GetGamePool('CObject')
        for k, v in pairs(Objects) do
            if propHashes[GetEntityModel(v)] then
                SetEntityAsMissionEntity(v, true, true)
                DeleteObject(v)
            end
        end
    end
end)