if Config.InventorySystem == Inventory.LJ then
    local resourceName = InventoryResourceNames[Inventory.LJ]

    function RemovePlayerItem(source, itemName, count)
        exports[resourceName]:RemoveItem(source, itemName, count)
    end

    function AddPlayerItem(source, itemName, count)
        exports[resourceName]:AddItem(source, itemName, count)
    end

    function CanPlayerCarryItem(source, itemName, count)
        local player = SharedObject.Functions.GetPlayer(source)
        local item = SharedObject.Shared.Items[itemName:lower()] or {}

        local ItemInfo = {
            name = itemName,
            count = item.amount or 0,
            label = item.label or "none",
            weight = item.weight or 0,
            usable = item.useable or false,
            rare = false,
            canRemove = false,
        }

        local totalWeight = exports[resourceName]:GetTotalWeight(player.PlayerData.items)
        local MaxWeight = 120000

        if SharedObject.Config.Player.MaxWeight then
            MaxWeight = SharedObject.Config.Player.MaxWeight
        end

        return (totalWeight + (ItemInfo.weight * count)) <= MaxWeight
    end

    function GetItemCount(source, itemName)
        local totalAmount = 0
        for k, v in pairs(exports[resourceName]:GetItemsByName(source, itemName)) do
            totalAmount = totalAmount + (v.amount or v.count)
        end
        return totalAmount
    end

    SharedObject.RegisterUsableItem = function(itemName, callBack)
        SharedObject.Functions.CreateUseableItem(itemName, callBack)
    end

    -- only if lj-inventory is active
    PlayerActiveSlots = {}

    RegisterNetEvent("inventory:server:UseItemSlot", function(activeSlot)
        -- I am not sure if the activeSlot argument can be something else beside number just like it is
        -- with qb-inventory so  i will leave it here
        if type(activeSlot) ~= "number" then
            return
        end

        PlayerActiveSlots[source] = activeSlot
    end)

    RegisterNetEvent("rcore_fuel:setActiveSlotId", function(slotId)
        PlayerActiveSlots[source] = slotId
    end)

    AddEventHandler("playerDropped", function()
        PlayerActiveSlots[source] = nil
    end)
end