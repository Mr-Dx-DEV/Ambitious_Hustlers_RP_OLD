fx_version 'adamant'
games { 'gta5' }

client_scripts {
	"config.lua",
	"shared.lua",
	"locales/*.lua",
	"client/*.lua",
}

server_scripts {
	"config.lua",
	"shared.lua",
	"locales/*.lua",
	"server/framework/*.lua",
	"server/server.lua",
}

escrow_ignore {
	"*.lua",
	"**/*.lua",
}

lua54 "yes"
dependency '/assetpacks'