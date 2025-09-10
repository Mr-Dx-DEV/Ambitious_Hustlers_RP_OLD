RegisterServerEvent("snipe-menu:server:changePlate", function(oldplate, newPlate)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        ChangeVehiclePlate(src, oldplate, newPlate)
    else
        SendLogs(src, "exploit", Config.Locales["change_plate_exploit_event"])
    end
end)

RegisterServerEvent("snipe-menu:server:givecar", function(playerid, carname, properties, type)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        GiveCarToPlayer(playerid, carname, properties, type, src)
        
    else
        SendLogs(src, "exploit", Config.Locales["give_car_exploit_event"])
    end
end)

RegisterServerEvent("snipe-menu:server:addAdminCar", function(carname, properties, type)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        AdminCarVehicle(carname, properties, type, src)
        ShowNotification(src, Config.Locales["you_own_the_car"])
        
    else
        SendLogs(src, "exploit", Config.Locales["admin_car_exploit"])
    end
end)


CreateCallback("snipe-menu:server:getOutsideVehicles", function(source, cb)
    cb(GetOutsideVehicles())
end)

RegisterServerEvent("snipe-menu:server:changeVehicleState", function(plate)
    local src = source
    if src ~= 0 and onlineAdmins[src] then
        ChangeVehicleState(plate)
        SendLogs(src, "triggered", Config.Locales["changed_vehicle_state"]..plate)
    else
        SendLogs(src, "exploit", Config.Locales["changed_vehicle_state_exploit"])
    end
end)


