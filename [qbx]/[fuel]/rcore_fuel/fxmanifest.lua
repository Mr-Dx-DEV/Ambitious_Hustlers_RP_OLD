fx_version 'cerulean'
games { 'gta5' }

version "1.1.1"

lua54 'yes'

client_scripts {
    "dispenserData.lua",

    "client/init.lua",

    "utils/SoundManager/main.lua",
    "utils/SoundManager/SoundPlayer.lua",
    "utils/SoundManager/events.lua",

    "utils/ropes/client/rope/*.lua",
    "utils/ropes/client/*.lua",
    "utils/callbacks/client/*.lua",
    "utils/*.lua",
    "utils/anim/*.lua",
    "utils/target/*.lua",

    "client/scaleform_render/*.lua",

    "client/permission.lua",
    "client/blipCreation.lua",
    "client/creationNPC.lua",
    "client/debug.lua",
    "client/events.lua",
    "client/fetchIdentifier.lua",
    "client/main.lua",
    "client/objectCreator.lua",
    "client/playerSkin.lua",
    "client/jerryCan.lua",
    "client/payment.lua",

    "client/bridge.lua",

    "client/company/*.lua",
    "client/menu/*.lua",
    "client/fuel/*.lua",
    "client/fuel_pump/*.lua",
    "client/player_job/*.lua",
    "client/shop/*.lua",

    "client/fuel_mission/main.lua",
    "client/fuel_mission/propSpawner.lua",
    "client/fuel_mission/acceptMenu.lua",
    "client/fuel_mission/barrelStuff.lua",
    "client/fuel_mission/taxi.lua",

    "client/fuel_mission/pickupPhantom.lua",
    "client/fuel_mission/spawnTipTruck.lua",

    "utils/MenuAPI/exports/*.lua",
    "utils/MenuAPI/system/*.lua",
    "utils/MenuAPI/module/*.lua",
    "utils/MenuAPI/*.lua",

    "client/editor/**/client/*.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",

    "utils/callbacks/server/*.lua",
    "utils/ropes/server/*.lua",

    "server/framework/init.lua",
    "server/framework/qbcore.lua",
    "server/framework/standalone.lua",

    "server/framework/inventory/*.lua",

    "server/*.lua",
    "server/society/*.lua",
    "server/society/drivers/*.lua",
    "server/company/*.lua",
    "server/fuel_pump/*.lua",
    "server/mission/*.lua",
    "server/player_job/*.lua",
    "server/shop/*.lua",

    "client/editor/**/server/*.lua",
}

shared_scripts {
    "const.lua",
    "config.lua",
    "config_vehiclekeys.lua",
    "config/shop_config.lua",
    "config/fuel_config.lua",
    "config/itemshop_config.lua",
    "config/player_job_config.lua",
    "config/dispenser_config.lua",

    "keyToString.lua",
    "defaultLocales.lua",

    "langClass.lua",
    "locales/*.lua",
    "config/mission_config.lua",

    "debug.lua",
    "object.lua",
    "shared/*.lua",
    "utils/ropes/*.lua",
}

escrow_ignore {
    "stream/*.*",
    "shared/*.lua",
    "config.lua",
    "config/*.lua",
    "config_vehiclekeys.lua",
    "dispenserData.lua",
    'const.lua',
    "debug.lua",
    "object.lua",
    "client/events.lua",

    "utils/blip.lua",
    "utils/jobChecker.lua",
    "utils/markers.lua",
    "utils/missionUtils.lua",
    "utils/notifications.lua",
    "utils/objectUtils.lua",
    "utils/pedUtils.lua",

    "server/framework/inventory/*.lua",

    "client/fuel_pump/events.lua",

    "langClass.lua",
    "locales/*.lua",
    "config/mission_config.lua",

    "utils/callbacks/server/*.lua",
    "server/framework/*.lua",

    "server/*.lua",
    "server/society/*.lua",
    "server/society/drivers/*.lua",
    "server/company/*.lua",
    "server/fuel_pump/pricing.lua",
    "server/mission/*.lua",
    "server/player_job/*.lua",

    "utils/MenuAPI/exports/*.lua",
    "utils/MenuAPI/system/*.lua",
    "utils/MenuAPI/module/*.lua",
    "utils/MenuAPI/*.lua",

    "client/menu/*.lua",

    "client/payment.lua",
    "client/permission.lua",
    "client/blipCreation.lua",
    "client/creationNPC.lua",
    "client/fetchIdentifier.lua",
    "client/player_job/*.lua",
    "client/objectCreator.lua",
}

-- this is providing only exports/events I could find for client side
-- it doesnt provide rest.
provide {
    "LegacyFuel",
    "ps-fuel",
    "cdn-fuel",
    "ox_fuel",
}

dependencies {
    "rcore_fuel_assets",
}

ui_page "html/GameUI/index.html"

files {
    "*.json",
    "html/*.html",
    "html/**/*.mp3",
    "html/**/*.html",
    "html/**/*.js",
    "html/**/*.png",
    "html/GameUI/img/*.*",
    "html/**/css/*.css",
    "html/**/scripts/*.js",

    "html/GameUI/MenuAPI/*.*",
}
dependency '/assetpacks'