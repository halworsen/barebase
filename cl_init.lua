include("vgui/scoreboard.lua")
include("vgui/team_pick.lua")

include("shared.lua")
include("modules/cl_hook.lua")

concommand.Add("bb_pick_team", function()
	if IsValid(ggt.team_picker) then
		ggt.team_picker:Remove()
	end

	ggt.team_picker = vgui.Create("BBTeamPick")
	ggt.team_picker:MakePopup()
end)
