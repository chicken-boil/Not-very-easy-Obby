local NPCs = workspace:WaitForChild("NPCs")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local root = char:WaitForChild("HumanoidRootPart",5)

game:GetService("RunService").RenderStepped:Connect(function()
	for i, npc in pairs(NPCs:GetChildren()) do
		local npcRoot = npc:WaitForChild("HumanoidRootPart")
		npc:SetPrimaryPartCFrame(CFrame.lookAt(npcRoot.Position,root.Position * Vector3.new(1,0,1) + npcRoot.Position * Vector3.new(0,1,0)))
	end
end)