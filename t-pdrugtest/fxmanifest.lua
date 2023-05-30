fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description "Police drug test for player"
version '1.0'
author 'taala#0149, made by taala'

client_scripts {
    'cl_pdrug.lua'
}

server_scripts  {
    'sv_pdrug.lua'
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}