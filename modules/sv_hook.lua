function GM:PlayerInitialSpawn(ply)
	ply:KillSilent()
	ply:SetTeam(TEAM_SPECTATOR)

	ply:ConCommand("bb_pick_team")
end

function GM:PlayerSpawn(ply)
	if ply:Team() == TEAM_SPECTATOR	then return end

	local team_table = ggt.config.teams[ply:Team()]
	local playermodel = table.Random(team_table.models)

	ply:SetModel(playermodel)
end

function GM:PlayerSelectSpawn(ply)
	return table.Random(ggt.util.get_spawns()[ply:Team()])
end

function GM:ShowHelp(ply)
	ply:ConCommand("bb_pick_team")
end

function GM:PlayerDeathThink(ply)
	if ply:Team() == TEAM_SPECTATOR then return false end
	if not ply.respawn_time then return end

	if CurTime() >= ply.respawn_time and ply:KeyDown(IN_ATTACK) then
		ply:Spawn()
		return true
	end

	return false
end