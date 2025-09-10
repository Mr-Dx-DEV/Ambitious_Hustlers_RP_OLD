Config = Config or {}


Config.CommandName = "adminmenu" -- command to open the menu

Config.FrameworkTriggers = {
    ["qbx"] = {
        ResourceName = "qbx_core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
        OnJobUpdate = "QBCore:Client:OnJobUpdate",
        OnGangUpdate = "QBCore:Client:OnGangUpdate",
        Garage_Table = "player_vehicles", -- table name for player vehicles in qbx-core
    },
    ["qb"] = {
        ResourceName = "qb-core",
        PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
        PlayerUnload = "QBCore:Client:OnPlayerUnload",
        OnJobUpdate = "QBCore:Client:OnJobUpdate",
        OnGangUpdate = "QBCore:Client:OnGangUpdate",
        Garage_Table = "player_vehicles", -- table name for player vehicles in qb-core
    },
    ["esx"] = {
        ResourceName = "es_extended",
        PlayerLoaded = "esx:playerLoaded",
        PlayerUnload = "esx:onPlayerLogout",
        OnJobUpdate = "esx:setJob",
        Garage_Table = "owned_vehicles", -- table name for player vehicles in es_extended
    },
}



Config.Discord = "https://discord.gg/yourdiscord" -- discord link to show when you ban a player in the ban message

Config.ShowInGameNames = true -- to show the in game names of the players in player list (if your server lags a lot, please set this to false)

Config.ReviveRadiusDistance = 10 -- distance within which a player can be revived when using Revive In Radius

Config.SafeCoords = vector3(136.79536437988, -627.42462158203, 262.85092163086) -- coords to teleport after spectate is cancelled and if the last location is not stored properly (happens sometimes but just a precaution so you do not teleport on the spectating player)

Config.EnableReports = true -- enable reports


-- DO NOT TOUCH ANYTHING BELOW THIS LINE!!!!!!!

for k, v in pairs(Config.FrameworkTriggers) do
    if GetResourceState(v.ResourceName) == "started" then
        if v.ResourceName == "qb-core" and GetResourceState("qbx_core") == "started" then
            Config.Framework = "qbx" -- prefer qbx over qb-core if both are started
        else
            Config.Framework = k
        end
        break
    end
end