-- We will preload ESX module into local variable
if Config.Framework == 1 then
    ESX = GetEsxObject()
end

function GetVehPlate(source)
    return GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(source)))
end

function IsPedInAnyVehicle(source)
    return GetVehiclePedIsIn(GetPlayerPed(source), false) ~= 0
end

RegisterNetEvent("rcore_buyradio:BuyRadioVehicle", function(style)
    local source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if not IsPedInAnyVehicle(source) then
        return
    end

    local plate = GetVehPlate(source)

    if xPlayer.getMoney() >= Config.RadioPrice then
        if not exports.rcore_radiocar:HasCarRadio(plate) then
            xPlayer.removeMoney(Config.RadioPrice)
            exports.rcore_radiocar:GiveRadioToCar(plate, style)
            TriggerClientEvent("rcore_buyradio:showNotification", source, _U("installed_radio"))
        else
            TriggerClientEvent("rcore_buyradio:showNotification", source, _U("already_own"))
        end
    else
        TriggerClientEvent("rcore_buyradio:showNotification", source, _U("not_enough_money"))
    end
end)

RegisterNetEvent("rcore_buyradio:RemoveRadioVehicle", function()
    local source = source
    if not IsPedInAnyVehicle(source) then
        return
    end

    local plate = GetVehPlate(source)
    if exports.rcore_radiocar:HasCarRadio(plate) then
        exports.rcore_radiocar:RemoveRadioFromCar(plate)
        TriggerClientEvent("rcore_buyradio:showNotification", source, _U("removed_radio"))
    else
        TriggerClientEvent("rcore_buyradio:showNotification", source, _U("dont_have_radio"))
    end
end)