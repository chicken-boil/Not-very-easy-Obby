local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local RunService = game:GetService("RunService")

local LastTrainCFrame

local Function
local Function2

Function = RunService.Heartbeat:Connect(function()
	local RootPart = character:FindFirstChild("Torso")
	local ray = Ray.new(RootPart.CFrame.p,Vector3.new(0,-50,0))
	local Hit = workspace:FindPartOnRay(ray,character)

	if Hit and Hit.Name == "MovePart" then
		local Train = Hit
		
		if LastTrainCFrame == nil then
			LastTrainCFrame = Train.CFrame
		end
		
		local TrainCF = Train.CFrame 
		local Rel = TrainCF * LastTrainCFrame:inverse()

		LastTrainCFrame = Train.CFrame
		RootPart.CFrame = Rel * RootPart.CFrame
	else
		LastTrainCFrame = nil
	end

	Function2 = character:FindFirstChild("Humanoid").Died:Connect(function()
		Function:Disconnect()
		Function2:Disconnect()
	end)
end)