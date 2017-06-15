surface.CreateFont("BBTeamPick", {font = "Default", size = 18, weight = 700, shadow = true})

local PANEL = {}

function PANEL:Init()
	self:SetSize(600, 300)
	self:Center()
	self:SetTitle("")
	self:ShowCloseButton(false)
	self:SetDraggable(false)

	self:DockPadding(10, 10, 10, 10)

	self:Populate()
end

function PANEL:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 120))
end

function PANEL:Populate()
	for k,v in pairs(ggt.config.teams) do
		local team_button = vgui.Create("DButton", self)
		team_button:SetText("")
		local width = self:GetWide() / 2 - 15
		team_button:SetWide(width)
		team_button:Dock(1+k) -- first team is left, second is right

		team_button.Paint = function(self, w, h)
			surface.SetDrawColor(v.color.r, v.color.g, v.color.b, 120)
			surface.DrawRect(0, 0, w, h)

			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawOutlinedRect(0, 0, w, h)

			draw.SimpleTextOutlined(v.name, "BBTeamPick", w/2, h/2 - 10, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 255))
			local players = #team.GetPlayers(k)
			draw.SimpleTextOutlined(players..(players == 1 and " player" or " players"), "BBTeamPick", w/2, h/2 + 10, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0, 255))
		end

		team_button.DoClick = function()
			RunConsoleCommand("bb_switch_team", k)
			self:Remove()
		end
	end
end

vgui.Register("BBTeamPick", PANEL, "DFrame")