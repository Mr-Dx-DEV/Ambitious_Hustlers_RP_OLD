fx_version 'cerulean'
game 'gta5'

description 'Evidence System'
version '1.2.4'
author 'Snipe'

lua54 'yes'

ui_page 'html/index.html'

files {
	'html/**/*',
    'html-dui/**/*',
}


shared_scripts{
    '@ox_lib/init.lua',
    'shared/**/*.lua',
}

client_scripts{
    'client/**/**/',
} 

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'server/open/**/**',
    'server/encrypted/*.lua',
}

escrow_ignore{
    'client/open/**/*',
    'server/open/**/*',
    'shared/*'
}

dependency '/assetpacks'