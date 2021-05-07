local RS = game:GetService("ReplicatedStorage")

local WIND_DIRECTION = Vector3.new(1,0,0.3)
local WIND_SPEED = 25
local WIND_POWER = 0.4

local WindShake = require(RS.Modules:WaitForChild("WindShake"))

WindShake:SetDefaultSettings({
	WindSpeed = WIND_SPEED;
	WindDirection = WIND_DIRECTION;
	WindPower = WIND_POWER;
})

WindShake:Init()

while true do
	wait(600)
	WindShake:SetDefaultSettings({WindSpeed = 50;WindDirection = WIND_DIRECTION;WindPower = 2;})
	wait(20)
	WindShake:SetDefaultSettings({WindSpeed = WIND_SPEED;WindDirection = WIND_DIRECTION;WindPower = WIND_POWER;})
end