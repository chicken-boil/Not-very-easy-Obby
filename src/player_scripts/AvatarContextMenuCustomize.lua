local StarterGui = game:GetService("StarterGui")
local player = game.Players.LocalPlayer
local PlayerGui = player.PlayerGui
local character = player.Character or player.CharacterAdded:Wait()

local bindableEvent = Instance.new("BindableEvent")

local function onCustomAction(targetPlayer)
	local HumanoidRootPart = character:WaitForChild("HumanoidRootPart")
	local Humanoid = character:WaitForChild("Humanoid")
	local LoadZone = PlayerGui:FindFirstChild("LoadZone")
	
	local otherPlayerCharacter = targetPlayer.Character or targetPlayer.CharacterAdded:Wait()

	if Humanoid.Sit == true then
		Humanoid.Sit = false
		LoadZone.Enabled = true
		wait(0.1)
		HumanoidRootPart.CFrame = CFrame.new(otherPlayerCharacter.PrimaryPart.Position)
		wait(1)
		LoadZone.Enabled = false
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All,true)
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false)
	else
		LoadZone.Enabled = true
		HumanoidRootPart.CFrame = CFrame.new(otherPlayerCharacter.PrimaryPart.Position)
		wait(1)
		LoadZone.Enabled = false
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All,true)
		StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false)
	end
end

bindableEvent.Event:Connect(onCustomAction)
local options = {"Teleport To",bindableEvent}
StarterGui:SetCore("AddAvatarContextMenuOption",options)