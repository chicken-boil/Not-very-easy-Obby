local module = {}

local function playSound(sound_id)
	local sound = Instance.new("Sound",game.ReplicatedStorage)
	sound.SoundId = sound_id
	sound.Volume = 0.3
	sound.PlayOnRemove = true
	sound:Destroy()
end

function module.tw(object,content,length)
	for i=1,string.len(content) do
		object.Text = string.sub(content,1,i)
		playSound("rbxassetid://915576050")
		if string.sub(content,i,i) == "!" or string.sub(content,i,i) == "." or string.sub(content,i,i) == "?" then
			wait(1)
		elseif string.sub(content,i,i) == "," then
			wait(0.5)
		else
			wait(0.05)
		end
	end
end

return module