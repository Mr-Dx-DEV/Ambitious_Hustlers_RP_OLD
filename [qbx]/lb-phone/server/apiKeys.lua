-- Webhook for instapic posts, recommended to be a public channel
INSTAPIC_WEBHOOK = "https://discord.com/api/webhooks/1431031667446911158/jv0QABAo3XasbwwHEYDjZRs-N80z98y9Q1uXylVukl4lhpGj5XpMXgYH1q6GAV_Mp86Y"
-- Webhook for birdy posts, recommended to be a public channel
BIRDY_WEBHOOK = "https://discord.com/api/webhooks/1431031591794245724/FY-sGYPAcFk3kf-WOlG-bklqZvdFTucIOhSh6euNj0Lxs_Yjp4ofbslT3xYVsvhQQL_w"

-- Discord webhook or API key for server logs
-- We recommend https://fivemanage.com/ for logs. Use code "LBLOGS" for 20% off the Logs Pro plan
LOGS = {
    Default = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP", -- set to false to disable
    Calls = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    Messages = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    InstaPic = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    Birdy = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    YellowPages = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    Marketplace = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    Mail = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    Wallet = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    DarkChat = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    Services = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    Crypto = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    Trendy = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP",
    Uploads = "https://discord.com/api/webhooks/1431026469978640456/Yor-3KveJYsENxMu97UNJ_AnYuJdGs3cSYH1L9fWCmoIn6mK8XQcXn151odr1zg2YCxP" -- all camera uploads will go here
}

DISCORD_TOKEN = nil -- you can set a discord bot token here to get the players discord avatar for logs

-- Set your API keys for uploading media here.
-- Please note that the API key needs to match the correct upload method defined in Config.UploadMethod.
-- The default upload method is Fivemanage
-- You can get your API keys from https://fivemanage.com/
-- Use code LBPHONE10 for 10% off on Fivemanage
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
API_KEYS = {
    Video = "Q0ZQQfpYoZzi4nyv4h5w6VS8mG7Sts1O",
    Image = "Q0ZQQfpYoZzi4nyv4h5w6VS8mG7Sts1O",
    Audio = "Q0ZQQfpYoZzi4nyv4h5w6VS8mG7Sts1O",
}

-- Here you can set your credentials for Config.DynamicWebRTC
-- This is needed if video calls or InstaPic live streams are not working
-- You can get your credentials from https://dash.cloudflare.com/?to=/:account/realtime/turn/overview
WEBRTC = {
    TokenID = nil,
    APIToken = nil,
}
