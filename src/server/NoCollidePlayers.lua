local PhysService = game:GetService("PhysicsService")
local PlayerGroup = PhysService:CreateCollisionGroup("p")
PhysService:CollisionGroupSetCollidable("p","p",false)

function NoCollide(model)
	for k, v in pairs(model:GetChildren()) do
		if v:IsA("BasePart") then
			PhysService:SetPartCollisionGroup(v,"p")
		end
	end
end

game:GetService("Players").PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		repeat wait() until char:FindFirstChild("HumanoidRootPart")
		repeat wait() until char:FindFirstChild("Head")
		repeat wait() until char:FindFirstChild("Humanoid")
		char:FindFirstChild("HumanoidRootPart")
		char:FindFirstChild("Head")
		char:FindFirstChild("Humanoid")
		wait(0.1)
		NoCollide(char)
	end)
	if player.Character then
		NoCollide(player.Character)
	end
end)