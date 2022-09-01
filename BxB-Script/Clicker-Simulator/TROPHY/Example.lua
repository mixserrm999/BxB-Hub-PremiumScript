
local WallyV2 = select(2, pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Clicker-Simulator/TROPHY/TPC-Lib.lua", true))()
end))

if type(WallyV2) == 'table' then
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    local Window = WallyV2:CreateWindow("Clicker Simulator")
    Window:Section("Trophies")
    Window:Button("Collect Trophies", function()
        local Head = select(2, pcall(function()
            return LocalPlayer.Character.Head
        end))
        local Drops = select(2, pcall(function()
            return workspace.Zones.HalfYear.Drops
        end))
        if typeof(Head) == 'Instance' and Head:IsA("BasePart") and typeof(Drops) == 'Instance' then
            for _, v in pairs(Drops:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    local Part = v.Parent
                    if typeof(Part) == 'Instance' and Part:IsA("BasePart") then
                        firetouchinterest(Head, Part, 0)
                        task.wait(.01)
                        firetouchinterest(Head, Part, 1)
                    end
                end
            end
        end
    end)
end

