name "Jim-CatCafe"
author "Jimathy"
version "2.1.08"
description "CatCafe Job Script - Props by idRP - ZenKat"
fx_version "cerulean"
game "gta5"
lua54 'yes'

server_script '@oxmysql/lib/MySQL.lua'

shared_scripts {
    'locales/*.lua*',
    'config.lua',
    'shared/*.lua',
    'consumables/*.lua',
    'locations/*.lua',

    --Jim Bridge - https://github.com/jimathy/jim_bridge
    '@jim_bridge/starter.lua',
}

client_scripts {
    'client/*.lua',
}

server_script 'server/*.lua'

escrow_ignore {
    '*.lua',
    'client/client.lua',
    'client/cats.lua',
    'client/functions.lua',
    'consumables/*.lua',
    'locales/*.lua',
    'locations/*.lua',
    'server/itemcontrol.lua',
    'shared/*.lua',
}

dependency 'jim_bridge' -- https://github.com/jimathy/jim_bridge

file 'stream/**.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/**.ytyp'
dependency '/assetpacks'