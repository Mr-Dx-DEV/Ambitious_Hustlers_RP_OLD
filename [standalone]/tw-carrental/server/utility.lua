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
    else
        Player = Core.Functions.GetPlayer(source)
    end
    return Player
end

function GetIdentifier(source)
    local Player = GetPlayer(source)
    if Player then
        if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
            return Player.getIdentifier()
        else
            return Player.PlayerData.citizenid
        end
    end
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
        local Player = Core.Functions.GetPlayer(tonumber(source))
        if Player then
            return Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        else
            return "0"
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
        end
    end
end

function removeItem(src, item, amount)
    local Player = GetPlayer(src)
    amount = tonumber(amount) or 1
    if Player then
        if Config.Inventory == "qb_inventory" then
            exports['qb-inventory']:RemoveItem(src, item, amount, false, 'diving:server:removeItem')
            -- Player.Functions.RemoveItem(item, amount)
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

function addItem(src, item, amount, slot, info)
    local Player = GetPlayer(src)
    if Player then
        if Config.Inventory == "qb_inventory" then
            Player.Functions.AddItem(item, amount, slot, info)
        elseif Config.Inventory == "esx_inventory" then
            Player.addInventoryItem(item, amount)
        elseif Config.Inventory == "ox_inventory" then
            exports.ox_inventory:AddItem(src, item, amount, info)
        elseif Config.Inventory == "codem-inventory" then
            exports["codem-inventory"]:AddItem(src, item, amount, slot, info)
        elseif Config.Inventory == "qs_inventory" then
            exports['qs-inventory']:AddItem(src, item, amount, slot, info)
        end
    end
end

function Round(value, numDecimalPlaces)
    if numDecimalPlaces then
        local power = 10 ^ numDecimalPlaces
        return math.floor((value * power) + 0.5) / (power)
    else
        return math.floor(value + 0.5)
    end
end

function GetVehicleProperties(name, plate)
    local extras = {}
    for i = 1, 12 do
        extras[i] = false
    end
    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        return {
            model                = GetHashKey(name),
            plate                = plate,
            plateIndex           = 0,

            bodyHealth           = Round(1000, 1),
            engineHealth         = Round(1000, 1),
            tankHealth           = Round(1000, 1),

            fuelLevel            = Round(100, 1),
            dirtLevel            = Round(0, 1),
            color1               = 0,
            color1Custom         = { 255, 255, 255 },

            color2               = 0,
            color2Custom         = { 255, 255, 255 },

            color1Type           = 0,
            color2Type           = 0,
            customPrimaryColor   = { 255, 255, 255 },
            customSecondaryColor = { 255, 255, 255 },

            pearlescentColor     = 111,
            wheelColor           = 156,

            wheels               = 0,
            windowTint           = -1,
            xenonColor           = 255,

            neonEnabled          = {
                false,
                false,
                false,
                false
            },

            neonColor            = { 255, 0, 255 },
            extras               = extras,
            tyreSmokeColor       = { 255, 255, 255 },
            dashboardColor       = 0,
            interiorColor        = 0,
            modSpoilers          = -1,
            modFrontBumper       = -1,
            modRearBumper        = -1,
            modSideSkirt         = -1,
            modExhaust           = -1,
            modFrame             = -1,
            modGrille            = -1,
            modHood              = -1,
            modFender            = -1,
            modRightFender       = -1,
            modRoof              = -1,

            modEngine            = -1,
            modBrakes            = -1,
            modTransmission      = -1,
            modHorns             = -1,
            modSuspension        = -1,
            modArmor             = -1,

            modTurbo             = false,
            modSmokeEnabled      = false,
            modXenon             = false,

            modFrontWheels       = -1,
            modBackWheels        = -1,

            modPlateHolder       = -1,
            modVanityPlate       = -1,
            modTrimA             = -1,
            modOrnaments         = -1,
            modDashboard         = -1,
            modDial              = -1,
            modDoorSpeaker       = -1,
            modSeats             = -1,
            modSteeringWheel     = -1,
            modShifterLeavers    = -1,
            modAPlate            = -1,
            modSpeakers          = -1,
            modTrunk             = -1,
            modHydrolic          = -1,
            modEngineBlock       = -1,
            modAirFilter         = -1,
            modStruts            = -1,
            modArchCover         = -1,
            modAerials           = -1,
            modTrimB             = -1,
            modTank              = -1,
            modWindows           = -1,
            modDoorR             = -1,
            modLivery            = -1,
            modLightbar          = -1,
            livery               = -1,
        }
    else
        return {
            model             = GetHashKey(name),
            plate             = plate,
            plateIndex        = 0,
            bodyHealth        = Round(1000, 0.1),
            engineHealth      = Round(1000, 0.1),
            tankHealth        = Round(1000, 0.1),
            fuelLevel         = Round(100, 0.1),
            dirtLevel         = Round(0, 0.1),

            color1            = 0,
            color2            = 0,

            pearlescentColor  = 111,
            wheelColor        = 156,
            dashboardColor    = 0,
            interiorColor     = 0,
            wheels            = 0,
            windowTint        = -1,
            xenonColor        = 255,
            neonEnabled       = {
                false,
                false,
                false,
                false
            },
            neonColor         = { 255, 0, 255 },
            extras            = extras,
            tyreSmokeColor    = { 255, 255, 255 },
            modSpoilers       = -1,
            modFrontBumper    = -1,
            modRearBumper     = -1,
            modSideSkirt      = -1,
            modExhaust        = -1,
            modFrame          = -1,
            modGrille         = -1,
            modHood           = -1,
            modFender         = -1,
            modRightFender    = -1,
            modRoof           = -1,
            modEngine         = -1,
            modBrakes         = -1,
            modTransmission   = -1,
            modHorns          = -1,
            modSuspension     = -1,
            modArmor          = -1,
            modTurbo          = false,
            modSmokeEnabled   = false,
            modXenon          = false,
            modFrontWheels    = -1,
            modBackWheels     = -1,
            modCustomTiresF   = false,
            modCustomTiresR   = false,
            modPlateHolder    = -1,
            modVanityPlate    = -1,
            modTrimA          = -1,
            modOrnaments      = -1,
            modDashboard      = -1,
            modDial           = -1,
            modDoorSpeaker    = -1,
            modSeats          = -1,
            modSteeringWheel  = -1,
            modShifterLeavers = -1,
            modAPlate         = -1,
            modSpeakers       = -1,
            modTrunk          = -1,
            modHydrolic       = -1,
            modEngineBlock    = -1,
            modAirFilter      = -1,
            modStruts         = -1,
            modArchCover      = -1,
            modAerials        = -1,
            modTrimB          = -1,
            modTank           = -1,
            modWindows        = -1,
            modLivery         = 0,
        }
    end
end

local StringCharset = {}
local NumberCharset = {}

for i = 48, 57 do NumberCharset[#NumberCharset + 1] = string.char(i) end
for i = 65, 90 do StringCharset[#StringCharset + 1] = string.char(i) end
for i = 97, 122 do StringCharset[#StringCharset + 1] = string.char(i) end

function RandomStr(length)
    if length <= 0 then return '' end
    return RandomStr(length - 1) .. StringCharset[math.random(1, #StringCharset)]
end

function RandomInt(length)
    if length <= 0 then return '' end
    return RandomInt(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
end
