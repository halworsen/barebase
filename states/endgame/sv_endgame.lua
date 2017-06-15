local state = "endgame"

local map_change = 0

local function endgame_entered()
	map_change = CurTime() + ggt.config.map_change_interval

	local cvar = GetConVar("bb_map_index")
	local maps = #ggt.config.maps
	local new_map = 0

	if ggt.config.random_map then
		local current_map = cvar:GetInt()
		new_map = math.random(1, maps)

		while new_map == current_map do
			new_map = math.random(1, maps)
		end
	else
		new_map = cvar:GetInt() + 1
		if new_map > maps then
			new_map = 1
		end
	end

	cvar:SetInt(new_map)

	for k,v in pairs(player.GetAll()) do
		v:ChatPrint("Map is changing to "..ggt.config.maps[cvar:GetInt()].." in "..ggt.config.map_change_interval.." seconds!")
	end
end
hook.Add("StateEnter_endgame", state, endgame_entered)

local function Think(gm)
	-- map rotation
	if CurTime() >= map_change then
		RunConsoleCommand("changelevel", ggt.config.maps[GetConVar("bb_map_index"):GetInt()])
	end
end
states.add_state_hook(state, "Think", Think)