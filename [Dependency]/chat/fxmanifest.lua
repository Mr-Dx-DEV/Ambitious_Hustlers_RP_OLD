fx_version 'adamant'
games { 'rdr3', 'gta5' }
author 'Assert Gaming'
version '1.0.2'
ui_page 'html/index.html'
client_script {
  'client/main.lua'
}
server_script {
  'server/main.lua'
}
shared_script {
  'config.lua'
}
files {
    'html/index.html',
    'html/css/style.css',
    'html/js/config.default.js',
    'html/js/App.js',
    'html/js/Message.js',
    'html/js/Suggestions.js',
    'html/vendor/vue.2.3.3.min.js',
    'html/vendor/flexboxgrid.6.3.1.min.css',
    'html/vendor/animate.3.5.2.min.css',
    'html/vendor/latofonts.css',
    'html/vendor/fonts/LatoRegular.woff2',
    'html/vendor/fonts/LatoRegular2.woff2',
    'html/vendor/fonts/LatoLight2.woff2',
    'html/vendor/fonts/LatoLight.woff2',
    'html/vendor/fonts/LatoBold.woff2',
    'html/vendor/fonts/LatoBold2.woff2',
  }
escrow_ignore {
    'config.lua'
}
lua54 'yes'
dependency '/assetpacks'