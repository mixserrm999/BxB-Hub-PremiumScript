repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character
wait(1)
local function chat (msg) 
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
end



local Players = game:GetService("Players")
onPlayerChat = function(chat_type,recipient,message)
print(chat_type)
print(recipient)
print(message)
--help
if (message == "!help" or message == "!cmds") then
print("TEST")
end


--mre
if (message == "!MRE" or message == "!mre" or message == "!lunchbox") then

end


end
Players.PlayerChatted:Connect(onPlayerChat)
