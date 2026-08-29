-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- You can get your API keys from https://fivemanage.com/
-- Use code LBPHONE10 for 10% off on Fivemanage
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = "YOUR_FIVEMANAGE_API_KEY",
    Image = "YOUR_FIVEMANAGE_API_KEY",
    Audio = "YOUR_FIVEMANAGE_API_KEY",
}

-- Discord webhook or API key for server logs
-- We recommend https://fivemanage.com/ for logs. Use code "LBLOGS" for 20% off the Logs Pro plan.
LOG_WEBHOOKS = {
    Default = "YOUR_DISCORD_WEBHOOK_URL", -- set to false to disable
    Police = "YOUR_DISCORD_WEBHOOK_URL",
    Ambulance = "YOUR_DISCORD_WEBHOOK_URL",
    Dispatch = "YOUR_DISCORD_WEBHOOK_URL"
}

DISCORD_TOKEN = nil -- you can set a discord bot token here to get the players discord avatar for logs

-- Here you can set your credentials for Config.DynamicWebRTC
-- You can get your credentials from https://dash.cloudflare.com/?to=/:account/realtime/turn/overview
WEBRTC = {
    TokenID = nil,
    APIToken = nil,
}
