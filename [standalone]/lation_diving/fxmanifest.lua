fx_version 'cerulean'
lua54 'yes'
game 'gta5'
name 'lation_diving'
author 'iamlation'
version '2.1.0'
description 'An advanced scuba diving resource for FiveM'

client_scripts {
    'config/client.lua',
    'bridge/client.lua',
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'config/server.lua',
    'bridge/server.lua',
    'server/*.lua',
}

shared_scripts {
    'config/shared.lua',
    'config/icons.lua',
    '@ox_lib/init.lua'
}

files {
    'locales/*.json'
}

dependencies {
    'oxmysql',
	'ox_lib'
}

ox_libs {
    'locale',
    'math'
}

escrow_ignore {
    'config/*.lua',
    'locales/*.json',
    'bridge/*.lua',
    'client/functions.lua',
    'server/functions.lua'
}
dependency '/assetpacks'