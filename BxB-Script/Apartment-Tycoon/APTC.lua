
-- init

-- init

-- init
local gameid = game.PlaceId
if gameid == 9284097280 then
    
-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Apartment-Tycoon/library.lua"))()
local venyx = library.new("BxB Hub", 5013109572)

-- themes
local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("AT", 5012544693)
local section1 = page:addSection("Main")
section1:addButton("Remove Purchase Prompts", function()
game:GetService("CoreGui").PurchasePrompt:remove()
end)
section1:addButton("Auto Collect", function()
	while wait(.5) do
local Playerhead = game:GetService("Players").LocalPlayer.Character.Head
for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v.Name == "TouchInterest" and v.Parent.Name == "Part" then
 firetouchinterest(v.Parent, Playerhead, 1)
firetouchinterest(v.Parent, Playerhead, 0)
end
end
end
end)
section1:addButton("Auto Buy", function()
while wait(.5) do
    local Playerhead = game:GetService("Players").LocalPlayer.Character.Head
for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
if v.Name == "Price" then
    firetouchinterest(v.Parent.Parent, Playerhead, 0)
    firetouchinterest(v.Parent.Parent, Playerhead, 1)
end
end
end
end)
section1:addButton("Auto Clean", function()
while wait(.5) do
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v.Name == "Puddle" and v:FindFirstChild("ProximityPrompt") then
fireproximityprompt(v.ProximityPrompt, 1)
end
end
end
end)
section1:addKeybind("Hide/Show GUI", Enum.KeyCode.LeftAlt, function()

	venyx:toggle()
end, function()

end)

-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
	colors:addColorPicker(theme, color, function(color3)
		venyx:setTheme(theme, color3)
	end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)

    end
if gameid == 9872472334 then
    
-- init
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Statue Hub", 5013109572)

-- themes
local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Evade", 5012544693)
local section1 = page:addSection("Section 1")
section1:addButton("FullBright", function()
    game:GetService("Lighting").FogStart = 0
    game:GetService("Lighting").ExposureCompensation = 3
    game:GetService("Lighting").ClockTime = 12
    game:GetService("Lighting").Brightness = 1
    game:GetService("Lighting").GlobalShadows = false
    while wait(.01) do
        for i, v in pairs(game:GetService("Lighting"):GetDescendants()) do
            if v.Parent == "Lighting" then
                v:remove()
    end
        end
end
end)
section1:addButton("Knocked God Mode", function()
game:GetService("Players").LocalPlayer.Died:remove()
end)
section1:addButton("Esp", function()

while wait(.1) do

for i, v in pairs(game:GetService("Players"):GetChildren()) do
	if v.ClassName == "Player" and v.Character and v.Character:FindFirstChild("Head") then

local BillboardGui = Instance.new("BillboardGui")
local Name = Instance.new("TextLabel")
local Health = Instance.new("TextLabel")
local Healthval = Instance.new("TextLabel")
BillboardGui.Name = "Esp"
		BillboardGui.Parent = v.Character.Head
		BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		BillboardGui.Active = true
		BillboardGui.AlwaysOnTop = true
		BillboardGui.LightInfluence = 1
		BillboardGui.Size = UDim2.new(0, 200, 0, 50)
		BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
		Healthval.Name = "HealthVal"
		Healthval.Parent = BillboardGui
		Healthval.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.141176)
		Healthval.BackgroundTransparency = 1
		Healthval.Size = UDim2.new(1, 1, 0, 50)
		Healthval.Font = Enum.Font.Code
		Healthval.Text = v.Character.Humanoid.Health
		Healthval.TextColor3 = Color3.new(0, 0, 0)
		Healthval.TextSize = 14
		Healthval.TextXAlignment = Enum.TextXAlignment.Left
		Healthval.Position = UDim2.new(0, 170, 0, 0)
		Name.Name = "Name"
		Name.Parent = BillboardGui
		Name.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.141176)
		Name.BackgroundTransparency = 1
		Name.Size = UDim2.new(1, 1, 0, 50)
		Name.Font = Enum.Font.Code
		Name.Text = v.Name
		Name.TextColor3 = Color3.new(0, 0, 0)
		Name.TextSize = 14
		Name.TextXAlignment = Enum.TextXAlignment.Left
		local health = "Health"
		Health.Name = health
		Health.Parent = BillboardGui
		Health.BackgroundColor3 = Color3.new(0.141176, 0.141176, 0.141176)
		Health.BackgroundTransparency = 1
		Health.Position = UDim2.new(0, 120, 0, 0)
		Health.Size = UDim2.new(1, 100, 0, 50)
		Health.Font = Enum.Font.Code
		Health.Text = "Health"
		Health.TextColor3 = Color3.new(0, 0, 0)
		Health.TextSize = 14
		Health.TextXAlignment = Enum.TextXAlignment.Left
		if game:GetService("Players").LocalPlayer.Character.Head:FindFirstChild("BillboardGui") then
		    game:GetService("Players").LocalPlayer.Character.Head.BillboardGui:remove()
		    end

	
		end
end
	end
	   
	while wait() do
	    game:GetService("Players").LocalPlayer.Character.Head.Esp:remove()
end
while wait() do
	for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
		if v.Name == "Esp" then wait(.2) v:remove()
		end
	end
end
	while wait() do
	    if game:GetService("Players").LocalPlayer.Character.Head:FindFirstChild("Esp") then
	        game:GetService("Players").LocalPlayer.Character.Head.Esp:remove()
	        end
end
end)
section1:addButton("Bot Esp", function()
while wait(5) do
for i,v in pairs(game:GetService("Workspace").Game.Players:GetDescendants()) do
    if v.Name == "HRP" then
 local esp = Instance.new("Highlight")
 esp.Name = "Highlights"
 esp.FillTransparency = 0
 esp.FillColor = Color3.new(0, 0, 1)
 esp.OutlineColor = Color3.new(1, 0.333333, 1)
 esp.OutlineTransparency = 0.4
 esp.Parent = v
 v.Transparency = 0
    end
end
end
end)

section1:addButton("My Reused Hover + Speed thingy (x)", function()
	getgenv().AutowalkToggled = false;
local Player = game:GetService('Players').LocalPlayer;
local Camera = workspace.Camera;
local Speed = 200;

game:GetService'RunService'.RenderStepped:Connect(function()
    if (getgenv().AutowalkToggled == true and Player.Character and Player.Character:FindFirstChild('HumanoidRootPart')) then
        Player.Character.HumanoidRootPart.Velocity = Player.Character.HumanoidRootPart.CFrame.LookVector * Speed;
    end;
end)

Player:GetMouse().KeyDown:connect(function(key)
if key == "x" then
 getgenv().AutowalkToggled = not getgenv().AutowalkToggled;
end
end)
end)
section1:addButton("My Reused Fly (z)", function()

getgenv().Toggled = false;
local Player = game:GetService('Players').LocalPlayer;
local Camera = workspace.Camera;
local Speed = 250;

game:GetService'RunService'.RenderStepped:Connect(function()
    if (getgenv().Toggled == true and Player.Character and Player.Character:FindFirstChild('HumanoidRootPart')) then
        Player.Character.HumanoidRootPart.Velocity = Camera.CFrame.LookVector * Speed;
    end;
end)

Player:GetMouse().KeyDown:connect(function(key)
if key == "z" then
 getgenv().Toggled = not getgenv().Toggled;
end
end)

end)
section1:addKeybind("Hide/Show GUI", Enum.KeyCode.LeftAlt, function()

	venyx:toggle()
end, function()

end)
-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
	colors:addColorPicker(theme, color, function(color3)
		venyx:setTheme(theme, color3)
	end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)

    end
local gameid = game.PlaceId
if gameid == 9103898828 then
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Venyx", 5013109572)

-- themes
local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Rogue Demon", 5012544693)
local section1 = page:addSection("Section 1")
section1:addSlider("Walkspeed", 1, 1, 60, function(value)
game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

section1:addButton("AutoBreath", function()
	while wait(.5) do
	local args = {
    [1] = "Start"
}

game:GetService("ReplicatedStorage").Knit.Packages.Knit.Services.BreathingService.RE.Breath:FireServer(unpack(args))
end
end)
section1:addButton("No Fall", function()
	game:GetService("ReplicatedStorage").Knit.Packages.Knit.Services.FallDamageService.RE.FallDamage:remove()
end)
section1:addKeybind("Hide/Show GUI", Enum.KeyCode.LeftAlt, function()

	venyx:toggle()
end, function()

end)
-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
	colors:addColorPicker(theme, color, function(color3)
		venyx:setTheme(theme, color3)
	end)
end

-- load
venyx:SelectPage(venyx.pages[1], true)
end


local gameid = game.PlaceId
if gameid == 9285238704 then
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Statue Hub", 5013109572)
local autowintoggle = false

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Race Clicker", 5012544693)
local section1 = page:addSection("Section 1")

section1:addToggle("Auto Win", nil, function(autowintoggletog)
   venyx:Notify("Note:", "You Can Only Win Once Per Round")
autowintoggle = autowintoggletog
end)
section1:addButton("Win", function()
local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(5,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp(-441061, 85, 35053);
end)
section1:addKeybind("Hide/Show GUI", Enum.KeyCode.LeftAlt, function()

	venyx:toggle()
end, function()

end)

-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
	colors:addColorPicker(theme, color, function(color3)
		venyx:setTheme(theme, color3)
	end)
end
while wait(7) do 
    if autowintoggle == true
    then
            local plr = game:service"Players".LocalPlayer;
local tween_s = game:service"TweenService";
local info = TweenInfo.new(5,Enum.EasingStyle.Quad);
function tp(...)
   local tic_k = tick();
   local params = {...};
   local cframe = CFrame.new(params[1],params[2],params[3]);
   local tween,err = pcall(function()
       local tween = tween_s:Create(plr.Character["HumanoidRootPart"],info,{CFrame=cframe});
       tween:Play();
   end)
   if not tween then return err end
end
tp(-441061, 85, 35053);
    end
    end
-- load

venyx:SelectPage(venyx.pages[1], true)
end

-- init

local gameid = game.PlaceId
if gameid == 6839171747 then

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Statue Hub", 5013109572)

local autoopen = false

local themes = {
	Background = Color3.fromRGB(24, 24, 24),
	Glow = Color3.fromRGB(0, 0, 0),
	Accent = Color3.fromRGB(10, 10, 10),
	LightContrast = Color3.fromRGB(20, 20, 20),
	DarkContrast = Color3.fromRGB(14, 14, 14),  
	TextColor = Color3.fromRGB(255, 255, 255)
}

-- first page
local page = venyx:addPage("Doors", 5012544693)
local section = page:addSection("Main")
local section1 = page:addSection("Misc")
_G.RushSpawned = false
section1:addButton("FullBright", function()
    game:GetService("Lighting").FogStart = 0
    game:GetService("Lighting").ExposureCompensation = 3
    game:GetService("Lighting").ClockTime = 12
    game:GetService("Lighting").Brightness = 1
    game:GetService("Lighting").GlobalShadows = false
    while wait(.01) do
        for i, v in pairs(game:GetService("Lighting"):GetDescendants()) do
            if v.Parent == "Lighting" then
                v:remove()
    end
        end
end
end)
section1:addButton("Complete Elevator Power Puzzle", function()
    game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()

end)
section1:addButton("Auto Complete (buggy)", function()
    repeat wait()
local name = game:GetService("ReplicatedStorage").GameData.LatestRoom.Value

local latest = game:GetService("Workspace").CurrentRooms:FindFirstChild(name)

if latest.Door:FindFirstChild("Lock") then
    for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "ModulePrompt" then
            
            game:GetService("Players").LocalPlayer.Character:PivotTo(v.Parent.Hitbox.CFrame + Vector3.new(0,0,0))
            wait(.1)
            if v.Parent == "DrawerContainer" then
                wait(1)
                fireproximityprompt(v.Parent.Knobs.ActivateEventPrompt, 1)
                wait(.6)
                end
            		game:GetService("Players").LocalPlayer.Character:PivotTo(latest.RoomEnd.CFrame + Vector3.new(0,0,0))
            		wait(.1)
   fireproximityprompt(latest.Door.Lock.UnlockPrompt, 1)
   --game:GetService("Workspace").CurrentRooms.0.Assets.Dresser.DrawerContainer.Knobs.ActivateEventPrompt
end
end
end

if name == "50" then
     game:GetService("Workspace").CurrentRooms["50"]:remove()
end
if game:GetService("Workspace"):FindFirstChild("RushMoving") then
    local Players = game:GetService("Players")

 

	local player = Players.LocalPlayer
	local character = player.Character
	if character and character.Parent then
	
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(4, 100, 3))
	end
	repeat wait() until not game:GetService("Workspace"):FindFirstChild("RushMoving")
    end
if game:GetService("Workspace"):FindFirstChild("AmbushMoving") then
    local Players = game:GetService("Players")

 

	local player = Players.LocalPlayer
	local character = player.Character
	if character and character.Parent then
		
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(0, 30, 0))
	end
	repeat wait() until not game:GetService("Workspace"):FindFirstChild("AmbushMoving")
    end
local latest = game:GetService("Workspace").CurrentRooms:FindFirstChild(name)
		game:GetService("Players").LocalPlayer.Character:PivotTo(latest.RoomEnd.CFrame + Vector3.new(0,0,0))
until name == "99"
end)
section1:addButton("Auto Monster Notify", function()
    
    while wait(3) do
 if game:GetService("ReplicatedStorage").GameData.SpawnAmbush.Value == true then
     venyx:Notify("Monster Spawn Notifier", "Ambush Has Spawned, Hide Quickly!")
     
    if game:GetService("Workspace"):FindFirstChild("RushMoving") then

    		venyx:Notify("Monster Spawn Notifier", "Rush Has Spawned, Hide Quickly!")
    		else
    
    		   for i, v in pairs(game:GetService("Workspace"):GetChildren()) do 
    if v.Name == "Lookman"
    
then
    venyx:Notify("Monster Spawn Notifier", "Eyes Has Spawned Somewhere, Dont Look!")
end
end
end
end
end
end)

section1:addButton("Esp Key", function()
while wait(.5) do

--or "Lighter" or "LeverForGate" or "Flashlight" or "Battery"
for i,v in pairs(game:GetService("Workspace").CurrentRooms:GetDescendants()) do
    if v.Name == "KeyObtain" or v.Name == "ElectricalKeyObtain" then
 local esp = Instance.new("Highlight")
 esp.Name = "Highlights"
 esp.FillTransparency = 0
 esp.FillColor = Color3.new(0, 0, 1)
 esp.OutlineColor = Color3.new(1, 0.333333, 1)
 esp.OutlineTransparency = 0.4
 esp.Parent = v
end
end
end
end)

section1:addToggle("Play The Seek Soundtrack", nil, function(firemusic)

game:GetService("Workspace")["Ambience_Seek"].Playing = firemusic
end)

section:addToggle("Auto Open Doors", nil, function(autoopentog)
autoopen = autoopentog
end)

  section1:addSlider("Walkspeed", 1, 1, 100, function(value)

        game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = value
        
end)
section1:addKeybind("Tp Forward", Enum.KeyCode.T, function()
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local character = player.Character
	if character and character.Parent then
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(0, 0, -15))
		end
	
end, function()

end)
section1:addKeybind("Tp Upward", Enum.KeyCode.Z, function()
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local character = player.Character
	if character and character.Parent then
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(0, 15, 0))
		end
	
end, function()

end)

section1:addButton("Larger FOV", function()
game:GetService("RunService").RenderStepped:Connect(function()
        game:GetService("Workspace").Camera.FieldOfView = 120
        end)
end)
section:addButton("Remove Lever Doors", function()
    
for i, v in pairs(game:GetService("Workspace"):GetDescendants()) do if v.Name == "ThingToOpen" then
    v:remove()
end
end
end)
section:addButton("No Screech", function()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Modules.Screech:remove()
end)
section:addButton("No Shade", function()
game:GetService("ReplicatedStorage").ClientModules.EntityModules.Shade:remove()
end)
section:addButton("No Glitch", function()
game:GetService("ReplicatedStorage").ClientModules.EntityModules.Glitch:remove()
end)
section:addButton("Remove Room 50 Door", function()
    game:GetService("Workspace").CurrentRooms:FindFirstChild("50").Door.Door:remove()
end)
section1:addButton("Remove Jumpscare Noises", function()
    game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener["Jumpscare_Ambush"]:remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener["Jumpscare_Ambush2"]:remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Modules.Screech:FindFirstChild("Attack"):remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Modules.Screech:FindFirstChild("Caught"):remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener["Jumpscare_Rush"]:remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener["Jumpscare_Rush2"]:remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Kill:remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener["Jumpscare_Seek"]:remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Modules.HideMonster.Scare:remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Modules.AchievementUnlock.Scare:remove()
game:GetService("Players").LocalPlayer.PlayerGui.MainUI.Initiator["Main_Game"].RemoteListener.Modules.SpiderJumpscare.Scare:remove()
end)
section1:addKeybind("Hide/Show GUI", Enum.KeyCode.LeftAlt, function()

	venyx:toggle()
end, function()

end)

-- second page
local theme = venyx:addPage("Theme", 5012544693)
local colors = theme:addSection("Colors")

for theme, color in pairs(themes) do -- all in one theme changer, i know, im cool
	colors:addColorPicker(theme, color, function(color3)
		venyx:setTheme(theme, color3)
	end)
end
-- load
while wait(2) do
    if antirush == true then
    
if _G.RushSpawned == true then
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local character = player.Character
	if character and character.Parent then
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(0, 20, 0))
		
	repeat wait() until
	_G.RushSpawned == false
		local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	local character = player.Character
	if character and character.Parent then
		local currentPivot = character:GetPivot()
		character:PivotTo(currentPivot * CFrame.new(0, -20, 0))
	end
	end
end
end
end
while wait(2) do
if game:GetService("Workspace"):FindFirstChild("RushMoving") then
    _G.RushSpawned = true
end
end
while wait(2) do
if not game:GetService("Workspace"):FindFirstChild("RushMoving") then
    _G.RushSpawned = false
end
end

venyx:SelectPage(venyx.pages[1], true)

    

while wait() do
    if autoopen == true then
    for i, v in pairs(game:GetService("Workspace").CurrentRooms:GetDescendants()) do
    if v.Name == "ClientOpen" then
        v:FireServer()
        wait(.5)
        for i, v in pairs(game:GetService("Workspace").CurrentRooms:GetDescendants()) do
    if v.Name == "PrismaticConstraint" then
        v.TargetPosition = 10
    end
    end
    
end
end
end
end
end
