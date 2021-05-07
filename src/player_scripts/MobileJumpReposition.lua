local UIS = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")

if UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled and not UIS.GamepadEnabled and not GuiService:IsTenFootInterface() then
	local player = game.Players.LocalPlayer
	local PlayerGui = player:WaitForChild("PlayerGui")
	local TouchGui = PlayerGui:WaitForChild("TouchGui")
	local TouchControlFrame = TouchGui:WaitForChild("TouchControlFrame")
	local JumpButton = TouchControlFrame:WaitForChild("JumpButton")
	
	repeat
		JumpButton.Position = UDim2.new(1,-115,1,-90)
		TouchGui.ResetOnSpawn = false
		wait()
	until JumpButton.Position == UDim2.new(1,-115,1,-90) and TouchGui.ResetOnSpawn == false
else
	script:Destroy()
end