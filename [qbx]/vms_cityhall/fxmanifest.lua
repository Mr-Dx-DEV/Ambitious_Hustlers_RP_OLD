fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'vames™️'
description 'vms_cityhall'
version '1.0.8'

data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_prop_payment_terminal.ytyp' -- https://forum.cfx.re/t/free-prop-payment-terminal

shared_scripts {
	'config/config.lua',
	'config/config.taxes.lua',
	'config/config.clerks.lua',
	'config/config.shared.lua',
	'config/config.translation.lua',
}

client_scripts {
	'config/config.client.lua',
	
	'client/lib.lua',
	'client/functions.lua',
	'client/main.lua',
	'client/nui.lua',
	'client/modules/*.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',

	'config/config.server.lua',
	
	'server/lib.lua',
	'server/main.lua',
	'server/modules/*.lua',
	'server/version_check.lua',
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
	'server/modules/*.lua',
	'server/version_check.lua',
	'stream/bzzz_prop_payment_terminal.ytyp',
	'stream/bzzz_prop_payment_terminal.ydr',
}
dependency '/assetpacks'