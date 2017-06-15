function GM:Initialize()
	self.BaseClass.Initialize(self)
end

function GM:CreateTeams()
	for k,v in pairs(ggt.config.teams) do
		team.SetUp(k, v.name, v.color)
	end
end