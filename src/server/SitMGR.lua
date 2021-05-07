local RS = game:GetService("ReplicatedStorage")
local RE = RS:WaitForChild("RemoteEvents")

RE.Sit.OnServerEvent:Connect(function(plr,seatPart,distanceConf)
	local distance = plr:DistanceFromCharacter(seatPart.Position)
	
	if (distance > 0 and distance < distanceConf) then
		seatPart:Sit(plr.Character.Humanoid)
	end
end)