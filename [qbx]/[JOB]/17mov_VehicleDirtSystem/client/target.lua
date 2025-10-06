if Config.UseTarget then
    if Config.Framework == "QBCore" then
        Config.TargetSystem = "qb-target"
    else
        Config.TargetSystem = "qtarget"
    end
    
    if GetResourceState("ox_target") ~= "missing" then
        Config.TargetSystem = "qtarget"    -- OX_Target have a backward compability to qtarget
    end
else
    return
end

function DeleteIntefaceFromTarget(index)
    exports[Config.TargetSystem]:RemoveZone("CarwashStation " .. index)
end

function AddInterfaceToTarget(table, index)
    exports[Config.TargetSystem]:AddBoxZone("CarwashStation " .. index, vector3(table.interface.x, table.interface.y, table.interface.z), 1.0, 0.5, {
        name = "CarwashStation " .. index,
        minZ = table.interface.z - 0.7,
        maxZ = table.interface.z + 0.7,
        heading = table.interfaceRot.y,
        job = table.requiredJob,
    }, {
        options = {
            {
                event = "17mov_DirtSystem:interfaceInteraction",
                icon = "fa-solid fa-car",
                label = string.format(_L("Carwash.StartWashingTarget"), table.price),
                table = table,
                index = index,
            },
        },
        distance = 2.5,
    })
end

if Config.UseTarget then
    CreateThread(function()
        for i=1, #Config.VendingMachinesCoordinates do
            local coordinates = Config.VendingMachinesCoordinates[i]
            exports[Config.TargetSystem]:AddBoxZone("carwashATM " .. i, vector3(coordinates.x, coordinates.y, coordinates.z), 1.0, 1.0, {
                name = "carwashATM " .. i,
                minZ = coordinates.z - 1.0,
                maxZ = coordinates.z + 1.0,
                heading = coordinates.w - 90.0,
            }, {
                options = {
                    {
                        event = "17mov_DirtSystem:VendingMachineInteraction",
                        icon = "fa-solid fa-car",
                        label = string.gsub(_L("VendingMachine.Interaction"), "~r~%[E%] | ~s~", ""),
                    },
                },
                distance = 2.5,
            })
        end
    end)
end