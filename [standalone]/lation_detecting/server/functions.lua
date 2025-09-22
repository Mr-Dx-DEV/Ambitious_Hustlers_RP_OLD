-- Check to see if fm-logs or fmsdk is started
local fmlogs = GetResourceState('fm-logs') == 'started'
local fmsdk = GetResourceState('fmsdk') == 'started'

-- Empty function that's triggered when a player tries to use a detector
-- Return true to allow usage, false to prevent
--- @param source number Player ID
--- @param model string Metal detector model (ex: blue_metaldetector)
function CanUseDetector(source, model)
    return true
end

-- Empty function that's triggered when an item is found
--- @param source number Player ID
--- @param model string Metal detector model (ex: blue_metaldetector)
--- @param item string Item name (ex: md_bottlecap)
--- @param quantity number Quanaity of item found (ex: 1)
function ItemFound(source, model, item, quantity)

end

-- Log events if applicable
--- @param message string Message contents
--- @param type string Log type
function EventLog(message, type)
    if not message or not Config.Setup.debug then return end
    if Logs.Service == 'fivemanage' then
        if not fmsdk then return end
        exports.fmsdk:LogMessage(type or 'info', message)
    elseif Logs.Service == 'fivemerr' then
        if not fmlogs then return end
        exports['fm-logs']:createLog({
            LogType = 'Resource',
            Resource = 'lation_detecting',
            Level = type or 'info',
            Message = message,
        })
    else
        print(message)
    end
end

-- Log player events if applicable
--- @param source number Player ID
--- @param title string Log title
--- @param message string Message contents
function PlayerLog(source, title, message)
    if Logs.Service == 'fivemanage' then
        if not fmsdk then return end
        if Logs.Screenshots then
            exports.fmsdk:takeServerImage(source, {
                name = title,
                description = message,
            })
        else
            exports.fmsdk:LogMessage('info', message)
        end
    elseif Logs.Service == 'fivemerr' then
        if not fmlogs then return end
        exports['fm-logs']:createLog({
            LogType = 'Player',
            Message = message,
            Resource = 'lation_detecting',
            Source = source,
        }, { Screenshot = Logs.Screenshots })
    elseif Logs.Service == 'discord' then
        local embed = {
            {
                ["color"] = 16711680,
                ["title"] = "**".. title .."**",
                ["description"] = message,
                ["footer"] = {
                    ["text"] = os.date("%a %b %d, %I:%M%p"),
                    ["icon_url"] = Logs.Discord.footer
                }
            }
        }
        PerformHttpRequest(Logs.Discord.link, function()
        end, 'POST', json.encode({username = Logs.Discord.name, embeds = embed, avatar_url = Logs.Discord.image}), {['Content-Type'] = 'application/json'})
    end
end