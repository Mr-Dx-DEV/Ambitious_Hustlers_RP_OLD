Locales = {}
function _U(str, ...)
    if type(Locales) ~= "table" then
        return string.format("[%s] the locales is wrong type, it is not a table..", GetCurrentResourceName())
    end
    if not Locales[Config.Locale] then
        return string.format("[%s] The language does not exists: %s", GetCurrentResourceName(), Config.Locale)
    end
    if not Locales[Config.Locale][str] then
        return string.format("[%s] There isnt such [%s] translation", GetCurrentResourceName(), str)
    end
    return string.format(Locales[Config.Locale][str], ...)
end

-- bridge for older versions
Config.GetQBCoreObject = function()
    local promise_ = promise:new()
    local obj
    xpcall(function()
        obj = exports['qb-core']['GetCoreObject']()
        promise_:resolve(obj)
    end, function(error)
        xpcall(function()
            obj = exports['qb-core']['GetSharedObject']()
            promise_:resolve(obj)
        end, function(error)

            local QBCore = nil
            local tries = 10

            LoadQBCore = function()
                if tries == 0 then
                    print("The QBCORE couldnt load any object! You need to correct the event / resource name for export!")
                    return
                end

                tries = tries - 1

                if QBCore == nil then
                    SetTimeout(100, LoadQBCore)
                end

                TriggerEvent(Config.QBCore or "QBCore:GetObject", function(module)
                    QBCore = module

                    obj = QBCore
                    promise_:resolve(QBCore)
                end)
            end

            LoadQBCore()

        end)
    end)

    Citizen.Await(obj)

    return obj
end

function GetEsxObject()
    local promise_ = promise:new()
    local obj
    xpcall(function()
        obj = exports["es_extended"]['getSharedObject']()
        promise_:resolve(obj)
    end, function(error)
        TriggerEvent(Config.ESX or "esx:getSharedObject", function(module)
            obj = module
            promise_:resolve(obj)
        end)
    end)

    Citizen.Await(obj)
    return obj
end