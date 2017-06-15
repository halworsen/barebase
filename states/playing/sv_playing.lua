local state = "playing"

local function playing_entered()
	print("welcum 2 playing")
end
hook.Add("StateEnter_playing", state, playing_entered)