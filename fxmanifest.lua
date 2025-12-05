fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'MikiToast'
description 'Customizable drug system'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
    'locales/*.lua'
}

client_scripts {
    'client/main.lua',
    'client/pack.lua'
}

server_scripts {
    'server/main.lua'
}

