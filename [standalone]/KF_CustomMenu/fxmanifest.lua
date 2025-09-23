fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'KFDev <info.kfdev@gmail.it>'
version '1.4'
url 'https://docs.kfdev.it'
description 'KF_CustomMenu allow you to customize the GTA native ESCAPE menu'

client_scripts {
    'client.lua'
}

shared_script {
    'config.lua'
}

escrow_ignore {
    'config.lua'
}
dependency '/assetpacks'