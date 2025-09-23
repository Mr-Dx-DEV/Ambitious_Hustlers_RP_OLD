author 'Envi-Scripts'
fx_version 'cerulean'

game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

version '3.0.3'

client_scripts {
    'client/*.lua',
}
shared_scripts {
    '@envi-bridge/bridge.lua',
    'shared/config.lua',
    'shared/*.lua',
}

server_scripts {
    'server/*.lua',
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/app.js'
}

escrow_ignore {
    'shared/*.lua',
    'client/client_open.lua',
    'server/server_open.lua',
    'server/insurance.lua',
    'server/insurance_broker.lua',
    'client/insurance.lua',
    'client/insurance_broker.lua',
}

dependencies {
    'envi-bridge',
}

bridge 'envi-bridge'
dependency '/assetpacks'