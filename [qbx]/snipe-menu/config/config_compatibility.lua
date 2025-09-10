Config = Config or {}

Config.Debug = false -- set to true if you want to see debug messages in console or f8

-- use qb if you use qb or lj inventory
-- use ox if you use ox inventory (should be above version 2.9)
-- use qsv2 is for quasar v2 inventory
-- chezza is for chezza inventory
-- ps is for ps-inventory
-- codem is for codem inventory (NOT TESTED, YOU ARE ON YOUR OWN RISK)
-- core is for core inventory (NOT TESTED, YOU ARE ON YOUR OWN RISK)
Config.Inventory = "ox"

Config.NewQBInventory = true -- set to true if you use the new qb inventory system (have inventories table in database)

-- use qb-clothing if you use qb-clothing
-- use fivem-appearance if you use fivem-appearance
-- use esx_skin if you use esx_skin
-- use illenium-appearance if you use illenium-appearance
Config.Clothing = "illenium-appearance" 

-- lb is for lb-phone
-- gks is for gks-phone
-- qbphone is for qbphone
-- npwd is for npwd
-- okokphone is for okok-phone
-- roadphone is for road-phone
-- snappy is for snappy-phone
-- yseries is for yseries-phone
-- qsphone is for qs-smartphone
Config.Phone = "lb" 

-- qb-ambulance
-- qbx_ambulance
-- wasabi is for wasabi-ambulance
-- esx_ambulance is for esx_ambulance
-- ak47 for ak47- ambulance (NOT TESTED, YOU ARE ON YOUR OWN RISK)
Config.Ambulance = "wasabi"

-- use default if you dont use any of the mentioned options
-- okok is for okokChat
-- codem is for codem-chat
Config.Chat = "default" -- "default", "okok", "codem"

-- use qb-weather if you use qb-weather
-- cd_easytime for cd_easytime (if you use esx, it will be cd_easytime  by default)
-- renewed for renewed weathersync
Config.WeatherScript = "renewed"

-- legacy is for legacyfuel
-- ps is for ps-fuel
-- ox is for ox-fuel
-- cdn is for cdn-fuel
-- lc_fuel is for lc_fuel
-- rcore is for rcore_fuel
-- other is for no fuel system
Config.Fuel = "ox" -- "ps" "ox" "other", "cdn", "legacy"

-- garage
-- qb is for qb-garage or qbx_garages
-- cd is for cd_garage
-- esx is for esx_garage
Config.Garage = "qb"


-- qb-target
-- ox_target
-- qtarget
-- interact
Config.Target = "ox_target" -- qb-target || ox_target || qtarget (Only these 3 targets are supported. You will have to edit in cl_customise if you want to use any other target other than this. No support is given to other target scripts)

-- use qb is you use qb-vehiclekeys
-- use cd if you use cd_garage keys system
-- use mk if you use mk_vehiclekeys
-- use jaksam if you use jaksam vehiclekeys
-- use wasabi if you use wasabi vehiclekeys
Config.Keys = "qb" -- "qb" or "cd" or "other"