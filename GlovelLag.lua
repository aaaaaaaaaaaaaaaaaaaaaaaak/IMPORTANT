
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local VFX = player.PlayerScripts.VFXListener
VFX.Disabled = AntiLag

-- Start Script
if not StartLag then
	VFX.Disabled = false
	game:GetService("ReplicatedStorage"):WaitForChild("GlovelCancel"):FireServer()
else
	for i = 1,LagValue do
		task.spawn(function()
			game:GetService("ReplicatedStorage"):WaitForChild("GlovelFunc"):InvokeServer()
		end)
	end 
end
