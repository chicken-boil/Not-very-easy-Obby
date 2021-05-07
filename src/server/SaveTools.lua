local ds = game:GetService("DataStoreService"):GetDataStore("ToolSave")
local rs = game:GetService("ReplicatedStorage")

game.Players.PlayerAdded:Connect(function(plr)
	local key = "tool-"..plr.UserId
	pcall(function()
		local tools = ds:GetAsync(key)
		
		if tools then
			for i,v in pairs(tools) do
				local tool = rs.TotalTools:FindFirstChild(v)
				if tool then
					tool:Clone().Parent = plr:WaitForChild("Backpack")
					tool:Clone().Parent = plr:WaitForChild("StarterGear")
				end
			end
		end
	end)
end)

game.Players.PlayerRemoving:Connect(function(plr)
	local key = "tool-"..plr.UserId
	pcall(function()
		local toolsToSave = {}
		
		for i, v in pairs(plr.StarterGear:GetChildren()) do
			if v then
				table.insert(toolsToSave,v.Name)
			end
		end
		ds:SetAsync(key,toolsToSave)
	end)
end)

game:BindToClose(function()
	for _, plr in pairs(game.Players:GetPlayers()) do
		local key = "tool-"..plr.UserId
		local toolsTable = {}
		
		for _, tool in pairs(plr.StarterGear:GetChildren()) do
			if rs.TotalTools:FindFirstChild(tool.Name) then
				table.insert(toolsTable,tool.Name)
			end
		end
		local success, errorMessage = pcall(function()
			ds:SetAsync(key,toolsTable)
		end)
	end
end)