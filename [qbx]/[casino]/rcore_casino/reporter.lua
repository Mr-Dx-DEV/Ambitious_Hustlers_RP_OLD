local Functions = {}
local LastFunctions = { "", "" }

function Debug(...)
    if Config.Debug then
        local i = debug.getinfo(2)
        if i ~= nil then
            print(i.short_src, i.currentline, ...)
        else
            print(...)
        end
    end
end

function DebugStart(funcName)
    LastFunctions[2] = LastFunctions[1]
    LastFunctions[1] = funcName
    Functions[funcName] = GetGameTimer()
end

if Config.ErrorDebug then
    local AddEventHandler_ = AddEventHandler
    local CreateThread_ = CreateThread

    -- replacement for CreateThread
    function CreateThread(methodFunction, isImportant, description)
        if isImportant then
            if type(isImportant) == "string" then
                description = isImportant
            end
        end

        CreateThread_(function()
            local status, err = xpcall(methodFunction, debug.traceback)
            if not status then
                print("^2CreateThread^0", "^1" .. (description or "non defined") .. "^0")
                print(err)

                -- if the thread has important role, run it again
                if isImportant == true then
                    Wait(1000)
                    CreateThread(methodFunction, isImportant, description)
                end
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
                print("^2AddEventHandler^0", "^1" .. eventName .. "^0")
                print("^2Args^1", retId, refId, a1, a2, a3, a4, a5, a6, a7, a8, a9)
                print(err)
            end
        end)
    end
end
