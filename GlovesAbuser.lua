--[[Wait For Game]]--
if not game:IsLoaded() then
    game.Loaded:Wait()
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
}
if table.find(allowedPlayers, playerName) then
    game.StarterGui:SetCore("SendNotification", {Title = "System",Duration = 5,Text = "Dear "..game.Players.LocalPlayer.Name.."! Premium Version are still on progress so please wait until we're finished Premium version, Thanks",Icon = "rbxthumb://type=Asset&id=4989003129&w=150&h=150",Button1 = "OK"})
    PremiumMember = true
else
    game.StarterGui:SetCore("SendNotification", {Title = "System",Duration = 5,Text = "Loading Gloves Abuser Script, wait a sec!",Icon = "rbxthumb://type=Asset&id=9649923610&w=150&h=150",Button1 = "OK"})
    PremiumMember = false
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
			VIPMEMBER = true
		}
	end
	if not PremiumMember then
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
	        if not Gl
