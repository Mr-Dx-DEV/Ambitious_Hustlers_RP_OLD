if Config.Framework == "1" then
    ESX = GetEsxObject()
end

for k, v in pairs(Config.ItemAdder) do
    Config.ItemAdder[v] = k
end

function GetVehPlate(source)
    return GetVehicleNumberPlateText(GetVehiclePedIsIn(GetPlayerPed(source)))
end

function IsPedInAnyVehicle(source)
    return GetVehiclePedIsIn(GetPlayerPed(source), false) ~= 0
end

function InstallRadio(source, itemName, typeRadio)
    if not IsPedInAnyVehicle(source) then
        return
    end

    local plate = GetVehPlate(source)
    if not exports.rcore_radiocar:HasCarRadio(plate) then
        if Config.ox_inv then
            exports.ox_inventory:RemoveItem(source, itemName, 1)
        else
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.removeInventoryItem(itemName, 1)
        end

        exports.rcore_radiocar:GiveRadioToCar(plate, typeRadio)
        TriggerClientEvent("rcore_itemradio:showNotification", source, _U("installed"))
    else
        TriggerClientEvent("rcore_itemradio:showNotification", source, _U("already_own"))
    end
end

function RemoveRadio(source)
    if not IsPedInAnyVehicle(source) then
        return
    end

    local plate = GetVehPlate(source)
    if exports.rcore_radiocar:HasCarRadio(plate) then
        local itemName = Config.ItemAdder[exports.rcore_radiocar:GetCarRadioStyle(plate)]
        if Config.ox_inv then
            if exports.ox_inventory:CanCarryItem(source, itemName, 1) then
                exports.ox_inventory:RemoveItem(source, Config.ItemRemover, 1)
                exports.ox_inventory:AddItem(source, itemName, 1)
            else
                TriggerClientEvent("rcore_itemradio:showNotification", source, _U("out_of_space"))
                return
            end
        else
            local xPlayer = ESX.GetPlayerFromId(source)
            if xPlayer.canCarryItem(itemName, 1) then
                xPlayer.addInventoryItem(itemName, 1)
                xPlayer.removeInventoryItem(Config.ItemRemover, 1)
            else
                TriggerClientEvent("rcore_itemradio:showNotification", source, _U("out_of_space"))
                return
            end
        end

        exports.rcore_radiocar:RemoveRadioFromCar(plate)
        TriggerClientEvent("rcore_itemradio:showNotification", source, _U("removed"))
    else
        TriggerClientEvent("rcore_itemradio:showNotification", source, _U("doesnt_have"))
    end
end

if Config.ox_inv then
    exports(Config.ItemRemover, function(event, item, inventory, slot, data)
        if event ~= "usingItem" then
            return
        end

        RemoveRadio(inventory.id)
    end)

    for itemName, typeRadio in pairs(Config.ItemAdder) do
        exports(itemName, function(event, item, inventory, slot, data)
            if event ~= "usingItem" then
                return
            end

            InstallRadio(inventory.id, itemName, typeRadio)
        end)
    end
else
    ESX.RegisterUsableItem(Config.ItemRemover, function(source)
        RemoveRadio(source)
    end)

    for itemName, typeRadio in pairs(Config.ItemAdder) do
        ESX.RegisterUsableItem(itemName, function(source)
            InstallRadio(source, itemName, typeRadio)
        end)
    end
end