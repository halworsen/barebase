local state = "pregame"

local function HUDPaint(gm)
	local players = team.NumPlayers(1) + team.NumPlayers(2)

	surface.SetFont("BB_32")

	if ggt.start_time ~= 0 and CurTime() >= ggt.start_time then
		local time_to_start = math.ceil(ggt.start_time - CurTime())
		local wide, tall = surface.GetTextSize("Starting in "..time_to_start)

		draw.RoundedBox(0, 0, 47, wide + 20, tall + 16, Color(0, 0, 0, 120))

		draw.SimpleTextOutlined("Starting in "..time_to_start, "BB_32", 10, 50, Color(255, 255, 255), 0, 0, 1, Color(0, 0, 0))
	else
		local wide, tall = surface.GetTextSize("Waiting for players")

		draw.RoundedBox(0, 0, 47, wide + 20, tall * 2 + 16, Color(0, 0, 0, 120))

		draw.SimpleTextOutlined("Waiting for players", "BB_32", 10, 50, Color(255, 255, 255), 0, 0, 1, Color(0, 0, 0))
		draw.SimpleTextOutlined(players.." / "..ggt.config.required_players, "BB_32", 10, 50 + 38, Color(255, 255, 255), 0, 0, 1, Color(0, 0, 0))
	end
end
states.add_state_hook(state, "HUDPaint", HUDPaint)