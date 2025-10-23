Logs = {}

-- General webhook configurations
Logs.Name = 'Laundering Logs' -- Name for the webhook
Logs.Image = 'https://i.imgur.com/ILTkWBh.png' -- Image for the webhook
Logs.Footer = 'https://i.imgur.com/ILTkWBh.png' -- Footer image for the webhook

-- Specific log type configurations
Logs.Types = {
    -- Do you want logs of users leveling up?
    levelUp = {
        enabled = true,
        webhook = 'https://discord.com/api/webhooks/1431023589167075340/sYKRlvHEmcId_qyt0ztxbtcU_DxLAStOe__2XjYxH4kbtFn5xDLnMsLhfF2W9kb8FIMz',
    },
    -- Do you want logs of users completing contracts?
    contracts = {
        enabled = true,
        webhook = 'https://discord.com/api/webhooks/1431023589167075340/sYKRlvHEmcId_qyt0ztxbtcU_DxLAStOe__2XjYxH4kbtFn5xDLnMsLhfF2W9kb8FIMz',
    },
    -- Do you want logs of users completing washes in warehouse?
    warehouse = {
        enabled = true,
        webhook = 'https://discord.com/api/webhooks/1431023589167075340/sYKRlvHEmcId_qyt0ztxbtcU_DxLAStOe__2XjYxH4kbtFn5xDLnMsLhfF2W9kb8FIMz'
    },
    -- Do you want logs of users counting money?
    counting = {
        enabled = true,
        webhook = 'https://discord.com/api/webhooks/1431023589167075340/sYKRlvHEmcId_qyt0ztxbtcU_DxLAStOe__2XjYxH4kbtFn5xDLnMsLhfF2W9kb8FIMz'
    }
}