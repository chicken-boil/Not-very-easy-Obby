local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local TaggedParts = CollectionService:GetTagged("enabledDefault")

local debounce = false

for i, TaggedPart in pairs(TaggedParts) do
	TaggedPart.Touched:Connect(function(hit)
		if debounce == false then
			debounce = true
			
			if hit.Parent:FindFirstChild("Humanoid") then
				local character = hit.Parent
				local player = Players:GetPlayerFromCharacter(character)
				local leaderstats = player:FindFirstChild("leaderstats")
				local stage = leaderstats:FindFirstChild("Stage")
				
				local normSpeed = character.Humanoid.WalkSpeed
				local normJump = character.Humanoid.JumpPower
				
				character.Humanoid.WalkSpeed = 0
				character.Humanoid.JumpPower = 0
				character.HumanoidRootPart.CFrame = CFrame.new(workspace.STAGES:FindFirstChild(stage.Value).Position + Vector3.new(0,3,0))
				character.Humanoid.Health = 100
				wait(0.3)
				character.Humanoid.WalkSpeed = normSpeed
				character.Humanoid.JumpPower = normJump
			end
			
			wait(0.1)
			debounce = false
		end
	end)
end