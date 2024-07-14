
--[[Loadstrings]]--
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/notificationtest"))();
local Notify = Notification.Notify;
Notify({Description = "Script already got removed due to people keep post my script to roblox executor script search; Title = "SCRIPT REMOVED!"; Duration = 5;});
Notify({Description = "New script in my youtube video description, video link was copied into your clipboard"; Title = "SCRIPT REMOVED!"; Duration = 5;});
setclipboard("https://youtu.be/KYEbdE5YiDk?si=7PExtX-3Tl--Bbe7")
--[[
local gui = Instance.new("ScreenGui")
gui.Name = "FakeAdminGui"
gui.Parent = game.CoreGui

local DieButton = Instance.new("TextButton", gui)
DieButton.Size = UDim2.new(0.15, 0, 0.08, 0)
DieButton.Position = UDim2.new(0.5, 0, -0.07, 0)
DieButton.BackgroundColor3 = Color3.new(0, 1, 0)
DieButton.Text = "die"
DieButton.Name = "die"
DieButton.TextSize = 22
DieButton.TextColor3 = Color3.new(0.3, 0.3, 0.3)
local DBCorner = Instance.new("UICorner", DieButton)
DBCorner.CornerRadius = UDim.new(0, 6)

local ToucheyButton = Instance.new("TextButton", gui)
ToucheyButton.Size = UDim2.new(0.15, 0, 0.08, 0)
ToucheyButton.Position = UDim2.new(0.66, 0, -0.07, 0)
ToucheyButton.BackgroundColor3 = Color3.new(0, 1, 0)
ToucheyButton.Text = "touchey"
ToucheyButton.Name = "touchey"
ToucheyButton.TextSize = 20
ToucheyButton.TextColor3 = Color3.new(0.3, 0.3, 0.3)
local TBCorner = Instance.new("UICorner", ToucheyButton)
TBCorner.CornerRadius = UDim.new(0, 6)

hiddenfling = false
local function NoTouchey(Value)
	if Value == true then
		 if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
			 hiddenfling = true
		 else
			 hiddenfling = true
			 detection = Instance.new("Decal")
			 detection.Name = "juisdfj0i32i0eidsuf0iok"
			 detection.Parent = game:GetService("ReplicatedStorage")
			 local function fling()
				 local hrp, c, vel, movel = nil, nil, nil, 0.1
				 while true do
					 game:GetService("RunService").Heartbeat:Wait()
					 if hiddenfling then
						 local lp = game.Players.LocalPlayer
						 while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
							 game:GetService("RunService").Heartbeat:Wait()
							 c = lp.Character
							 hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
						 end
						 if hiddenfling then
							 vel = hrp.Velocity
							 hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
							 game:GetService("RunService").RenderStepped:Wait()
							 if c and c.Parent and hrp and hrp.Parent then
								 hrp.Velocity = vel
							 end
							 game:GetService("RunService").Stepped:Wait()
							 if c and c.Parent and hrp and hrp.Parent then
								 hrp.Velocity = vel + Vector3.new(0, movel, 0)
								 movel = movel * -1
							 end
						 end
					 end
				 end
			 end
			 
			 fling()
		 end
	elseif Value == false then
		hiddenfling = false
	end
end

local function Anti(Value)
	ToggleAnti = Value
	if Value == true then
		while ToggleAnti == true do
			for _, part in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if part:IsA("BasePart") and part.Anchored then
					part.Anchored = false
				end
			end
			for _, obj in ipairs(game.Workspace:GetChildren()) do
				if string.find(obj.Name, "ÅBarrier") then
					if obj.CanCollide then
						obj.CanCollide = false
					end
				end
				if obj.Name == "wall" then
					obj.CanCollide = false
				end
			end
			task.wait()
		end
	end
end

DieButton.MouseButton1Down:Connect(function()
	if DieButton.BackgroundColor3 ~= Color3.new(1,0,0) then
		workspace.BountyHunterRoom.BountyHunterBooth._configPart.OpenRemote:InvokeServer()
		wait()
		workspace.BountyHunterRoom.BountyHunterBooth._configPart.LeaveRemote:FireServer()
		DieButton.BackgroundColor3 = Color3.new(1,0,0)
		DieButton.Text = "die'nt"
		Anti(true)
	else
		DieButton.BackgroundColor3 = Color3.new(0,1,0)
		DieButton.Text = "die"
		Anti(false)
	end
end)

ToucheyButton.MouseButton1Down:Connect(function()
	if ToucheyButton.BackgroundColor3 ~= Color3.new(1,0,0) then
		ToucheyButton.BackgroundColor3 = Color3.new(1,0,0)
		ToucheyButton.Text = "no touchey"
		NoTouchey(true)
	else
		ToucheyButton.BackgroundColor3 = Color3.new(0,1,0)
		ToucheyButton.Text = "touchey"
		NoTouchey(false)
	end
end)


