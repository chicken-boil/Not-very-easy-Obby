local zoomer = {}
local enabled = true
local defaultKey = "C"
local defaultfov = 70
local zoomedfov = 30

function zoomer:SetKeybind(key)
	defaultKey = string.upper(key)
end

function zoomer:SetDefaultFOV(fov)
	if fov >= 30 and fov <= 120 then
		if tonumber(fov) then
			defaultfov = tonumber(fov)
		end
	end
end

function zoomer:SetZoomedFOV(fov)
	if fov >= 30 and fov <= 120 then
		if tonumber(fov) then
			zoomedfov = tonumber(fov)
		end
	end
end

function zoomer:SetEnabled(ready)
	if ready then
		enabled = true
	else
		enabled = false
	end
end
function zoomer:ForceZoomIn()
	workspace.CurrentCamera.FieldOfView = zoomedfov
end

function zoomer:ForceZoomOut()
	workspace.CurrentCamera.FieldOfView = defaultfov
end

function zoomer:GetZoomerData()
	return {
		["Version"] = "V1.0.0",
		["Enabled"] = tostring(enabled),
		["Keybind"] = defaultKey
	}
end

game:GetService("UserInputService").InputBegan:Connect(function(input,typing)
	if input.KeyCode == Enum.KeyCode[defaultKey] and not typing then
		workspace.CurrentCamera.FieldOfView = zoomedfov
	end
end)
game:GetService("UserInputService").InputEnded:Connect(function(input,typing)
	if input.KeyCode == Enum.KeyCode[defaultKey] and not typing then
		workspace.CurrentCamera.FieldOfView = defaultfov
	end
end)

return zoomer