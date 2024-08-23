--[[Setting Value]]--
if not getgenv().DeathGlove then
	getgenv().DeathGlove = {
		HideClients = true,
		MuteClientSounds = false,
		HideFEScythe = false,
		ClientDeathTheme = true,
		BoostValue = 50, --[[MAX = 80]]--
	}
end
if DeathGlove.BoostValue > 50 then DeathGlove.BoostValue = 50 end
--[[Wait For Game]]--
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local abilityFrame
--[[NOTIFY GUI]]--
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

 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/notificationtest"))();
 local Notify = Notification.Notify;

--[[VARIABLES]]--
 PlaceId, JobId = game.PlaceId, game.JobId
 local Players = game:GetService("Players")
 local UserInputService = game:GetService("UserInputService")
 local TweenService = game:GetService("TweenService")
 local Debris = game:GetService("Debris")
 local RunService = game:GetService("RunService")
 local TeleportService = game:GetService("TeleportService")
 local RunService2 = game:FindService("RunService")
 local StarterGui = game:GetService("StarterGui")
 local SoundService = game:GetService("SoundService")
 local ReplicatedStorage = game:GetService("ReplicatedStorage")
 local Player = game.Players.LocalPlayer
 local Character = Player.Character or Player.CharacterAdded:Wait()
 local Torso = Character:WaitForChild("Torso",15)
 local Head = Character:WaitForChild("Head",15)
 local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
 local Humanoid = Character and Character:FindFirstChildWhichIsA("Humanoid")
--[VARIABLES2]--
 local lobby = game.Workspace.Lobby
 local HideClients = DeathGlove.HideClients
 local MuteClientSounds = DeathGlove.MuteClientSounds
 local DeathThemeEnabled = DeathGlove.ClientDeathTheme
 local HideFEScythe = DeathGlove.HideFEScythe
 local BoostValue = 0
 local OLGlove = Player.leaderstats.Glove.Value
 local ShowScythe = false
 local HoldingGlove = false
 local CanStopScript = true
 local DeadDisconnected = false
 local NewGlove = "Death"
 local NewTooltip = "Upgraded version of Reaper W"
 local CustomTexture = "15785747117"
--[VARIABLES ABILITIES]]--
local BlessedCubeConnection
local ReturnBrickConnection
local DeathPassiveConnection
local DeathCubeBoost = false
local PassiveOnCD
local lastLmbTime = 0
local LmbCooldown = .7
local LastRapidSlashTime = 0
local ECooldown = 3
local STUN
local CanLmb
local CantRapidSlash
local SuperJumpCD
local SeismicDescentCD
local StompCD
local DashCD
local DashCD2
local ScytheSpinCD
local ScytheSpin
local OmnidirectionalCleaveCD
local SpectralMoving
-- Ability CD
local function AbilityCDSet(Value)
	STUN = Value
	CantRapidSlash = not Value
	PassiveOnCD = not Value
	CanLmb = not Value
	SuperJumpCD = Value
	SeismicDescentCD = Value
	StompCD = Value
	DashCD = Value
	DashCD2 = Value
	ScytheSpinCD = Value
	ScytheSpin = Value
	OmnidirectionalCleaveCD = Value
    SpectralMoving = Value
end

--[[Check For Running]]--
if Player.leaderstats.Glove.Value == NewGlove then Notify({Description = "Script already running" ; Title = "Error"; Duration = 5;}); return end
if OLGlove == "Extended" or OLGlove == "Dual" or OLGlove == "spin" or OLGlove == "Diamond" or OLGlove == "Zombie" then Notify({Description = "Death glove does not support for the " .. OLGlove .. " Glove!" ; Title = "Error"; Duration = 5;}); return end
if game.CoreGui:FindFirstChild("Death_Gui") then game.CoreGui:FindFirstChild("Death_Gui"):Destroy() end
if game.ReplicatedStorage:FindFirstChild("DeathStorage") then game.ReplicatedStorage:FindFirstChild("DeathStorage"):Destroy() end
--[[CREDIT]]--
loadstring(game:HttpGet("https://raw.githubusercontent.com/OMOHOTA/GeneralSB/main/Credit_owner.lua"))()
Notify({Description = "Made by " .. getgenv().CreditName.DisplayYoutube .. "/" .. getgenv().CreditName.SourceYoutube ; Title = "Script Credit!"; Duration = 5;});
if workspace:FindFirstChild("Death's AntiVoid") then
	workspace:FindFirstChild("Death's AntiVoid"):Destroy()
end

-- God Mode
local function DeathPassive()
    if game.Players.LocalPlayer.Character and not DeadDisconnected and not PassiveOnCD then
	    for i,v in pairs(game.Workspace:GetChildren()) do
            if v.Name == "wall" then
                v.CanCollide = false
            end
        end
        for i,v in pairs(game.Workspace:GetChildren()) do
            if string.find(v.Name, "ÅBarrier") then
                if v.CanCollide == false then
                    v.CanCollide = true
                 end
            end
       end
       if game.Players.LocalPlayer.Character:FindFirstChild("YouHaveGotMail") then
			game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = true
		end
        if game.Players.LocalPlayer.Character:FindFirstChild("Head") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
	        if game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == true then
            	PassiveOnCD = true 
				workspace.BountyHunterRoom.BountyHunterBooth._configPart.OpenRemote:InvokeServer()
				task.wait(.3)
				workspace.BountyHunterRoom.BountyHunterBooth._configPart.LeaveRemote:FireServer()
				task.wait(.5)
				PassiveOnCD = false
			end
		end
	end
end
-- Anti Barries
local function NotAntiBarriers(Value)
	local Cube = game:GetService("Workspace").Arena.CubeOfDeathArea:FindFirstChild("the cube of death(i heard it kills)")
	if Cube then
		Cube.CanTouch = Value
	end
	for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
        if v.ClassName == "Part" and v.Name == "BLOCK" then
            v.CanTouch = Value
            v.CanCollide = not Value
        end
    end
	workspace.DEATHBARRIER.CanTouch = Value
	workspace.DEATHBARRIER2.CanTouch = Value
	workspace.dedBarrier.CanTouch = Value
	workspace.ArenaBarrier.CanTouch = Value
	workspace.AntiDefaultArena.CanTouch = Value
	workspace.DEATHBARRIER.CanCollide = not Value
	workspace.DEATHBARRIER2.CanCollide = not Value
	workspace.dedBarrier.CanCollide = not Value
	workspace.ArenaBarrier.CanCollide = not Value
	workspace.AntiDefaultArena.CanCollide = not Value
	for i,v in pairs(workspace.Lobby.LobbyFrame:GetDescendants()) do
		if v.ClassName == "Script" then
			v.Parent.CanTouch = Value
		end
	end
	if workspace:FindFirstChild("dedBarrier") then
		workspace.dedBarrier.CanTouch = Value
	end
	if workspace:FindFirstChild("ArenaBarrier") then
		workspace.ArenaBarrier.CanTouch = Value
	end
	if workspace:FindFirstChild("AntiDefaultArena") then
		workspace.AntiDefaultArena.CanTouch = Value
	end
end
-- Slap Aura
loadstring(game:HttpGet(("https://raw.githubusercontent.com/OMOHOTA/GeneralSB/main/Slap_Aura.lua")))()
local function SlapTarget(Glove, User)
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character and v == User then
            if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("Mirage") == nil and v.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil and v.Character:FindFirstChild("Stevebody") == nil then
                    gloveHits[Glove]:FireServer(v.Character:WaitForChild("HumanoidRootPart"), true)
                    break 
                 end
            end
        end
    end
end
local function SlapAura(Glove, Range)
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
            if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("Mirage") == nil and v.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil and v.Character:FindFirstChild("Stevebody") == nil then
                    local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if Magnitude <= Range then
                        gloveHits[Glove]:FireServer(v.Character:WaitForChild("HumanoidRootPart"), true)
                    end
                end
            end
        end
    end
end

local function SlapAura2(Glove, Range)
    for i,v in pairs(game.Players:GetChildren()) do
        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
            if v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("stevebody") == nil and v.Character:FindFirstChild("Mirage") == nil and v.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil and v.Character:FindFirstChild("Stevebody") == nil then
                    local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    if Magnitude <= Range then
                        gloveHits[Glove]:FireServer(v.Character:WaitForChild("HumanoidRootPart"), true)
                        break 
                    end
                end
            end
        end
    end
end
-- Get nearest
local function getNearestPlayer(Range)
    local nearestPlayer = nil
    local shortestDistance = Range

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.Head:FindFirstChild("UnoReverseCard") == nil and player.Character:FindFirstChild("Stevebody") == nil and player.Character:FindFirstChild("rock") == nil and player.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and player.Character:FindFirstChild("Mirage") == nil and player.Character.HumanoidRootPart:FindFirstChild("Digging") == nil and player.leaderstats.Glove.Value ~= "Spectator" then
            local targetPosition = player.Character.HumanoidRootPart.Position
            local localPosition = Player.Character.HumanoidRootPart.Position
            local distance = (targetPosition - localPosition).magnitude
            if distance < shortestDistance then
                shortestDistance = distance
                nearestPlayer = player
            end
        end
    end
    return nearestPlayer
end
-- Check Character
local function NotFullCharacter()
    if game.Players.LocalPlayer.Character then
        if game.Players.LocalPlayer.Character:FindFirstChild("Head") and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
	        if game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false then
	            return false
            end
        end
    end
    print("Player part missing")
    return true
end

--[[Bypass]]--
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

--[[CooldownMaker]]--
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

local function createCooldown(Notify)
    if Notify.Fill == nil then Notify.Fill = 0 end
    Notify.Time = Notify.Time - 0.025
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

--[[SCREENGUI]]--
local DeathStorage = game.ReplicatedStorage:FindFirstChild("DeathStorage")
if not DeathStorage then
    DeathStorage = Instance.new("Folder", ReplicatedStorage)
    DeathStorage.Name = "DeathStorage"
end

local SG = game.CoreGui:FindFirstChild("Death_Gui")
if not SG then
	SG = Instance.new("ScreenGui", game.CoreGui)
	SG.Name = "Death_Gui"
end

local colorcorrect = game:GetService("Lighting"):FindFirstChild("HYPE")
if not colorcorrect then
	 colorcorrect = Instance.new("ColorCorrectionEffect", game:GetService("Lighting"))
	 colorcorrect.Name = "HYPE"
end
--[[Sound]]--
local createSound = function(instance,soundid,volume,destroy,pitch)
	if MuteClientSounds then return end
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. soundid
	sound.Volume = volume
	sound.Parent = instance
	sound:Play()
	if pitch then
		sound.PlaybackSpeed = pitch
	end
	if destroy == true then
		task.spawn(function()
		sound.Ended:Wait()
		sound:Destroy()
		end)
	else
		return sound
	end
end

local function SoundCreate(Name, Id)
	Sound = workspace:FindFirstChild(Name)
	if not Sound then
	    Sound = Instance.new("Sound", SG)
	    Sound.Name = Name
	    Sound.SoundId = "rbxassetid://".. Id
	    Sound.Volume = 1
		return Sound
	end
end
DeathTheme1 = SoundCreate("DeathTheme1", 1837301451) or workspace:FindFirstChild("DeathTheme1")
DeathTheme1.Ended:Connect(function()
	DeathTheme1:Play()
end)

--[[Functions]]--
local function CubeOfBoost()
	if workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless") then
		workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless"):Destroy()
	end
	local CubeBuff = Instance.new("Part", workspace.Arena.CubeOfDeathArea)
	CubeBuff.Position = game:GetService("Workspace").Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CFrame.Position - Vector3.new(0, 1.7, 0)
	CubeBuff.Anchored = true
	CubeBuff.Name = "Death's bless"
	CubeBuff.Size = Vector3.new(.5, 60, 60)
	CubeBuff.Material = Enum.Material.Neon 
	CubeBuff.Color = Color3.new(0, 0, 0) 
	CubeBuff.Shape = Enum.PartType.Cylinder 
	CubeBuff.CFrame = CubeBuff.CFrame * CFrame.Angles(0, 0, math.rad(90))
	
	local CubeBuff2 = CubeBuff:Clone()
	CubeBuff2.Size = Vector3.new(.4, 62.5, 62.5)
	CubeBuff2.Color = Color3.new(1,1,1) 
	CubeBuff2.CFrame = CubeBuff.CFrame
	CubeBuff2.Parent = CubeBuff
end

local function BlessedCube(hit)
    if DeathCubeBoost and not DeadDisconnected then
        if hit:IsDescendantOf(Character) then
	        local touchingPlayer = game.Players:GetPlayerFromCharacter(hit.Parent)
	        if touchingPlayer and touchingPlayer.UserId == Player.UserId then
		        Humanoid.WalkSpeed = Humanoid.WalkSpeed * 1.5
				BoostValue = DeathGlove.BoostValue
		        createSound(Head,3508218059,10,true)
		        chatFunc1("(The Death Cube has returned a portion of the power that originally belonged to you)")
		        task.spawn(function()
				    task.wait(5)
				    if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
				        game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
				    end
				end)
		        DeathCubeBoost = false
			end
	    end
	end
end

local function ReturnToArena(hit)
    if not DeadDisconnected then
        if hit:IsDescendantOf(Character) then
	        local touchingPlayer = game.Players:GetPlayerFromCharacter(hit.Parent)
	        if touchingPlayer and touchingPlayer.UserId == Player.UserId then
		        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
		        createSound(Head,3508218059,10,true)
			end
		end
	end
end

--[[CHAT]]--
function swait()
	game:GetService("RunService").Stepped:wait()
end
function chatFunc1(msg, timr, size)
	if HideClients then return end
    spawn(function()
        msg = "* " .. msg
        timr = 30
        local MRC_A = BrickColor.new("White")
        local MRC_B = BrickColor.new("Really black")
        local namebillboard = Instance.new("BillboardGui")
        if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
            game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
        end
        local textt = Instance.new("TextBox")
        namebillboard.Size = UDim2.new(20, 0,1, 0)
        namebillboard.Name = "NameBillboard"
        namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
        namebillboard.Parent = Head
        textt.TextWrapped = true
        textt.BackgroundTransparency = 1
        textt.BackgroundColor3 = Color3.new(1, 1, 1)
        textt.TextSize = size or 14
        textt.TextScaled = true
        textt.Font = Enum.Font.Arcade
        textt.Text = msg or ''
        textt.TextStrokeTransparency = 0
        textt.TextStrokeColor3 = MRC_B.Color
        textt.TextColor = MRC_A
        textt.Size = UDim2.new(1, 0, 1, 0)
        textt.Parent = namebillboard
        for i = 1,string.len(msg),1 do
            local newtxt = string.sub(msg,1,i)
            textt.Text = newtxt
            textt.Text = newtxt
            namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
            --CFuncs["Sound"].Create("rbxassetid://434975206", Torso, 5,1)
            local audio = Instance.new("Sound",Head)
            audio.SoundId = "rbxassetid://4742745849"
            audio.Name = "voice"
            Debris:AddItem(audio,.5)
            local random = Random.new()
            audio.PlaybackSpeed = random:NextNumber(.99, 1.01)
            audio:Play()
            task.wait(.01)
        end
        local RM = math.random(1,2)
        local DR = 0
        wait(20)
        for i=1,timr do swait()
            if RM == 1 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            elseif RM == 2 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            end
        end
        namebillboard:Destroy()
    end)
end

function chatFunc2(msg, timr, size)
	if HideClients then return end
    spawn(function()
        msg = "* " .. msg
        timr = 30
        local MRC_A = BrickColor.new("White")
        local MRC_B = BrickColor.new("Really black")
        local namebillboard = Instance.new("BillboardGui")
        if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
            game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
        end
        local textt = Instance.new("TextBox")
        namebillboard.Size = UDim2.new(20, 0,1, 0)
        namebillboard.Name = "NameBillboard"
        namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
        namebillboard.Parent = Head
        textt.TextWrapped = true
        textt.BackgroundTransparency = 1
        textt.BackgroundColor3 = Color3.new(1, 1, 1)
        textt.TextSize = size or 14
        textt.TextScaled = true
        textt.Font = Enum.Font.Arcade
        textt.Text = msg or ''
        textt.TextStrokeTransparency = 0
        textt.TextStrokeColor3 = MRC_B.Color
        textt.TextColor = MRC_A
        textt.Size = UDim2.new(1, 0, 1, 0)
        textt.Parent = namebillboard
        for i = 1,string.len(msg),1 do
            local newtxt = string.sub(msg,1,i)
            textt.Text = newtxt
            textt.Text = newtxt
            namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
            local audio = Instance.new("Sound",Head)
            audio.SoundId = "rbxassetid://4742745849"
            audio.Name = "voice"
            Debris:AddItem(audio,.5)
            local random = Random.new()
            audio.PlaybackSpeed = random:NextNumber(.99, 1.01)
            audio:Play()
            task.wait(.01)
        end
        local RM = math.random(1,2)
        local DR = 0
        wait(20)
        for i=1,timr do swait()
            if RM == 1 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            elseif RM == 2 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            end
        end
        namebillboard:Destroy()
    end)
end

function chatFunc3(msg, timr, size)
	if HideClients then return end
    spawn(function()
        timr = 30
        local r = true
        local MRC_A = BrickColor.new("White")
        local MRC_B = BrickColor.new("Really black")
        local namebillboard = Instance.new("BillboardGui")
        if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
            game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
        end
        local textt = Instance.new("TextBox")
        namebillboard.Size = UDim2.new(20, 0,3, 0)
        namebillboard.Name = "NameBillboard"
        namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
        namebillboard.Parent = Head
        namebillboard.Brightness = 4
        textt.TextWrapped = true
        textt.BackgroundTransparency = 1
        textt.BackgroundColor3 = Color3.new(1, 1, 1)
        textt.TextSize = size or 35
        textt.TextScaled = true
        textt.Font = Enum.Font.Arcade
        textt.Text = msg or ''
        textt.TextStrokeTransparency = 1
        textt.TextStrokeColor3 = MRC_B.Color
        textt.TextColor = MRC_A
        textt.Size = UDim2.new(1, 0, 1, 0)
        textt.Parent = namebillboard
        local ghost_textt1 = textt:Clone()
        ghost_textt1.Parent = namebillboard
        ghost_textt1.ZIndex = -5
        ghost_textt1.TextTransparency = .05
        local ghost_textt2 = textt:Clone()
        ghost_textt2.Parent = namebillboard
        ghost_textt2.ZIndex = -5
        ghost_textt2.TextTransparency = .05
        local ghost_textt3 = textt:Clone()
        ghost_textt3.Parent = namebillboard
        ghost_textt3.ZIndex = -5
        ghost_textt3.TextTransparency = .05
        task.spawn(function()
            while true do
                pcall(function()
                    textt.Position = UDim2.new(0,math.random(-50,50)/10,0,math.random(-50,50)/100)
                    ghost_textt1.Position = UDim2.new(0,math.random(-25,25),0,math.random(-25,25))
                    ghost_textt1.TextTransparency = .7 - textt.TextTransparency
                    ghost_textt1.Text = textt.Text
                    ghost_textt2.Position = UDim2.new(0,math.random(-25,25),0,math.random(-25,25))
                    ghost_textt2.TextTransparency = .7 - textt.TextTransparency
                    ghost_textt2.Text = textt.Text
                    ghost_textt3.Position = UDim2.new(0,math.random(-25,25),0,math.random(-25,25))
                    ghost_textt3.TextTransparency = .7 - textt.TextTransparency
                    ghost_textt3.Text = textt.Text
                    task.wait() end)
                if r == false then break end
            end
        end)
        for i = 1,string.len(msg),1 do
            local newtxt = string.sub(msg,1,i)
            textt.Text = newtxt
            textt.Text = newtxt
            namebillboard.StudsOffset = Vector3.new(0, 5.25, 0.01)
            local audio = Instance.new("Sound",Head)
            audio.SoundId = "rbxassetid://3015952289"
            audio.Name = "voice"
            audio.PlaybackSpeed = 1.2
            audio:Play()
            Debris:AddItem(audio,5)
            task.wait(.2) end
        local RM = math.random(1,2)
        local DR = 0
        task.wait(20)
        for i=1,timr do swait()
            if RM == 1 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            elseif RM == 2 then
                DR = DR + 1
                namebillboard.StudsOffset = Vector3.new(0, 3.25, 0.01)
                textt.TextStrokeTransparency = i/timr
                textt.TextTransparency = i/timr
            end
        end
        r = true
        namebillboard:Destroy()
    end)
end


--[[EFFECTS]]--
local function Highlight(plr)
    local Highlight = Instance.new("Highlight", SG)
    Highlight.Name = plr.Name
    Highlight.FillColor = Color3.fromRGB(0, 0, 0)
    Highlight.DepthMode = "AlwaysOnTop"
    Highlight.FillTransparency = 0
    Highlight.OutlineColor = Color3.fromRGB(255,255,255)
    Highlight.OutlineTransparency = 1
    local plrchar = plr.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end
end

local function Horn()
    if lobby.GloveStands.Killstreak.CultAuraAttachments:FindFirstChild("Horns") then
	    if Character.Head.FaceCenterAttachment:FindFirstChild("Horn1") and Character.Head.FaceCenterAttachment:FindFirstChild("Horn2") then
		    Character.Head.FaceCenterAttachment.Horn2:Destroy()
		    Character.Head.FaceCenterAttachment.Horn2:Destroy()
		end
        local CHorn1 = lobby.GloveStands.Killstreak.CultAuraAttachments:FindFirstChild("Horns"):Clone()
        local CHorn2 = lobby.GloveStands.Killstreak.CultAuraAttachments:FindFirstChild("Horns"):Clone()
        CHorn1.Name = "Horn1"
        CHorn2.Name = "Horn2"
        CHorn2.Parent = Character.Head.FaceCenterAttachment 
        CHorn1.Parent = Character.Head.FaceCenterAttachment 
        CHorn2 = Character.Head.FaceCenterAttachment.Horn2
        CHorn1 = Character.Head.FaceCenterAttachment.Horn1
        CHorn2.Acceleration = Vector3.new(2, 2, -1)
        CHorn1.Acceleration = Vector3.new(-2, 2, -1)
        CHorn1.EmissionDirection = Enum.NormalId.Right
        CHorn2.EmissionDirection = Enum.NormalId.Left
        CHorn1.Size = NumberSequence.new(.4, 0)
        CHorn2.Size = NumberSequence.new(.4, 0)
        CHorn1.Lifetime = NumberRange.new(.5)
        CHorn2.Lifetime = NumberRange.new(.5)
        CHorn1.Rate = 200
        CHorn2.Rate = 200
    end
end

local function CreateAttachment(Set)
	if Set.Parent:FindFirstChild(Set.Name) then
		Set.Parent:FindFirstChild(Set.Name):Destroy()
	end
	local attachment = Instance.new("Attachment", Set.Parent)
	attachment.Visible = false
    attachment.Name = Set.Name
	attachment.CFrame = Set.CFrame
	attachment.Rotation = Set.Rotation
	return attachment
end

local function CreateParticleEmitter(Set)
   if Set.Parent:FindFirstChild(Set.Name) then
      Set.Parent:FindFirstChild(Set.Name):Destroy()
   end
	local emitter = Instance.new("ParticleEmitter", Set.Parent)
	emitter.Name = Set.Name
	emitter.Texture = "rbxassetid://" .. Set.TextureId
	emitter.Speed = Set.Speed
	emitter.Rate = Set.Rate
	emitter.Lifetime = Set.Lifetime
	emitter.VelocitySpread = 0 
	emitter.Enabled = true
	emitter.Drag = Set.Drag
	emitter.Acceleration = Set.Acceleration
	emitter.Transparency = Set.Transparency
	emitter.VelocityInheritance = Set.VelocityInheritance
	emitter.Color = Set.Color
	if Set.Size then
	    emitter.Size = Set.Size
    end
	emitter.SpreadAngle = Set.SpreadAngle
	emitter.Rotation = Set.Rotation
	emitter.RotSpeed = Set.RotSpeed
	emitter.LockedToPart = true
    emitter.LightEmission = Set.LightEmission
    if Set.UnLockCam == true then
		emitter.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
	end
	return emitter
end

--[[Camera]]--
local start = tick()
function shakeCameraConnect(initialTrauma, shakeCentre, blur) 
    local iterator = 0
    local seed = Random.new():NextNumber()
    local blurEffect = nil
    if blur == true then
        blurEffect = Instance.new("BlurEffect")
        blurEffect.Size = 0
        blurEffect.Parent = game.Lighting
    end
    while initialTrauma > 0 do
        game:GetService("RunService").Heartbeat:Wait()
        local now = tick() - start
        iterator += 1
        local shake = (initialTrauma ^ 2)
        if shakeCentre then
            local distance = (workspace.CurrentCamera.CFrame.Position - shakeCentre).Magnitude
            shake = shake / math.clamp((distance * 0.1), 0.7, math.huge)
        end
        local noiseX = (math.noise(iterator, now, seed)) * shake
        local noiseY = (math.noise(iterator + 1, now, seed)) * shake
        local noiseZ = (math.noise(iterator + 2 + 1, now, seed)) * shake
        game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(noiseX, noiseY, noiseZ)
        workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * CFrame.Angles(noiseX / 50, noiseY / 50, noiseZ / 50)
        if blurEffect then
            blurEffect.Size = shake * 12
        end
        local falloffSpeed = 1.6
        initialTrauma = math.clamp(initialTrauma - falloffSpeed * game:GetService("RunService").Heartbeat:Wait(), 0, 1)
    end
    game.Players.LocalPlayer.Character.Humanoid.CameraOffset = Vector3.new(0, 0, 0)  
    if blurEffect then
        blurEffect:Destroy()
    end
end
local function shakeCamera(initialTrauma, shakeCentre, blur) 
	coroutine.wrap(function()
		shakeCameraConnect(initialTrauma, shakeCentre, blur) 
	end)()
end

--[[Animations]]--
local function PlayAnim(Name, Anim, Speed)
    local animation = game.Players.LocalPlayer.Character.Head:FindFirstChild(Name)
    if animation == nil then
        animation = Instance.new("Animation")
        animation.AnimationId = "rbxassetid://"..Anim
        animation.Name = Name
        animation.Parent = game.Players.LocalPlayer.Character.Head 
    else
        animation.AnimationId = "rbxassetid://"..Anim
    end
    if animation then
        local animInstance = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(animation)
        animInstance:Play()
        animInstance:AdjustSpeed(Speed)
    end
    return animation 
end

local function StopAnim(Name, Anim)
    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
    if not Humanoid then return end
    local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
    for _, v in pairs(ActiveTracks) do
        if v.Animation.AnimationId == "rbxassetid://"..Anim then
            v:Stop()
        end
    end
end

local function AnimSpeed(Name, Anim, Speed)
    local Humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") or game.Players.LocalPlayer.Character:FindFirstChildOfClass("AnimationController")
    if not Humanoid then return end
    local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
    for _, v in pairs(ActiveTracks) do
        if v.Animation.AnimationId == "rbxassetid://"..Anim then
            v:AdjustSpeed(Speed)
        end
    end
end


--[[FUNCTIONS]]--
local function HoldScythe(ToolName)
    local tool = Character:FindFirstChildWhichIsA("Tool")
    while ShowScythe == true do
	    if tool and tool.Name == ToolName then
			if not HideFEScythe then
				ReplicatedStorage.Scythe:FireServer("ScytheWeapon")
			end
	        tool = Character:FindFirstChildWhichIsA("Tool")
	    end
		wait(.45)
	end
end

--[[EQUIP GLOVE]]--
local function EquipGlove()
	local TimeGlovestatsChecker = false
	local StartTimeCheck = tick()
	local EndedTimeCheck = 300
	local TimeEnded = nil 
    Player.leaderstats.Glove.Value = NewGlove
    wait(0.1)
    Player.leaderstats.Glove.Value = NewGlove
    local tool
    while TimeEnded == nil and not DeadDisconnected do
	    if tick() - StartTimeCheck < EndedTimeCheck and not NotFullCharacter() then
		    if Player.leaderstats.Glove.Value ~= NewGlove then DeadDisconnected = true SG:Destroy() return end
			    tool = Character:FindFirstChildWhichIsA("Tool") or Player.Backpack:FindFirstChildWhichIsA("Tool")
			    if tool then 
				    if tool.Name == OLGlove then TimeEnded = false break
					else 
						Notify({Description = tool.Name .. "Do not match with the " .. OLGlove .. " glove you equipped, please enter regular portal"; Title = "Error"; Duration = 8;}); tool = nil SG:Destroy() return 
					end
				end 
		    else
			    Notify({Description = "You took too long to enter arena, died or ragdolled, script automatically stopped"; Title = "Error"; Duration = 5;}); DeadDisconnected = true TimeEnded = true Player.leaderstats.Glove.Value = OLGlove SG:Destroy() return
		    end 
	    wait()
    end
    if tool and game.Players.LocalPlayer.Character:FindFirstChild("entered") and not DeadDisconnected then
		if math.random() == 1 then
		    chatFunc1("I FEEL THE POWER!")
		elseif math.random() > 0.5 then 
			chatFunc1("The Power!")
		elseif math.random() < 0.5 then
			chatFunc1("This power...")
		else
			chatFunc1("...")
		end
		task.wait(1.4)
		workspace.BountyHunterRoom.BountyHunterBooth._configPart.OpenRemote:InvokeServer()
		task.wait(.3)
		workspace.BountyHunterRoom.BountyHunterBooth._configPart.LeaveRemote:FireServer()
		abilityFrame.Visible = true
		if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		    game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		end
		createSound(Head,3508218059,10,true)
		game:GetService("TweenService"):Create(colorcorrect,TweenInfo.new(.1,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Brightness = 2}):Play() 
		task.wait(.5)
	    if tool:FindFirstChildWhichIsA("LocalScript") then
	        tool:FindFirstChildWhichIsA("LocalScript").Enabled = false
	    end
	    Humanoid.WalkSpeed = 25
	    Humanoid.JumpPower = 50
		if workspace:FindFirstChild("Death's AntiVoid") then
			workspace:FindFirstChild("Death's AntiVoid"):Destroy()
		end
		local antivoid = Instance.new("Part", workspace)
		antivoid.Position = workspace.Origo.Position - Vector3.new( 0,109,0)
		antivoid.Name = "Death's AntiVoid"
		antivoid.Size = Vector3.new(2500, 100, 2500)
		antivoid.Anchored = true
		antivoid.Color = Color3.new(0, 0, 0)
		antivoid.Transparency = .9
		-- Unlock Abilities 
		DeathPassiveConnection = game:GetService("RunService").Heartbeat:Connect(DeathPassive)
		NotAntiBarriers(false)
		AbilityCDSet(false)
		PassiveOnCD = false
		workspace.Gravity = 196.2
	    tool.Name = tostring(NewGlove)
        tool.ToolTip = tostring(NewTooltip)
	    ShowScythe = true
	    tool.Equipped:Connect(function()
			createSound(Head, 6854065655, 5, true)
			HoldingGlove = true
			lastLmbTime = 0
	        coroutine.wrap(function()
			    HoldScythe(tool.Name)
			end)()
		end)
		tool.Unequipped:Connect(function()
			HoldingGlove = false
		end)
		CubeOfBoost()
		DeathCubeBoost = true
		local Bless = workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless") 
		local Return = workspace:FindFirstChild("Death's AntiVoid")
		if Bless then
			BlessedCubeConnection = Bless.Touched:Connect(BlessedCube)
		end
		if Return then
			ReturnBrickConnection = Return.Touched:Connect(ReturnToArena)
		end
		if DeathThemeEnabled then DeathTheme1:Play() end
		if HideClients ~= true then
			local toolSet = tool:FindFirstChild("Glove") or tool:WaitForChild("Glove")
			local HandleSet = tool:FindFirstChild("Handle") or tool:WaitForChild("Handle")
			Highlight(Player)
			Horn()
			if toolSet then
				local DeathAttachment = CreateAttachment{Parent = Character.Torso, Name =  "DeathAttachment", CFrame = CFrame.new(0, 2, 2.20000005, 1, 0, 0, 0, 0, -1, 0, 1, 0), Rotation = Vector3.new(-90, 0, 0)}
				local EffectAttachment = CreateAttachment{Parent = Character.Torso, Name = "EffectAttachment", CFrame = CFrame.new(0,-3, 0), Rotation = Vector3.new(0,0,0)}
				local CurseAttachment = Instance.new("Attachment", toolSet) CurseAttachment.Visible = false CurseAttachment.Name = "CurseAttachment" CurseAttachment.CFrame = CFrame.new(-0.165016174, 0.142364502, 0.0890109539, 1, 0, 0, 0, 1, 0, 0, 0, 1)
				local WatchAttachment = CreateAttachment{Parent = game.Players.LocalPlayer.Character.HumanoidRootPart, Name =  "WatchAttachment", CFrame = CFrame.new(0, 0.5, 1.49800003, 0, 0, -1, 0, 1, 0, 1, 0, 0), Rotation = Vector3.new(-90, 0, -180)}
				local WatchAttachment2 = CreateAttachment{Parent = game.Players.LocalPlayer.Character.HumanoidRootPart, Name =  "WatchAttachment2", CFrame = CFrame.new(0, 0.5, 1.49800003, 0, 0, -1, 0, 1, 0, 1, 0, 0), Rotation = Vector3.new(-90, 0, 0)}
				CreateParticleEmitter{Parent = WatchAttachment, Name = "grow", TextureId = 8966783318, Speed = NumberRange.new(0.001, 0.001), Rate = 100, Lifetime = NumberRange.new(1, 1), Drag = 0, Acceleration = Vector3.new(0, 0, 0), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0)}), VelocityInheritance = 0, Size = NumberSequence.new({NumberSequenceKeypoint.new(0, .5), NumberSequenceKeypoint.new(1, 0)}), Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0, 0)), LightEmission = 1, SpreadAngle = Vector2.new(0, 0), Rotation = NumberRange.new(0, 0), RotSpeed = NumberRange.new(36, 36), UnLockCam = true}
                CreateParticleEmitter{Parent = WatchAttachment, Name = "Clock", TextureId = 8966783318, Speed = NumberRange.new(0.001, 0.001), Rate = 1, Lifetime = NumberRange.new(10), Drag = 0, Acceleration = Vector3.new(0, 0, 0), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0)}), VelocityInheritance = 0, Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 3), NumberSequenceKeypoint.new(1, 3)}), Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0, 0)), LightEmission = 1, SpreadAngle = Vector2.new(0, 0), Rotation = NumberRange.new(0, 0), RotSpeed = NumberRange.new(36, 36), UnLockCam = true}
				CreateParticleEmitter{Parent = WatchAttachment2, Name = "Clock2", TextureId = 8966783318, Speed = NumberRange.new(0.001, 0.001), Rate = 1, Lifetime = NumberRange.new(10), Drag = 0, Acceleration = Vector3.new(0, 0, 0), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0)}), VelocityInheritance = 0, Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 5), NumberSequenceKeypoint.new(1, 5)}), Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 0, 0)), LightEmission = 1, SpreadAngle = Vector2.new(0, 0), Rotation = NumberRange.new(0, 0), RotSpeed = NumberRange.new(36, 36), UnLockCam = true}
				CreateParticleEmitter{Parent = DeathAttachment, Name = "DeathWings", TextureId = 795729504, Speed = NumberRange.new(0.0001, 0.0001), Rate = 12, Lifetime = NumberRange.new(5), Drag = 0, Acceleration = Vector3.new(0, 0, 0), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0)}), VelocityInheritance = 0, Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 5), NumberSequenceKeypoint.new(1, 6)}), Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(0, 0, 0)), LightEmission = 0, SpreadAngle = Vector2.new(0, 0), Rotation = NumberRange.new(0, 0), RotSpeed = NumberRange.new(0, 0), UnLockCam = true}
				CreateParticleEmitter{Parent = toolSet, Name = "DeadlyParticle", TextureId = 6764385668, Speed = NumberRange.new(2, 2), Rate = 666, Lifetime = NumberRange.new(5), Drag = 5.5, Acceleration = Vector3.new(0, 0.5, 0), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.189437, 0.18125), NumberSequenceKeypoint.new(0.730195, 0.45), NumberSequenceKeypoint.new(1, 0.85)}), VelocityInheritance = 1.25, Color = ColorSequence.new(Color3.new(0, 0.0313726, 0), Color3.new(0.0509804, 0, 1), Color3.new(0.0313726, 0, 0.0509804)), LightEmission = 1, SpreadAngle = Vector2.new(80, -80), Rotation = NumberRange.new(-360, -360), RotSpeed = NumberRange.new(-80, 80)}
				CreateParticleEmitter{Parent = CurseAttachment, Name = "ShadowPartice", TextureId = 6764385668, Speed = NumberRange.new(2, 2), Rate = 50, Lifetime = NumberRange.new(5), Drag = 5.5, Acceleration = Vector3.new(0, 0.5, 0), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.189437, 0.18125), NumberSequenceKeypoint.new(0.730195, 0.45), NumberSequenceKeypoint.new(1, 0.85)}), VelocityInheritance = 1.25, Color = ColorSequence.new(Color3.new(0, 0.0313726, 0), Color3.new(0.0509804, 0, 1), Color3.new(0.0313726, 0, 0.0509804)), LightEmission = 0, SpreadAngle = Vector2.new(80, -80), Rotation = NumberRange.new(-360, -360), RotSpeed = NumberRange.new(-80, 80)}
				CreateParticleEmitter{Parent = CurseAttachment, Name = "AuraParticle", TextureId = 6764385668, Speed = NumberRange.new(0, 0), Rate = 20, Lifetime = NumberRange.new(2), Drag = 0, Acceleration = Vector3.new(0, 0, 0), Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.189437, 0.18125), NumberSequenceKeypoint.new(0.730195, 0.45), NumberSequenceKeypoint.new(1, 0.85)}), VelocityInheritance = 1.15, Size = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.7, 4), NumberSequenceKeypoint.new(1, 0)}), Color = ColorSequence.new(Color3.new(1, 0, 0), Color3.new(1, 1, 1), Color3.new(0.0316, 0, 0.1804), Color3.new(0, 0, 0), Color3.new(0, 0, 0)), LightEmission = 1, SpreadAngle = Vector2.new(80, -80), Rotation = NumberRange.new(-360, -360), RotSpeed = NumberRange.new(-120, 120)}
				CreateParticleEmitter{Parent = EffectAttachment, Name = "DeathAura", TextureId = 8529175248, Speed = NumberRange.new(2, 2), Rate = 66, Lifetime = NumberRange.new(10), Drag = 1, Size = NumberSequence.new(3, 0), Acceleration = Vector3.new(0, 0.5, 0), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(0.189437, 0.18125), NumberSequenceKeypoint.new(0.730195, 0.45), NumberSequenceKeypoint.new(1, 0.85)}), VelocityInheritance = 1, Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(1, 0, 0), Color3.new(0.0509804, 0, 0.0313726)), LightEmission = 0, SpreadAngle = Vector2.new(40, -40), Rotation = NumberRange.new(-360, 360), RotSpeed = NumberRange.new(-80, 80)}
				CreateParticleEmitter{Parent = EffectAttachment, Name = "particle", TextureId = 14958149389, Speed = NumberRange.new(2, 2), Rate = 20, Lifetime = NumberRange.new(10), Drag = .8, Size = NumberSequence.new(2, 0), Acceleration = Vector3.new(0, 0.5, 0), Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 0), NumberSequenceKeypoint.new(1, 0), NumberSequenceKeypoint.new(1, 0.85)}), VelocityInheritance = 1.25, Color = ColorSequence.new(Color3.new(0, 0, 0), Color3.new(.8, 0, 0), Color3.new(0.0313726, 0, 0.0509804)), LightEmission = 0, SpreadAngle = Vector2.new(60, -60), Rotation = NumberRange.new(-360, 360), RotSpeed = NumberRange.new(-80, 80)}					
				local light = Instance.new("PointLight", toolSet)
				light.Brightness = 6
				light.Color = Color3.new(1,1,1)
			    toolSet.Color = Color3.new(0, 0, 0)
			    toolSet.Transparency = 0
			    toolSet.Material = Enum.Material.Neon
				HandleSet.Color = Color3.new(0, 0, 0)
				HandleSet.Transparency = 0
				HandleSet.Material = Enum.Material.Neon
			end
		end
		game:GetService("TweenService"):Create(colorcorrect,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Brightness = 0}):Play()
		shakeCamera(30, Character.HumanoidRootPart.Position, true)
		chatFunc3("DEATH")
		task.spawn(function()
		    task.wait(5)
		    if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
    else
	    Notify({Description = "You took too long to enter arena, script automatically stopped"; Title = "Error"; Duration = 5;}); DeadDisconnected = true Player.leaderstats.Glove.Value = OLGlove
        return
    end
end

--[[Abilities]]--
local function LmbClicked()
    if DeadDisconnected or not CanLmb or not HoldingGlove or STUN or NotFullCharacter() then return end
    if tick() - lastLmbTime < LmbCooldown then
        return
    end
    STUN = true
    CanLmb = false
    createSound(Head,4861863043, 5,true)
    PlayAnim("DeathSlash1", 16102426718, 1)
    SlapAura2(OLGlove, 20)
    createCooldown({Title = "Scythe Swing", Time = .7})
    lastLmbTime = tick()
    task.wait(.7)
    STUN = false
    CanLmb = true
    StopAnim("DeathSlash1", 16102426718, 1)
end

local function RapidSlashAbility()
	local BoostedTeleport = BoostValue
	if BoostedTeleport ~= 0 then BoostedTeleport = BoostedTeleport - 30 end
    if DeadDisconnected or not CantRapidSlash or not HoldingGlove or STUN then return end
    if tick() - LastRapidSlashTime < ECooldown then
        return
    end
    CantRapidSlash = false
    STUN = true
	chatFunc2("rapid slash")
	task.spawn(function()
	    task.wait(2)
	    if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
	        game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
	    end
	end)
    PlayAnim("ScytheCharge", 16102532028, 2)
    wait(.6)
    ReplicatedStorage.slapstick:FireServer("fullcharged")
    StopAnim("ScytheCharge", 16102532028, 1)
    PlayAnim("ScytheAttack", 16102535685, 1)
    ReplicatedStorage.slapstick:FireServer("dash")
	local forward = Character.HumanoidRootPart.CFrame.LookVector * (50 + BoostedTeleport)
	Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame + forward
	createSound(Head,4861863043, 5,true)
    task.wait()
    ReplicatedStorage.slapstick:FireServer("dash")
    shakeCamera(7, Character.HumanoidRootPart.Position, true)
    createCooldown({Title = "Rapid Slash", Time = 3})
    LastRapidSlashTime = tick()
    CantRapidSlash = true
    task.wait(.5)
    STUN = false
    task.wait(2)
    StopAnim("ScytheAttack", 16102535685, 1)
end

local function SeismicDescent()
	if DeadDisconnected or not HoldingGlove or NotFullCharacter() or SeismicDescentCD or STUN then return end
	SeismicDescentCD = true
	DashCD2 = true
	STUN = true
	if game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
		chatFunc2("Seismic Descent")
		task.spawn(function()
		    task.wait(2)
		    if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
	    local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	    bv.Velocity = Vector3.new(0, 100, 0)
	    bv.Name = "bv"
	    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
	    PlayAnim("SeismicDescent", 15437009238, 1.6)
	    game:GetService("Debris"):AddItem(bv, .5)
	    task.wait(.1)
	    bv:Destroy()
	    local bv2 = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
	    bv2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	    bv2.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 150
	    bv2.Name = "bv"
	    game:GetService("Debris"):AddItem(bv2, .1)
	    task.wait(.1)
	    bv2:Destroy()
	    task.wait(.4)
	    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
	    StopAnim("SeismicDescent", 15437009238)
	    SlapAura(OLGlove, 50)
	    if StompCD == false then ReplicatedStorage.RetroAbility:FireServer("Bomb") else ReplicatedStorage.slapstick:FireServer("fullcharged") end
	    local BvB = game.Players.LocalPlayer.Character.HumanoidRootPart:WaitForChild("BodyVelocity", .5)
	    if BvB and BvB.Name ~= "bv" then
	        BvB:Destroy()
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
			shakeCamera(3, game.Players.LocalPlayer.Character.HumanoidRootPart.Position, true)
		end
		createCooldown({Title = "Seismic Descent", Time = 1.5})
	else
		chatFunc2("Seismic Descent")
		task.spawn(function()
		    task.wait(2)
		    if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
	    local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	    bv.Velocity = Vector3.new(0, 600, 0)
	    bv.Name = "bv"
	    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 0
	    PlayAnim("SeismicDescent", 15437009238, 2.4)
	    game:GetService("Debris"):AddItem(bv, .5)
	    task.wait(.1)
	    bv:Destroy()
	    local bv2 = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
	    bv2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	    bv2.Velocity = (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 250) + Vector3.new(0, -200, 0)
	    bv2.Name = "bv"
	    game:GetService("Debris"):AddItem(bv2, .1)
	    task.wait(.1)
	    bv2:Destroy()
		task.wait(.1)
	    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
	    StopAnim("SeismicDescent", 15437009238)
		PlayAnim("LeapEnded", 14772482253, 1.25)
		task.wait(.225)
		SlapAura(OLGlove, 50)
		if StompCD == false then ReplicatedStorage.RetroAbility:FireServer("Bomb") else ReplicatedStorage.slapstick:FireServer("fullcharged") end
	    local BvB = game.Players.LocalPlayer.Character.HumanoidRootPart:WaitForChild("BodyVelocity", .5)
	    if BvB and BvB.Name ~= "bv" then
	        BvB:Destroy()
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
			shakeCamera(3, game.Players.LocalPlayer.Character.HumanoidRootPart.Position, true)
		end
		task.wait(.1)
		StopAnim("LeapEnded", 14772482253)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
		createCooldown({Title = "SeismicDescent", Time = 1.5})
	end
	task.wait(.5)
	STUN = false
	task.wait(1)
	SeismicDescentCD = false
	DashCD2 = false
	return bv, bv2
end


local function Dash()
    if DeadDisconnected or DashCD or DashCD2 or STUN or NotFullCharacter() then return end
    local DashPower = 60 + BoostValue
    DashCD = true
	STUN = true
    local dashDirection = nil
    local lookVector = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector
	local moveDirection = game.Players.LocalPlayer.Character.Humanoid.MoveDirection
	if moveDirection == Vector3.new(0,0,0) then
		dashDirection = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(lookVector.X, 0, lookVector.Z)
	else
		dashDirection = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(moveDirection.X, 0, moveDirection.Z)
	end
    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
    local bg = Instance.new("BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart)
	bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bg.D = 0
	bg.P = 500000
	bg.CFrame = CFrame.lookAt(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, dashDirection) 
    local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
    bv.Name = "bv"
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    createSound(game.Players.LocalPlayer.Character.Torso,1295417556, 1 ,true)
    if game.Players.LocalPlayer.Character.Humanoid.MoveDirection == Vector3.new(0,0,0) and game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
	    bv.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * DashPower
	    PlayAnim("Roll", 16299510063, 1.5)
    elseif game.Players.LocalPlayer.Character.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
	    bv.Velocity = game.Players.LocalPlayer.Character.Humanoid.MoveDirection * DashPower
	    PlayAnim("Dash", 15436359788, 1)
	elseif game.Players.LocalPlayer.Character.Humanoid.MoveDirection ~= Vector3.new(0,0,0) and game.Players.LocalPlayer.Character.Humanoid.FloorMaterial == Enum.Material.Air then
		bv.Velocity = game.Players.LocalPlayer.Character.Humanoid.MoveDirection * (DashPower + 10)
		PlayAnim("Roll", 16299510063, 2)
	elseif game.Players.LocalPlayer.Character.Humanoid.MoveDirection == Vector3.new(0,0,0) and game.Players.LocalPlayer.Character.Humanoid.FloorMaterial == Enum.Material.Air then
		bv.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * (DashPower + 10)
		PlayAnim("Roll", 16299510063, 2)
	end
    game:GetService("Debris"):AddItem(bv, DashPower)
    task.wait(.25)
    StopAnim("Dash", 15436359788)
    StopAnim("Roll", 16299510063)
    bv:Destroy()
    bg:Destroy()
    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
	task.wait(.1)
	DashCD = false
	STUN = false
	return bv
end

local function Stomp()
	if DeadDisconnected or not HoldingGlove or NotFullCharacter() then return end
	if not StompCD and not STUN and game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
	local NearestPlayer = getNearestPlayer(30)
		if NearestPlayer and NearestPlayer.Character and NearestPlayer.Character:FindFirstChild("HumanoidRootPart") then
			chatFunc2("Void Leap")
			task.spawn(function()
			    task.wait(2)
			    if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
			        game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
			    end
			end)
			StompCD = true
			STUN = true 
			ReplicatedStorage.slapstick:FireServer("fullcharged")
			ReplicatedStorage.RetroAbility:FireServer("Ban Hammer")
			task.wait(.25)
			local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
		    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv.Velocity = Vector3.new(0, 100, 0)
			bv.Name = "bv"
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
			PlayAnim("Stomp", 15437009238, 1)
			game:GetService("Debris"):AddItem(bv, .5)
			task.wait(.8)
			bv:Destroy()
			if NearestPlayer and NearestPlayer.Character and NearestPlayer.Character:FindFirstChild("HumanoidRootPart") and NearestPlayer.Character.Ragdolled.Value == true then
				local bodyVelocity = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
		        bodyVelocity.Velocity = ((NearestPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 0)).p - game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * 600
				task.wait(.2)
				bodyVelocity:Destroy()
				SlapAura(OLGlove, 50)
			end
			task.wait(.1)
			local bv2 = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
		    bv2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bv2.Velocity = Vector3.new(0, -200, 0)
			bv2.Name = "bv"
			game:GetService("Debris"):AddItem(bv2, .1)
			wait(.2)
			SlapAura(OLGlove, 50)
			task.wait(.10)
			bv2:Destroy()
			StopAnim("Stomp", 15437009238, 1)
		    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
			task.wait(.1)
			SlapAura(OLGlove, 35)
			shakeCamera(3, game.Players.LocalPlayer.Character.HumanoidRootPart.Position, true)
			task.wait(.5)
			STUN = false
			createCooldown({Title = "Void Leap", Time = 3.7})
			task.wait(3.7)
			StompCD = false
		end
	elseif not StompCD and not STUN and game.Players.LocalPlayer.Character.Humanoid.FloorMaterial == Enum.Material.Air then
		chatFunc2("Cataclysmic Stomp")
		task.spawn(function()
		    task.wait(2)
		    if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
		StompCD = true
		PlayAnim("Stomp", 16102767550, 2)
		task.wait(.2)
		ReplicatedStorage.RetroAbility:FireServer("Ban Hammer")
		local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = Vector3.new(0, -30, 0)
		bv.Name = "bv"
		task.wait(.1)
		bv:Destroy()
		createCooldown({Title = "Cataclysmic Stomp", Time = 4.5})
		task.wait(4.5)
		StompCD = false
	end
	return bv, bv2, bodyVelocity
end

local function SuperJump()
	if DeadDisconnected or NotFullCharacter() or SuperJumpCD or STUN then return end
	SuperJumpCD = true
	STUN = true
	if game.Players.LocalPlayer.Character.Humanoid.MoveDirection ~= Vector3.new(0, 0, 0) then
		PlayAnim("SuperJump", 16102806530, 2.4)
	    local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	    bv.Velocity = (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 150) + Vector3.new(0, 100, 0)
	    bv.Name = "bv"
		ReplicatedStorage.slapstick:FireServer("fullcharged")
	    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
	    task.wait(.1)
	    bv:Destroy()
	    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
	    StopAnim("SuperJump", 16102806530)
	else
		PlayAnim("SuperJump", 16102806530, 2.4)
		local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	    bv.Velocity = Vector3.new(0, 200, 0)
	    bv.Name = "bv"
		ReplicatedStorage.slapstick:FireServer("fullcharged")
	    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
	    task.wait(.1)
	    bv:Destroy()
	    game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
	    StopAnim("SuperJump", 16102806530)
  	end
	task.wait(.5)
	STUN = false
	task.wait(.5)
	SuperJumpCD = false
	return bv, bv2
end


local function ScytheSpinning()
    if DeadDisconnected or not HoldingGlove or NotFullCharacter() or ScytheSpinCD or STUN then return end
    ScytheSpinCD = true
    STUN = true
    if game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
	    createCooldown({Title = "Death's Cyclone", Time = 7, Fill = 5})
        chatFunc2("Death's Cyclone")
        task.spawn(function()
		    task.wait(5)
		    if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
        ScytheSpin = true
        workspace.CurrentCamera.FieldOfView = 90
        local originalPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Name = "bv"
        
        coroutine.wrap(function()
            while ScytheSpin do
                if NotFullCharacter() or not ScytheSpin then 
                    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bv") then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bv"):Destroy() 
                    end
                    workspace.CurrentCamera.FieldOfView = 70
                    break
                else
                    PlayAnim("ScytheSpinning", 15437009238, 8)
                    task.wait(0.1)
                    AnimSpeed("ScytheSpinning", 15437009238, 1)
                    task.wait(0.5)
                    StopAnim("ScytheSpinning", 15437009238, 2)
                end
            end
        end)()
        
        local LoopScytheSpin = true    
        coroutine.wrap(function()
            while LoopScytheSpin do
                if bv and not NotFullCharacter() then
                    bv.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 50
                    ReplicatedStorage.slapstick:FireServer("fullcharged")
                    task.wait(0.1)
                else
                    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bv") then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bv"):Destroy() 
                    end
                    workspace.CurrentCamera.FieldOfView = 70
                    break
                end
            end
        end)()
        local targetPlayer
        local targetFound = false
        local startTime = tick()
        coroutine.wrap(function()
            while LoopScytheSpin do
                if bv and not NotFullCharacter() then
                if not targetFound then
                    SlapAura(OLGlove, 30)
                else 
	                SlapTarget(OLGlove, targetPlayer)
                end
                else break end
                task.wait(0.8)
            end
        end)()
        
        while ScytheSpin do
            targetPlayer = getNearestPlayer(10)
            if targetPlayer then
                targetFound = true
                break
            end
            if tick() - startTime >= 7 then
                ScytheSpin = false
                break
            end
            task.wait(0.1)
        end

        if targetFound and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health ~= 0 and LoopScytheSpin then
            while tick() - startTime < 7 and targetPlayer and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character.Humanoid.Health ~= 0 and not NotFullCharacter() do
				local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
				local localPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				local distance = (targetPosition - localPosition).magnitude
				
				if distance < 150 then
				    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				        local targetHumanoid = targetPlayer.Character.Humanoid
				        if targetHumanoid and targetHumanoid.Health > 0 then
				            bv.Velocity = (targetPosition - localPosition).unit * (50 + BoostValue)
				        elseif targetHumanoid and targetHumanoid.Health <= 0 then
				            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalPosition
				        end
				    end
				else break end
                task.wait(0.1)
            end
        end
        ScytheSpin = false
        bv:Destroy()
        LoopScytheSpin = false
        workspace.CurrentCamera.FieldOfView = 70
        STUN = false
        wait(5)
        ScytheSpinCD = false
    else
	    createCooldown({Title = "Scythe Whirlwind", Time = 7.45, Fill = 5})
        chatFunc2("Scythe Whirlwind")
        task.spawn(function()
		    task.wait(5)
		    if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
        local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
	    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.Velocity = Vector3.new(0, -30, 0)
		bv.Name = "bv"
		task.wait(.1)
		bv:Destroy()
		workspace.CurrentCamera.FieldOfView = 90
    	PlayAnim("ScytheSpinning2", 16102682904, 8)
	    PlayAnim("ScytheSpinning1", 15505690455, 5)
		task.wait(.1)
		AnimSpeed("ScytheSpinning1" , 15505690455, .00001)
		workspace.CurrentCamera.FieldOfView = 90
        local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Name = "bv"
        local LoopScytheSpin = true
        coroutine.wrap(function()
            while LoopScytheSpin == true do
                if bv and not NotFullCharacter() and LoopScytheSpin == true then
                    bv.Velocity = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * 80
                    ReplicatedStorage.slapstick:FireServer("fullcharged")
                    task.wait(.1)
                else
	                if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bv") then game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bv"):Destroy() end
					StopAnim("ScytheSpinning2", 16102682904)
			        StopAnim("ScytheSpinning1", 15505690455)
					ScytheSpin = false
					workspace.CurrentCamera.FieldOfView = 70
                    break
                end
            end
        end)()
        coroutine.wrap(function()
            while LoopScytheSpin == true do
                if bv and not NotFullCharacter() and LoopScytheSpin == true then
	                SlapAura2(OLGlove, 20)
                else break end
                task.wait(.8)
            end
        end)()
		task.wait(6)
		ScytheSpin = false
		LoopScytheSpin = false
        task.wait(.25)
        bv:Destroy()
        StopAnim("ScytheSpinning2", 16102682904)
        StopAnim("ScytheSpinning2.5", 15505690455)
        workspace.CurrentCamera.FieldOfView = 70
        task.wait(.5)
        STUN = false
        task.wait(4.5)
        ScytheSpinCD = false 
    end    
    return bv
end

local function OmnidirectionalCleave()
	if DeadDisconnected or not HoldingGlove or NotFullCharacter() or OmnidirectionalCleaveCD or STUN then return end
	if game.Players.LocalPlayer.Character.Humanoid.FloorMaterial ~= Enum.Material.Air then
		STUN = true
		OmnidirectionalCleaveCD = true
		chatFunc1("Cleave Combo")
	    task.spawn(function()
	    	task.wait(5)
	        if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
	        	game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
		    end
		end)
		ReplicatedStorage.Prop:FireServer()
		wait(.2)
	    local bv = Instance.new("BodyVelocity")
	    bv.Name = "bv"
	    bv.Velocity = (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * -90) + (game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.UpVector * 50)
	    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge) 
	    bv.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
	    PlayAnim("Backflip", 16738720919, 1)
	    wait(0.1)
	    bv:Destroy()
	    wait(.2)
	    StopAnim("Backflip", 16738720919)
		wait(.3)
	    local player = game.Players.LocalPlayer
	    local character = player.Character or player.CharacterAdded:Wait()
        game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
	    local originalPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
	    local LoopSpectralMove = true
	    SpectralMoving = true 
	    local bv = Instance.new("BodyVelocity")
	    bv.Name = "bv"
	    bv.Parent = character.HumanoidRootPart
	    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
	    bv.Velocity = Vector3.new(0, 0, 0)
	    local bg = Instance.new("BodyGyro")
	    bg.Name = "bg"
	    bg.Parent = character.HumanoidRootPart
	    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
	    bg.P = 1000
	    bg.D = 50
	    local Camera = game.Workspace.CurrentCamera
		Camera.FieldOfView = 90
	    PlayAnim("Spectral Flight", 17569574003, 0)
	    PlayAnim("Spectral Flight2", 17332790610, 0)
		local targetPlayer
	    local targetFound = false
	    local moveDuration = 4
        local startTime = tick()
	    coroutine.wrap(function()
            while LoopSpectralMove and not targetFound do task.wait()
                if bv and bg and not NotFullCharacter() then
		            bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
		            character.Humanoid.PlatformStand = true            
		            bg.CFrame = Camera.CFrame
		            bv.Velocity = Vector3.new()
		            local CameraLookVector = Camera.CFrame.LookVector
				    bv.Velocity = CameraLookVector * 100
			    	game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
                else
                    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bv") then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bv"):Destroy() 
                    end
                    if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bg") then 
                        game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("bg"):Destroy() 
                    end
                    StopAnim("Spectral Flight", 17569574003)
	                StopAnim("Spectral Flight2", 17332790610)
	                game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
                    workspace.CurrentCamera.FieldOfView = 70
                    break
                end
            end
        end)()
	    while SpectralMoving do
	        targetPlayer = getNearestPlayer(10)
	        if targetPlayer then
	            targetFound = true
	            break
	        end
	        if tick() - startTime >= moveDuration then
	            SpectralMoving = false
	            break
	        end
	        task.wait(.1)
	    end
        local counter = 0
        local LastCounter = 7
	    if targetFound and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Health ~= 0 and LoopSpectralMove then
		    local moveDuration = 7
	        local startTime = tick()
            StopAnim("Spectral Flight", 17569574003)
	        StopAnim("Spectral Flight2", 17332790610)
            while tick() - startTime < moveDuration and counter <= LastCounter do
                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character.Humanoid.Health ~= 0 and not NotFullCharacter() then
 			   local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
				local localPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
				local distance = (targetPosition - localPosition).magnitude
				if distance < 150 then
				    if targetPlayer.Character and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then   
				        local targetHumanoid = targetPlayer.Character.Humanoid
				            if targetHumanoid and targetHumanoid.Health > 0 then
			                    character.Humanoid.AutoRotate = true
			           	 	character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame + targetPlayer.Character.HumanoidRootPart.CFrame.LookVector * 5
								createSound(Head,4861863043, 10,true)
	                        	PlayAnim("Cleave1", 16569959250, 20)
			    	        	wait(.1) 
                                SlapTarget(OLGlove, targetPlayer) counter = counter + 1
			                    wait()
				                bv.Velocity = (targetPosition - localPosition).unit * 300
						    	wait(.1)
                                bv.Velocity = Vector3.new(0, 0, 0)
				            elseif targetHumanoid and targetHumanoid.Health <= 0 then
				                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalPosition break
				            end
				        end
                    else break end
				else break end
                task.wait(.25)
            end
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") and targetPlayer.Character.Humanoid.Health ~= 0 and not NotFullCharacter() then
            StopAnim("Cleave1", 16569959250)
            ReplicatedStorage.slapstick:FireServer("dash")
            wait(.5)
            PlayAnim("EarthSlam", 16102907464, 2)
            targetPosition = targetPlayer.Character.HumanoidRootPart.Position
		    localPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
            character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            wait()
            character.HumanoidRootPart.CFrame = character.HumanoidRootPart.CFrame * CFrame.new(0,50,0)
            wait(0.2)
            bv.Velocity = (character.HumanoidRootPart.CFrame.UpVector * 400) * -1
            wait(.2)
            bv.Velocity = Vector3.new(0, 0, 0)
            ReplicatedStorage.slapstick:FireServer("fullcharged")
            end
        end
	    SpectralMoving = false
        LoopSpectralMove = false
        STUN = false
		Camera.FieldOfView = 70
		wait(.15)
	    if character and character.HumanoidRootPart then
	        if bv then bv:Destroy() end
	        if bg then bg:Destroy() end
	        character.Humanoid.PlatformStand = false
			character.Humanoid.AutoRotate = true
	        StopAnim("Spectral Flight", 17569574003)
	        StopAnim("Spectral Flight2", 17332790610)
	    end
		if targetFound then
			createCooldown({Title = "Cleaves Combo", Time = 8})
			task.spawn(function()
		    	task.wait(5)
		        if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        	game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
			    end
			end)
			wait(8)
			OmnidirectionalCleaveCD = false
		else
			createCooldown({Title = "Cleaves Combo", Time = 3})
			task.spawn(function()
		    	task.wait(5)
		        if game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard") then
		        	game.Players.LocalPlayer.Character.Head:FindFirstChild("NameBillboard"):Destroy()
			    end
			end)
			wait(3)
			OmnidirectionalCleaveCD = false
		end 
	else 
	end
    return bg, bv
end

--[[OnDead]]--
function PlayerDead()
	if not CanStopScript or DeadDisconnected then return end
	if workspace:FindFirstChild("Death's AntiVoid") then
		workspace:FindFirstChild("Death's AntiVoid"):Destroy()
	end
	if SG then
		SG:Destroy()
	end
	if DeathStorage then 
		DeathStorage:Destroy()
	end
	ShowScythe = false
	DeadDisconnected = true
	AbilityCDSet(true)
	HoldingGlove = false
	DeathTheme1:Stop()
	if workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless") then
		workspace.Arena.CubeOfDeathArea:FindFirstChild("Death's bless"):Destroy()
	end
	NotAntiBarriers(true)
	game.Players.LocalPlayer.leaderstats.Glove.Value = OLGlove
	if DeathPassiveConnection then
		DeathPassiveConnection:Disconnect()
	end
	if PlayerIsDeadConnection then
		PlayerIsDeadConnection:Disconnect()
	end
	if BlessedCubeConnection then 
    	BlessedCubeConnection:Disconnect()
	end 
	if ReturnBrickConnection then 
    	ReturnBrickConnection:Disconnect()
	end 
end
local PlayerIsDeadConnection = Player.CharacterAdded:Connect(PlayerDead)
--[[CONNECT]]--
abilityFrame = Instance.new("Frame", SG)
abilityFrame.Name = "AbilityFrame"
abilityFrame.Size = UDim2.new(0.3, 0, 0.25, 0) -- Kích thước của Frame
abilityFrame.Position = UDim2.new(0.67, 0, 0.6, 0) -- Vị trí của Frame
abilityFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Màu nền
abilityFrame.BorderSizePixel = 0
abilityFrame.BackgroundTransparency = 0.5
abilityFrame.Active = true
abilityFrame.Draggable = true
abilityFrame.Visible = false
-- Tạo UIGridLayout
local gridLayout = Instance.new("UIGridLayout")
gridLayout.CellSize = UDim2.new(.23, 0, 0.46, 0) -- Kích thước ô
gridLayout.FillDirection = Enum.FillDirection.Horizontal
gridLayout.Parent = abilityFrame

local function createAbilityButton(name, text, callback)
    local abilityButton = Instance.new("TextButton")
    abilityButton.Name = name
    abilityButton.Text = text
    abilityButton.TextScaled = true
    abilityButton.BackgroundColor3 = Color3.new(0, 0, 0)
    abilityButton.BorderColor3 = Color3.new(1, 1, 1)
    abilityButton.BorderSizePixel = 3
    abilityButton.TextColor3 = Color3.new(1, 1, 1)
	abilityButton.Font = Enum.Font.Arcade
    abilityButton.MouseEnter:Connect(function()
        local enlargeTween = TweenService:Create(abilityButton, TweenInfo.new(0.3), {Size = UDim2.new(1.05, 0, 1.05, 0)})
        local borderTween = TweenService:Create(abilityButton, TweenInfo.new(0.3), {BorderColor3 = Color3.fromRGB(255, 255, 0)}) -- Chuyển thành màu vàng
        enlargeTween:Play()
        borderTween:Play()
    end)
    abilityButton.MouseLeave:Connect(function()
        local shrinkTween = TweenService:Create(abilityButton, TweenInfo.new(0.3), {Size = UDim2.new(1, 0, 1, 0)})
        local borderTween = TweenService:Create(abilityButton, TweenInfo.new(0.3), {BorderColor3 = Color3.fromRGB(255, 255, 255)}) -- Quay lại màu trắng
        shrinkTween:Play()
        borderTween:Play()
    end)
    abilityButton.Parent = abilityFrame
    abilityButton.MouseButton1Click:Connect(callback)
    return abilityButton
end


createAbilityButton("Ability1", "1", function() 
LmbClicked()
end)
createAbilityButton("Ability2", "2", function() 
RapidSlashAbility()
end)
createAbilityButton("Ability3", "3", function() 
SeismicDescent()
end)
createAbilityButton("Ability4", "4", function() 
Stomp()
end)
createAbilityButton("Ability5", "5", function() 
OmnidirectionalCleave()
end)
createAbilityButton("Ability6", "6", function() 
ScytheSpinning()
end)
createAbilityButton("Ability7", "7", function() 
Dash()
end)
createAbilityButton("Ability8", "8", function() 
SuperJump()
end)



UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then -- or input.UserInputType == Enum.UserInputType.Touch 
        LmbClicked()
    end
end)


UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Two then
        RapidSlashAbility()
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Three then
        SeismicDescent()
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Four then
        Stomp()
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Five then
        OmnidirectionalCleave()
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Six then
        ScytheSpinning()
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Seven then
        Dash()
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Eight then
        SuperJump()
    end
end)

UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.One then
        LmbClicked()
    end
end)

--[[Activate Script]]--
AbilityCDSet(true)
EquipGlove()
