AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("states/states.lua")
AddCSLuaFile("config.lua")
AddCSLuaFile("util.lua")

AddCSLuaFile("modules/sh_hook.lua")
AddCSLuaFile("modules/cl_hook.lua")

AddCSLuaFile("vgui/scoreboard.lua")
AddCSLuaFile("vgui/team_pick.lua")

include("shared.lua")
include("modules/sv_hook.lua")

states.switch_state("pregame")

CreateConVar("bb_map_index", 1, {FCVAR_ARCHIVE, FCVAR_PROTECTED})

concommand.Add("bb_switch_team", function(ply, cmd, args)
	args[1] = math.Round(args[1])
	if not ggt.config.teams[args[1]] then return end
	if ply:Team() == args[1] then
		ply.pending_team = nil

		return
	end

	local desired_team = args[1]
	local other_team = desired_team == 1 and 2 or 1

	if #team.GetPlayers(desired_team) > #team.GetPlayers(other_team) then
		ply:ChatPrint("This team is full!")

		return
	end

	if ply:Team() == TEAM_SPECTATOR then
		ply:SetTeam(args[1])
		ply:Spawn()

		return
	end

	ply:KillSilent()
	ply:SetTeam(args[1])
end)
