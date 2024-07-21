--[[Wait For Game]]--
if not game:IsLoaded() then
    game.Loaded:Wait()
end

--[[Loadstrings]]--
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/notificationtest"))();
local Notify = Notification.Notify;
loadstring(game:HttpGet("https://raw.githubusercontent.com/OMOHOTA/GeneralSB/main/Credit_owner.lua"))()
Notify({Description = "Made by " .. getgenv().CreditName.DisplayYoutube .. "/" .. getgenv().CreditName.SourceYoutube ; Title = "Script Credit!"; Duration = 5;});

_G.CanStopEdgelord = true
local Namecall
Namecall = hookmetamethod(game, "__namecall", function(self, ...)
   if getnamecallmethod() == "FireServer" and tostring(self) == "Ban" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "WalkSpeedChanged" then
       return
   elseif getnamecallmethod() == "FireServer" and tostring(self) == "AdminGUI" then
       return
   end
   return Namecall(self, ...)
end)

local cloneref = cloneref or function(o) return o end
RunService = cloneref(game:GetService("RunService"))
invisRunning = false
function TurnInvisible()
	if invisRunning then return end
	invisRunning = true
	local Player = game.Players.LocalPlayer
	repeat wait(.1) until Player.Character
	local Character = Player.Character
	Character.Archivable = true
	local IsInvis = false
	local IsRunning = true
	local InvisibleCharacter = Character:Clone()
	InvisibleCharacter.Parent = Lighting
	local Void = workspace.FallenPartsDestroyHeight
	InvisibleCharacter.Name = ""
	local CF

	local invisFix = RunService.Stepped:Connect(function()
		pcall(function()
			local IsInteger
			if tostring(Void):find'-' then
				IsInteger = true
			else
				IsInteger = false
			end
			local Pos = Player.Character.HumanoidRootPart.Position
			local Pos_String = tostring(Pos)
			local Pos_Seperate = Pos_String:split(', ')
			local X = tonumber(Pos_Seperate[1])
			local Y = tonumber(Pos_Seperate[2])
			local Z = tonumber(Pos_Seperate[3])
			if IsInteger == true then
				if Y <= Void then
					Respawn()
				end
			elseif IsInteger == false then
				if Y >= Void then
					Respawn()
				end
			end
		end)
	end)

	for i,v in pairs(InvisibleCharacter:GetDescendants())do
		if v:IsA("BasePart") then
			if v.Name == "HumanoidRootPart" then
				v.Transparency = 1
			else
				v.Transparency = .5
			end
		end
	end

	function Respawn()
		IsRunning = false
		if IsInvis == true then
			pcall(function()
				Player.Character = Character
				wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA'Humanoid':Destroy()
				IsInvis = false
				InvisibleCharacter.Parent = nil
				invisRunning = false
			end)
		elseif IsInvis == false then
			pcall(function()
				Player.Character = Character
				wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA'Humanoid':Destroy()
				TurnVisible()
			end)
		end
	end

	local invisDied
	invisDied = InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
		Respawn()
		invisDied:Disconnect()
	end)

	if IsInvis == true then return end
	IsInvis = true
	CF = workspace.CurrentCamera.CFrame
	local CF_1 = Player.Character.HumanoidRootPart.CFrame
	Character:MoveTo(Vector3.new(0,math.pi*1000000,0))
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	wait(.2)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	InvisibleCharacter = InvisibleCharacter
	Character.Parent = Lighting
	InvisibleCharacter.Parent = workspace
	InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
	Player.Character = InvisibleCharacter
	workspace.CurrentCamera:remove()
	wait(.1)
	repeat wait() until game.Players.LocalPlayer.Character ~= nil
	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	game.Players.LocalPlayer.CameraMinZoomDistance = 0.5
	game.Players.LocalPlayer.CameraMaxZoomDistance = 400
	game.Players.LocalPlayer.CameraMode = "Classic"
	game.Players.LocalPlayer.Character.Head.Anchored = false
	Player.Character.Animate.Disabled = true
	Player.Character.Animate.Disabled = false

	function TurnVisible()
		if IsInvis == false then return end
		invisFix:Disconnect()
		invisDied:Disconnect()
		CF = workspace.CurrentCamera.CFrame
		Character = Character
		local CF_1 = Player.Character.HumanoidRootPart.CFrame
		Character.HumanoidRootPart.CFrame = CF_1
		InvisibleCharacter:Destroy()
		Player.Character = Character
		Character.Parent = workspace
		IsInvis = false
		Player.Character.Animate.Disabled = true
		Player.Character.Animate.Disabled = false
		invisDied = Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
			Respawn()
			invisDied:Disconnect()
		end)
		invisRunning = false
	end
end

--[[Lobby Check+Destroy Old]]--
if game.Players.LocalPlayer.Character.isInArena.Value == true then
	game.StarterGui:SetCore("SendNotification", {Title = "ERROR", Text = "Script can only be using in lobby.", Duration = 3})
	return
end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("EdgelordGui") ~= nil then
	game.Players.LocalPlayer.PlayerGui:FindFirstChild("EdgelordGui"):Destroy()
end
if game.Workspace:FindFirstChild("SafeSpotEdgeLord") ~= nil then
	game.Workspace:FindFirstChild("SafeSpotEdgeLord"):Destroy()
end

--[[Create SettingZone]]--
local SafeSpotEdgeLord = Instance.new("Part", workspace)
SafeSpotEdgeLord.Position = Vector3.new(86, -12173, 78)
SafeSpotEdgeLord.Name = "SafeSpotEdgeLord"
SafeSpotEdgeLord.Size = Vector3.new(100, 0.1, 100)
SafeSpotEdgeLord.Anchored = true
SafeSpotEdgeLord.Transparency = 0
SafeSpotEdgeLord.CanCollide = true

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("SafeSpotEdgeLord").CFrame * CFrame.new(0, 1, 0)

--[[Create functionGUI]]--
local function AddCorner(instance, radius)
    local corner = Instance.new("UICorner", instance)
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end
local function AddStroke(instance, thickness)
	local Stroke = Instance.new("UIStroke", instance)
	Stroke.Color = Color3.new(0, 0, 0)
	Stroke.Thickness = thickness
	return Stroke
end

local function createGradient(frame, color1, color2)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(1, color2)
    }
    gradient.Parent = frame
    return gradient
end

local EdgelordGui = Instance.new("ScreenGui",game.Players.LocalPlayer.PlayerGui)
EdgelordGui.Name = "EdgelordGui"
EdgelordGui.ResetOnSpawn = false
EdgelordGui.DisplayOrder = 1

local EAbilityButton = Instance.new("Frame",EdgelordGui)
EAbilityButton.BackgroundColor3 = Color3.new(100, 0, 0)
EAbilityButton.Size = UDim2.new(0 , 80, 0 , 80)
EAbilityButton.Position = UDim2.new(0.82, 0, 0.06, 0)
EAbilityButton.Transparency = 0
EAbilityButton.Draggable = false
EAbilityButton.Visible = false
local EAbilityButtonReal = Instance.new("TextButton",EAbilityButton)
EAbilityButtonReal.Size = UDim2.new(1, 0, 1, 0)
EAbilityButtonReal.Position = UDim2.new(0, 0, 0, 0)
EAbilityButtonReal.Text = "E"
EAbilityButtonReal.TextSize = 80
EAbilityButtonReal.TextColor3 = Color3.new(255, 255, 255)
EAbilityButtonReal.Font = Enum.Font.SourceSans
EAbilityButtonReal.BackgroundTransparency = 1
AddCorner(EAbilityButton, 10)
AddStroke(EAbilityButton, 4)
createGradient(EAbilityButton, Color3.new(1,1,1), Color3.new(0,0,1))
local TAbilityButton = Instance.new("Frame",EdgelordGui)
TAbilityButton.BackgroundColor3 = Color3.new(100, 0, 0)
TAbilityButton.Size = UDim2.new(0 , 80, 0 , 80)
TAbilityButton.Position = UDim2.new(0.76, 0, 0.3, 0)
TAbilityButton.Transparency = 0
TAbilityButton.Draggable = false
TAbilityButton.Visible = false
local TAbilityButtonReal = Instance.new("TextButton",TAbilityButton)
TAbilityButtonReal.Size = UDim2.new(1, 0, 1, 0)
TAbilityButtonReal.Position = UDim2.new(0, 0, 0, 0)
TAbilityButtonReal.Text = "T"
TAbilityButtonReal.TextSize = 80
TAbilityButtonReal.TextColor3 = Color3.new(255, 255, 255)
TAbilityButtonReal.Font = Enum.Font.SourceSans
TAbilityButtonReal.BackgroundTransparency = 1
AddCorner(TAbilityButton, 10)
AddStroke(TAbilityButton, 4)
createGradient(TAbilityButton, Color3.new(1,1,1), Color3.new(0,0,1))
local FAbilityButton = Instance.new("Frame",EdgelordGui)
FAbilityButton.BackgroundColor3 = Color3.new(100, 0, 0)
FAbilityButton.Size = UDim2.new(0 , 80, 0 , 80)
FAbilityButton.Position = UDim2.new(0.87, 0, 0.3, 0)
FAbilityButton.Transparency = 0
FAbilityButton.Draggable = false
FAbilityButton.Visible = false
local FAbilityButtonReal = Instance.new("TextButton",FAbilityButton)
FAbilityButtonReal.Size = UDim2.new(1, 0, 1, 0)
FAbilityButtonReal.Position = UDim2.new(0, 0, 0, 0)
FAbilityButtonReal.Text = "F"
FAbilityButtonReal.TextSize = 80
FAbilityButtonReal.TextColor3 = Color3.new(255, 255, 255)
FAbilityButtonReal.Font = Enum.Font.SourceSans
FAbilityButtonReal.BackgroundTransparency = 1
AddCorner(FAbilityButton, 10)
AddStroke(FAbilityButton, 4)
createGradient(FAbilityButton, Color3.new(1,1,1), Color3.new(0,0,1))
local TelekineticOnTap = Instance.new("TextButton", EdgelordGui)
TelekineticOnTap.Size = UDim2.new(0.112, 0, 0.1, 0)
TelekineticOnTap.Position = UDim2.new(0.75, 0, 0.53, 0)
TelekineticOnTap.BackgroundColor3 = Color3.new(0, 0, 0)
TelekineticOnTap.Text = "Telekinetic OnTap(Enabled)"
TelekineticOnTap.TextScaled = true
TelekineticOnTap.TextColor3 = Color3.new(255, 255, 255)
TelekineticOnTap.Font = Enum.Font.Cartoon
TelekineticOnTap.Transparency = 0.4
TelekineticOnTap.Visible = false
AddCorner(TelekineticOnTap, 5)
local CartoonMode = Instance.new("TextButton", EdgelordGui)
CartoonMode.Size = UDim2.new(0.112, 0, 0.1, 0)
CartoonMode.Position = UDim2.new(0.863, 0, 0.53, 0)
CartoonMode.BackgroundColor3 = Color3.new(0, 0, 0)
CartoonMode.Text = "Cartoon Mode(Disabled)"
CartoonMode.TextScaled = true
CartoonMode.TextColor3 = Color3.new(255, 255, 255)
CartoonMode.Font = Enum.Font.Cartoon
CartoonMode.Transparency = 0.4
CartoonMode.Visible = false
AddCorner(CartoonMode, 5)
local TouchToTelekinetic = true
local CartoonPush = false
CartoonMode.MouseButton1Click:Connect(function()
	if CartoonMode.Text == "Cartoon Mode(Enabled)" then
		CartoonMode.Text = "Cartoon Mode(Disabled)"
		CartoonPush = false
	else
		CartoonMode.Text = "Cartoon Mode(Enabled)"
		CartoonPush = true
	end
end)
TelekineticOnTap.MouseButton1Click:Connect(function()
	if TelekineticOnTap.Text == "Telekinetic OnTap(Enabled)" then
		TelekineticOnTap.Text = "Telekinetic OnTap(Disabled)"
		TouchToTelekinetic = false
	else
		TelekineticOnTap.Text = "Telekinetic OnTap(Enabled)"
		TouchToTelekinetic = true
	end
end)
local DaShowing = Instance.new("TextButton",EdgelordGui)
DaShowing.Size = UDim2.new(0.02, 0, 0.58, 0)
DaShowing.Position = UDim2.new(0.978, 0, 0.05, 0)
DaShowing.BackgroundColor3 = Color3.new(0, 0, 0)
DaShowing.Text = ">"
DaShowing.TextSize = 25
DaShowing.TextColor3 = Color3.new(255, 255, 255)
DaShowing.Font = Enum.Font.SourceSans
DaShowing.Transparency = 0.4
DaShowing.Visible = false
AddCorner(DaShowing, 5)
DaShowing.MouseButton1Click:Connect(function()
	if DaShowing.Text == ">" then
		DaShowing.Text = "<"
		EAbilityButton.Visible = false
		TAbilityButton.Visible = false
		FAbilityButton.Visible = false
		TelekineticOnTap.Visible = false
		CartoonMode.Visible = false
	else
		DaShowing.Text = ">"
		EAbilityButton.Visible = true
		TAbilityButton.Visible = true
		FAbilityButton.Visible = true
		TelekineticOnTap.Visible = true
		CartoonMode.Visible = true
	end
end)

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

if not game.CoreGui:FindFirstChild("Notification Maker") then
    local screenGui = Instance.new("ScreenGui", game.CoreGui)
    screenGui.Name = "Notification Maker"
end
local screenGui = game.CoreGui:FindFirstChild("Notification Maker")
if not screenGui:FindFirstChild("notificationCenter") then
    local notificationCenter = Instance.new("Frame")
    notificationCenter.Size = UDim2.new(0.2, 0, 1, 0)
    notificationCenter.Position = UDim2.new(0.8, 0, 0, 0)
    notificationCenter.BackgroundTransparency = 1
    notificationCenter.Parent = screenGui
    notificationCenter.Name = "notificationCenter"
end
local notificationCenter = screenGui:FindFirstChild("notificationCenter")

local notifications = {}
local function updateNotificationPositions()
    for i, notification in ipairs(notifications) do
        local targetPos = UDim2.new(1, -(100 * i + 10 * (i - 1)) - 10, 0.65, 0)
        TweenService:Create(notification, TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = targetPos}):Play()
    end
end

local function AddCorner(instance, radius)
    local corner = Instance.new("UICorner", instance)
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

local function AddStroke(instance, thickness)
	local Stroke = Instance.new("UIStroke", instance)
	Stroke.Color = Color3.new(0, 0, 0)
	Stroke.Thickness = thickness
	return Stroke
end

local function createCooldown(Notify)
    if Notify.Fill == nil then Notify.Fill = 0 end
    
    local notification = Instance.new("Frame", notificationCenter)
    notification.Size = UDim2.new(0, 100, 0, 50)
    notification.Position = UDim2.new(1, 10, 0.65, 0)
    notification.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    notification.BorderColor3 = Color3.fromRGB(30, 30, 30)
    notification.BorderSizePixel = 2
    notification.Active = true
    table.insert(notifications, 1, notification)
    AddCorner(notification, 5)
    AddStroke(notification, 2)
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0.5, 0)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = Notify.Title
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 14
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.Parent = notification
    
    local timeFrame = Instance.new("Frame") 
    timeFrame.Size = UDim2.new(0.9, 0, 0.35, 0)
    timeFrame.Position = UDim2.new(0.05, 0, 0.5, 0)
    timeFrame.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
    timeFrame.BorderSizePixel = 0
    timeFrame.Parent = notification
    AddCorner(timeFrame, 5)
    local timeBar = Instance.new("Frame")
    timeBar.BackgroundColor3 = Color3.new(1, 1, 1)
    timeBar.BorderSizePixel = 0
    timeBar.Parent = timeFrame
    AddCorner(timeBar, 5)
    
    local showTween = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0, 0, 0, 0)})
    showTween:Play()
    updateNotificationPositions()

    local startTime = tick()
    local cooldownEnded = false
    RunService.RenderStepped:Connect(function()
        if not cooldownEnded then
            local elapsedTime = tick() - startTime
            if elapsedTime < Notify.Time then
                timeBar.Size = UDim2.new(1 - (elapsedTime / Notify.Time), 0, 1, 0)
            else
                timeBar.Size = UDim2.new(0, 0, 1, 0)
                cooldownEnded = true
				
                if Notify.Fill > 0 then
                    local fillTime = startTime + Notify.Time
                    RunService.RenderStepped:Connect(function()
		                local fillElapsedTime = tick() - fillTime
		                if fillElapsedTime < Notify.Fill then
		                    timeBar.Size = UDim2.new((fillElapsedTime / Notify.Fill), 0, 1, 0)
		                end
		            end)
                end
            end
        end
    end)
    
    local function endCooldown()
        if notification then
            table.remove(notifications, table.find(notifications, notification))
            cooldownEnded = true
            local hideTween = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1, 10, 0.65, 0)})
            hideTween:Play()
            hideTween.Completed:Connect(function()
                notification:Destroy()
                updateNotificationPositions()
            end)
        end
    end
    
    delay(Notify.Time + Notify.Fill, function()
        endCooldown()
    end)
    
    return notification 
end

--[[Create Animation/Animation Controller]]--
if game.ReplicatedStorage:FindFirstChild("TheForceAnim") == nil then
	local EdgeAnim = Instance.new("Animation")
	EdgeAnim.AnimationId = "rbxassetid://16102717448"
	EdgeAnim.Parent = game.ReplicatedStorage
	EdgeAnim.Name = "TheForceAnim"
	return EdgeAnim
end

local function PauseAnim(Anim)
    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
    local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
    for _, v in pairs(ActiveTracks) do
        if v.Animation.AnimationId == "rbxassetid://"..Anim then
            v:AdjustSpeed(0)
        end
    end
end

local function StopAnim(Anim)
    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
    local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
    for _, v in pairs(ActiveTracks) do
        if v.Animation.AnimationId == "rbxassetid://"..Anim then
            v:Stop()
        end
    end
end
--[[Create Sound]]--
local GasterTheme = Instance.new("Sound", EdgelordGui)
GasterTheme.SoundId = "rbxassetid://9133844756"
GasterTheme.Volume = 1
GasterTheme.Ended:Connect(function()
	GasterTheme:Play()
end)

local TelekineticSound = Instance.new("Sound", EdgelordGui)
TelekineticSound.SoundId = "rbxassetid://858508159"
TelekineticSound.Volume = 5

--[[Camera]]--
local function ShakeScreen(shakeTime, shakeIntensity)
    local originalRotation = workspace.CurrentCamera.CFrame
    local function Shake()
        local shakeX = (math.random() - 0.5) * 2
        local shakeY = (math.random() - 0.5) * 2
        local shakeRotation = CFrame.Angles(shakeIntensity * shakeX, shakeIntensity * shakeY, 0)
        workspace.CurrentCamera.CFrame = originalRotation * shakeRotation
    end
    local elapsedTime = 0
    while elapsedTime < shakeTime do
        Shake()
        wait(0.01)
        elapsedTime = elapsedTime + 0.01
    end
    workspace.CurrentCamera.CFrame = originalRotation
end

local tweens = {
    {Property = "FieldOfView", Goal = 70},
    {Property = "FieldOfView", Goal = 450},
    {Property = "FieldOfView", Goal = 80}
}

local function startTween(index)
    if index <= #tweens then
        local properties = {
            [tweens[index].Property] = tweens[index].Goal
        }
        local tween = game:GetService("TweenService"):Create(game.Workspace.CurrentCamera, TweenInfo.new(0.35, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0), properties)
        tween:Play()
        tween.Completed:Connect(function()
            startTween(index + 1)
        end)
    end
end
--[[Equip edgelord+ Ability]]--
if workspace:FindFirstChild("KCTimeErase") == nil then
	local KCTimeErase = Instance.new("Part", workspace)
	KCTimeErase.Position = Vector3.new(60, -8.8, 100)
	KCTimeErase.Name = "KCTimeErase"
	KCTimeErase.Size = Vector3.new(5000, 1, 5000)
	KCTimeErase.Anchored = true
	KCTimeErase.Transparency = 1
	KCTimeErase.CanCollide = false
end
local KCTimeErase = workspace:FindFirstChild("KCTimeErase")
KCTimeErase.CanCollide = false

--[[Sky]]--
if game.Lighting:FindFirstChild("DefaultSky") == nil then
	local defaultSky = game.Lighting:FindFirstChild("Sky")
	defaultSky.Name = "DefaultSky"
end
local defaultSky = game.Lighting:FindFirstChild("DefaultSky")

local skyBox = Instance.new("Sky")
skyBox.Name = "TimeEraseSky"
skyBox.SkyboxBk = "rbxthumb://type=Asset&id=17558415793&w=150&h=150"
skyBox.SkyboxDn = "rbxthum
