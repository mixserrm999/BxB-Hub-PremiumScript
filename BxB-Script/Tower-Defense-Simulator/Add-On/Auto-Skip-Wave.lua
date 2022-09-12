--[[ ============== [ Auto Loop Skip ] ============== ]]--
while wait(0.1) do
game.ReplicatedStorage.RemoteEvent:FireServer("Waves","Skip")
end
--[[ ========================================== ]]--
--[[ ============== [ Keybind Skip ] ============== ]]--
--To skip press "E"
game:GetService("UserInputService").InputBegan:Connect(function(input, chatting)
if input.KeyCode == Enum.KeyCode.E and not chatting then
game.ReplicatedStorage.RemoteEvent:FireServer("Waves","Skip")
end
end)
--[[ ========================================== ]]--
--[[ ============== [ Abilities Under KeyBinds (Works With AutoStrats) ] ============== ]]--
local library = loadstring(game:HttpGet("hhttps://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Tower-Defense-Simulator/load-For-AutoAbilityUI.lua", true))()
local w = library:CreateWindow("Info")
w:Section("B for Commander")
w:Section("N for Gladiator")
w:Section("M for Swarmer")
local event = game.ReplicatedStorage.RemoteFunction
function actc(Name,AName)
for i,v in pairs(game.Workspace.Towers:GetChildren()) do
if v:WaitForChild("Owner").Value == game.Players.LocalPlayer.UserId then
if v.Replicator:GetAttribute("Type") == Name then
event:InvokeServer("Troops","Abilities","Activate",{["Troop"] = v, ["Name"] = AName})
end
end
end
end
game:GetService("UserInputService").InputBegan:Connect(function(input, chatting)
if input.KeyCode == Enum.KeyCode.B and not chatting then
actc("Commander","Call Of Arms")
elseif input.KeyCode == Enum.KeyCode.N and not chatting then
actc("Gladiator", "Warrior's Call")
elseif input.KeyCode == Enum.KeyCode.M and not chatting then
actc("Swarmer","Swarm")
end
end)
--[[ ========================================== ]]--
--[[ ============== [ Hotkey ] ============== ]]--

--original script by MintTea, customizable
local m = game.Players.LocalPlayer:GetMouse()
function findModel(part)
    while true do
        local parentModel = part:FindFirstAncestorOfClass("Model")
        if not parentModel then
            return nil
        end
        if parentModel.Parent == workspace.Towers then
            return parentModel
        else
            part = parentModel
        end
    end
end
m.KeyDown:Connect(function(key)
    local tar = m.Target
    local tower = findModel(tar)
    if tower then
    if key:lower() == "e" then
     game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops","Upgrade","Set",{["Troop"] = tower})
    elseif key:lower() == "r" then
        game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops","Sell",{["Troop"] = tower})
	elseif key:lower() == "z" then
        game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops","Abilities","Activate",{["Name"] = "Call Of Arms",["Troop"] = tower})
    elseif key:lower() == "x" then
        game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops","Abilities","Activate",{["Name"] = "Warrior's Call",["Troop"] = tower})
    elseif key:lower() == "c" then
        game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops","Abilities","Activate",{["Name"] = "Cleansing",["Troop"] = tower})
    elseif key:lower() == "v" then
        game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops","Abilities","Activate",{["Name"] = "Swarm",["Troop"] = tower})
    end
    end
end)
--[[ ========================================== ]]--
