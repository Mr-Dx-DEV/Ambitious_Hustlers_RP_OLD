Logs = {}

-- What logging service do you want to use?
-- Available options: 'fivemanage', 'fivemerr', 'discord' & 'none'
-- It is highly recommended to use a proper logging service such as Fivemanage or Fivemerr
Logs.Service = 'discord'

-- Do you want to include screenshots with your logs?
-- This is only applicable to Fivemanage and Fivemerr
Logs.Screenshots = true

-- You can enable (true) or disable (false) specific player events to log here
Logs.Events = {
    -- 'selling' is for logging when a drug sale has completed
    selling = true,
    -- 'robbed' is when a player has been robbed by a ped
    robbed = true,
    -- 'claimed' is when a player has re-collected the robbed items
    claimed = true,
    -- 'leveled' is when a player has leveled up
    leveled = true
}

-- If Logs.Service = 'discord', you can customize the webhook data here
-- If not using Discord, this section can be ignored
Logs.Discord = {
    -- The name of the webhook
    name = 'Drug Selling Logs',
    -- The webhook link
    link = 'https://discord.com/api/webhooks/1431023759820718100/A_V-JLRlCGR4rTJJVprJjf5T2US10BsYpIvBDMN0y4Z_bPIPyTdcZygJ0JWOVbQmk5D_',
    -- The webhook profile image
    image = 'https://i.imgur.com/ILTkWBh.png',
    -- The webhook footer image
    footer = 'https://i.imgur.com/ILTkWBh.png'
}