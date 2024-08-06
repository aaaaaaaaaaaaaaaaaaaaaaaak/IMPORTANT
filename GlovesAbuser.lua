--[[Wait For Game]]--
if not game:IsLoaded() then
    game.Loaded:Wait()
end

--[[Loadstrings]]--
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/notificationtest"))();
local Notify = Notification.Notify;
loadstring(game:HttpGet("https://raw.githubusercontent.com/OMOHOTA/GeneralSB/main/Credit_owner.lua"))()
Notify({Description = "Made by " .. getgenv().CreditName.DisplayYoutube .. "/" .. getgenv().CreditName.SourceYoutube ; Title = "Script Credit!"; Duration = 5;});

------------/// Remove Old Gui \\\------------
if _G.MultiGloveAbuser then
	if game.Players.LocalPlayer.PlayerGui:FindFirstChild(getgenv().CreditName.DisplayYoutube .. "GUI" .. _G.MultiGloveAbuser) then
	    game.Players.LocalPlayer.PlayerGui:FindFirstChild(getgenv().CreditName.DisplayYoutube .. "GUI" .. _G.MultiGloveAbuser):Destroy()
	end
end

------------/// Create Value \\\------------
if _G.MultiGloveAbuser == nil then
    local function generateRandomWord(length)    
        local characters =  " ̷̧̢͉͎̦̖̼̥͕̮̮͇̠̩͍̼̞̰̹̘̲̥̲͚͉̲̟̝̩̳̪͉̙͔̭̺͔̪̺͂̎̈̓̂̾̀̏͌́̿̿̽̎̐̈̀̿͗̄̔͐́̅́͐͐͋̑͊͑̀̽̈̕͘̕͜͜͠͝ ̷̧̡̨̢͕̬̖̯̮͖̠͖͓̣̼̤̹̬̩̤̙͎̥̠͖̤̫̻̖̼͙̪̦̞̯͖̪̠͙͖̙͆͒̌̿̈́̾͂̇̉́̒̈́̏̔͛̑̀̇̈́̂͊͘̚̚ͅ ̷̢̢̢̩̩̭̻̙̥̼̝͎͓͖̼͎̙̣̝̦̳̩̮̼̗̱͉̖̖̜̲͔͕̙̦̱̣̦̹̓̽͊ͅͅ ̶̈͑͛̋͊̊̄͆̈́̂"
        local word = ""   
        for i = 1, length do
            local randomIndex = math.random(1, #characters)
            word = word .. string.sub(characters, randomIndex, randomIndex)
        end
        return word
    end
    _G.MultiGloveAbuser = generateRandomWord(10)
end

------------/// Find Value \\\------------
maxWaitTime = 5
elapsedTime = 0
while _G.MultiGloveAbuser == nil do
    wait(0.1)
    elapsedTime = elapsedTime + 0.1
    if elapsedTime >= maxWaitTime then
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Error", Text = "Script can't run due to some Error from Value, Please try again!", Duration = 5})
        break
    end
end

------------/// Create Screen Gui \\\------------
SourceGlovesAbuserGui = Instance.new("ScreenGui")
SourceGlovesAbuserGui.Name = getgenv().CreditName.DisplayYoutube .. "GUI" .. _G.MultiGloveAbuser
SourceGlovesAbuserGui.ResetOnSpawn = false
SourceGlovesAbuserGui.Parent = game.Players.LocalPlayer.PlayerGui


------------/// Create MainBar \\\------------
MainBar = Instance.new("Frame")
MainBar.Name = "MainBar"
MainBar.Size = UDim2.new(0.35 , 0, 0.05, 0)
MainBar.Position = UDim2.new(0.12, 0, 0.3, 0)
MainBar.BackgroundColor3 = Color3.new(1, 1, 1)
MainBar.BorderSizePixel = 2
MainBar.Active = true
MainBar.Draggable = true
MainBar.Parent = SourceGlovesAbuserGui
-- MainBar Text --
MainBarTitle = Instance.new("TextLabel", MainBar)
MainBarTitle.Name = "MainBarTitle"
MainBarTitle.Size = UDim2.new(1, 0, 1, 0)
MainBarTitle.Position = UDim2.new(-0.1, 0, 0, 0)
MainBarTitle.Text = "Slap Battle | Glove Abuser Gui"
MainBarTitle.TextSize = 13
MainBarTitle.TextColor3 = Color3.new(0, 0, 0)
MainBarTitle.Font = Enum.Font.Cartoon
MainBarTitle.BackgroundTransparency = 1
local StrokeMain = Instance.new("UIStroke", MainBarTitle)
StrokeMain.Thickness = 0.25
-- MainBar's Destroy Button 
local DestroyMainBar = Instance.new("TextButton", MainBar)
DestroyMainBar.Name = "DestroyMainBar"
DestroyMainBar.Size = UDim2.new(0.1, 0, 1, 0)
DestroyMainBar.Position = UDim2.new(0.9, 0, 0, 0)
DestroyMainBar.Text = "X"
DestroyMainBar.TextSize = 12
DestroyMainBar.TextColor3 = Color3.new(0, 0, 0)
DestroyMainBar.Font = Enum.Font.Code
DestroyMainBar.BackgroundTransparency = 1
local DMainStroke = Instance.new("UIStroke", DestroyMainBar)
DMainStroke.Thickness = 0.35
DestroyMainBar.MouseButton1Click:Connect(function()
    SourceGlovesAbuserGui:Destroy()
    if game.CoreGui:FindFirstChild("SlapUi") then
	    game.CoreGui.SlapUi:Destroy()
    end
end)

-- MainBar's Hide And Show Button --
HideMainBar = Instance.new("TextButton", MainBar)
HideMainBar.Name = "HideMainBar"
HideMainBar.Size = UDim2.new(0.1, 0, 1, 0)
HideMainBar.Position = UDim2.new(0.82, 0, 0, 0)
HideMainBar.Text = "-"
HideMainBar.TextSize = 20
HideMainBar.TextColor3 = Color3.new(0, 0, 0)
HideMainBar.Font = Enum.Font.Code
HideMainBar.BackgroundTransparency = 1
local HMainStroke = Instance.new("UIStroke", HideMainBar)
HMainStroke.Thickness = 0.35


------------/// Create MainTable Gui \\\------------
MainTable = Instance.new("Frame", MainBar)
MainTable.Name = "MainTable"
MainTable.Size = UDim2.new(1, 0, 12, 0)
MainTable.Position = UDim2.new(0, 0, 1.25, 0)
MainTable.BackgroundColor3 = Color3.new(1, 1, 1)
MainTable.BorderColor3 = Color3.new(0, 0, 0)
MainTable.BorderSizePixel = 2
MainTable.Active = true
MainTable.Transparency = 0.1
-- MainBar's Text
MainTableTitle = Instance.new("Frame", MainTable)
MainTableTitle.Name = "MainTableTop"
MainTableTitle.Size = UDim2.new(0.98, 0, 0.075, 0)
MainTableTitle.Position = UDim2.new(0.01, 0, 0.01, 0)
MainTableTitle.BackgroundColor3 = Color3.new(255, 255, 255)
MainTableTitle.BorderColor3 = Color3.new(255,255,255)
MainTableTitle.BorderSizePixel = 1
MainTableTitle.BackgroundTransparency = 0
-- MainBar's Frame
MainTableFrame = Instance.new("ScrollingFrame", MainTable)
MainTableFrame.Name = "MainTableFrame"
MainTableFrame.Size = UDim2.new(0.96, 0, 0.87, 0)
MainTableFrame.Position = UDim2.new(0.02, 0, 0.105, 0)
MainTableFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainTableFrame.BorderColor3 = Color3.new(0, 0, 0)
MainTableFrame.BorderSizePixel = 2
MainTableFrame.ScrollBarThickness = 0
MainTableFrame.Transparency = 0.6


------------/// Create Show/Hide Extra Gui \\\------------
MoreButton = Instance.new("TextButton", MainTable)
MoreButton.Name = "MoreButton"
MoreButton.Size = UDim2.new(0.05, 0, 0.3, 0)
MoreButton.Position = UDim2.new(1.02, 0, 0.105, 0)
MoreButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MoreButton.BorderSizePixel = 0
MoreButton.Text = ">"
MoreButton.TextSize = 20
MoreButton.TextColor3 = Color3.new(0, 0, 0)
MoreButton.Font = Enum.Font.Cartoon
MoreButton.Transparency = 0.2

------------/// Create ExtraFrame \\\------------
TableExtra = Instance.new("Frame", MainTable)
TableExtra.Name = "TableExtra"
TableExtra.Size = UDim2.new(0.4, 0, 0.9, 0)
TableExtra.Position = UDim2.new(1.02, 0, 0.105, 0)
TableExtra.BackgroundColor3 = Color3.new(1, 1, 1)
TableExtra.BorderColor3 = Color3.new(0, 0, 0)
TableExtra.BorderSizePixel = 2.5
TableExtra.Active = true
TableExtra.Transparency = 0.1
TableExtra.Visible = false
-- Extra's Text --
TableExtraTitle = Instance.new("TextLabel", TableExtra)
TableExtraTitle.Name = "TableExtraTitle"
TableExtraTitle.Size = UDim2.new(0.9, 0, 0.1, 0)
TableExtraTitle.Position = UDim2.new(0.05, 0, 0.016, 0)
TableExtraTitle.BackgroundColor3 = Color3.new(1, 1, 1)
TableExtraTitle.BorderColor3 = Color3.new(1, 1, 1)
TableExtraTitle.BorderSizePixel = 1
TableExtraTitle.Text = "Extra"
TableExtraTitle.TextSize = 20
TableExtraTitle.TextColor3 = Color3.new(0, 0, 0)
TableExtraTitle.Font = Enum.Font.Cartoon
TableExtraTitle.BackgroundTransparency = 0
-- Extra's Scroll
ExtraScroll = Instance.new("Frame", TableExtra)
ExtraScroll.Name = "TableExtraScroll"
ExtraScroll.Size = UDim2.new(0.9, 0, 0.83, 0)
ExtraScroll.Position = UDim2.new(0.05, 0, 0.14, 0)
ExtraScroll.BackgroundColor3 = Color3.new(1, 1, 1)
ExtraScroll.BorderColor3 = Color3.new(0, 0, 0)
ExtraScroll.BorderSizePixel = 2
ExtraScroll.Transparency = 0.6







------------/// Create UiList \\\------------

local ExtraScrollList = Instance.new("UIListLayout", ExtraScroll)
ExtraScrollList.HorizontalAlignment = Enum.HorizontalAlignment.Center
ExtraScrollList.SortOrder = Enum.SortOrder.LayoutOrder
ExtraScrollList.Padding = UDim.new(0, 5)
------------/// Create Function \\\------------


------------/// Create Clicked function Connect\\\------------
MoreButton.MouseButton1Click:Connect(function()
    if MoreButton.Text == ">" then
        TableExtra.Visible = true
        MoreButton.Position = UDim2.new(1.435, 0, 0.105, 0)
        MoreButton.Text = "<"
    elseif MoreButton.Text ~= ">" then
        TableExtra.Visible = false
        MoreButton.Position = UDim2.new(1.02, 0, 0.105, 0)
        MoreButton.Text = ">"
    end
end)

HideMainBar.MouseButton1Click:Connect(function()
    MainTable.Visible = not MainTable.Visible
    HideMainBar.Text = MainTable.Visible and "-" or "+"
end)

maxWaitTime = 5
elapsedTime = 0
while not game.Players.LocalPlayer.PlayerGui:FindFirstChild(getgenv().CreditName.DisplayYoutube .. "GUI" .. _G.MultiGloveAbuser) do
    wait(0.1)
    elapsedTime = elapsedTime + 0.1
    if elapsedTime >= maxWaitTime then
        game:GetService("StarterGui"):SetCore("SendNotification",{Title = "ERROR!", Text = "Script can't run due to some error from ScreenGui, Please try again!", Duration = 5})
        break
    end
end

--[[Premium Memebers]]--
local playerName = game.Players.LocalPlayer.Name
playerName = playerName:lower()
-- whitelist
local allowedPlayers = {
    "hotomoma",
    "ikdkd130",
    "ikdkd128",
    "xkaiden30x",
    "calamitynoteL",
    "prismaticofchaos",
    "calamitynotem",
    "jibuhms585",
    "bruhboy19079",
}
if table.find(allowedPlayers, playerName) then
    game.StarterGui:SetCore("SendNotification", {Title = "System",Duration = 5,Text = "Dear "..game.Players.LocalPlayer.Name.."! Premium Version are still on progress so please wait until we're finished Premium version, Thanks",Icon = "rbxthumb://type=Asset&id=4989003129&w=150&h=150",Button1 = "OK"})
     PremiumMember = true
else
    game.StarterGui:SetCore("SendNotification", {Title = "System",Duration = 5,Text = "Loading Gloves Abuser Script, wait a sec!",Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",Button1 = "OK"})
     PremiumMember = false
end

------------/// Get getgenv() setting \\\------------
	if not getgenv().GlovesAbuserSetting then
		getgenv().GlovesAbuserSetting = {
			ActiveAbility = true,
			VictimSetting = "Nearest", -- others, self, random
			GloveStatsChanger = false,
			StatsChangeValue = "spin",
			DiveBombPower = 500,
			GoldenCancelColor = 131,
			PropMorph = "bob",
			VIPMEMBER = false
		}
	end
	if not  PremiumMember then
		 PremiumMember = false
	end
	local Moai = "🗿"
------------/// Call Button function tab \\\------------
function AddTabButton(Type, Text, Name, Pos, Size, Image)
    local TabButton = Instance.new(Type, MainTable)
    TabButton.Size = Size
    TabButton.Position = Pos
    TabButton.BackgroundColor3 = Color3.new(1, 1, 1)
    TabButton.BorderColor3 = Color3.new(0, 0, 0)
    TabButton.BorderSizePixel = 1
    TabButton.Name = Name
    if TabButton:IsA("TextButton") or TabButton:IsA("TextLabel") then
        TabButton.Text = Text
        TabButton.TextScaled = true
        TabButton.TextColor3 = Color3.new(0, 0, 0)
        TabButton.Font = Enum.Font.SourceSans
    elseif TabButton:IsA("ImageButton") then
        TabButton.ImageColor3 = Color3.new(0, 0, 0)
        TabButton.Image = "rbxthumb://type=Asset&id="..Image.."&w=150&h=150"
        TabButton.ImageTransparency = 0
    end
    return TabButton
end

------------/// Add tab Button \\\------------
AddTabButton("TextButton", "<", "<", UDim2.new(0.02, 0, 0.01, 0), UDim2.new(0.08, 0, 0.08, 0))
AddTabButton("TextLabel", "0", "CurrentLevel", UDim2.new(0.11, 0, 0.01, 0), UDim2.new(0.2, 0, 0.08, 0))
AddTabButton("TextButton", ">", ">", UDim2.new(0.32, 0, 0.01, 0), UDim2.new(0.08, 0, 0.08, 0))
AddTabButton("ImageButton", "Lobby", "Lobby", UDim2.new(0.41, 0, 0.01, 0), UDim2.new(0.08, 0, 0.08, 0), 4562959390)
AddTabButton("ImageButton", "Arena", "Arena", UDim2.new(0.5, 0, 0.01, 0), UDim2.new(0.08, 0, 0.08, 0), 10090587536)
AddTabButton("ImageButton", "Slap", "Slap", UDim2.new(0.59, 0, 0.01, 0), UDim2.new(0.08, 0, 0.08, 0), 12334310477)
AddTabButton("ImageButton", "Set", "Set", UDim2.new(0.68, 0, 0.01, 0), UDim2.new(0.08, 0, 0.08, 0), 12809025366)
AddTabButton("TextButton", "Version 2.5", "Version", UDim2.new(0.77, 0, 0.01, 0), UDim2.new(0.21, 0, 0.08, 0))
------------/// Get Current Level Value \\\------------
local CurrentLevel = MainTable:FindFirstChild("CurrentLevel")
local level = tonumber(CurrentLevel.Text)

------------/// Add gridlayout \\\------------
local gridLayoutPotionChosse = Instance.new("UIGridLayout", MainTableFrame)
gridLayoutPotionChosse.CellSize = UDim2.new(0.1, 0, 0.06, 0)
gridLayoutPotionChosse.CellPadding = UDim2.new(0.011, 0, 0.008, 0)
gridLayoutPotionChosse.FillDirection = Enum.FillDirection.Horizontal
gridLayoutPotionChosse.HorizontalAlignment = Enum.HorizontalAlignment.Center
gridLayoutPotionChosse.SortOrder = Enum.SortOrder.LayoutOrder

------------/// Add Buttons Ability + Button List \\\------------
function UpdateGloveStandList(List)
    local updatedList = {}
    local removedItems = {}
    for _, glove in ipairs(List) do
        if game.Workspace.Lobby:FindFirstChild(glove) then
            table.insert(updatedList, glove)
        else
            table.insert(removedItems, glove)
        end
    end
    if #removedItems > 0 then
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Update", Text = "Removed: " .. table.concat(removedItems, ", "), Duration = 1})
    end
    if #updatedList ~= #List then
        for i=1, #updatedList do
            List[i] = updatedList[i]
        end
        for i=#updatedList + 1, #List do
            List[i] = nil
        end
        print("Success Update List: ", table.concat(updatedList, ", "))
    end
end

------------/// Add Button List \\\------------
local AbilitiesText = {"Diamond", "ZZZZZZZ", "Swapper", "Ghost", "Za Hando", "Fort", "Pusher", "Mail", "Golden", "MR", "Replica", "Reverse", "Duelist", "woah", "Engineer", "Rocky", "STOP", "Home Run", "Slicer", "Excavator", "Cloud", "Ferryman", "Blink", "God's Hand", "CUSTOM", "MEGAROCK", "[REDACTED]", "bus", "Mitten", "Phase", "Bomb", "Bubble", "Jet", "Shard", "bob", "Dominance", "Quake", "Kraken", "Counter", "rob", "Glovel", "Divebomb", "BONK", "Siphon", "Rojo"}
local GeneralAbilitiesText = {"Tableflip", "Shield", "Baller", "Whirlwind", "Gravity", "Meteor", "Blackhole", "Rattlebones", "Tycoon", "Glitch", "Parry", "Alchemist", "Druid", "Jester", "Scythe", "Guardian Angel", "Ping Pong", "Flamarang", Moai, "Firework", "Pocket", "Jebaited", "Prop", "Frostbite", "Sun", "Sbeve", "Joust", "Golem", "fish", "Plank", "Spoonful", "UFO", "el gato"}
local PassiveAbilitiesText = {"Snow", "Pull", "Bull", "Dice", "Anchor", "Boomerang", "Divert", "Ice", "Gummy", "Blocked", "Conveyor", "Booster", "Nightmare", "The Flex", "Warp", "Spy", "Orbit", "Disarm", "Error", "Chain", "Confusion", "RNG", "Goofy", "Leash", "Psycho", "Hammer", "Lure", "Pan", "Blasphemy", "Detonator", "Knockoff", "Warp", "The Flex", "Wrench", "Relude"}
local VIPAbilitiesText = {"Defense", "Obby", "Magnet", "Thanos", "Acrobat", "Space", "Flash", "Retro", "Admin", "Grapple", "Beatdown", "Snowball", "Santa", "Hunter"}

UpdateGloveStandList(AbilitiesText)
UpdateGloveStandList(PassiveAbilitiesText)
UpdateGloveStandList(GeneralAbilitiesText)
UpdateGloveStandList(VIPAbilitiesText)

function createButtons(textArray, isVisible, multiplier)
    for i = 1, #textArray do
        local button = Instance.new("TextButton", MainTableFrame)
        button.Text = textArray[i]
        button.Name = textArray[i]
        button.TextColor3 = Color3.new(0, 0, 0)
        button.TextScaled = true
        button.BorderSizePixel = 1
        button.BackgroundTransparency = 0
        button.BackgroundColor3 = Color3.new(1, 1, 1)
        button.BorderColor3 = Color3.new(0, 0, 0)
        button.Font = Enum.Font.Cartoon
        button.LayoutOrder = multiplier * i
        button.Visible = isVisible
    end
end

createButtons(AbilitiesText, true, 1)
createButtons(GeneralAbilitiesText, false, 1)
createButtons(PassiveAbilitiesText, false, 1)
createButtons(VIPAbilitiesText, false, 1)

------------/// Add function \\\------------
function findNearestPlayer()
    nearestDist = math.huge
    TargetLockedPlayer = nil
    for _, otherPlayer in pairs(game.Players:GetPlayers()) do
        if otherPlayer ~= game.Players.LocalPlayer and otherPlayer.Character.Humanoid.Health ~= 0 then
            dist = (otherPlayer.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if dist < nearestDist then
                nearestDist = dist
                TargetLockedPlayer = otherPlayer
            end
        end
    end
    return TargetLockedPlayer
end

function findRandomPlayer()
	TargetLockedPlayer = nil
	players = game.Players:GetPlayers()
	randomPlayer = players[math.random(1, #players)]
	if randomPlayer ~= game.Players.LocalPlayer and randomPlayer.Character:FindFirstChild("entered") and randomPlayer.Character:FindFirstChild("ded") == nil and randomPlayer.Character:FindFirstChild("InLabyrinth") == nil and randomPlayer.Character:FindFirstChild("rock") == nil then
	    TargetLockedPlayer = randomPlayer
	end
	return TargetLockedPlayer
end

abilities = {AbilitiesText, GeneralAbilitiesText, PassiveAbilitiesText, VIPAbilitiesText}
function ShowPage(Value)
  for _, Button in ipairs(MainTableFrame:GetChildren()) do
    if Button:IsA("TextButton") then
      Button.Visible = false
      for _, buttonText in ipairs(abilities[Value + 1]) do
        if Button.Name == buttonText then
          Button.Visible = true
          break
        end
      end
    end
  end
end

function UpdatePage(delta)
    local level = tonumber(CurrentLevel.Text)
    local newLevel = level + delta
    if newLevel >= 0 and newLevel <= 3 then
        CurrentLevel.Text = tostring(newLevel)
        ShowPage(newLevel)
    else
        CurrentLevel.Text = (newLevel < 0) and "3" or "0"
        level = tonumber(CurrentLevel.Text)
        ShowPage(level)
    end
end

for _, Button in ipairs(MainTable:GetChildren()) do
    if Button:IsA("TextButton") or  Button:IsA("ImageButton") then
        Button.MouseButton1Click:Connect(function()
            if Button.Name == "<" then
                UpdatePage(-1)
            elseif Button.Name == ">" then
                UpdatePage(1)
            elseif Button.Name == "Arena" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
            elseif Button.Name == "Lobby" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lobby.MeshPart.CFrame * CFrame.new(8,0,-2)
            elseif Button.Name == "Slap" then
                if game.CoreGui:FindFirstChild("SlapUi") then
                    game.CoreGui.SlapUi.Enabled = not game.CoreGui.SlapUi.Enabled
                else
                    CreateSlapAura()
                end
            end
        end)
    end
end

function ChangeBorderColor(List, Button)
    if Button:IsA("TextButton") then
        for _, buttonText in ipairs(List) do
            if Button.Name == buttonText then
                Button.BorderColor3 = Color3.new(1, 0, 0)
                wait(6.1)
                Button.BorderColor3 = Color3.new(0, 0, 0)
                break
            end
        end
    end
end

local AbilityUsingRequire = false
function EquipGlove(GloveSet, Name)
    if AbilityUsingRequire == true then
    game:GetService("StarterGui"):SetCore("SendNotification",{Title = "ERROR!", Text = "Please wait until task done!", Duration = 0.1})
        return true
    end
    local Glove = GloveSet
    if game.Players.LocalPlayer.leaderstats.Glove.Value ~= Glove then
        fireclickdetector(workspace.Lobby[Glove].ClickDetector)
        AbilityUsingRequire = true
        wait(.5)
        AbilityUsingRequire = false
        if game.Players.LocalPlayer.leaderstats.Glove.Value ~= Glove then
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "ERROR!", Text = "Failed to equip "..Glove.." Glove, Try again later", Duration = 0.5})
            return true
        end
    end
    for _, Button in ipairs(MainTableFrame:GetChildren()) do
	    if Name == nil then 
		    Name = GloveSet
	    end
	    if Button:IsA("TextButton") and Button.Name == Name then
	        if not GlovesAbuserSetting.ActiveAbility or Button.BorderColor3 ~= Color3.new(0, 0, 0) then
	            return true
	        end
	    end
    end
    return false
end

function EquipVIPGlove(GloveSet)
	if  PremiumMember == false then
		game:GetService("StarterGui"):SetCore("SendNotification",{Title = "ERROR!", Text = "VIP MEMBER ONLY!", Duration = 0.1})
		return true
	end
	local VIPGloveStorage = game.Workspace:FindFirstChild("VIPGloveStorage")
	if not VIPGloveStorage then
	    VIPGloveStorage = Instance.new("Folder")
	    VIPGloveStorage.Name = "VIPGloveStorage"
	    VIPGloveStorage.Parent = game.Workspace
	end
	local Glove = GloveSet
	for _, Button in ipairs(MainTableFrame:GetChildren()) do
		if Button:IsA("TextButton") and Button.Name == Glove then
		    if not GlovesAbuserSetting.ActiveAbility or Button.BorderColor3 ~= Color3.new(0, 0, 0) then
		        return true
		    end
		end
	end
	for _, Button in ipairs(MainTableFrame:GetChildren()) do
	    if Button:IsA("TextButton") then
		    coroutine.wrap(function()
		        ChangeBorderColor(VIPAbilitiesText, Button)
		    end)()
		end 
	end
	wait()
    game.Players.LocalPlayer.Character.Humanoid:UnequipTools()
    if game.Players.LocalPlayer.Backpack:FindFirstChild(Glove) then
		fireclickdetector(workspace.Lobby[Glove].ClickDetector)
		return
	end
	if VIPGloveStorage:FindFirstChild(Glove) then
		local CloneVIPGlove = VIPGloveStorage:FindFirstChild(Glove):Clone()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v then
				v:Destroy()
			end
		end
		CloneVIPGlove.Parent = game.Players.LocalPlayer.Backpack
		fireclickdetector(workspace.Lobby[Glove].ClickDetector)
		game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Notification!", Text = "Added saved glove:"..Glove.." to your backpack!", Duration = 2})
	else
		fireclickdetector(workspace.Lobby[Glove].ClickDetector)
		wait(0.3)
        if game.Players.LocalPlayer.leaderstats.Glove.Value ~= Glove then
            game:GetService("StarterGui"):SetCore("SendNotification",{Title = "ERROR!", Text = "Failed to equip "..Glove.." Glove, try again later", Duration = 0.5})
            return true
        end
		game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Notification!", Text = "Getting " ..Glove.. " to your backpack, Do not spam!", Duration = 2})
	    firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
		firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
		repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool")
		for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
			                    if v.ClassName == "Tool" then
			                        v.Parent = VIPGloveStorage
			                    end
			                end
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		                        v.Parent = VIPGloveStorage
		                end
		game:GetService("ReplicatedStorage"):WaitForChild("HumanoidDied"):FireServer(game.Players.LocalPlayer.Character,false)
		wait(4)
		for i,v in pairs(VIPGloveStorage:GetChildren()) do
						if v.Name == Glove then
									CloneVIPGlove = v:Clone()
									for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
										if v then
											v:Destroy()
										end
									end
			                        CloneVIPGlove.Parent = game.Players.LocalPlayer.Backpack
			                end
						end
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
		                end 
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
	end
    return false
end

------------/// ButtonConnect \\\------------
for _, Button in ipairs(MainTableFrame:GetChildren()) do
    if Button:IsA("TextButton") then
    	for _, buttonText in ipairs(GeneralAbilitiesText) do
			if Button.Name == buttonText then
		        Button.MouseButton1Click:Connect(function()
					if EquipGlove(Button.Name) then return end
						for _, Button in ipairs(MainTableFrame:GetChildren()) do
						    if Button:IsA("TextButton") then
							    coroutine.wrap(function()
							        ChangeBorderColor(GeneralAbilitiesText, Button)
							    end)()
							end 
						end
			        local GeneralValue
					if Button.Name == "Sun" then
						GeneralValue = {"Cast"}
					elseif Button.Name == "Frostbite" then
						GeneralValue = {1}
					elseif Button.Name == Moai then
						GeneralValue = {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -0.522, -10) * CFrame.Angles(-2, 0, 0)}
					elseif Button.Name == "Tycoon" then
						GeneralValue = {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2.55, -20) * CFrame.Angles(0, 1.5, 0)}
					elseif Button.Name == "Pocket" then
						for i,v in pairs(game.Players:GetPlayers()) do
							game:GetService("ReplicatedStorage").PocketWhitelist:FireServer("add", v)
						end
						GeneralValue = {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -0, -10) * CFrame.Angles(0, 0, 0)}
					elseif Button.Name == "Jester" then
						if GlovesAbuserSetting.VictimSetting == "Self" then
							GeneralValue = {"Ability3", game.Players.LocalPlayer}
						elseif GlovesAbuserSetting.VictimSetting == "Nearest" or GlovesAbuserSetting.VictimSetting == "Others" then
							TargetLockedPlayer = findNearestPlayer()
							if TargetLockedPlayer then 
								GeneralValue = {"Ability3", TargetLockedPlayer} 
							end
						elseif GlovesAbuserSetting.VictimSetting == "Random" then
							TargetLockedPlayer = findRandomPlayer()
							if TargetLockedPlayer then
							    GeneralValue = {"Ability3", TargetLockedPlayer} 
							end
						end
					elseif Button.Name == "Golem" then
						GeneralValue = {"release"}
					elseif Button.Name == "Guardian Angel" then
						if GlovesAbuserSetting.VictimSetting == "Self" then
							GeneralValue = {game.Players.LocalPlayer}
						elseif GlovesAbuserSetting.VictimSetting == "Nearest" or GlovesAbuserSetting.VictimSetting == "Others" then
							TargetLockedPlayer = findNearestPlayer()
							if TargetLockedPlayer then 
								GeneralValue = {TargetLockedPlayer} 
							end
						end
					elseif Button.Name == "Spoonful" then
						GeneralValue = {[1] = {["state"] = "vfx", ["cf"] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(-0, -0, -0), ["vfx"] = "crash"}}
						game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack({[1] = {["state"] = "vfx", ["vfx"] = "jumpvfx"}}))
					elseif Button.Name == "Plank" then
						GeneralValue = {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(15, 55, -5) * CFrame.Angles(0, 0, -5), Vector3.new(120, 0, 0)}
					elseif Button.Name == "Joust" then
						GeneralValue = {"Start"}
					elseif Button.Name == "UFO" then
						if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.. "'s UFO") then
							if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
								if game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.. "'s UFO").battery.light.Color ~= Color3.fromRGB(255, 0, 0) then
									for i,v in pairs(game.Players:GetChildren()) do
									    if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
									        if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") then
									            local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
									            if Magnitude <= 15 then
													GeneralValue = {"drop"}
													break
												else
													GeneralValue = {"ability"}
													break 
									            end
									        end
									    end
									end
								elseif game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.. "'s UFO").battery.light.Color == Color3.fromRGB(255, 0, 0) then
									GeneralValue = {"Break UFO"}
								end
							end
						else
							GeneralValue = {"Summon UFO"}
						end
					elseif Button.Name == "Prop" then
						GeneralValue = {GlovesAbuserSetting.PropMorph}
					elseif Button.Name == "el gato" then
						if not game:GetService("Workspace"):FindFirstChild(game.Players.LocalPlayer.Name .. "'s cat") then
							game:GetService("ReplicatedStorage").Events.Cat:FireServer()
						end
						GeneralValue = {"What a cute cat :3333"}
					else
						GeneralValue = {"Script made by " .. getgenv().CreditName.DisplayYoutube .. "/" .. getgenv().CreditName.SourceYoutube}
					end
					game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(GeneralValue))
				end)
			end
		end
	end
end

for _, Button in ipairs(MainTableFrame:GetChildren()) do
    if Button:IsA("TextButton") then
    	for _, buttonText in ipairs(PassiveAbilitiesText) do
			if Button.Name == buttonText then
		        Button.MouseButton1Click:Connect(function()
					if EquipGlove(Button.Name) then return end
				end)
			end
		end
	end
end

for _, Button in ipairs(MainTableFrame:GetChildren()) do
    if Button:IsA("TextButton") then
    	for _, buttonText in ipairs(VIPAbilitiesText) do
			if Button.Name == buttonText then
		        Button.MouseButton1Click:Connect(function()
					if EquipVIPGlove(Button.Name) then return end
				end)
			end
		end
	end
end

for _, Button in ipairs(MainTableFrame:GetChildren()) do
    if Button:IsA("TextButton") then
        for _, buttonText in ipairs(AbilitiesText) do
			if Button.Name == buttonText then
		        Button.MouseButton1Click:Connect(function()
			        if Button.Name == "Diamond" then
						if EquipGlove("Diamond") then return end
						game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
					elseif Button.Name == "ZZZZZZZ" then
						if EquipGlove("ZZZZZZZ") then return end
						game:GetService("ReplicatedStorage").ZZZZZZZSleep:FireServer()
					elseif Button.Name == "Swapper" then
						if EquipGlove("Swapper") then return end
						game:GetService("ReplicatedStorage").SLOC:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Ghost" then
						if EquipGlove("Ghost") then return end
						if game.Players.LocalPlayer.Character.Head.Transparency ~= 1 then
							for i = 1,3 do
								game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
							end
						else
							game:GetService("ReplicatedStorage").Ghostinvisibilitydeactivated:FireServer()
							game:GetService("ReplicatedStorage").Ghostinvisibilitydeactivated:FireServer()
						end
					elseif Button.Name == "Za Hando" then
						if EquipGlove("Za Hando") then return end
						game:GetService("ReplicatedStorage").Erase:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Fort" then
						if EquipGlove("Fort") then return end
						game:GetService("ReplicatedStorage").Fortlol:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(3.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Pusher" then
						if EquipGlove("Pusher") then return end
						game:GetService("ReplicatedStorage").PusherWall:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Mail" then
						if EquipGlove("Mail") then return end
						game:GetService("ReplicatedStorage").MailSend:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(3.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Golden" then
						if EquipGlove("Golden") then return end
						if game.Players.LocalPlayer.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") then
							game:GetService("ReplicatedStorage").Goldify:FireServer(true)
						else 
							game:GetService("ReplicatedStorage").Goldify:FireServer(false,BrickColor.new(GlovesAbuserSetting.GoldenCancelColor))		
						end
					elseif Button.Name == "MR" then
						if EquipGlove("MR") then return end
						game:GetService("ReplicatedStorage").Spherify:FireServer()
					elseif Button.Name == "Replica" then
						if EquipGlove("Replica") then return end
						game:GetService("ReplicatedStorage").Duplicate:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Reverse" then
						if EquipGlove("Reverse") then return end
						game:GetService("ReplicatedStorage").ReverseAbility:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(6.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Duelist" then
						if EquipGlove("Duelist") then return end
						game:GetService("ReplicatedStorage").DuelistAbility:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "woah" then
						if EquipGlove("woah") then return end
						game:GetService("ReplicatedStorage").VineThud:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "[REDACTED]" then
						if EquipGlove("[REDACTED]") then return end
						game:GetService("ReplicatedStorage").Well:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Engineer" then
						if EquipGlove("Engineer") then return end
						game:GetService("ReplicatedStorage").Sentry:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Rocky" then
						if EquipGlove("Rocky") then return end
						game:GetService("ReplicatedStorage").RockyShoot:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(6.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "STOP" then
						if EquipGlove("STOP") then return end
						game:GetService("ReplicatedStorage").STOP:FireServer(true)
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Slicer" then
						if EquipGlove("Slicer") then return end
						game:GetService("ReplicatedStorage").Slicer:FireServer("sword")
						game:GetService("ReplicatedStorage").Slicer:FireServer("slash", game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame, Vector3.new())
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Excavator" then
						if EquipGlove("Excavator") then return end
						game:GetService("ReplicatedStorage"):WaitForChild("Excavator"):InvokeServer()
						game:GetService("ReplicatedStorage"):WaitForChild("ExcavatorCancel"):FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(7.3)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Cloud" then
						if EquipGlove("Cloud") then return end
						game:GetService("ReplicatedStorage").CloudAbility:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Ferryman" then
						if EquipGlove("Ferryman") then return end
						game:GetService("Players").LocalPlayer.Character.FerrymanStaff.StaffConfig.AbilityEvent:FireServer("Strike")
					elseif Button.Name == "Mitten" then
						if EquipGlove("Mitten") then return end
						game:GetService("ReplicatedStorage").MittenA:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(4.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "bus" then
						if EquipGlove("bus") then return end
						game:GetService("ReplicatedStorage").busmoment:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Bomb" then
						if EquipGlove("Bomb") then return end
						Button.BorderColor3 = Color3.new(1, 0, 0)
						game:GetService("ReplicatedStorage").BombThrow:FireServer()
						wait(2.5)
						game:GetService("ReplicatedStorage").BombThrow:FireServer()
						wait(6.6)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Jet" then
						if EquipGlove("Jet") then return end
						if GlovesAbuserSetting.VictimSetting == "Nearest" or GlovesAbuserSetting.VictimSetting == "Self" or GlovesAbuserSetting.VictimSetting == "Others" then
							TargetLockedPlayer = findNearestPlayer()
							if TargetLockedPlayer then 
								game:GetService("ReplicatedStorage").AirStrike:FireServer(TargetLockedPlayer.Character)
							end
						elseif GlovesAbuserSetting.VictimSetting == "Random" then
							TargetLockedPlayer = findRandomPlayer()
							if TargetLockedPlayer then 
								game:GetService("ReplicatedStorage").AirStrike:FireServer(TargetLockedPlayer.Character)
							end
						end
						game:GetService("ReplicatedStorage").AirStrike:FireServer(Target.Character)
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "bob" then
						if EquipGlove("bob") then return end
						game:GetService("ReplicatedStorage"):WaitForChild("bob"):FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Blink" then
						if EquipGlove("Blink") then return end
						if not game.Workspace:FindFirstChild("Blink_".. game.Players.LocalPlayer.Name) then
							game:GetService("ReplicatedStorage").Blink:FireServer(unpack({[1] = "OutOfBody",[2] = {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default}}))
						else
							game:GetService("ReplicatedStorage").Blink:FireServer("IntoBody")
						end
					elseif Button.Name == "Dominance" then
						if EquipGlove("Dominance") then return end
						game:GetService("ReplicatedStorage").DominanceAc:FireServer(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(3.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Phase" then
						if EquipGlove("Phase") then return end
						game:GetService("ReplicatedStorage").PhaseA:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(6.375)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Kraken" then
						if EquipGlove("Kraken") then return end
						game:GetService("ReplicatedStorage").KrakenArm:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "rob" then
						if EquipGlove("rob") then return end
						game:GetService("ReplicatedStorage"):WaitForChild("rob"):FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "God's Hand" then
						if EquipGlove("God's Hand") then return end
						fireclickdetector(workspace.Lobby["God's Hand"].ClickDetector)
						game:GetService("ReplicatedStorage").TimestopJump:FireServer()
						game:GetService("ReplicatedStorage").Timestopchoir:FireServer()
						game:GetService("ReplicatedStorage").Timestop:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(60.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Bubble" then
						if EquipGlove("Bubble") then return end
						game:GetService("ReplicatedStorage").BubbleThrow:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(3.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "MEGAROCK" then
						if EquipGlove("MEGAROCK") then return end
						game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
					elseif Button.Name == "CUSTOM" then
						if EquipGlove("CUSTOM") then return end
						game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
					elseif Button.Name == "Home Run" then
						if EquipGlove("Home Run") then return end
						game:GetService("ReplicatedStorage").HomeRun:FireServer({["start"] = true})
					elseif Button.Name == "Shard" then
						if EquipGlove("Shard") then return end
						game:GetService("ReplicatedStorage").Shards:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(4.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Quake" then
						if EquipGlove("Quake") then return end
						Button.BorderColor3 = Color3.new(1, 0, 0)
						game:GetService("ReplicatedStorage"):WaitForChild("QuakeQuake"):FireServer({["start"] = true})
						wait(4.13)
						game:GetService("ReplicatedStorage"):WaitForChild("QuakeQuake"):FireServer({["finished"] = true})
						wait(5.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Counter" then
						if EquipGlove("Counter") then return end
						game:GetService("ReplicatedStorage").Counter:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(6.2)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Glovel" then
						if EquipGlove("Glovel") then return end
						if game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("Digging") == nil then
							game:GetService("ReplicatedStorage").GlovelFunc:InvokeServer()
						else
							game:GetService("ReplicatedStorage").GlovelCancel:FireServer()
						end
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "BONK" then
						if EquipGlove("BONK") then return end
						game:GetService("ReplicatedStorage").BONK:FireServer()
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(13.1)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Divebomb" then
						if EquipGlove("Divebomb") then return end
						game:GetService("ReplicatedStorage").RocketJump:InvokeServer({["chargeAlpha"] = 99.7833333881571889,["rocketJump"] = true})
						if GlovesAbuserSetting.VictimSetting == "Self" then
							game:GetService("ReplicatedStorage").RocketJump:InvokeServer({["position"] = game.Players.LocalPlayer.Character.HumanoidRootPart.Position,["explosion"] = true,["explosionAlpha"] = GlovesAbuserSetting.DiveBombPower})
						elseif GlovesAbuserSetting.VictimSetting == "Nearest" then
							TargetLockedPlayer = findNearestPlayer()
							if TargetLockedPlayer then 
								game:GetService("ReplicatedStorage").RocketJump:InvokeServer({["position"] = TargetLockedPlayer.Character.HumanoidRootPart.Position,["explosion"] = true,["explosionAlpha"] = GlovesAbuserSetting.DiveBombPower})
							end
						elseif GlovesAbuserSetting.VictimSetting == "Random" then
							TargetLockedPlayer = findRandomPlayer()
							if TargetLockedPlayer then 
								game:GetService("ReplicatedStorage").RocketJump:InvokeServer({["position"] = TargetLockedPlayer.Character:FindFirstChild("HumanoidRootPart").Position, ["explosion"] = true, ["explosionAlpha"] = GlovesAbuserSetting.DiveBombPower})
							end
						elseif GlovesAbuserSetting.VictimSetting == "Others" then
							for _, player in pairs(game:GetService("Players"):GetPlayers()) do
							    if player ~= game:GetService("Players").LocalPlayer then
							        game:GetService("ReplicatedStorage").RocketJump:InvokeServer({["chargeAlpha"] = 99.7833333881571889, ["rocketJump"] = true})
									wait()
							        game:GetService("ReplicatedStorage").RocketJump:InvokeServer({["position"] = player.Character:FindFirstChild("HumanoidRootPart").Position, ["explosion"] = true, ["explosionAlpha"] = GlovesAbuserSetting.DiveBombPower})
							    end
							end						
						end
					elseif Button.Name == "Siphon" then
						if EquipGlove(Button.Name) then return end
						game:GetService("ReplicatedStorage").Events.Siphon:FireServer(unpack({[1] = {["cf"] = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -40)}}))
						Button.BorderColor3 = Color3.new(1, 0, 0)
						wait(5)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					elseif Button.Name == "Rojo" then
						if EquipGlove(Button.Name) then return end
						Button.BorderColor3 = Color3.new(1, 0, 0)
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
						game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Charge")
						game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Rojo.Animation, game.Players.LocalPlayer.Character.Humanoid):Play()
						wait(5)
						game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
						game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Assets.Rojo.AnimationRecoil, game.Players.LocalPlayer.Character.Humanoid):Play()
						game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
						wait(5)
						Button.BorderColor3 = Color3.new(0, 0, 0)
					end
		        end)
			end
		end
    end
end

function CreateSlapAura()
	loadstring(game:HttpGet(("https://raw.githubusercontent.com/OMOHOTA/GeneralSB/main/Slap_Aura.lua")))()
	--/// Destroy old Gui ///--
	if game.CoreGui:FindFirstChild("SlapUi") then
		game.CoreGui:FindFirstChild("SlapUi"):Destroy()
	end
	
	--/// New Gui ///--
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "SlapUi"
	ScreenGui.Parent = game.CoreGui
	
	local SlapButton = Instance.new("ImageButton", ScreenGui)
	SlapButton.Size = UDim2.new(0.06, 0, 0.12, 0)
	SlapButton.Position = UDim2.new(0.8, 0, 0.1, 0)
	SlapButton.BackgroundColor3 = Color3.new(0, 0, 0)
	SlapButton.ImageColor3 = Color3.new(1, 1, 1)
	SlapButton.Image = "rbxthumb://type=Asset&id=12334310477&w=150&h=150"
	SlapButton.BackgroundTransparency = 0.4
	SlapButton.Draggable = true
	
	local Corner = Instance.new("UICorner", SlapButton)
	Corner.CornerRadius = UDim.new(0, 6)
	
	local Stroke = Instance.new("UIStroke", SlapButton)
	Stroke.Color = Color3.new(0, 0, 0)
	Stroke.Transparency = 0.2
	Stroke.Thickness = 3
	
	
	local SlapAura = false
	local lastClickTime = 0
	local SlapAuraCooldown = 0.5
	local Range = 20
	local Range2 = math.huge
	
	SlapButton.MouseButton1Click:Connect(function()	
	    if SlapAura then return end
	    if tick() - lastClickTime < SlapAuraCooldown then
	        return
	    end
		
	    SlapAura = true
	
	    for i,v in pairs(game.Players:GetChildren()) do
	        if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
	            if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("rock") == nil and v.Character.HumanoidRootPart.BrickColor ~= BrickColor.new("New Yeller") and v.Character:FindFirstChild("Mirage") == nil and v.Character:FindFirstChild("Digging") == nil then
	                if v.Character.Head:FindFirstChild("UnoReverseCard") == nil then
	                    local Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
	                    if Magnitude <= Range then
							game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Slap, game.Players.LocalPlayer.Character.Humanoid):Play()
	                        gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Character:WaitForChild("HumanoidRootPart"), true)
	                    end
	                end
	            end
	        end
	    end
		for _, c in pairs(workspace:GetChildren()) do
			if string.find(c.Name, "Å") and c:FindFirstChild("HumanoidRootPart") then
				local Magnitude2 = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - c.HumanoidRootPart.Position).Magnitude
				if Magnitude2 <= Range2 then
					gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(c:WaitForChild("HumanoidRootPart"), true)
				end
			end
		end
		if game.Workspace:FindFirstChild("Blink_".. game.Players.LocalPlayer.Name) then
		    gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(workspace:FindFirstChild("Blink_".. game.Players.LocalPlayer.Name).Torso)
		end
		    lastClickTime = tick()
		    SlapAura = false
	end)
end
