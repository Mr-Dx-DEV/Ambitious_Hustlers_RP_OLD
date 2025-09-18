local CachedCallBacks = {}

function AddTimeEvent(h, m, cb)
    table.insert(CachedCallBacks, {
        h = h,
        m = m,
        cb = cb,
    })
end

function AddHourEvent(h, cb)
    table.insert(CachedCallBacks, {
        h = h,
        m = -1,
        cb = cb,
    })
end

function CheckForTimeEvent()
    SetTimeout(60 * 1000, CheckForTimeEvent)
    local time = os.date("*t")
    for k, v in pairs(CachedCallBacks) do
        if v.h == time.hour and v.m == time.min then
            v.cb()
        end
    end
end
CreateThread(function()
    -- just making sure that everything will load in time.
    Wait(10000)
    CheckForTimeEvent()
end, "CheckForTimeEvent")

function CheckForHourTimeEvent()
    SetTimeout(60 * 60 * 1000, CheckForTimeEvent)
    local time = os.date("*t")
    for k, v in pairs(CachedCallBacks) do
        if v.h == time.hour and v.m == -1 then
            v.cb()
        end
    end
end
CreateThread(function()
    -- just making sure that everything will load in time.
    Wait(10000)
    CheckForHourTimeEvent()
end, "CheckForHourTimeEvent")