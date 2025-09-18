fx_version 'adamant'
games { 'gta5' }

client_scripts {
	"config.lua",
	"shared.lua",
	"locales/*.lua",

	"client/menu/system/*.lua",
	"client/menu/*.lua",
	"client/menu/module/*.lua",
	"client/menu/exports/*.lua",

	"client/framework/esx.lua",
	"client/framework/qbcore.lua",
	"client/framework/standalone.lua",
	"client/markers.lua",
	"client/client.lua",
}

server_scripts {
	"config.lua",
	"shared.lua",
	"locales/*.lua",

	"server/framework/qbcore.lua",
	"server/framework/standalone.lua",
	"server/server.lua",
}

files {
	"html/*.html",
	"html/scripts/*.js",
	"html/img/*.*",
	"html/css/*.css",
}

escrow_ignore {
	"*.lua",
	"**/*.lua",
}

lua54 "yes"

ui_page "html/index.html"
dependency '/assetpacks'