----------------------------------
if game:IsLoaded() ~= true then
	game.Loaded:Wait(1)
end
----------------------------------
local players = game:GetService("Players")
local plr = players.LocalPlayer
local plrId = players.LocalPlayer.UserId

function Self(target)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local Highlight_Self = Instance.new("Highlight")
            Highlight_Self.RobloxLocked = true
            Highlight_Self.Name = "GetReal"
            Highlight_Self.Adornee = target.Character
            Highlight_Self.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Highlight_Self.FillTransparency = 1.0
            Highlight_Self.FillColor = Color3.fromRGB(255,111,255)
            Highlight_Self.OutlineTransparency = 0.0
            Highlight_Self.OutlineColor = Color3.fromRGB(255,111,255)
            Highlight_Self.Parent = target.Character
        end
    end
end

players.PlayerRemoving:Connect(function(v)
    if Highlight_Self then
        Highlight_Self:Destroy()
        Highlight_Self = nil
    end
end)

function Friend(target)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local Highlight_Friend = Instance.new("Highlight")
            Highlight_Friend.RobloxLocked = true
            Highlight_Friend.Name = "GetReal"
            Highlight_Friend.Adornee = target.Character
            Highlight_Friend.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Highlight_Friend.FillTransparency = 0.75
            Highlight_Friend.FillColor = Color3.fromRGB(0,255,0)
            Highlight_Friend.OutlineTransparency = 0.25
            Highlight_Friend.OutlineColor = Color3.fromRGB(0,255,0)
            Highlight_Friend.Parent = target.Character
        end
    end
end

players.PlayerRemoving:Connect(function(v)
    if Highlight_Friend then
        Highlight_Friend:Destroy()
        Highlight_Friend = nil
    end
end)

function Others(target)
    if target.Character then
        if not target.Character:FindFirstChild("GetReal") then
            local Highlight_Others = Instance.new("Highlight")
            Highlight_Others.RobloxLocked = true
            Highlight_Others.Name = "GetReal"
            Highlight_Others.Adornee = target.Character
            Highlight_Others.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            Highlight_Others.FillTransparency = 0.75
            Highlight_Others.FillColor = Color3.fromRGB(0,0,0)
            Highlight_Others.OutlineTransparency = 0.25
            Highlight_Others.OutlineColor = Color3.fromRGB(255,255,255)
            Highlight_Others.Parent = target.Character
        end
    end
end

players.PlayerRemoving:Connect(function(v)
    if Highlight_Others then
        Highlight_Others:Destroy()
        Highlight_Others = nil
    end
end)


while task.wait() do
    for i, v in pairs(players:GetPlayers()) do
        if v == plr then
            Self(v)
        elseif v:IsFriendsWith(plrId) == true then
            Friend(v)
        -- elseif v ~= plr and v:IsFriendsWith(plrId) ~= true then
        --     Others(v)
        end
    end
end
