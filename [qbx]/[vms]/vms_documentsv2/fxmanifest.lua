fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vames™️'
description 'vms_documentsv2'
version '1.0.5'

shared_scripts {
	'config/config.lua',
	'config/config.translation.lua',
}

client_scripts {
	'config/config.client.lua',
	
	'client/lib.lua',
	'client/functions.lua',
	'client/main.lua',
	'client/nui.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',

	'config/config.server.lua',
	
	'server/modules/ssn.lua',
	'server/lib.lua',
	'server/main.lua',
}

ui_page 'html/ui.html'

files {
	'html/*.*',
	'html/**/*.*',
	'config/*.js',
	'config/translation.json',
}

escrow_ignore {
	'config/*.lua',
	'server/modules/ssn.lua',
	'server/version_check.lua',
}
dependency '/assetpacks'