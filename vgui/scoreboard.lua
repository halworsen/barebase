surface.CreateFont("BBScoreboardName", {font = "Default", size = 64, weight = 700, shadow = true})
surface.CreateFont("BBScoreboardTeamName", {font = "Default", size = 32, weight = 700, shadow = true})
surface.CreateFont("BBScoreboardSmall", {font = "Default", size = 18, weight = 700, shadow = true})

local PANEL = {}

function PANEL:Init()
	self:SetTall(40)

	self:DockPadding(4, 4, 4, 4)
end

function PANEL:Paint(w, h)
	if not self.player then return end

	surface.SetDrawColor(0, 0, 0, 120)
	surface.DrawRect(0, 0, w, h)

	surface.SetDrawColor(255, 255, 255, 255)
	surface.DrawOutlinedRect(0, 0, w, h)
end

function PANEL:SetPlayer(ply)
	self.player = ply

	self:Populate()
end

function PANEL:Populate()
	local avatar = vgui.Create("AvatarImage", self)
	avatar:SetSize(32, 32)
	avatar:SetPlayer(self.player, 32)
	avatar:Dock(LEFT)
	avatar:DockMargin(0, 0, 10, 0)

	local name = vgui.Create("DLabel", self)
	name:SetText("")
	name:SetWide(100)
	name:Dock(LEFT)
	name.Paint = function(s, w, h)
		draw.SimpleTextOutlined(self.player:Name(), "BBScoreboardSmall", 1, h / 2, Color(255, 255, 255, 255), 0, 1, 1, Color(0, 0, 0, 255))
	end

	local ping = vgui.Create("DLabel", self)
	ping:SetWide(25)
	ping:SetText("")
	ping:Dock(RIGHT)
	ping.text = self.player:Ping()
	ping.Paint = function(s, w, h)
		draw.SimpleTextOutlined(s.text, "BBScoreboardSmall", 0, h / 2, Color(255, 255, 255, 255), 0, 1, 1, Color(0, 0, 0, 255))
	end
	ping.Think = function() ping.text = self.player:Ping() end
end

vgui.Register("BBScoreboardPlayerEntry", PANEL, "DPanel")


PANEL = {}

function PANEL:Init()
	self:SetSize(ScrW(), ScrH())

	self:DockPadding(ScrW() / 5, ScrH() / 10, ScrW() / 5, ScrH() / 10)

	self:Populate()
end

function PANEL:Paint()
	return
end

function PANEL:Populate()
	local effective_width = ScrW() - (ScrW() / 5) * 2

	local scoreboard_container = vgui.Create("DPanel", self)
	scoreboard_container:SetWide(effective_width)
	scoreboard_container:Dock(FILL)
	scoreboard_container.Paint = function() end

	local gm_title = vgui.Create("DLabel", scoreboard_container)
	gm_title:SetFont("BBScoreboardName")
	gm_title:SetText("")
	gm_title:SetTall(74)
	gm_title:Dock(TOP)
	gm_title:DockMargin(0, 0, 0, 10)
	gm_title.Paint = function(self, w, h)
		draw.SimpleTextOutlined(GAMEMODE.Name, "BBScoreboardName", w / 2, h / 2, Color(255, 255, 255, 255), 1, 1, 1, Color(0, 0, 0, 255))
	end

	local teams_container = vgui.Create("DPanel", scoreboard_container)
	teams_container:Dock(FILL)
	teams_container.Paint = function() end

	-- first team
	if #team.GetPlayers(1) > 0 then
		local titles1_panel = vgui.Create("DPanel", teams_container)
		titles1_panel:SetTall(42)
		titles1_panel:Dock(TOP)
		titles1_panel:DockMargin(0, 0, 0, 10)
		titles1_panel:DockPadding(0, 0, -8, 0)
		titles1_panel.Paint = function() end

		local team1_title = vgui.Create("DLabel", titles1_panel)
		team1_title:SetText("")
		team1_title:SetWide(effective_width)
		team1_title:Dock(LEFT)
		team1_title.Paint = function(self, w, h)
			draw.SimpleTextOutlined(team.GetName(1).." - "..team.GetScore(1), "BBScoreboardTeamName", 4, h / 2, Color(255, 255, 255, 255), 0, 1, 1, Color(0, 0, 0, 255))
		end

		local team1_ping = vgui.Create("DLabel", titles1_panel)
		team1_ping:SetText("")
		team1_ping:Dock(RIGHT)
		team1_ping.Paint = function(self, w, h)
			draw.SimpleTextOutlined("Ping", "BBScoreboardSmall", w / 2, h / 2, Color(255, 255, 255, 255), 1, 1, 1, Color(0, 0, 0, 255))
		end

		local team1_container = vgui.Create("DPanel", teams_container)
		team1_container:SetWide(effective_width / 2 - 50)
		team1_container:Dock(TOP)
		team1_container:DockMargin(0, 0, 0, 20)
		team1_container.Paint = function() end

		for k,v in pairs(team.GetPlayers(1)) do
			entry = vgui.Create("BBScoreboardPlayerEntry", team1_container)
			entry:SetPlayer(v)
			entry:Dock(TOP)
			entry:DockMargin(0, 0, 0, 5)
		end

		team1_container:InvalidateLayout(true)
		team1_container:SizeToChildren(true, true)
	end

	-- second team
	if #team.GetPlayers(2) > 0 then
		local titles2_panel = vgui.Create("DPanel", teams_container)
		titles2_panel:SetTall(42)
		titles2_panel:Dock(TOP)
		titles2_panel:DockMargin(0, 0, 0, 10)
		titles2_panel:DockPadding(0, 0, -8, 0)
		titles2_panel.Paint = function() end

		local team2_title = vgui.Create("DLabel", titles2_panel)
		team2_title:SetText("")
		team2_title:SetWide(effective_width)
		team2_title:SetTall(42)
		team2_title:DockMargin(0, 0, 0, 10)
		team2_title:Dock(LEFT)
		team2_title.Paint = function(self, w, h)
			draw.SimpleTextOutlined(team.GetName(2).." - "..team.GetScore(2), "BBScoreboardTeamName", 4, h / 2, Color(255, 255, 255, 255), 0, 1, 1, Color(0, 0, 0, 255))
		end

		local team2_ping = vgui.Create("DLabel", titles2_panel)
		team2_ping:SetText("")
		team2_ping:Dock(RIGHT)
		team2_ping.Paint = function(self, w, h)
			draw.SimpleTextOutlined("Ping", "BBScoreboardSmall", w / 2, h / 2, Color(255, 255, 255, 255), 1, 1, 1, Color(0, 0, 0, 255))
		end

		local team2_container = vgui.Create("DPanel", teams_container)
		team2_container:SetWide(effective_width / 2 - 50)
		team2_container:Dock(TOP)
		team2_container:DockMargin(0, 0, 0, 20)
		team2_container.Paint = function() end

		for k,v in pairs(team.GetPlayers(2)) do
			entry = vgui.Create("BBScoreboardPlayerEntry", team2_container)
			entry:SetPlayer(v)
			entry:Dock(TOP)
			entry:DockMargin(0, 0, 0, 5)
		end

		team2_container:InvalidateLayout(true)
		team2_container:SizeToChildren(true, true)
	end
end

vgui.Register("BBScoreboard", PANEL, "DPanel")