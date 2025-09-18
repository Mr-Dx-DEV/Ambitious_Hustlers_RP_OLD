local loadedObject = false
OnObjectLoadedVariable = {}

function OnObjectLoaded(cb)
    if loadedObject then
        cb()
    end
    table.insert(OnObjectLoadedVariable, cb)
end

function GetFrameworkName()
    local type = Config.Framework.Active
    if type == Framework.ESX then
        return Config.Framework.ES_EXTENDED_NAME
    end
    if type == Framework.QBCORE then
        return Config.Framework.QB_CORE_NAME
    end
end

function IsResourceOnServer(resourceName)
    if GetResourceState(resourceName) == "started" or GetResourceState(resourceName) == "starting" then
        return true
    end
    return false
end

function GetSharedObject()
    local promise_ = promise:new()
    local framework = Config.Framework.Active

    if not Config.Framework.DisableDetection then
        if IsResourceOnServer(Config.Framework.ES_EXTENDED_NAME) then
            framework = Framework.ESX
        end

        if IsResourceOnServer(Config.Framework.QB_CORE_NAME) then
            framework = Framework.QBCORE
        end
    end

    Config.Framework.Active = framework

    local resourceName = GetFrameworkName()

    -- Your custom
    if framework == Framework.CUSTOM then
        loadedObject = true
        promise_:resolve({ })

        for _, fun in pairs(OnObjectLoadedVariable) do
            fun()
        end
    end

    -- ES_EXTENDED
    if framework == Framework.ESX then
        xpcall(function()
            if ESX == nil then
                error("ESX variable is nil")
            end
            promise_:resolve(ESX)
        end, function(error)
            xpcall(function()
                promise_:resolve(exports[resourceName or 'es_extended']['getSharedObject']())
            end, function(error)
                local ESX = nil
                local tries = 10
                LoadEsx = function()
                    if tries == 0 then
                        print("Could not load any Es_extended object you need to correct the event name or change export name!")
                        return
                    end

                    tries = tries - 1

                    if ESX == nil then
                        SetTimeout(100, LoadEsx)
                    end

                    TriggerEvent(Config.Framework.ESX_SHARED_OBJECT, function(obj)
                        ESX = obj
                    end)
                end

                LoadEsx()
                promise_:resolve(ESX)
            end)
        end)
    end

    -- QBCORE
    if framework == Framework.QBCORE then
        xpcall(function()
            promise_:resolve(exports[resourceName or 'qb-core']['GetCoreObject']())
        end, function(error)
            xpcall(function()
                promise_:resolve(exports[resourceName or 'qb-core']['GetSharedObject']())
            end, function(error)

                local QBCore = nil
                local tries = 10
                LoadQBCore = function()
                    if tries == 0 then
                        print("Could not load any QB-Core object you need to correct the event name or change export name!")
                        return
                    end

                    tries = tries - 1

                    if QBCore == nil then
                        SetTimeout(100, LoadQBCore)
                    end

                    TriggerEvent(Config.Framework.QBCORE_SHARED_OBJECT, function(obj)
                        QBCore = obj
                    end)
                end

                LoadQBCore()
                promise_:resolve(QBCore)
            end)
        end)
    end

    loadedObject = true
    for _, fun in pairs(OnObjectLoadedVariable) do
        fun()
    end
    return Citizen.Await(promise_)
end
