local state = "pregame"

ggt.start_time = 0

local function Think(gm)
	if ggt.start_time == 0 then
		local players = team.NumPlayers(1) + team.NumPlayers(2)

		if players >= ggt.config.required_players then
			ggt.start_time = CurTime() + 10
		end

		return
	end

	if SERVER and CurTime() >= ggt.start_time then
		states.switch_state("playing")
	end
end
states.add_state_hook(state, "Think", Think)