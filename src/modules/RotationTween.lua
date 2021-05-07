local module = {}

local TS = game:GetService("TweenService")
local TI = TweenInfo.new(0.1,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)

function module.tweenC(object)
	local tween = TS:Create(object,TI,{Rotation	= 0})
	tween:Play()
end

function module.tweenR(object)
	local tween = TS:Create(object,TI,{Rotation	= 15})
	tween:Play()
end

function module.tweenL(object)
	local tween = TS:Create(object,TI,{Rotation	= -15})
	tween:Play()
end

return module