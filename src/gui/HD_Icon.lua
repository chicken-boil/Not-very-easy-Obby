game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
	if child.Name == "TopbarPlus" then
		child.Enabled = false
	end
end)