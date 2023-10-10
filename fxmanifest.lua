fx_version 'bodacious'
author 'Brown Development'
desfription 'ESX Status Effects - Originally made for True Story RP V4'
game 'gta5'
lua54 'yes'
client_scripts {
    'code/client.lua',
    'configurable/notify.lua',
    'data/data_process_cl.lua',
    'data/data_update_cl.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'code/server.lua',
    'data/new_entry_sv.lua',
    'data/data_process_sv.lua'
}
shared_scripts {
    '@ox_lib/init.lua',
    'configurable/config.lua'
}
files {
    'html/*.html',
    'html/audio/*.ogg'
}
ui_page 'html/index.html'
escrow_ignore {
    'configurable/*.lua'
}
dependencies {
    'oxmysql',
    'esx_status'
}