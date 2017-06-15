local state = "pregame"

local function PlayerDeath(gm, ply, killer, attacker)
	if ply:Team() == TEAM_SPECTATOR then return end

	ply.respawn_time = CurTime() + ggt.config.respawn_time
end
states.add_state_hook(state, "PlayerDeath", PlayerDeath)

local function PlayerSilentDeath(gm, ply)
	if ply:Team() == TEAM_SPECTATOR then return end

	ply.respawn_time = CurTime() + ggt.config.respawn_time
end
states.add_state_hook(state, "PlayerSilentDeath", PlayerSilentDeath)