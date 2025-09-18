Config = {}

-- Standalone = 0
-- ESX = 1
-- QBCore = 2
Config.Framework = 0

Config.Locale = "en"
------------------------------------------------
--  Standalone stuff
------------------------------------------------
-- For client side look in client/framework/standalone.lua
-- For server side look in server/framework/standalone.lua

------------------------------------------------
--  ESX Stuffs
------------------------------------------------
-- ESX object
Config.ESX = "esx:getSharedObject"

-- event for player loaded
Config.PlayerLoaded = "esx:playerLoaded"

-- event for setjob
Config.SetJob = "esx:setJob"

------------------------------------------------
--  QBCore Stuffs
------------------------------------------------
-- event for player loaded
Config.OnPlayerLoaded = "QBCore:Client:OnPlayerLoaded"

-- event for setjob
Config.OnJobUpdate = "QBCore:Client:OnJobUpdate"

-- qbcore object
Config.QBCore = "QBCore:GetObject"

---------------

Config.RadioPrice = 5000

Config.KeyListToInteract = { 38 }

-- marker list to buy radio car
Config.MarkerList = {
    {
        -- if left nil everyone will be able to open this.
        --job = "dealer",

        pos = vector3(235.89, -788.46, 30.61),
        onlyInVehicle = false, -- if true the marker will be displayed only if player is in vehicle
        style = 6, -- appearance of the marker

        size = vector3(1.0, 1.0, 1.0),
        color = { r = 0, g = 255, b = 0, a = 125 },

        rotate = true,
        faceCamera = false,
    },
}