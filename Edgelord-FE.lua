--///////////[Wait For Game]\\\\\\\\\--
if not game:IsLoaded() then
    game.Loaded:Wait()
end

--///////////[Loadstrings]\\\\\\\\\--
loadstring(game:HttpGet("https://raw.githubusercontent.com/OMOHOTA/GeneralSB/main/Credit_owner.lua"))()
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

--///////////[Send Credit]\\\\\\\\\--
game.StarterGui:SetCore("SendNotification", {Title = "YouTube OMOHOTA", Text = "Script made by" .. CreditName.SourceYoutube .. "/" .. CreditName.DisplayYoutube .. ", Subscribe now.", Duration = 6})

--///////////[Lobby Check+Destroy Old]\\\\\\\\\--
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

--///////////[Create SettingZone]\\\\\\\\\--
local SafeSpotEdgeLord = Instance.new("Part", workspace)
SafeSpotEdgeLord.Position = Vector3.new(86, -12173, 78)
SafeSpotEdgeLord.Name = "SafeSpotEdgeLord"
SafeSpotEdgeLord.Size = Vector3.new(100, 0.1, 100)
SafeSpotEdgeLord.Anchored = true
SafeSpotEdgeLord.Transparency = 0
SafeSpotEdgeLord.CanCollide = true

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("SafeSpotEdgeLord").CFrame * CFrame.new(0, 1, 0)

--///////////[Create functionGUI]\\\\\\\\\--
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
    Notify.Title = Notify.Title
    Notify.Time = Notify.Time

    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 100, 0, 50)
    notification.Position = UDim2.new(1, 10, 0.65, 0)
    notification.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    notification.BorderColor3 = Color3.fromRGB(30, 30, 30)
    notification.BorderSizePixel = 2
    notification.Parent = notificationCenter
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
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.Parent = notification
    local timeFrame = Instance.new("Frame") timeFrame.Size = UDim2.new(0.9, 0, 0.35, 0)
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
        end
    end
end)
local function endCooldown()
    cooldownEnded = true
    timeBar.Size = UDim2.new(0, 0, 1, 0)
end
    notification.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            endCooldown()
        end
    end)

    notification.TouchTap:Connect(function()
        endCooldown()
    end)

    delay(Notify.Time, function()
        if notification then
            table.remove(notifications, table.find(notifications, notification))
            local hideTween = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1, 10, 0.65, 0)})
            hideTween:Play()
            hideTween.Completed:Connect(function()
                notification:Destroy()
                updateNotificationPositions()
            end)
        end
    end)
end

local function createCooldown2(Notify)
    Notify.Title = Notify.Title
    Notify.Time = Notify.Time

    local notification = Instance.new("Frame")
    notification.Size = UDim2.new(0, 100, 0, 50)
    notification.Position = UDim2.new(1, -(100 * #notifications + 10 * (#notifications - 1)) - 10, 0.65, 0)
    notification.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    notification.BorderColor3 = Color3.fromRGB(30, 30, 30)
    notification.BorderSizePixel = 2
    notification.Parent = notificationCenter
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
    titleLabel.TextSize = 16
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
                timeBar.Size = UDim2.new((elapsedTime / Notify.Time), 0, 1, 0)
            else
                timeBar.Size = UDim2.new(1, 0, 1, 0)
                cooldownEnded = true
            end
        end
    end)

    notification.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            endCooldown()
        end
    end)

    notification.TouchTap:Connect(function()
        endCooldown()
    end)

    local function endCooldown()
        cooldownEnded = true
        timeBar.Size = UDim2.new(1, 0, 1, 0)
    end

    delay(Notify.Time, function()
        if notification then
            table.remove(notifications, table.find(notifications, notification))
            local hideTween = TweenService:Create(notification, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Position = UDim2.new(1, 10, 0.65, 0)})
            hideTween:Play()
            hideTween.Completed:Connect(function()
                notification:Destroy()
                updateNotificationPositions()
            end)
        end
    end)
end
--///////////[Create Animation/Animation Controller]\\\\\\\\\--
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
--///////////[Create Sound]\\\\\\\\\--
local GasterTheme = Instance.new("Sound", EdgelordGui)
GasterTheme.SoundId = "rbxassetid://9133844756"
GasterTheme.Volume = 1
GasterTheme.Ended:Connect(function()
	GasterTheme:Play()
end)

local TelekineticSound = Instance.new("Sound", EdgelordGui)
TelekineticSound.SoundId = "rbxassetid://858508159"
TelekineticSound.Volume = 5

--///////////[Camera]\\\\\\\\\--
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
--///////////[Equip edgelord+ Ability]\\\\\\\\\--
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

--///////////[Sky]\\\\\\\\\--
if game.Lighting:FindFirstChild("DefaultSky") == nil then
	local defaultSky = game.Lighting:FindFirstChild("Sky")
	defaultSky.Name = "DefaultSky"
end
local defaultSky = game.Lighting:FindFirstChild("DefaultSky")

local skyBox = Instance.new("Sky")
skyBox.Name = "TimeEraseSky"
skyBox.SkyboxBk = "rbxthumb://type=Asset&id=17558415793&w=150&h=150"
skyBox.SkyboxDn = "rbxthumb://type=Asset&id=17558415793&w=150&h=150"
skyBox.SkyboxFt = "rbxthumb://type=Asset&id=17558415793&w=150&h=150"
skyBox.SkyboxLf = "rbxthumb://type=Asset&id=17558415793&w=150&h=150"
skyBox.SkyboxRt = "rbxthumb://type=Asset&id=17558415793&w=150&h=150"
skyBox.SkyboxUp = "rbxthumb://type=Asset&id=17558415793&w=150&h=150"
skyBox.Parent = nil

--///////////[Sound Effect]\\\\\\\\\--
-- Create and set properties for KCEndSound if it doesn't exist in workspace
local KCEndSound = workspace:FindFirstChild("KCEndSound")
if not KCEndSound then
    KCEndSound = Instance.new("Sound", workspace)
    KCEndSound.Name = "KCEndSound"
    KCEndSound.SoundId = "rbxassetid://3763437293"
    KCEndSound.Volume = 3
end

-- Create and set properties for PartBreak if it doesn't exist in workspace
local PartBreak = workspace:FindFirstChild("PartBreak")
if not PartBreak then
    PartBreak = Instance.new("Sound", workspace)
    PartBreak.Name = "PartBreak"
    PartBreak.SoundId = "rbxassetid://3923230963"
    PartBreak.Volume = 7
end

-- Create and set properties for PartBreak2 if it doesn't exist in workspace
local PartBreak2 = workspace:FindFirstChild("PartBreak2")
if not PartBreak2 then
    PartBreak2 = Instance.new("Sound", workspace)
    PartBreak2.Name = "PartBreak2"
    PartBreak2.SoundId = "rbxassetid://3923230963"
    PartBreak2.Volume = 7
end

-- Create and set properties for TickSound if it doesn't exist in workspace
local TickSound = workspace:FindFirstChild("TickSound")
if not TickSound then
    TickSound = Instance.new("Sound", workspace)
    TickSound.Name = "TickSound"
    TickSound.SoundId = "rbxassetid://9133682204"
    TickSound.Volume = 3
    TickSound.Ended:Connect(function()
        TickSound:Play()
    end)
end

--///////////[Script]\\\\\\\\\--

local function TimeErase()
	KCTimeErase.CanCollide = true
	PartBreak:Play()
	if game.ReplicatedStorage:FindFirstChild("Arena") == nil and workspace:FindFirstChild("Arena") ~= nil then
		workspace:FindFirstChild("Arena").Parent = game.ReplicatedStorage
	end
	wait(.1)
	PartBreak2:Play()
	ShakeScreen(.1 ,.4)
	wait(.3)
		local edge1 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("EdgelordGui")
		if edge1 then
			edge = true
			_G.CanStopEdgelord = false
		else
			edge = nil
		end
		TurnInvisible() 
		local SL = game.StarterGui.MobileShiftLock:Clone()  SL.Parent = game.Players.LocalPlayer.PlayerGui
	defaultSky.Parent = nil
	skyBox.Parent = game.Lighting
	TickSound:Play()
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 35
	createCooldown({Title = "Domain Expansion", Time = 10})
	ShakeScreen(.1 ,.2)
	wait(10)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20
	skyBox.Parent = nil 
	defaultSky.Parent = game.Lighting
	KCTimeErase.CanCollide = false
	if game.ReplicatedStorage:FindFirstChild("Arena") ~= nil then
		game.ReplicatedStorage:FindFirstChild("Arena").Parent = workspace 
	end 
	TickSound:Stop()
	KCEndSound:Play()
		TurnVisible() 
		if edge == true then
			_G.CanStopEdgelord = true
		end
		local SL = game.StarterGui.MobileShiftLock:Clone()  SL.Parent = game.Players.LocalPlayer.PlayerGui
	createCooldown2({Title = "Domain Expansion", Time = 5})
	ShakeScreen(.16 ,.1)
end

local function edgelordGlove()
	OGlove = game.Players.LocalPlayer.leaderstats.Glove.Value
	game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.TheForceAnim):Play()
	game.Players.LocalPlayer.leaderstats.Glove.Value = "edgelord"
	wait(0.98)
	PauseAnim(16102717448)
	GasterTheme:Play()
	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
	wait(12.5)
	EAbilityButton.Visible = true
	TAbilityButton.Visible = true
	FAbilityButton.Visible = true
	TelekineticOnTap.Visible = true
	CartoonMode.Visible = true
	DaShowing.Visible = true
	startTween(1)
	ShakeScreen(.1, .8)
end

local CanBeTelekinetic = true
local lastClickTime = 0
local TelekineticCooldown = 1.4
loadstring(game:HttpGet(("https://raw.githubusercontent.com/OMOHOTA/GeneralSB/main/Slap_Aura.lua")))()

local function EClicked()
    if CanBeTelekinetic then return end
    if tick() - lastClickTime < TelekineticCooldown then
        return
    end
	
    CanBeTelekinetic = true
	createCooldown({Title = "Telekinetic Force", Time = 1.3})
    for i,v in pairs(game.Players:GetChildren()) do
		StopAnim(16102717448)
        game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.TheForceAnim):Play()
        TelekineticSound:Play()
        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
            if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") then
                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
                    local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if Magnitude <= 25 then
						if CartoonPush then
							game:GetService("ReplicatedStorage").slapstick:FireServer("dash")
						else
	                        gloveHits[OGlove]:FireServer(v.Character:WaitForChild("HumanoidRootPart"), true)
						end
                    end
                end
            end
        end
    end
	for _, c in pairs(workspace:GetChildren()) do
		if string.find(c.Name, "Å") and c:FindFirstChild("HumanoidRootPart") then
			local Magnitude2 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude
			if Magnitude2 <= 75 then
				gloveHits[OGlove]:FireServer(c:WaitForChild("HumanoidRootPart"), true)
			end
		end
	end
    lastClickTime = tick()
    CanBeTelekinetic = false
    wait(0.98)
	PauseAnim(16102717448)
end

local TeleportForPc = false
local Teleport = false
local TeleportPE = false
local function TClicked()
    if Teleport then 
        return 
    end
    Teleport = true
    TeleportPE = true
end

local function FClicked()
			if GasterTheme.Playing then
				GasterTheme:Stop()
			else
				GasterTheme:Play()
			end
end

if not game.ReplicatedStorage:FindFirstChild("DomainSummonAnimation") then
	local DomainSummon = Instance.new("Animation")
	DomainSummon.AnimationId = "rbxassetid://15561810697"
	DomainSummon.Parent = game.ReplicatedStorage
	DomainSummon.Name = "DomainSummonAnimation"
end

local CanDomainExpansion = false
local lastClickTime2 = 0
local DomainCooldown = 15
local Players, ReplicatedStorage = game:GetService("Players"), game:GetService("ReplicatedStorage")
ReplicatedStorage:WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("OnMessageDoneFiltering").OnClientEvent:Connect(function(message)
    local sender, receiver = message.FromSpeaker, game.Players.LocalPlayer
    local msg = message.Message or ""
    
    if msg:lower() == "domain expansion" or msg:lower() == "domain expansion " or msg:lower() == "king crimson" or msg:lower() == "king crimson " and sender and sender == receiver.Name then
	    if CanDomainExpansion then return end
	    if tick() - lastClickTime2 < DomainCooldown then
	        return
	    end
	    lastClickTime2 = tick()
	    CanDomainExpansion = false
		local CutSence = tick()
		StopAnim(16102717448)
		game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.DomainSummonAnimation, game.Players.LocalPlayer.Character.Humanoid):Play()
		local SGD = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
			local IMAGEDOMAIN = Instance.new("ImageLabel", SGD)
			IMAGEDOMAIN.Size = UDim2.new(0.3, 0, 0.8, 0)
			IMAGEDOMAIN.Position = UDim2.new(0.1, 0, 0.05, 0)
			IMAGEDOMAIN.Image = "rbxthumb://type=Asset&id=15318959176&w=150&h=150"
			local TEXTDOMAIN = Instance.new("TextLabel")
			TEXTDOMAIN.Parent = SGD
			TEXTDOMAIN.Size = UDim2.new(0, 400, 0, 50)
			TEXTDOMAIN.Position = UDim2.new(0.3, 0, 0.1, 0)
			TEXTDOMAIN.TextSize = 50
			TEXTDOMAIN.Text = "//Domain Expansion: Erase Time//"
			TEXTDOMAIN.BackgroundTransparency = 1
			TEXTDOMAIN.Font = Enum.Font.SourceSansBold
			TEXTDOMAIN.TextColor3 = Color3.fromRGB(255, 255, 255)
			AddStroke(TEXTDOMAIN, 4)
		while tick() - CutSence < 2.4 do
		    local playerHeadPosition = game.Players.LocalPlayer.Character.Head.Position
		    game.Workspace.CurrentCamera.CFrame = CFrame.new(playerHeadPosition, playerHeadPosition - game.Players.LocalPlayer.Character.Head.CFrame.LookVector)
		    game.Workspace.CurrentCamera.FieldOfView = 20
		    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
		    local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
		    for _, v in pairs(ActiveTracks) do
		        if v.Animation.AnimationId == "rbxassetid://15561810697" then
		            v:AdjustSpeed(.5)
		        end
		    end
		    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 0
		    wait()
		end
		wait(2)
		SGD:Destroy()
		game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.DomainSummonAnimation, game.Players.LocalPlayer.Character.Humanoid):Stop()
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 20 
		game.Workspace.CurrentCamera.FieldOfView = 70
		TimeErase()
    end
end)

--///////////[OnDead]\\\\\\\\\--
local function PlayerDead()
	if _G.CanStopEdgelord == false then return end
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("EdgelordGui") then
		fireclickdetector(workspace.Lobby[OGlove].ClickDetector)
		game.Players.LocalPlayer.leaderstats.Glove.Value = OGlove
	    CanBeTelekinetic = true
		CanDomainExpansion = true
	    Teleport = false
	    TeleportPE = false
	    TeleportForPc = false
	    TouchToTelekinetic = true
	    CartoonPush = false
		GasterTheme:Stop()
		EdgelordGui:Destroy()
		game.Workspace.Camera.FieldOfView = 70
		for _, v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
		    if v.ClassName == "Part" and v.Name == "BLOCK" then
		        v.CanTouch = true
		    end
		end
		workspace.DEATHBARRIER.CanTouch = true
		workspace.DEATHBARRIER2.CanTouch = true
		workspace.dedBarrier.CanTouch = true
		workspace.ArenaBarrier.CanTouch = true
		workspace.AntiDefaultArena.CanTouch = true
	end
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("EdgelordGui") ~= nil then
		game.Players.LocalPlayer.PlayerGui:FindFirstChild("EdgelordGui"):Destroy()
	end
	if game.Workspace:FindFirstChild("SafeSpotEdgeLord") ~= nil then
		game.Workspace:FindFirstChild("SafeSpotEdgeLord"):Destroy()
	end
end

--///////////[function connect]\\\\\\\\\--
game:GetService("UserInputService").InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch and TeleportPE then
		local Teleportpos = game.Players.LocalPlayer:GetMouse().Hit+Vector3.new(0,2.5,0)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Teleportpos.X,Teleportpos.Y,Teleportpos.Z)
		Teleport = false
		TeleportPE = false
	end
end)

local function onInputBegan(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if not TouchToTelekinetic then return end
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch or input.KeyCode == Enum.KeyCode.E then
        EClicked()
    end
end
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.T and TeleportForPc then
		local Teleportpos = game.Players.LocalPlayer:GetMouse().Hit+Vector3.new(0,2.5,0)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Teleportpos.X,Teleportpos.Y,Teleportpos.Z)
    end
end)
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        FClicked()
    end
end)
EAbilityButtonReal.MouseButton1Click:Connect(EClicked)
TAbilityButtonReal.MouseButton1Click:Connect(TClicked)
FAbilityButtonReal.MouseButton1Click:Connect(FClicked)
game.Players.LocalPlayer.CharacterAdded:Connect(PlayerDead)
game:GetService("UserInputService").InputBegan:Connect(onInputBegan)
--///////////[Others]\\\\\\\\\--
local EffectUI = Instance.new("Frame",EdgelordGui)
EffectUI.Size = UDim2.new(0.3, 0, 0.3, 0)
EffectUI.Position = UDim2.new(0.34, 0, -0.2, 0)
EffectUI.BackgroundColor3 = Color3.new(1, 1, 1)
EffectUI.BorderColor3 = Color3.new(0, 0, 0)
EffectUI.BorderSizePixel = 1
EffectUI.Active = false
local EffectUICorner = Instance.new("UICorner", EffectUI)
EffectUICorner.CornerRadius = UDim.new(0, 20)


local PhaseEffect = Instance.new("ImageButton", EffectUI)
PhaseEffect.Size = UDim2.new(0.28, 0, 0.48, 0)
PhaseEffect.Position = UDim2.new(0.05, 0, 0.42, 0)
PhaseEffect.BackgroundColor3 = Color3.new(0, 0, 0)
PhaseEffect.BorderColor3 = Color3.new(0, 0, 0)
PhaseEffect.BorderSizePixel = 1
PhaseEffect.Image = "rbxthumb://type=Asset&id=13780996974&w=150&h=150"
PhaseEffect.MouseButton1Click:Connect(function()
	local OGlove = game.Players.LocalPlayer.leaderstats.Glove.Value
	EffectUI.Visible = false
    fireclickdetector(workspace.Lobby.Phase.ClickDetector)
    wait(0.3)
    if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Phase" then
	    game.StarterGui:SetCore("SendNotification", {Title = "ERROR!", Text = "You don't have Phase glove", Duration = 2})
		EffectUI.Visible = true
	else
	    wait(0.3)
	    game:GetService("ReplicatedStorage").PhaseA:FireServer()
	    fireclickdetector(workspace.Lobby.Diamond.ClickDetector)
		game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
	    wait(6.4)
	    game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
	    game:GetService("ReplicatedStorage").Ghostinvisibilitydeactivated:FireServer()
	    EffectUI.Visible = true
	    fireclickdetector(workspace.Lobby[OGlove].ClickDetector)
	end
end)



local KineticEffect = Instance.new("ImageButton", EffectUI)
KineticEffect.Size = UDim2.new(0.28, 0, 0.48, 0)
KineticEffect.Position = UDim2.new(0.36, 0, 0.42, 0)
KineticEffect.BackgroundColor3 = Color3.new(0, 0, 0)
KineticEffect.BorderColor3 = Color3.new(0, 0, 0)
KineticEffect.BorderSizePixel = 1
KineticEffect.Image = "rbxthumb://type=Asset&id=858523025&w=150&h=150"
KineticEffect.MouseButton1Click:Connect(function()
	local OGlove = game.Players.LocalPlayer.leaderstats.Glove.Value
	EffectUI.Visible = false
	fireclickdetector(workspace.Lobby.Kinetic.ClickDetector)
	wait(0.5)
	if game.Players.LocalPlayer.leaderstats.Glove.Value ~= "Kinetic" then
		game.StarterGui:SetCore("SendNotification", {Title = "ERROR!", Text = "You don't have Kinetic glove to get effect", Duration = 2})
		EffectUI.Visible = true
	else
		for i = 1, 100 do
			game:GetService("ReplicatedStorage").SelfKnockback:FireServer(unpack({[1] = {["Direction"] = Vector3.new(-0, 0.5, -0),["Force"] = 0}}))
			wait(0.01)
		end
		EffectUI.Visible = true
	    fireclickdetector(workspace.Lobby[OGlove].ClickDetector)
	end
end)



local StartUsing = Instance.new("TextButton", EffectUI)
StartUsing.Size = UDim2.new(0.28, 0, 0.48, 0)
StartUsing.Position = UDim2.new(0.67, 0, 0.42, 0)
StartUsing.BackgroundColor3 = Color3.new(0, 0, 0)
StartUsing.BorderColor3 = Color3.new(0, 0, 0)
StartUsing.BorderSizePixel = 1
StartUsing.Text = "Start"
StartUsing.TextSize = 40
StartUsing.TextColor3 = Color3.new(255, 255, 255)
StartUsing.Font = Enum.Font.SourceSans
StartUsing.MouseButton1Click:Connect(function()
	if game.Players.LocalPlayer.leaderstats.Glove.Value == "Default" then
		game.StarterGui:SetCore("SendNotification", {Title = "Notification!", Text = "Telekinetic Push won't work with default glove, turn on Cartoon Mode to enable.", Duration = 2})
	end
    EffectUI.Visible = false
    edgelordGlove()
	TeleportForPc = false
	CanBeTelekinetic = false
end)
