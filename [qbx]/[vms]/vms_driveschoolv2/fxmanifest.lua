fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vames™️'
description 'vms_driveschoolv2'
version '1.1.2'

shared_scripts {
	'config/config.lua',
	'config/config.translation.lua',
}

client_scripts {
	'config/config.client.lua',
	'client/*.lua',
}

server_scripts {
	'config/config.server.lua',
	'server/*.lua',
}

ui_page 'html/index.html'

files {
	'data/vehicles.meta',
    'data/handling.meta',
	'html/*.*',
	'html/**/*.*',
	'config/*.js',
	'config/*.json',
}

data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'

escrow_ignore {
	'config/*.lua',
	'server/version_check.lua',
}
dependency '/assetpacks'