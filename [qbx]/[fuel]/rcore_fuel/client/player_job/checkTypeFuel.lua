function CheckFuelTypeForVehicle()
    ShowHelpNotification(_U("manual_guide"), false, true, 10000)
    local veh = LetUserSelectVehicle()
    if not veh then
        return
    end

    local ped = PlayerPedId()
    local offset = vector3(0, 2.8, 0.0)

    local size = #GetModelDimensions(GetEntityModel(veh))

    offset = vector3((size / 2.647) * offset.x, (size / 2.647) * offset.y, offset.z)

    local walkPos = GetOffsetFromEntityInWorldCoords(veh, offset)

    FreezeEntityPosition(veh, true)

    GoToCoordsWithHeadingInTime(ped, walkPos, GetEntityHeading(veh) - 180, 1000)

    Wait(1000)
    FreezeEntityPosition(ped, true)
    SetEntityHeading(ped, GetEntityHeading(veh) - 180)
    Wait(1000)
    Animation.Play("mechanic")
    Wait(1000)
    Animation.ResetAll()
    SetVehicleDoorOpen(veh, 4, false, false)

    Wait(1000)

    Animation.Play("notepad")
    ShowSubtitle(_U("manual_reading"), 10000)

    Wait(10000)
    Animation.Play("mechanic")
    Wait(1000)

    ShowSubtitle(_U(GetVehicleFuelType(GetEntityModel(veh)) .. "_check"), 10000)

    Animation.ResetAll()
    SetVehicleDoorShut(veh, 4, false)
    FreezeEntityPosition(ped, false)
    FreezeEntityPosition(veh, false)
end

RegisterNetEvent("rcore_fuel:checkFuelType", CheckFuelTypeForVehicle)