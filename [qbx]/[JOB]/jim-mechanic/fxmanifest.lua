name "Jim-Mechanic"
author "Jimathy"
version "3.6.13"
description "Advanced Mechanic Script"
fx_version "cerulean"
game "gta5"
lua54 'yes'

server_script '@oxmysql/lib/MySQL.lua'

shared_scripts {
	'locales/*.lua',
	'configs/*.lua',
    'locations/*.lua',

    --Jim Bridge - https://github.com/jimathy/jim_bridge
    '@jim_bridge/starter.lua',

	'shared/*.lua',
}
client_scripts {
    'client/*.lua',
    'modules/**/**.lua',
}

server_script 'server/*.lua'

files {
    'html/**',
    'html/img/**',
    'html/snd/**',
    "data/carcols_gen9.meta",
    "data/carmodcols_gen9.meta",
    'stream/*.ytyp'
}

ui_page 'html/index.html'
data_file "CARCOLS_GEN9_FILE" "data/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "data/carmodcols_gen9.meta"
data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'

escrow_ignore {
    'locations/*.lua',
	'*.lua',
	'client/*.lua',
    'configs/*.lua',
	'locales/*.lua',
	'modules/*.lua',
	'modules/**/**.lua',
	'server/adminCustoms.lua',
	'server/functionserver.lua',
    'server/main.lua',
    'server/commands.lua',
    'server/usableItems.lua',
    'shared/helpers.lua',
    'shared/helpersServer.lua',
    'shared/recipes.lua',
    'shared/platechange.lua',
	'html/*.lua',
    'html/*.css',
    'html/*.html',
    'html/*.js',
}

dependency 'jim_bridge'
dependency '/assetpacks'