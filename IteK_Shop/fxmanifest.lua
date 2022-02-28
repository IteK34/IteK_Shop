fx_version 'adamant'
game 'gta5'

author "IteK#0905"
description "Shop System"
version "1.0.0"

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
    "client/client.lua",
    "config.lua"
}

server_scripts {
    "server/server.lua"
}
