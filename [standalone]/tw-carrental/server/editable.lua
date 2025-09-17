bot_Token = ""
bot_logo = "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
bot_name = "Tworst Store"


discord_webhook = {
    ['carrental'] =
    "https://discord.com/api/webhooks/1310259133592895598/vXx6m2fOHM6mjSE80SlVkbLByy-Uku45dokQZQfkSx-UYup670Gjb9xeDfslEPklPioQ",
}

local Caches = {
    Avatars = {}
}
local FormattedToken = "Bot " .. bot_Token
function DiscordRequest(method, endpoint, jsondata)
    local data = nil
    PerformHttpRequest(
        "https://discordapp.com/api/" .. endpoint,
        function(errorCode, resultData, resultHeaders)
            data = { data = resultData, code = errorCode, headers = resultHeaders }
        end,
        method,
        #jsondata > 0 and json.encode(jsondata) or "",
        { ["Content-Type"] = "application/json", ["Authorization"] = FormattedToken }
    )

    while data == nil do
        Citizen.Wait(0)
    end

    return data
end

function GetDiscordAvatar(user)
    local discordId = nil
    local imgURL = nil
    for _, id in ipairs(GetPlayerIdentifiers(user)) do
        if string.match(id, "discord:") then
            discordId = string.gsub(id, "discord:", "")
            break
        end
    end

    if discordId then
        if Caches.Avatars[discordId] == nil then
            local endpoint = ("users/%s"):format(discordId)
            local member = DiscordRequest("GET", endpoint, {})

            if member.code == 200 then
                local data = json.decode(member.data)
                if data ~= nil and data.avatar ~= nil then
                    if (data.avatar:sub(1, 1) and data.avatar:sub(2, 2) == "_") then
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".gif"
                    else
                        imgURL = "https://media.discordapp.net/avatars/" .. discordId .. "/" .. data.avatar .. ".png"
                    end
                end
            end
            Caches.Avatars[discordId] = imgURL
        else
            imgURL = Caches.Avatars[discordId]
        end
    end
    return imgURL
end

function sendDiscordLogHistory(data)
    local message = {
        username = bot_name,
        embeds = {
            {
                title = bot_name,
                color = 0xFFA500,
                author = {
                    name = 'Tworst CarRental - Rent Vehicle',
                },
                thumbnail = {
                    url = data.avatar or "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
                },
                fields = {
                    { name = "Player Name", value = data.name or false, inline = true },
                    { name = "Player ID",   value = data.id or false,   inline = true },
                    {
                        name = "──────────Rent Information──────────",
                        value = "",
                        inline = false
                    },
                    { name = "Rent Price",    value = string.format("%s%d", Config.MoneyType, tonumber(math.ceil(data.money)) or 0), inline = true },
                    { name = "Vehicle Model", value = data.vehicle or 'undefined',                                                   inline = true },
                    { name = "Rent Price",    value = string.format("%s%d", data.rentType, data.rentTime or 0),                      inline = true },

                },
                footer = {
                    text = "Tworst Store - https://discord.gg/tworst",
                    icon_url =
                    "https://r2.fivemanage.com/biv23I9cFWICSObhZsr4C/LogoNEW.png"
                },

                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
            }
        },
        avatar_url = bot_logo
    }

    PerformHttpRequest(discord_webhook['carrental'], function(err, text, headers) end,
        "POST",
        json.encode(message),
        { ["Content-Type"] = "application/json" })
end
