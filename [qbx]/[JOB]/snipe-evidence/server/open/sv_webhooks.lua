local webhooks = {
    ["add"] = "",
    ["remove"] = "",
    ["img_add"] = "",
    ["img_remove"] = "",
    ["image"] = "",
}

local typeLabelMappings = {
    ["add"] = "Added Evidence",
    ["remove"] = "Removed Evidence",
    ["img_add"] = "Added Image",
    ["img_remove"] = "Removed Image",
}

local colors = {
    ["add"] = 65280,
    ["remove"] = 16711680,
    ["img_add"] = 65280,
    ["img_remove"] = 16711680,
}

function SendAddRemoveWebhook(source, action, cs_label, id, evidenceTypeLabel, metadata, isNormalItem)
    local embedData = {
        {
            ["title"] = typeLabelMappings[action] ,
            ["color"] = colors[action],
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            -- ["description"] = description,
            ["fields"] = {
                {
                    ["name"] = "Player",
                    ["value"] = "```"..GetPlayerName(source).." (" ..source..")".."```",
                    ["inline"] = false,
                },
                {
                    ["name"] = "Crime Scene Label",
                    ["value"] = "```"..cs_label.."```",
                    ["inline"] = false,
                },
                {
                    ["name"] = isNormalItem and "Item Label" or "Evidence Type",
                    ["value"] = "```"..evidenceTypeLabel.."```",
                    ["inline"] = false,
                },
                {
                    ["name"] = "Evidence ID",
                    ["value"] = "```"..id.."```",
                    ["inline"] = false,
                },
                {
                    ["name"] = "Metadata",
                    ["value"] = "```"..metadata.."```",
                    ["inline"] = true,
                },
            },
            ["author"] = {
                ["name"] = 'Snipe Evidence System Logs',
            },
        }
    }

    PerformHttpRequest(webhooks[action], function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end

function SendAddRemoveImageWebhook(source, action, cs_label, id, image_link)
    local embedData = {
        {
            ["title"] = typeLabelMappings[action] ,
            ["color"] = colors[action],
            ["footer"] = {
                ["text"] = os.date("%c"),
            },
            -- ["description"] = description,
            ["fields"] = {
                {
                    ["name"] = "Player",
                    ["value"] = "```"..GetPlayerName(source).." (" ..source..")".."```",
                    ["inline"] = false,
                },
                {
                    ["name"] = "Crime Scene Label",
                    ["value"] = "```"..cs_label.."```",
                    ["inline"] = false,
                },
                {
                    ["name"] = "Image Link",
                    ["value"] = image_link,
                    ["inline"] = false,
                },
                {
                    ["name"] = "Image ID",
                    ["value"] = "```"..id.."```",
                    ["inline"] = false,
                },
            },
            ["author"] = {
                ["name"] = 'Snipe Evidence System Logs',
            },
        }
    }

    PerformHttpRequest(webhooks[action], function(err, text, headers) end, 'POST', json.encode({ username = "Snipe Logs",embeds = embedData}), { ['Content-Type'] = 'application/json' })
end

function SendImageWebhook(imageUrl)
    local payload = json.encode({
        embeds = {
            {
                title = "Evidence Image",
                image = {
                    url = imageUrl
                }
            }
        }
    })

    PerformHttpRequest(webhooks["image"], function(err, text, headers) end, 'POST', payload, { ['Content-Type'] = 'application/json' })
end