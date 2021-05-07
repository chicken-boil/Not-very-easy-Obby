local UIS = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()

local normalSpeed = 16
local sprintSpeed = 30
local sprinting = false

UIS.InputBegan:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.Home then
		running = true
		if char.Humanoid then	
			char.Humanoid.WalkSpeed = sprintSpeed
		end
	end
end)

UIS.InputEnded:Connect(function(key)
	if key.KeyCode == Enum.KeyCode.Home then
		running = false
		if char.Humanoid then	
			char.Humanoid.WalkSpeed = normalSpeed
		end
	end
end)