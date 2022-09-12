local OldIndex, OldNamecall = nil, nil;
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local State = ReplicatedStorage.State;
if isfile(getgenv().StratName..".txt") then
    local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/banbuskox/dfhtyxvzexrxgfdzgzfdvfdz/main/jsdnfjdsfdjnsmvkjhlkslzLIB", true))()
    local w = lib:CreateWindow("What do you do?")
    w:Section("We detected file with")
    w:Section("same name you choosed")
    w:Section("Do you want to record")
    w:Section("new strat or record")
    w:Section("to the old strat file?")
    local Choosed = false
    w:Button("New Strat", function()
	getgenv().Towers = {}
	getgenv().GoldenPerks = {}
        for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do if v:IsA("Frame") and v.Name == "What do you do?" then v:Remove() end end
	for TowerName, Tower in next, game.ReplicatedStorage.RemoteFunction:InvokeServer("Session", "Search", "Inventory.Troops") do
			if (Tower.Equipped) then
				table.insert(getgenv().Towers, TowerName)
				if (Tower.GoldenPerks) then
					table.insert(getgenv().GoldenPerks, TowerName)
				end
			end;
		end;
	for c=1,5 do if getgenv().Towers[c] == nil then getgenv().Towers[c] = "nil" end end
	if getgenv().GoldenPerks[1] then
		writefile(getgenv().StratName..".txt", 'getgenv().GoldenPerks = {"'..getgenv().GoldenPerks[1]..'","'..getgenv().GoldenPerks[2]..'","'..getgenv().GoldenPerks[3]..'","'..getgenv().GoldenPerks[4]..'","'..getgenv().GoldenPerks[5]..'"}\n')
	end
        writefile(getgenv().StratName..".txt", 'local '..getgenv().APIVar..' = loadstring(game:HttpGet("https://raw.githubusercontent.com/banbuskox/dfhtyxvzexrxgfdzgzfdvfdz/main/ckmhjvskfkmsStratFun2", true))() \n'..getgenv().APIVar..':Loadout("'..getgenv().Towers[1]..'", "'..getgenv().Towers[2]..'", "'..getgenv().Towers[3]..'", "'..getgenv().Towers[4]..'", "'..getgenv().Towers[5]..'") \n'..getgenv().APIVar..':Map("'..game:GetService("ReplicatedStorage").State.Map.Value..'", true, "'..game:GetService("ReplicatedStorage").State.Mode.Value..'")\n');
        Choosed = true
    end)
    w:Button("Old Strat", function()
        for i,v in pairs(game:GetService("CoreGui"):GetDescendants()) do if v:IsA("Frame") and v.Name == "What do you do?" then v:Remove() end end
        appendfile(getgenv().StratName..".txt","---------- STARTED RECORDING TO OLD STRAT FILE ----------\n")
        Choosed = true
    end)
    repeat wait() until Choosed
else
    getgenv().Towers = {}
    for TowerName, Tower in next, game.ReplicatedStorage.RemoteFunction:InvokeServer("Session", "Search", "Inventory.Troops") do
			if (Tower.Equipped) then
				table.insert(getgenv().Towers, TowerName)
			end;
		end;
    for c=1,5 do if getgenv().Towers[c] == nil then getgenv().Towers[c] = "nil" end end
    writefile(getgenv().StratName..".txt", 'local '..getgenv().APIVar..' = loadstring(game:HttpGet("https://raw.githubusercontent.com/banbuskox/dfhtyxvzexrxgfdzgzfdvfdz/main/ckmhjvskfkmsStratFun2", true))() \n'..getgenv().APIVar..':Loadout("'..getgenv().Towers[1]..'", "'..getgenv().Towers[2]..'", "'..getgenv().Towers[3]..'", "'..getgenv().Towers[4]..'", "'..getgenv().Towers[5]..'") \n'..getgenv().APIVar..':Map("'..game:GetService("ReplicatedStorage").State.Map.Value..'", true, "'..game:GetService("ReplicatedStorage").State.Mode.Value..'")\n');
end
function sendw(message)
spawn(function()
if getgenv().Webhook ~= "WEBHOOK (OPTIONAL)" then
local url = getgenv().Webhook
local data = {
	["username"] = "TDS Recorder LOGGER",
	["content"] = message
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
	["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
print("Webhook sent")
end
end)
end
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/banbuskox/dfhtyxvzexrxgfdzgzfdvfdz/main/jsdnfjdsfdjnsmvkjhlkslzLIB", true))()
if game.PlaceId == 5591597781 then
getgenv().recstatus = "Recording"
local w = library:CreateWindow("Recorder")
w:Section("Last Record :")
w:Section("Recording")
local labelx
for i,v in pairs(game.CoreGui:GetDescendants()) do
    if v:IsA("TextLabel") and v.Text == "Recording" then
        labelx = v
    end
end
spawn(function()
while wait() do
labelx.Text = getgenv().recstatus
end
end)
end

spawn(function()
cc = 0
if game.PlaceId == 5591597781 then
game:GetService("Workspace").Towers.ChildAdded:Connect(function(v)
cc = cc + 1
repeat wait() until v:FindFirstChild("Owner") 
if v.Owner.Value == game.Players.LocalPlayer.UserId then
v.Name = tostring(cc)
end
end)
end
end)

function getTroopTypeCheck(troop)
    return troop.Replicator:GetAttribute("Type")
end
function getTroopType(tr)
local check = getTroopTypeCheck(tr)
if check then
	return check
else
	return "Unable to GET"
end
end

local function Convert(Seconds)
    return math.floor(Seconds / 60), Seconds % 60;
end;

local Towers = {};
local GameTowers = game.Workspace.Towers;

spawn(function()
repeat wait() until getgenv().RecorderSync
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local State = ReplicatedStorage.State;
local Wave = tonumber(stateRep:GetAttribute("Wave"));
local Timer = State.Timer;
local CurTime = Timer.Time.Value;
local TM, TS = Convert(CurTime);
appendfile(getgenv().StratName..".txt", getgenv().APIVar..":AutoChain("..getgenv().Commanders[1].Name..", "..getgenv().Commanders[2].Name..", "..getgenv().Commanders[3].Name..", "..Wave..", "..TM..", "..TS..")\n");
getgenv().recstatus = "Activated AutoChain"
sendw("Activated AutoChain")
end)

stateRep = nil
if game.PlaceId == 5591597781 then
	function getStateRep() for i,v in pairs(game:GetService("ReplicatedStorage").StateReplicators:GetChildren()) do if v:GetAttribute("TimeScale") then return v end end end
	repeat stateRep = getStateRep() until stateRep
end

local Events = {
    ["Troops"] = {
        ["Place"] = function(Tower, PositionData)
            spawn(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage");
            local State = ReplicatedStorage.State;
            local Wave = tonumber(stateRep:GetAttribute("Wave"));
            local Timer = State.Timer;
            local CurTime = Timer.Time.Value;
            local Position = PositionData.Position;
            local TM, TS = Convert(CurTime);
            local price = require(game:GetService("ReplicatedStorage").Assets.Troops[Tower].Stats).Price
            if game:GetService("ReplicatedStorage").State.Mode.Value == "Hardcore" then
                price = price * 1.5
            end
            local s = game:GetService("Players").LocalPlayer.PlayerGui.GameGui.Hotbar.Stats.Cash.Amount.Text
            s = string.gsub(s, ",", "")
            if price <= tonumber(s) then
		    if PositionData.Rotation.X > 0 or PositionData.Rotation.Y > 0 or PositionData.Rotation.Z > 0 then
            	appendfile(getgenv().StratName..".txt", getgenv().APIVar..":Place('"..Tower.."', "..Position.X..", "..Position.Y..", "..Position.Z..", "..Wave..", "..TM..", "..TS..", true, "..tostring(PositionData.Rotation.X)..", "..tostring(PositionData.Rotation.Y)..", "..tostring(PositionData.Rotation.Z)..")\n");
		    else
			    appendfile(getgenv().StratName..".txt", getgenv().APIVar..":Place('"..Tower.."', "..Position.X..", "..Position.Y..", "..Position.Z..", "..Wave..", "..TM..", "..TS..")\n");
		    end
            	getgenv().recstatus = "Placed "..Tower
	        sendw("Placed "..Tower)
            else
                warn("No Cash")
                getgenv().recstatus = "No Cash For "..Tower
		        sendw("No Cash For "..Tower)
            end
            end)
        end;
        ["Sell"] = function(Info)
            spawn(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage");
            local State = ReplicatedStorage.State;
            local Wave = tonumber(stateRep:GetAttribute("Wave"))
            local Timer = State.Timer;
            local CurTime = Timer.Time.Value;
            local Index = Info.Troop.Name
            local TM, TS = Convert(CurTime);
            appendfile(getgenv().StratName..".txt", getgenv().APIVar..":Sell("..Index..", "..Wave..", "..TM..", "..TS..")\n");
            getgenv().recstatus = "Sold "..Info.Troop.Name
	        sendw("Sold "..Info.Troop.Name.." ("..getTroopType(Info.Troop)..")")
            end)
        end;
        ["Upgrade"] = {
            ["Set"] = function(Troop)
                spawn(function()
                local ReplicatedStorage = game:GetService("ReplicatedStorage");
                local State = ReplicatedStorage.State;
                local Wave = tonumber(stateRep:GetAttribute("Wave"))
                local Timer = State.Timer;
                local CurTime = Timer.Time.Value;
                local Index = Troop.Troop.Name;
                local TM, TS = Convert(CurTime);
                repeat wait() until Troop.Troop:FindFirstChild("Owner")
                local price = require(game:GetService("ReplicatedStorage").Assets.Troops[tostring(getTroopType(Troop.Troop))].Stats).Upgrades[tonumber(Troop.Troop.Replicator:GetAttribute("Upgrade")) + 1].Cost
                if game:GetService("ReplicatedStorage").State.Mode.Value == "Hardcore" then
                    price = price * 1.5
                end
		        if Troop.Troop.Display.Discount.Value ~= 0 then
		        	local disc = Troop.Troop.Display.Discount.Value
                    local check = math.sign(disc)
                    if check == 1 then
		        	disc = tonumber("0."..disc)
		        	price = price-(price*disc)
                    elseif check == -1 then
                    disc = tostring(disc):gsub("-", "")
                    disc = tonumber(disc)
                    if disc ~= 100 then
                    disc = tonumber("0."..disc)
                    else
                    disc = 1
                    end
                    price = price+(price*disc)
                    end
		        end
                local s = game:GetService("Players").LocalPlayer.PlayerGui.GameGui.Hotbar.Stats.Cash.Amount.Text
                s = string.gsub(s, ",", "")
                if price <= tonumber(s) then
                appendfile(getgenv().StratName..".txt", getgenv().APIVar..":Upgrade("..Index..", "..Wave..", "..TM..", "..TS..")\n");
                getgenv().recstatus = "Upgraded "..Troop.Troop.Name
		        sendw("Upgraded "..Index.." ("..getTroopType(Troop.Troop)..")")
                else
                    warn("No Cash")
                    getgenv().recstatus = "No Cash For Upgrade "..Troop.Troop.Name
		            sendw("No Cash For Upgrade "..Troop.Troop.Name)
                end
                end)
            end;
        };
        ["Target"] = {
            ["Set"] = function(Troop)
                spawn(function()
                local ReplicatedStorage = game:GetService("ReplicatedStorage");
                local State = ReplicatedStorage.State;
                local Wave = tonumber(stateRep:GetAttribute("Wave"))
                local Timer = State.Timer;
                local CurTime = Timer.Time.Value;
                local Index = Troop.Troop.Name
                local TM, TS = Convert(CurTime);
                appendfile(getgenv().StratName..".txt", getgenv().APIVar..":Target("..Index..", "..Wave..", "..TM..", "..TS..")\n");
                getgenv().recstatus = "Changed Target "..Troop.Troop.Name
		        sendw("Changed Target "..Troop.Troop.Name.." ("..getTroopType(Troop.Troop)..")")
                end)
            end;
        };
        ["Abilities"] = {
            ["Activate"] = function(Info)
                spawn(function()
                local ReplicatedStorage = game:GetService("ReplicatedStorage");
                local State = ReplicatedStorage.State;
                local Wave = tonumber(stateRep:GetAttribute("Wave"))
                local Timer = State.Timer;
                local CurTime = Timer.Time.Value;
                local Troop, Ability = Info.Troop, Info.Name;
                local Index = Info.Troop.Name
                local TM, TS = Convert(CurTime);
                if Info.AutoChain == nil then
                    appendfile(getgenv().StratName..".txt", getgenv().APIVar..":Ability("..Index..", \""..Ability.."\", "..Wave..", "..TM..", "..TS..")\n");
                    getgenv().recstatus = "Activated "..Info.Name.." In "..Info.Troop.Name
                    sendw("Activated "..Info.Name.." In "..Info.Troop.Name)
                end
                end)
            end;
        }
    },
    ["Waves"] = {
        ["Skip"] = function()
            spawn(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage");
            local State = ReplicatedStorage.State;
            local Wave = tonumber(stateRep:GetAttribute("Wave"))
            local Timer = State.Timer;
            local CurTime = Timer.Time.Value;
            local TM, TS = Convert(CurTime);
            appendfile(getgenv().StratName..".txt", getgenv().APIVar..":Skip("..Wave..", "..TM..", "..TS..")\n");
            getgenv().recstatus = "Skipped Wave"
	        sendw("Skipped Wave")
            end)
        end;
    },
    ["Difficulty"] = {
        ["Vote"] = function(Difficulty)
            spawn(function()
            local ReplicatedStorage = game:GetService("ReplicatedStorage");
            local State = ReplicatedStorage.State;
            if State.Mode.Value == "Survival" then
                appendfile(getgenv().StratName..".txt", getgenv().APIVar..":Mode('"..Difficulty.."')\n");
                getgenv().recstatus = "Voted For Difficulty"
		        sendw("Voted For Difficulty")
            end
            end)
        end;
    }
}

OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
    local Args = {...};
    local Self = table.remove(Args, 1);
    local Method = getnamecallmethod();
    
        if (table.find({"InvokeServer", "FireServer"}, Method)) then
            coroutine.wrap(function()
                local Select = table.remove(Args, 1);
                local Current = Events[Select];
                if (Current) then
                    Current = Current[table.remove(Args, 1)];
                    while (typeof(Current) == "table") do
                        Current = Current[table.remove(Args, 1)];
                    end;
                    if (typeof(Current) == "function") then
                        local a, b = pcall(Current, unpack(Args));
                        warn(a, b);
                    end;
                end;
            end)();
        end;
    
    return OldNamecall(...);
end));
