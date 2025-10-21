
fx_version "cerulean"
game "gta5"
author "Malizniak - 17Movement"
lua54 "yes"
version "4.0.5"
this_is_a_map 'yes'

shared_scripts {
    "shared/locale.lua",
    "locale/*.lua",
    "Config.lua",
    "shared/core.lua",
}

server_scripts {
    "server/core.lua",
    "server/functions.lua",
    "server/server.lua",
}

client_scripts {
    "client/core.lua",
    "client/functions.lua",
    "client/target.lua",
    "client/client.lua",
}

ui_page "web/driver.html"
files {
    "web/**/*.**",
    "web/*.**",
}

escrow_ignore {
    "Config.lua",
    "client/target.lua",
    "client/functions.lua",
    "server/functions.lua",
    "stream/*.**",
    "locale/*.**",
}

data_file 'DLC_ITYP_REQUEST' 'stream/ytyp/17mov_garbage_job_ytyp.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ytyp/17mov_garbage_interior_ytyp.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ytyp/v_bins.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ytyp/v_rubbish.ytyp'
dependency '/assetpacks'
