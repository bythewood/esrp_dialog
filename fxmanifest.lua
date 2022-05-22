author 'OfficiallyM-'
description 'VORP dialog script'
version '1.0.0'

fx_version "adamant"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

client_scripts {
  'client/main.lua',
  'html/ui.html',
  'html/style.css',
  'html/crock.ttf'
}

server_scripts {
  'server/dialog.lua',
  'server/main.lua',
}

shared_scripts {
  'config.lua'
}

files{
  'html/ui.html',
  'html/style.css',
  'html/crock.ttf',
}

ui_page 'html/ui.html'
