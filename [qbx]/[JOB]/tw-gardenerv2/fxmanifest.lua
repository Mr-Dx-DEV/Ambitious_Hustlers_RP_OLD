fx_version 'cerulean'
game 'gta5'
version '1.11'
author 'tworst-script'

shared_scripts {
	--'@ox_lib/init.lua',
	'locales/*.lua',
	'config/*.lua',
}

client_scripts {
	'locales/*.lua',
	'client/*.lua',
	'client/interaction/textures.lua',
	'client/interaction/interacts.lua',
	'client/interaction/raycast.lua',
}
server_scripts {
	-- '@mysql-async/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'mysql-async'.:warning:
	'@oxmysql/lib/MySQL.lua', --:warning:PLEASE READ:warning:; Uncomment this line if you use 'oxmysql'.:warning:
	'server/sqlinsert.lua',
	'server/*.lua',
	'locales/*.lua',
}

ui_page "html/index.html"
files {
	'client/interaction/interactions.lua',
	'client/interaction/utils.lua',
	'client/interaction/entities.lua',
	"html/**/*.**",
    "html/*.**",
}

escrow_ignore {
	'config/*.lua',
	'locales/*.lua',
	'client/utility.lua',
	'client/interaction/*.lua',
	'server/utility.lua',
	'server/editable.lua',
	'server/sqlinsert.lua',
	--'client/main.lua',
	--'server/server.lua',
}

lua54 'yes'
dependency '/assetpacks'