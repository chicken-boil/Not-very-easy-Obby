local player = game.Players.LocalPlayer
local character = player.Character or player.Character:Wait()

local MPS = game:GetService("MarketplaceService")
local PlayerBoughtTrailPass = MPS:UserOwnsGamePassAsync(player.UserId,10430505)

local camera = workspace.CurrentCamera

game:GetService("RunService").RenderStepped:Connect(function()
	if character:FindFirstChild("Head") then
		if (camera.Focus.p - camera.CoordinateFrame.p).magnitude <= 1 then
			character.Head:WaitForChild("Trail").Enabled = false
		elseif PlayerBoughtTrailPass and (camera.Focus.p - camera.CoordinateFrame.p).magnitude > 1 then
			character.Head:WaitForChild("Trail").Enabled = true
		else
			character.Head:WaitForChild("Trail").Enabled = false
		end
	end
end)