local debugInfo = {}

function StartDebugSession(sessionName)
    if Config.ErrorDebug then
        debugInfo[sessionName] = {
            stepCount = 0,
            stepData = {},
        }
    end
end

function DestoryDebugSession(sessionName)
    if Config.ErrorDebug then
        debugInfo[sessionName] = nil
    end
end

function DebugRecordStep(sessionName, stepName)
    if Config.ErrorDebug then
        local data = debugInfo[sessionName]
        if data then
            data.stepCount = data.stepCount + 1

            data.stepData[data.stepCount] = stepName
        end
    end
end

function DisplayCurrentRecordSteps(sessionName)
    local data = debugInfo[sessionName]
    if data then
        for k, v in ipairs(data.stepData) do
            print("^0Step name: ^1" .. tostring(v))
        end
        print("^5=====^0")
        print("^0Last step before the error: ^1" .. tostring(data.stepData[#data.stepData]))
    end
end

--- Will send a print when debug is enabled
--- @param ... object
function Debug(...)
    if Config.Debug then
        print(...)
    end
end


if Config.ErrorDebug then
    local AddEventHandler_ = AddEventHandler
    local RegisterNetEvent_ = RegisterNetEvent
    local CreateThread_ = CreateThread
    local RegisterCommand_ = RegisterCommand
    local RegisterNUICallback_ = RegisterNUICallback

    -- replacement for AddEventHandler
    function RegisterCommand(eventName, eventRoutine)
        RegisterCommand_(eventName, function(source, args, rawCommand)
            local status, err = xpcall(function()
                eventRoutine(source, args, rawCommand)
            end, debug.traceback)
            if not status then
                local args = { [1] = source, [2] = args, [3] = rawCommand }
                print("^5=========================^0")
                print("^2Error in: ^1RegisterCommand^0")
                print("^2Event name: ^1" .. eventName .. "^0")
                print("^5=========================^0")
                DisplayCurrentRecordSteps(eventName)
                print("^5=========================^0")
                for k, v in pairs(args) do
                    print("^0Argument key: ^1" .. k)
                    print("^0Argument value type: ^1" .. type(v))
                    print(" ")
                    if type(v) == "table" then
                        print("^0Argument value: ^1" .. tostring(v))
                        Dump(v)
                    else
                        print("^0Argument value: ^1" .. tostring(v))
                    end
                    print("^5=====^0")
                end
                print("^5=========================^0")
                print(err)
                print("^5=========================^0")
            end
        end)
    end

    -- replacement for AddEventHandler
    function RegisterNetEvent(eventName, eventRoutine)
        if not eventRoutine then
            RegisterNetEvent_(eventName)
            return
        end
        RegisterNetEvent_(eventName, function(retEvent, retId, refId, a1, a2, a3, a4, a5, a6, a7, a8, a9)
            local status, err = xpcall(function()
                eventRoutine(retEvent, retId, refId, a1, a2, a3, a4, a5, a6, a7, a8, a9)
            end, debug.traceback)
            if not status then
                local args = { [1] = retEvent, [2] = retId, [3] = refId, [4] = a1, [5] = a2, [6] = a3, [7] = a4, [8] = a5, [9] = a6, [10] = a7, [11] = a8, [12] = a9 }
                print("^5=========================^0")
                print("^2Error in: ^1RegisterNetEvent^0")
                print("^2Event name: ^1" .. eventName .. "^0")
                print("^5=========================^0")
                DisplayCurrentRecordSteps(eventName)
                print("^5=========================^0")
                for k, v in pairs(args) do
                    print("^0Argument key: ^1" .. k)
                    print("^0Argument value type: ^1" .. type(v))
                    print(" ")
                    if type(v) == "table" then
                        print("^0Argument value: ^1" .. tostring(v))
                        Dump(v)
                    else
                        print("^0Argument value: ^1" .. tostring(v))
                    end
                    print("^5=====^0")
                end
                print("^5=========================^0")
                print(err)
                print("^5=========================^0")
                local arguments = ""
                for i = 1, 12 do
                    local value = args[i]
                    if type(value) == "table" then
                        arguments = arguments .. Dump(value, true) .. ","
                    else
                        if type(value) == "string" then
                            arguments = arguments .. "'" .. value .. "',"
                        else
                            arguments = arguments .. tostring(value) .. ","
                        end
                    end
                end
                print("^0Replication trigger event:")
                print("^1TriggerEvent('" .. eventName .. "', " .. arguments:gsub("\n", ""):sub(1, -2) .. ")")
                print("^5=========================^0")
            end
        end)
    end

    -- replacement for RegisterNUICallback
    function RegisterNUICallback(eventName, eventRoutine)
        RegisterNUICallback_(eventName, function(retEvent, retId, refId, a1, a2, a3, a4, a5, a6, a7, a8, a9)
            local status, err = xpcall(function()
                eventRoutine(retEvent, retId, refId, a1, a2, a3, a4, a5, a6, a7, a8, a9)
            end, debug.traceback)
            if not status then
                local args = { [1] = retEvent, [2] = retId, [3] = refId, [4] = a1, [5] = a2, [6] = a3, [7] = a4, [8] = a5, [9] = a6, [10] = a7, [11] = a8, [12] = a9 }
                print("^5=========================^0")
                print("^2Error in: ^1RegisterNUICallback^0")
                print("^2Event name: ^1" .. eventName .. "^0")
                print("^5=========================^0")
                DisplayCurrentRecordSteps(eventName)
                print("^5=========================^0")
                for k, v in pairs(args) do
                    print("^0Argument key: ^1" .. k)
                    print("^0Argument value type: ^1" .. type(v))
                    print(" ")
                    if type(v) == "table" then
                        print("^0Argument value: ^1" .. tostring(v))
                        Dump(v)
                    else
                        print("^0Argument value: ^1" .. tostring(v))
                    end
                    print("^5=====^0")
                end
                print("^5=========================^0")
                print(err)
                print("^5=========================^0")
                local arguments = ""
                for i = 1, 12 do
                    local value = args[i]
                    if type(value) == "table" then
                        arguments = arguments .. Dump(value, true) .. ","
                    else
                        if type(value) == "string" then
                            arguments = arguments .. "'" .. value .. "',"
                        else
                            arguments = arguments .. tostring(value) .. ","
                        end
                    end
                end
                print("^0Replication trigger event:")
                print("^1TriggerEvent('__cfx_nui:" .. eventName .. "', " .. arguments:gsub("\n", ""):sub(1, -2) .. ")")
                print("^5=========================^0")
            end
        end)
    end

    -- replacement for CreateThread
    function CreateThread(methodFunction, description)
        CreateThread_(function()
            local status, err = xpcall(methodFunction, debug.traceback)
            if not status then
                print("=========================")
                print("^2Error in: ^1CreateThread^0")
                print("^1" .. (description or "non defined") .. "^0")
                print("=========================")
                DisplayCurrentRecordSteps(description)
                print("^5=========================^0")
                print(err)
                print("=========================")
            end
        end)
    end

    -- replacement for AddEventHandler
    function AddEventHandler(eventName, eventRoutine)
        AddEventHandler_(eventName, function(retEvent, retId, refId, a1, a2, a3, a4, a5, a6, a7, a8, a9)
            local status, err = xpcall(function()
                eventRoutine(retEvent, retId, refId, a1, a2, a3, a4, a5, a6, a7, a8, a9)
            end, debug.traceback)
            if not status then
                local args = { [1] = retEvent, [2] = retId, [3] = refId, [4] = a1, [5] = a2, [6] = a3, [7] = a4, [8] = a5, [9] = a6, [10] = a7, [11] = a8, [12] = a9 }
                print("^5=========================^0")
                print("^2Error in: ^1AddEventHandler^0")
                print("^2Event name: ^1" .. eventName .. "^0")
                print("^5=========================^0")
                DisplayCurrentRecordSteps(eventName)
                print("^5=========================^0")
                for k, v in pairs(args) do
                    print("^0Argument key: ^1" .. k)
                    print("^0Argument value type: ^1" .. type(v))
                    print(" ")
                    if type(v) == "table" then
                        print("^0Argument value: ^1" .. tostring(v))
                        Dump(v)
                    else
                        print("^0Argument value: ^1" .. tostring(v))
                    end
                    print("^5=====^0")
                end
                print("^5=========================^0")
                print(err)
                print("^5=========================^0")
                local arguments = ""
                for i = 1, 12 do
                    local value = args[i]
                    if type(value) == "table" then
                        arguments = arguments .. Dump(value, true) .. ","
                    else
                        if type(value) == "string" then
                            arguments = arguments .. "'" .. value .. "',"
                        else
                            arguments = arguments .. tostring(value) .. ","
                        end
                    end
                end
                print("^0Replication trigger event:")
                print("^1TriggerEvent('" .. eventName .. "', " .. arguments:gsub("\n", ""):sub(1, -2) .. ")")
                print("^5=========================^0")
            end
        end)
    end
end