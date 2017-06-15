-- Gamemode config

ggt.config = {}

local config = ggt.config

-- shared config

-- Maps that are in the map rotation
config.random_map = false
config.map_change_interval = 10
config.maps = {
	"cs_assault",
	"de_port",
	"cs_militia",
	"de_cbble",
	"de_nuke",
	"de_inferno"
}

-- respawn time is 10 times shorter in pregame/warmup
config.respawn_time = 10
config.required_players = 4

-- All the teams and their colors
-- >2 teams requires heavy modifications
config.teams = {
	[1] = {
		name = "Good Guys",
		color = Color(255, 255, 255),
		models = {
			"models/player/group03/male_01.mdl",
			"models/player/group03/male_02.mdl",
			"models/player/group03/male_03.mdl",
			"models/player/group03/male_04.mdl",
			"models/player/group03/male_05.mdl",
			"models/player/group03/male_06.mdl",
			"models/player/group03/male_07.mdl",
			"models/player/group03/male_08.mdl",
			"models/player/group03/male_09.mdl"
		}
	},
	[2] = {
		name = "Bad Guys",
		color = Color(0, 0, 0),
		models = {
			"models/player/police.mdl"
		}
	}
}

-- serverside config
if SERVER then
	
end

-- clientside config
if CLIENT then
	
end
