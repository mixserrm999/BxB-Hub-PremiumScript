loadstring(game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Tower-Defense-Simulator/AutoFarm/Low-LvL.lua/Notify.lua"))()
say("SCRIPT","BxB")
while wait(1) do
	for i,v in pairs(game:GetService("Workspace").Towers:GetChildren()) do 
		if v:FindFirstChild("Owner") then 
		if v.Owner.Value == game.Players.LocalPlayer.UserId and v.Replicator:GetAttribute("Type") == "Commander" then
		if getgenv().Commander then
			game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops","Abilities","Activate",{["Troop"] = v,["Name"] = "Call Of Arms"})
		end
		elseif v.Owner.Value == game.Players.LocalPlayer.UserId and v.Replicator:GetAttribute("Type") == "Swarmer" then
		if getgenv().Swarmer then
            game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops","Abilities","Activate",{["Troop"] = v,["Name"] = "Swarm"})
		end
		elseif v.Owner.Value == game.Players.LocalPlayer.UserId and v.Replicator:GetAttribute("Type") == "Gladiator" then
		if getgenv().Gladiator then
            game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer("Troops","Abilities","Activate",{["Troop"] = v,["Name"] = "Warrior's Call"})
		end	
		end
		end
	end
end
