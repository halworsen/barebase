-- Utility functions

ggt.util = {}

function ggt.util.get_spawns()
	local spawns = {
		[1] = {},
		[2] = {},
		[TEAM_SPECTATOR] = {}
	}

	for k,v in pairs(ents.FindByClass("info_player_terrorist")) do
		spawns[1][k] = v
	end

	for k,v in pairs(ents.FindByClass("info_player_counterterrorist")) do
		spawns[2][k] = v
	end

	for k,v in pairs(ents.FindByClass("info_player_start")) do
		spawns[TEAM_SPECTATOR][k] = v
	end

	return spawns
end