--[[
Hey if you re watching this then
I would like to say your script ability it's better than mine
how can you Deobfucase the moonsec v3
Cool man! Can i add you in discord? my user is @poguos
]]--
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/notificationtest"))();
local Notify = Notification.Notify;
loadstring(game:HttpGet("https://raw.githubusercontent.com/OMOHOTA/GeneralSB/main/Credit_owner.lua"))()

if game.PlaceId ~= 18550498098 then
	Notify({Description = "Wrong placeid" ; Title = "Error!"; Duration = 5;});
	return
end

Notify({Description = "Made by " .. getgenv().CreditName.DisplayYoutube .. "/" .. getgenv().CreditName.SourceYoutube ; Title = "Script Credit!"; Duration = 5;});

local function GloveSlap()
    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") == nil and game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") ~= nil and game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool").Name == "Lantern" then game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack.Lantern) end
    wait()
    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") ~= nil then game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):Activate() end
end

local function AutoGolem(Value)
	Golem = Value
	while Golem == true do task.wait(.25)
		for i, v in pairs(workspace:GetChildren()) do
		    if v.Name == "golem" then
				GloveSlap()
		        local args = {
		            [1] = "Hit",
		            [2] = v:FindFirstChild("Hitbox")
		        }
		
		        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
		    end
		end
	end
end
local function AutoNPC(Value)
	NPC = Value
	while NPC == true do task.wait(.5)
		for i, v in pairs(workspace:GetChildren()) do
		    if v.Name == "ReplicaNPC" then 
				GloveSlap()
		        local args = {
		            [1] = "Hit",
		            [2] = v:FindFirstChild("HumanoidRootPart")
		        }
		
		        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
		    end
		end
	end
end

local function AutoRocket(Value)
	Rocket = Value
	while Rocket == true do task.wait(.5)
		for i, v in pairs(workspace:GetChildren()) do
		    if v.Name == "TrackGloveMissile" then
				GloveSlap()
		        local args = {
		            [1] = "Hit",
		            [2] = v
		        }
		
		        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
		    end
		end
	end
end

local function AutoGuide(Value)
	Guide = Value
	while Guide == true do task.wait(.1)
		for i, v in pairs(workspace:GetChildren()) do
		    if v.Name == "GuideNPC" then
				GloveSlap()
		        local args = {
		            [1] = "Hit",
		            [2] = v:FindFirstChild("HumanoidRootPart")
		        }
		
		        game:GetService("Players").LocalPlayer.Character.Lantern.Network:FireServer(unpack(args))
		    end
		end
	end
end

local gui = Instance.new("ScreenGui")
gui.Name = "TheGuide"
gui.Parent = game.CoreGui

local MainUi = Instance.new("Frame", gui)
MainUi.Size = UDim2.new(0.25, 0, 0.6, 0)
MainUi.Position = UDim2.new(0.1, 0, 0.2, 0)
MainUi.BackgroundColor3 = Color3.new(1, 1, 1)
MainUi.Active = true
MainUi.Draggable = true
local Title = Instance.new("TextLabel", MainUi)
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.BackgroundColor3 = Color3.new(1, 1 , 1)
Title.Text = "The Guide Boss// By Omoscripts//"
Title.TextColor3 = Color3.new(0, 0, 0)
Title.TextSize = 10

local TPTo = Instance.new("TextButton", MainUi)
TPTo.Size = UDim2.new(0.9, 0, 0.1, 0)
TPTo.Position = UDim2.new(0.05, 0, 0.12, 0)
TPTo.BackgroundColor3 = Color3.new(1, 1, 1)
TPTo.BorderColor3 = Color3.new(0, 0, 0)
TPTo.BorderSizePixel = 1
TPTo.Text = "Teleport To Boss (Switch Level)"
TPTo.BackgroundTransparency = 0 
TPTo.TextColor3 = Color3.new(0, 0, 0)

local SAFE = Instance.new("TextButton", MainUi)
SAFE.Size = UDim2.new(0.9, 0, 0.1, 0)
SAFE.Position = UDim2.new(0.05, 0, 0.25, 0)
SAFE.BackgroundColor3 = Color3.new(1, 1, 1)
SAFE.BorderColor3 = Color3.new(0, 0, 0)
SAFE.BorderSizePixel = 1
SAFE.Text = "Teleport To SafeZone"
SAFE.BackgroundTransparency = 0 
SAFE.TextColor3 = Color3.new(0, 0, 0)

local HITMINI = Instance.new("TextButton", MainUi)
HITMINI.Size = UDim2.new(0.9, 0, 0.1, 0)
HITMINI.Position = UDim2.new(0.05, 0, 0.38, 0)
HITMINI.BackgroundColor3 = Color3.new(1, 1, 1)
HITMINI.BorderColor3 = Color3.new(0, 0, 0)
HITMINI.BorderSizePixel = 1
HITMINI.Text = "Auto Slap Minions "
HITMINI.BackgroundTransparency = 0 
HITMINI.TextColor3 = Color3.new(0, 0, 0)

local HITGOLEM = Instance.new("TextButton", MainUi)
HITGOLEM.Size = UDim2.new(0.9, 0, 0.1, 0)
HITGOLEM.Position = UDim2.new(0.05, 0, 0.50, 0)
HITGOLEM.BackgroundColor3 = Color3.new(1, 1, 1)
HITGOLEM.BorderColor3 = Color3.new(0, 0, 0)
HITGOLEM.BorderSizePixel = 1
HITGOLEM.Text = "Auto Slam Golem "
HITGOLEM.BackgroundTransparency = 0 
HITGOLEM.TextColor3 = Color3.new(0, 0, 0)

local HITGUIDE = Instance.new("TextButton", MainUi)
HITGUIDE.Size = UDim2.new(0.9, 0, 0.1, 0)
HITGUIDE.Position = UDim2.new(0.05, 0, 0.62, 0)
HITGUIDE.BackgroundColor3 = Color3.new(1, 1, 1)
HITGUIDE.BorderColor3 = Color3.new(0, 0, 0)
HITGUIDE.BorderSizePixel = 1
HITGUIDE.Text = "Auto Slap Guide "
HITGUIDE.BackgroundTransparency = 0 
HITGUIDE.TextColor3 = Color3.new(0, 0, 0)

local HITROCKET = Instance.new("TextButton", MainUi)
HITROCKET.Size = UDim2.new(0.9, 0, 0.1, 0)
HITROCKET.Position = UDim2.new(0.05, 0, 0.74, 0)
HITROCKET.BackgroundColor3 = Color3.new(1, 1, 1)
HITROCKET.BorderColor3 = Color3.new(0, 0, 0)
HITROCKET.BorderSizePixel = 1
HITROCKET.Text = "Auto Rocket "
HITROCKET.BackgroundTransparency = 0 
HITROCKET.TextColor3 = Color3.new(0, 0, 0)

local SPARE = Instance.new("TextButton", MainUi)
SPARE.Size = UDim2.new(0.45, 0, 0.1, 0)
SPARE.Position = UDim2.new(0.05, 0, 0.86, 0)
SPARE.BackgroundColor3 = Color3.new(1, 1, 1)
SPARE.BorderColor3 = Color3.new(0, 0, 0)
SPARE.BorderSizePixel = 1
SPARE.TextScaled = true
SPARE.Text = "Spare Guide (Relude)"
SPARE.BackgroundTransparency = 0 
SPARE.TextColor3 = Color3.new(0, 0, 0)

local UNSPARE = Instance.new("TextButton", MainUi)
UNSPARE.Size = UDim2.new(0.45, 0, 0.1, 0)
UNSPARE.Position = UDim2.new(0.5, 0, 0.86, 0)
UNSPARE.BackgroundColor3 = Color3.new(1, 1, 1)
UNSPARE.BorderColor3 = Color3.new(0, 0, 0)
UNSPARE.BorderSizePixel = 1
UNSPARE.TextScaled = true
UNSPARE.Text = "No-Spare Guide (Hunter)"
UNSPARE.BackgroundTransparency = 0 
UNSPARE.TextColor3 = Color3.new(0, 0, 0)

UNSPARE.MouseButton1Down:Connect(function()
	game:GetService("ReplicatedStorage").Remotes.Data.AnswerInCutscene:FireServer("Eliminate")
end)

SPARE.MouseButton1Down:Connect(function()
	game:GetService("ReplicatedStorage").Remotes.Data.AnswerInCutscene:FireServer("Spare")
end)

SAFE.MouseButton1Down:Connect(function()
	local SF = Instance.new("Part", workspace)
	SF.Size = Vector3.new(400,5,400)
	SF.Transparency = .8
	SF.Anchored = true
	SF.CanCollide = true
	SF.Position = Vector3.new(595, 146, -330)
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(595, 150, -330)
end)

TPTo.MouseButton1Down:Connect(function()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3273,-75,822)
end)

HITMINI.MouseButton1Down:Connect(function()
	if HITMINI.BackgroundColor3 == Color3.new(1, 1, 1) then
		HITMINI.BackgroundColor3 = Color3.new(0, 1, 0)
		AutoNPC(true)
		else
		HITMINI.BackgroundColor3 = Color3.new(1, 1, 1)
		AutoNPC(false)
		end
end)
HITGOLEM.MouseButton1Down:Connect(function()
	if HITGOLEM.BackgroundColor3 == Color3.new(1, 1, 1) then
	HITGOLEM.BackgroundColor3 = Color3.new(0, 1, 0)
	AutoGolem(true)
	else
	HITGOLEM.BackgroundColor3 = Color3.new(1, 1, 1)
	AutoGolem(false)
	end
end)
HITGUIDE.MouseButton1Down:Connect(function()
	if HITGUIDE.BackgroundColor3 == Color3.new(1, 1, 1) then
	HITGUIDE.BackgroundColor3 = Color3.new(0, 1, 0)
	AutoGuide(true)
	else
	HITGUIDE.BackgroundColor3 = Color3.new(1, 1, 1)
	AutoGuide(false)
	end
end)
HITROCKET.MouseButton1Down:Connect(function()
	if HITROCKET.BackgroundColor3 == Color3.new(1, 1, 1) then
	HITROCKET.BackgroundColor3 = Color3.new(0, 1, 0)
	AutoRocket(true)
	else
	HITROCKET.BackgroundColor3 = Color3.new(1, 1, 1)
	AutoRocket(false)
	end
end)
