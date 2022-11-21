repeat wait() until game:IsLoaded()
spawn(function()
    while task.wait(.1) do
        pcall(function()
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
                vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                wait(1)
                vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end)
    end
end)
function Teleport()
    wait (0.5)
    game.Players.LocalPlayer:Kick("Hoppppp")
end
_G.Settings = {
    Autofarm = false;
    Code = false;
    room = "_lobbytemplategreen3";
    story = "namek_infinite";
    Mode = "Hard";
    UUID = {};
    Reach = 100;
}
local filename = "8304191830_KNIXNKK.json";
function saveSettings()
    local json;
    local HttpService = game:GetService("HttpService");
    if (writefile) then
        json = HttpService:JSONEncode(_G.Settings);
        writefile(filename,json)
    else
        print(' -- CANNOT SAVE CONFIG FILE -- ')
    end   
end
function loadSettings()
    local HttpService = game:GetService("HttpService");
    if (readfile and isfile and isfile(filename)) then
        _G.Settings = HttpService:JSONDecode(readfile(filename));
    else
        saveSettings()
    end
end
loadSettings()
spawn(function()
    while task.wait() do
        repeat wait() until game.CoreGui:FindFirstChild('RobloxPromptGui')
        local lp,po,ts = game:GetService('Players').LocalPlayer,game.CoreGui.RobloxPromptGui.promptOverlay,game:GetService('TeleportService')
        po.ChildAdded:connect(function(a)
            if a.Name == 'ErrorPrompt' then
                repeat
                    ts:Teleport(8304191830)
                    wait(2)
                until false
            end
        end)
    end
end)
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/insanedude59/UILib/main/source"))();
local codes = loadstring(game:HttpGet("https://pastebin.com/raw/7pF7RfUv"))()

lib:SetTitle("MIGRAINE | KNIXNKK")

local tab1 = lib:NewTab("Farm Settings", ":D") 
tab1:NewToggle("Autofarm",_G.Settings.Autofarm,function(value) 
    _G.Settings.Autofarm = value
    saveSettings()
end)
tab1:NewToggle("Code",_G.Settings.Code,function(value) 
    _G.Settings.Code = value
    saveSettings()
end)
tab1:NewTextBox("Reach","...",function(value) 
    _G.Settings.Reach = value
    saveSettings()
end)
tab1:NewButton("Get UUID",function()
    plr = game.Players.LocalPlayer.Name
    path = game:GetService("Workspace")[plr]["_pets_folder"]:GetChildren()
    for i,v in pairs(path) do
        setclipboard(tostring(v))
    end
end)
tab1:NewTextBox("Add UNIT","...",function(value)
    table.insert(_G.Settings.UUID, value)
    saveSettings()
end)
tab1:NewButton("Clear UUID",function()
    _G.Settings.UUID = {}
    saveSettings()
end)
tab1:NewButton("Show UUID",function()
    for i,v in pairs(_G.Settings.UUID) do
        print(i,v)
    end
end)
local tab2 = lib:NewTab("Room Settings", ":D") 
tab2:NewTextBox("Room","...",function(value) 
    _G.Settings.room = value
    saveSettings()
end)
tab2:NewTextBox("Mode","...",function(value) 
    _G.Settings.Mode = value
    saveSettings()
end)
tab2:NewTextBox("Story","...",function(value)
    _G.Settings.story = value
    saveSettings()
end)
local tab3 = lib:NewTab("Mics", ":D") 
tab3:NewTextBox("Webhook","...",function(value) 
    _G.Settings.URL = value
    saveSettings()
end)
tab3:NewButton("Server hop",function()
    Teleport()
end)
function deleteText()
    pcall(function()
        path = game:GetService("Players").LocalPlayer.PlayerGui.MessageGui.messages:GetChildren()
        for i,v in pairs(path) do
            if tostring(v) == "Error" then
                v:destroy()
            end
        end
    end)
end
if game.PlaceId == 8304191830 then
    while wait() do
        loadSettings()
        wait(5)
        if _G.Settings.Code then
            wait(3)
            for i,v in pairs(codes) do
                Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["redeem_code"]
                local args = {
                    [1] = tostring(v)
                }
                Event:InvokeServer(unpack(args))
                wait(.1)
            end
        end
        if _G.Settings.Autofarm then
            wait(10)
            event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["request_join_lobby"]
            local args = {
                [1] = tostring(_G.Settings.room)
            }
            event:InvokeServer(unpack(args))
            wait(1.5)
            event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["request_lock_level"]
            local args = {
                [1] = tostring(_G.Settings.room),
                [2] = tostring(_G.Settings.story),
                [3] = true,
                [4] = tostring(_G.Settings.Mode)
            }
            event:InvokeServer(unpack(args))
            wait(1.5)
            event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["request_start_game"]
            local args = {
                [1] = tostring(_G.Settings.room)
            }
            event:InvokeServer(unpack(args))
            wait(120)
        end
    end
end
if game.PlaceId == 8349889591 then
    loadSettings()
    wait(10)
    Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["vote_start"]
    Event:InvokeServer()
    path = game:GetService("Workspace")["_road"].ground:GetChildren()
    vector = {}
    place = {}
    for i,v in pairs(path) do
        if tostring(v) == "1" then
            table.insert(vector, v.Position)
        elseif tostring(v) == "2" then
            table.insert(vector, v.Position)
        elseif tostring(v) == "main" then
            table.insert(vector, v.Position)
        end
    end
    if _G.Settings.Autofarm then
    spawn(function()
        while task.wait(.1) do
            pcall(function()
                    local unit = {}
                    for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                        if v:IsA("Model") and v._stats.player.Value == game.Players.LocalPlayer then
                            if not table.find(unit, tostring(v)) then
                                table.insert(unit, tostring(v))
                            end
                        end
                    end
                    function getRandom()
                        local dist, thing = math.huge
                        UNITS = game:GetService("Workspace")["_UNITS"]:GetChildren()
                        for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                            if tonumber(i) == math.random(1,#UNITS) then
                                if v:IsA("Model") and table.find(unit, v.Name) ~= nil then
                                    thing = v
                                end
                            end
                        end
                        return thing
                    end
                    function round(x)
                        return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
                    end
                    spawn(function()
                        pcall(function()
                                ran_chr = getRandom()
                                WaveNumber = game:GetService("Players").LocalPlayer.PlayerGui.Waves.HealthBar.WaveNumber.Text
                                if tonumber(WaveNumber) >= tonumber(_G.Settings.Reach) then
                                    spawn(function()
                                        while task.wait(.1) do
                                            Event = game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame
                                            local args = {
                                                [1] = ran_chr
                                            }
                                            Event:InvokeServer(unpack(args))
                                            wait(.1)
                                            Event = game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame
                                            local args = {
                                                [1] = tostring(ran_chr)
                                            }
                                            Event:InvokeServer(unpack(args))
                                            wait(.1)
                                    end
                                end)
                                else
                                    for i,v in pairs(_G.Settings.UUID) do
                                        Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["spawn_unit"]
                                        randomPosition = vector[math.random(1, #vector)]
                                        pve = game:GetService("Workspace")["_BASES"].pve["base_"]["fake_unit"].HumanoidRootPart.Position
                                        pveAway = (pve-randomPosition).Magnitude
                                        base = game:GetService("Workspace")["_BASES"].player.base["fake_unit"].HumanoidRootPart.Position
                                        baseAway = (base-randomPosition).Magnitude
                                        if pveAway < baseAway then
                                            xPos = randomPosition
                                        end
                                        choice = math.random(1,4)
                                        if tonumber(choice) == 1 then
                                            local args = {
                                                [1] = tostring(v),
                                                [2] = CFrame.new(xPos)
                                            }
                                            Event:InvokeServer(unpack(args))
                                        end
                                        if tonumber(choice) == 2 then
                                            local args = {
                                                [1] = tostring(v),
                                                [2] = CFrame.new(xPos)
                                            }
                                            Event:InvokeServer(unpack(args))
                                        end
                                        if tonumber(choice) == 3 then
                                            local args = {
                                                [1] = tostring(v),
                                                [2] = CFrame.new(xPos)
                                            }
                                            Event:InvokeServer(unpack(args)) 
                                        end
                                        if tonumber(choice) == 4 then
                                            local args = {
                                                [1] = tostring(v),
                                                [2] = CFrame.new(xPos)
                                            }
                                            Event:InvokeServer(unpack(args))
                                        end
                                        end
                                end               
                                if tonumber(WaveNumber) <= tonumber(_G.Settings.Reach) then
                                    Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["vote_wave_skip"]
                                    Event:InvokeServer()
                                end
                            end)
                    end)
                end)
        end
    end)
    spawn(function()
        while wait(.1) do
            pcall(function()
                local unit = {}
                for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                    if v:IsA("Model") and v._stats.player.Value == game.Players.LocalPlayer then
                        if not table.find(unit, tostring(v)) then
                            table.insert(unit, tostring(v))
                        end
                    end
                end
                function getRandom()
                    local dist, thing = math.huge
                    UNITS = game:GetService("Workspace")["_UNITS"]:GetChildren()
                    for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
                        if tonumber(i) == math.random(1,#UNITS) then
                            if v:IsA("Model") and table.find(unit, v.Name) ~= nil then
                                thing = v
                            end
                        end
                    end
                    return thing
                end
                function round(x)
                    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
                end
                chr = getRandom()
                Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["upgrade_unit_ingame"]
                local args = {
                    [1] = chr
                }
                Event:InvokeServer(unpack(args))
                wait(.1)
                Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["upgrade_unit_ingame"]
                local args = {
                    [1] = tostring(chr)
                }
                Event:InvokeServer(unpack(args))
                wait(.1)
                Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["use_active_attack"]
                local args = {
                    [1] = chr
                }
                Event:InvokeServer(unpack(args))
                wait(.1)
                Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["use_active_attack"]
                local args = {
                    [1] = tostring(chr)
                }
                Event:InvokeServer(unpack(args))
                wait(.1)
            end)
        end
    end)
    spawn(function()
        while task.wait(.2) do
            pcall(function()
                waves = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.WavesCompleted.Text
                if tostring(waves) ~= "Waves Completed: 999" then
                    wait(1)
                    print('Complete')
                    plr = game.Players.LocalPlayer.Name
                    gemAmount = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.GoldGemXP.GemReward.Main.Amount.Text
                    xpAmount = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.GoldGemXP.XPReward.Main.Amount.Text
                    globalGold = game:GetService("Players").LocalPlayer["_stats"]["gold_amount"].Value
                    globalGem = game:GetService("Players").LocalPlayer["_stats"]["gem_amount"].Value
                    roundXp = round(game:GetService("Players").LocalPlayer["_stats"]["player_xp"].Value)
                    globalLevel = game:GetService("Workspace")[plr].Head["_overhead"].Frame["Level_Frame"].Level.Text
                    sybgem = string.gsub(gemAmount, '+', '')
                    sybxp = string.gsub(xpAmount, '+', '')
                    timer = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.Timer.Text
                    -- yur webhok src
                            wait(1)
                            pa = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["teleport_back_to_lobby"]
                            local args = {}
                            pa:InvokeServer(unpack(args))
                            wait(120)
                end
            end)
        end
    end)
    spawn(function()
        while task.wait() do
            deleteText()
        end
    end)
    spawn(function()
        while task.wait(5) do
            pcall(function()
                UNIT = game:GetService("Workspace")["_UNITS"]:GetChildren()
                for i,v in pairs(UNIT) do
                    chr = v
                    priority = game:GetService("Workspace")["_UNITS"][tostring(chr)]["_stats"].priority.Value
                    if tostring(priority) ~= "closest" then
                        Event = game:GetService("ReplicatedStorage").endpoints["client_to_server"]["cycle_priority"]
                        local args = {
                            [1] = chr
                        }
                        Event:InvokeServer(unpack(args))
                        wait(.1)
                    end
                end
            end)
        end
    end)
end
end
