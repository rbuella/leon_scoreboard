fx_version 'adamant'

game 'gta5'
description 'Leon Maximus HomeScoreboard'
version '1.0'
lua54 'yes'

server_script 'server/main.lua'
client_script 'client/*.lua'

ui_page 'html/index.html'

files {
	'html/*'
}

escrow_ignore {
  "html/*",
  "server/*",
}

 
dependency '/assetpacks'
