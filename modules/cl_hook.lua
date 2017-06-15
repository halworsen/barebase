surface.CreateFont("BB_64", {font = "Default", size = 64, weight = 700, shadow = true})
surface.CreateFont("BB_32", {font = "Default", size = 32, weight = 700, shadow = true})
surface.CreateFont("BB_16", {font = "Default", size = 16, weight = 700, shadow = true})

function GM:ScoreboardShow()
	if IsValid(self.scoreboard) then
		self.scoreboard:Remove()
	end

	self.scoreboard = vgui.Create("BBScoreboard")
	self.scoreboard:MakePopup()
end

function GM:ScoreboardHide()
	if IsValid(self.scoreboard) then
		self.scoreboard:Remove()
	end
end

local suppress = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudCrosshair"] = true
}

function GM:HUDShouldDraw(name)
	if suppress[name] then return false end

	return true
end