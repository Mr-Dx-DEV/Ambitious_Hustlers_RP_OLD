fx_version 'cerulean'
author 'marcinhu#0001'
Description 'm-Fishing V2'
game 'gta5'

data_file 'DLC_ITYP_REQUEST' 'stream/m-fishing.ytyp'

files {
    'stream/m-fishing.ytyp',
    'stream/prop_m_coral_01.ydr',
    'stream/prop_m_coral_02.ydr',
    'stream/prop_m_coral_03.ydr',
    'stream/prop_m_coral_04.ydr',
    'stream/prop_m_coral_05.ydr',
    'stream/prop_m_coral_06.ydr',
    'stream/prop_m_fishing_net_01.ydr',
    'stream/prop_m_fishing_net_02.ydr',
    'stream/prop_m_fishing_net_03.ydr',
    'stream/prop_m_fishing_net_04.ydr',
    'stream/prop_m_fishing_net_05.ydr',
    'stream/prop_m_fishingrod_1.ydr',
    'stream/prop_m_fishingrod_2.ydr',
    'stream/prop_m_fishingrod_3.ydr',
    'stream/prop_m_fishingrod_4.ydr',
    'stream/prop_m_fishingrod_5.ydr',
    'stream/prop_m_shell_01.ydr',
    'stream/prop_m_shell_02.ydr',
}

shared_scripts {
    "@ox_lib/init.lua",
    "config/**",
    "server/s_utils.lua",
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    "server/**.lua",
}

client_script {
    "client/**.lua",
}

escrow_ignore {
    "client/c_utils.lua",
    "server/s_utils.lua",
    "config/**",
    "README.lua",
    "SQL.sql",
}

lua54 'yes'
dependency '/assetpacks'

dependency '/assetpacks'