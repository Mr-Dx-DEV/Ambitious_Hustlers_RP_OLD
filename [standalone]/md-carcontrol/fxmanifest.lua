fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Midnight Developments'
description 'Simple, aestethic vehicle menu script focused on quick access and ease of use'
version '2.0.0'

escrow_ignore {
    'shared/*.lua',
	'config.lua'
}

shared_scripts {
	'config.lua',
}

ui_page 'html/index.html'

server_scripts {
	'server/*.lua'
}

client_scripts {
	'shared/client-functions.lua',
	'client/*.lua',
}

files {	
	'html/**/*'
}
dependency '/assetpacks'