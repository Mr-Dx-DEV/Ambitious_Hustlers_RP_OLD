fx_version "cerulean"
version "1.0.31"
game "gta5"
author "17Movement"
lua54 'yes'

shared_scripts {
    "shared/locale.lua",
    "locale/*.lua",
    "Config.lua",
    "shared/core.lua",
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "installation/installer.lua",
    "server/functions.lua",
    "server/core.lua",
    "server/server.lua",
    "server/devtool.lua",
}

client_scripts {
    "client/target.lua",
    "client/functions.lua",
    "client/core.lua",
    "client/client.lua",
    "client/devtool.lua",
}

ui_page "web/index.html"
files {
    "web/index.html",
    "web/assets/**/*.*",
    "stream/data/weaponarchetypes.meta",
    "stream/data/weaponanimations.meta",
    "stream/data/weaponnozzle.meta",
}

data_file "DLC_ITYP_REQUEST" "stream/17mov_carwash_ytyp.ytyp"
data_file "WEAPON_METADATA_FILE" "stream/data/weaponarchetypes.meta"
data_file "WEAPON_ANIMATIONS_FILE" "stream/data/weaponanimations.meta"
data_file "WEAPONINFO_FILE" "stream/data/weaponnozzle.meta"

escrow_ignore {
    "Config.lua",
    "locale/**.*",
    "stream/ydr/open/**.ydr",
    "client/functions.lua",
    "server/functions.lua",
    "client/target.lua",
}
dependency '/assetpacks'