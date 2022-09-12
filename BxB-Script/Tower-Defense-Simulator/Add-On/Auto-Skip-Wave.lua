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
