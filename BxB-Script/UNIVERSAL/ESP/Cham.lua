local highlight = Instance.new("Highlight")
local rS = game:GetService("RunService")

rS.RenderStepped:Connect(function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if not v.Character:FindFirstChild("Highlight") then
            highlight.FillTransparency = 1
            highlight:Clone().Parent = v.Character
            highlight.OutlineColor = v.Team.TeamColor.Color
    end
    
    game.Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function(char)
            if not char:FindFirstChild("Highlight") then
                highlight.FillTransparency = 1
                highlight:Clone().Parent = char
                highlight.OutlineColor = plr.Team.TeamColor.Color
            end
        end)
    end)
    end
end)
