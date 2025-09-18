-- Fill your webhook only here if you want music get logged
Config.LogWebhook = ""

function SendDiscordMessage(name, message)
    local footer = "rcore:discord | rcore.cz"
    local color = 56108
    local embeds = {
        {
            ["title"] = name,
            ["description"] = message,
            ["type"] = "rich",
            ["color"] = color,
            ["footer"] = {
                ["text"] = footer,
            },
        }
    }

    PerformHttpRequest(Config.LogWebhook, function(err, text, headers)
    end, 'POST', json.encode({ username = name, embeds = embeds }), { ['Content-Type'] = 'application/json' })
end

function PerformedDiscordMessage(source, data)
    -- Do not insert your webhook here, this is just check so we wont send HTTP request if the webhook isnt filled
    -- by filling your webhook here and above will make the code not work.
    if Config.LogWebhook ~= "" then
        local rock, steam = PlayerIdentifier(source, "license:"), PlayerIdentifier(source, "steam:")
        SendDiscordMessage("Someone is playing music from radiocar!", string.format("Player ID: %s\nPlayer name: %s\nIs playing music: %s\nOn position: %s\nPlayer identifier (rockstar): %s\nPlayer identifier (steam): %s", source, GetPlayerName(source), data.url, GetEntityCoords(GetPlayerPed(source)), rock, steam))
    end
end