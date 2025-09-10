CreateCallback("snipe-menu:server:getOfflinePlayers", function(source, cb)
    cb(GetOfflinePlayers())
end)

CreateCallback("snipe-menu:server:getAllOwnedVehicles", function(source, cb)
    cb(GetAllOwnedVehicles())
end)
