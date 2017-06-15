GM.Name = "BareBase"
GM.Author = "Atebite"
GM.Email = "N/A"
GM.Website = "N/A"

-- global gamemode table
ggt = ggt or {}

include("config.lua")
include("util.lua")

include("modules/sh_hook.lua")

include("states/states.lua")
states.init()