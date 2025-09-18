_G.serverCallbacks = _G.serverCallbacks or {}


RegisterServerCallback = function(eventName, callback)
    _G.serverCallbacks[eventName] = callback
end

RegisterNetEvent("tworst-gardenerv2:triggerServerCallback", function(eventName, requestId, invoker, ...)
    if not _G.serverCallbacks[eventName] then
        return print(("[^1ERROR^7] Server Callback not registered, name: ^5%s^7, invoker resource: ^5%s^7"):format(
            eventName, invoker))
    end

    local src = source
    _G.serverCallbacks[eventName](src, function(...)
        TriggerClientEvent("tworst-gardenerv2:serverCallback", src, requestId, invoker, ...)
    end, ...)
end)



function RegisterCallback(name, cbFunc)
    while not Core do
        Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Core.RegisterServerCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    else
        Core.Functions.CreateCallback(name, function(source, cb, data)
            cbFunc(source, cb, data)
        end)
    end
end



local vRP = nil
CreateThread(function()
    if Config.Framework == 'vrp' then
        Wait(5000)
        local Tunnel = module("vrp", "lib/Tunnel")
        local Proxy = module("vrp", "lib/Proxy")
        
        vRP = Proxy.getInterface("vRP")
    end
end)

function ExecuteSql(query, parameters)
    local IsBusy = true
    local result = nil
    if Config.SQL == "oxmysql" then
        if parameters then
            exports.oxmysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.oxmysql:execute(query, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "ghmattimysql" then
        if parameters then
            exports.ghmattimysql:execute(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            exports.ghmattimysql:execute(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    elseif Config.SQL == "mysql-async" then
        if parameters then
            MySQL.Async.fetchAll(query, parameters, function(data)
                result = data
                IsBusy = false
            end)
        else
            MySQL.Async.fetchAll(query, {}, function(data)
                result = data
                IsBusy = false
            end)
        end
    end
    while IsBusy do
        Citizen.Wait(0)
    end
    return result
end

function WaitCore()
    while Core == nil do
        Wait(0)
    end
end

function GetPlayer(source)
    local Player = false
    while Core == nil do
        Citizen.Wait(0)
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        Player = Core.GetPlayerFromId(source)
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        Player = Core.Functions.GetPlayer(source)
    elseif Config.Framework == 'vrp' then
        Player = vRP.getUserId(source)
    end
    return Player
end

function GetIdentifier(source)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            return Player.getIdentifier()
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            return Player.PlayerData.citizenid
        elseif Config.Framework == 'vrp' then
            return vRP.getUserId(source)
        end
    end
end

function ChecklistItem(item)
    for _,v in pairs(Config.InventoryAccess.allowedItems) do
        if item == v then
            return true
        end
    end
    return false
end

function GetPlayerInventory(source)
    local data = {}
    local Player = GetPlayer(source)
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        for _, v in pairs(Player.getInventory())  do
            if v then
                v.count = v.count or v.amount
                if v and tonumber(v.count) > 0 and ChecklistItem(v.name) then
                    local formattedData = v
                    formattedData.name = string.lower(v.name)
                    formattedData.label = v.label
                    formattedData.amount = v.count
                    formattedData.image = v.image or (string.lower(v.name) .. '.png')
                    local metadata = v.metadata or v.info
                    if not metadata or next(metadata) == nil then
                        metadata = false
                    end
                    formattedData.metadata = metadata
                    table.insert(data, formattedData)
                end
            end
        end
    elseif Config.Framework == "qb" or Config.Framework == "oldqb" then
        for _, v in pairs(Player.PlayerData.items) do
            if v then
                local amount = v.count or v.amount
                if tonumber(amount) > 0 and ChecklistItem(v.name)  then
                    local formattedData = v
                    formattedData.name = string.lower(v.name)
                    formattedData.label = v.label
                    formattedData.amount = amount
                    formattedData.image = v.image or (string.lower(v.name) .. '.png')
                    local metadata = v.metadata or v.info
                    if not metadata or next(metadata) == nil then
                        metadata = false
                    end
                    formattedData.metadata = metadata
                    table.insert(data, formattedData)
                end
            end
        end
    elseif Config.Framework == "vrp" then
        for _, v in pairs(vRP.Inventory(Player)) do
            if v then
                local amount = v.count or v.amount
                if tonumber(amount) > 0 and ChecklistItem(v.name)  then
                    local formattedData = v
                    formattedData.name = string.lower(v.name)
                    formattedData.label = v.label
                    formattedData.amount = amount
                    formattedData.image = v.image or (string.lower(v.name) .. '.png')
                    local metadata = v.metadata or v.info
                    if not metadata or next(metadata) == nil then
                        metadata = false
                    end
                    formattedData.metadata = metadata
                    table.insert(data, formattedData)
                end
            end
        end
    end
    return data
end

function GetName(source)
    if Config.Framework == "oldesx" or Config.Framework == "esx" then
        local xPlayer = Core.GetPlayerFromId(tonumber(source))
        if xPlayer then
            return xPlayer.getName()
        else
            return "0"
        end
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        local Player = GetPlayer(tonumber(source))
        if Player then
            return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        else
            return "0"
        end
    elseif Config.Framework == 'vrp' then
        local user_id = vRP.getUserId(source)
        local identity = vRP.getUserIdentity(user_id)
        if identity then
            return identity.firstname .. " " .. identity.name
        end
        return "Firstname Lastname" 
    end
end

function AddMoney(source, type, value)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if type == 'bank' then
                Player.addAccountMoney('bank', tonumber(value))
            end
            if type == 'cash' then
                Player.addMoney(value)
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            if type == 'bank' then
                Player.Functions.AddMoney('bank', value)
            end
            if type == 'cash' then
                Player.Functions.AddMoney('cash', value)
            end
        elseif Config.Framework == 'vrp' then
            if type == 'bank' then
                local user_id = vRP.getUserId(source)
                vRP.giveBankMoney(user_id, value)
            end
            if type == 'cash' then
                local user_id = vRP.getUserId(source)
                vRP.giveMoney(user_id, value)
            end
        end
    end
end

function RemoveMoney(source, type, value)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if type == 'bank' then
                Player.removeAccountMoney('bank', value)
            end
            if type == 'cash' then
                Player.removeMoney(value)
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            if type == 'bank' then
                Player.Functions.RemoveMoney('bank', value)
            end
            if type == 'cash' then
                Player.Functions.RemoveMoney('cash', value)
            end
        elseif Config.Framework == 'vrp' then
            if type == 'bank' then
                vRP.tryWithdraw(source, value)
            end
            if type == 'cash' then
                vRP.tryPayment(source, value)
            end
        end
    end

end


function AddXP(source, xp)
    if not xp or xp <= 0 then return end

    local identifier = GetIdentifier(source)
    local data = playerJobData[identifier]
    if not data then return end

    local profiledata = data.profiledata
    profiledata.xp = profiledata.xp + tonumber(xp)

    if profiledata.level > #Config.RequiredXP then
        TriggerClientEvent('tworst-gardenerv2:client:sendNotification', source, Config.NotificationText['maxlevel'].text, Config.NotificationText['maxlevel'].type)
        return
    end

    if profiledata.xp >= Config.RequiredXP[profiledata.level] then
        profiledata.level = profiledata.level + 1
        profiledata.xp = 0
    end

    profiledata.lasttime = os.date('%Y-%m-%d %H:%M:%S')
end


function addItem(src, item, amount, slot, info)
    local amount = tonumber(amount) or 1
    local Player = GetPlayer(src)
    if Player then
        if Config.Framework == 'vrp' then
            local user_id = vRP.getUserId(src)
            vRP.giveInventoryItem(user_id, item, amount)	
        end
        if Config.Inventory == "qb_inventory" then
            Player.Functions.AddItem(item, amount, slot, info)
        elseif Config.Inventory == "esx_inventory" then
            Player.addInventoryItem(item, amount)
        elseif Config.Inventory == "ox_inventory" then
            exports.ox_inventory:AddItem(src, item, amount)
        elseif Config.Inventory == "codem-inventory" then
            exports["codem-inventory"]:AddItem(src, item, amount, slot, info)
        elseif Config.Inventory == "qs_inventory" then
            exports['qs-inventory']:AddItem(src, item, amount)
        end
    end
end

function GetPlayerMoney(source, value)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            if value == 'bank' then
                return Player.getAccount('bank').money
            end
            if value == 'cash' then
                return Player.getMoney()
            end
        elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            if value == 'bank' then
                return Player.PlayerData.money['bank']
            end
            if value == 'cash' then
                return Player.PlayerData.money['cash']
            end
        elseif Config.Framework == 'vrp' then
            if value == 'bank' then
                return vRP.getBankMoney(source)
            end
            if value == 'cash' then
                return vRP.getMoney(source)
            end
        end
    end
end

function calculateDistance(coord1, coord2)
    local dx = coord1.x - coord2.x
    local dy = coord1.y - coord2.y
    local dz = coord1.z - coord2.z
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end

function HasItem(source, item)
    local Player = GetPlayer(source)
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        if Config.Inventory == 'codem-inventory' then
            local item = exports["codem-inventory"]:CheckItemValid(source, item.name, tonumber(item.amount))
            return item
        elseif Config.Inventory == 'qs_inventory' then
            local itemCount = exports['qs-inventory']:GetItemTotalAmount(source, item.name)
            if itemCount == 0 or itemCount == nil then
                return false
            end
            return true
        elseif Config.Inventory == 'ox_inventory' then
            local item = exports.ox_inventory:GetItemCount(source, item.name)
            if item then
                return true
            else
                return false
            end
        else
            local playerItem = Player.getInventoryItem(item.name)
            if not playerItem then
                return false
            end
            local amount = playerItem.count or playerItem.amount
            if tonumber(amount) >= tonumber(item.amount) then
                return true
            end
        end
    elseif Config.Framework == 'qb' or Config.Framework == 'oldqb' then
        if Config.Inventory == 'codem-inventory' then
            local item = exports["codem-inventory"]:CheckItemValid(source, item.name, tonumber(item.amount))
            return item
        elseif Config.Inventory == 'qs_inventory' then
            local itemCount = exports['qs-inventory']:GetItemTotalAmount(source, item.name)
            if itemCount == 0 or itemCount == nil then
                return false
            end
            return true
        elseif Config.Inventory == 'ox_inventory' then
            local item = exports.ox_inventory:GetItemCount(source, item.name)
            if item and item >= 1 then
                return true
            else
                return false
            end
        else
            return Core.Functions.HasItem(source, item.name, tonumber(item.amount))
        end
    elseif Config.Framework == 'vrp' then
        local user_id = vRP.getUserId(source)
        local item = vRP.getInventoryItemAmount(user_id, item.name)
        if item and item >= tonumber(item.amount) then
            return true
        end
    end
    return false
end


function removeItem(src, item, amount)
    local Player = GetPlayer(src)
    amount = tonumber(amount) or 1
    if Player then
        if Config.Framework == 'vrp' then
            local user_id = vRP.getUserId(src)
            vRP.tryGetInventoryItem(user_id, item, amount)
        end
        if Config.Inventory == "qb_inventory" then
            --exports['qb-inventory']:RemoveItem(src, item, amount, false, 'diving:server:removeItem')
            Player.Functions.RemoveItem(item, amount)
        elseif Config.Inventory == "esx_inventory" then
            Player.removeInventoryItem(item, amount)
        elseif Config.Inventory == "ox_inventory" then
            exports.ox_inventory:RemoveItem(src, item, amount)
        elseif Config.Inventory == "codem-inventory" then
            exports["codem-inventory"]:RemoveItem(src, item, amount)
        elseif Config.Inventory == "qs_inventory" then
            exports['qs-inventory']:RemoveItem(src, item, amount)
        end
    end
end

--- Yields the current thread until a non-nil value is returned by the function.
---@generic T
---@param cb fun(): T?
---@param errMessage string?
---@param timeout? number | false Error out after `~x` ms. Defaults to 1000, unless set to `false`.
---@return T
---@async
function waitFor(cb, errMessage, timeout)
    local value = cb()
    if value ~= nil then return value end

    if timeout or timeout == nil then
        if type(timeout) ~= 'number' then timeout = 1000 end
    end

    local startTime = timeout and os.time() -- os.time() saniye bazlı çalışır
    local elapsed = 0

    while value == nil do
        Citizen.Wait(100) -- Döngüde CPU'yu rahatlatmak için bekleme süresi artırıldı

        if timeout then
            elapsed = os.time() - startTime
            if elapsed * 1000 > timeout then -- os.time() saniye döndürdüğü için ms'ye çevrildi
                return error(('%s (waited %.1fms)'):format(errMessage or 'failed to resolve callback', elapsed * 1000), 2)
            end
        end

        value = cb()
    end

    return value
end
