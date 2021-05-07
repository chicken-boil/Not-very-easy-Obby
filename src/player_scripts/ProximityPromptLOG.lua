for i, v in pairs(workspace:GetDescendants()) do
	if v:IsA("ProximityPrompt") then
		v.PromptShown:Connect(function()
			print("New interaction: "..v.ActionText)
		end)
		v.PromptHidden:Connect(function()
			print("Remove interaction: "..v.ActionText)
		end)
	end
end