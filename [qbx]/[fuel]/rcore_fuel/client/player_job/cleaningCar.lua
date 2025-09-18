RegisterNetEvent("rcore_fuel:selectVehicleForCleaning", function()
    ShowHelpNotification(_U("select_vehicle"), false, true, 10000)
    local ped = PlayerPedId()
    local veh = LetUserSelectVehicle()
    if not veh then
        return
    end

    local size = #GetModelDimensions(GetEntityModel(veh))

    local prepPose = {
        vector3(1.1, -0.9, 0.5),
        vector3(1.1, 0.9, 0.5),

        vector3(-1.1, -0.9, 0.5),
        vector3(-1.1, 0.9, 0.5),
    }
    local doorPos = {}

    for k, v in pairs(prepPose) do
        local x = (size / 2.647) * v.x
        local y = (size / 2.647) * v.y
        local z = v.z
        table.insert(doorPos, vector3(x, y, z))
    end

    local breakLoop = false
    local freezeCommand = false
    while true do
        Wait(0)
        if breakLoop then
            return
        end

        if #(GetEntityCoords(veh) - GetEntityCoords(ped)) >= 35 then
            return
        end

        for k, v in pairs(doorPos) do
            local pos = GetOffsetFromEntityInWorldCoords(veh, v)
            DrawMarker(42, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 150, false, false, 0, true)
            if IsControlJustReleased(1, 38) and not freezeCommand then
                if #(pos - GetEntityCoords(ped)) <= 1 then
                    freezeCommand = true
                    CreateThread(function()
                        GoToCoordsWithHeadingInTime(ped, pos - vector3(0, 0, 1), GetPotentitalHeadingForCoords(GetEntityCoords(veh)), 1000)
                        Animation.Play("clean2")
                        FreezeEntityPosition(ped, true)
                        Wait(10000)
                        FreezeEntityPosition(ped, false)
                        doorPos[k] = nil
                        freezeCommand = false
                        Animation.ResetAll()
                        if #doorPos == 0 then
                            SetVehicleDirtLevel(veh, 0)
                            breakLoop = true
                        end
                    end, "animation for cleaning vehicle")
                end
            end
        end
    end
end)