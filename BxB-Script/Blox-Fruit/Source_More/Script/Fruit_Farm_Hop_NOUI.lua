repeat wait() until game.IsLoaded and (game.Players.LocalPlayer or game.Players.PlayerAdded:Wait()) and (game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait())
if Ran then 
    return
else
    getgenv().Ran = true
end

if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main", 9e9):FindFirstChild("ChooseTeam") then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
    wait(3)
end

local plr = game.Players.LocalPlayer
local chr = plr.Character
local t = game.TweenService

local bv = Instance.new("BodyVelocity")
bv.MaxForce = Vector3.new(1/0, 1/0, 1/0)
bv.Velocity = Vector3.new()
bv.Name = "bV"
local bav = Instance.new("BodyAngularVelocity")
bav.AngularVelocity = Vector3.new()
bav.MaxTorque = Vector3.new(1/0, 1/0, 1/0)
bav.Name = "bAV" 

for _,v in next, workspace:GetChildren() do
    if v.Name:find("Fruit") and (v:IsA("Tool") or v:IsA("Model")) then
        repeat 
            local anc1 = bv:Clone()
            anc1.Parent = chr.HumanoidRootPart
            local anc2 = bav:Clone()
            anc2.Parent = chr.HumanoidRootPart
            local p = t:Create(chr.HumanoidRootPart, TweenInfo.new((plr:DistanceFromCharacter(v.Handle.Position)-100)/320, Enum.EasingStyle.Linear), {CFrame=v.Handle.CFrame + Vector3.new(0, v.Handle.Size.Y, 0)})
            p:Play()
            p.Completed:Wait()
            chr.HumanoidRootPart.CFrame = v.Handle.CFrame
            anc1:Destroy()
            anc2:Destroy()
            wait(1)
        until v.Parent ~= workspace
        wait(1)
        local fruit = chr:FindFirstChildOfClass("Tool") and chr:FindFirstChildOfClass("Tool").Name:find("Fruit") and chr:FindFirstChildOfClass("Tool") or (function()
            for _,fr in plr.Backpack:GetChildren() do
                if fr.Name:find("Fruit") then
                    return fr
                end 
            end
        end)()
        print(fruit)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit", fruit:GetAttribute("OriginalName"), fruit)
    end
end

print('nope')
local currentJobId = game.JobId
repeat
    task.spawn(pcall, function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer, game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(math.random(1, 100))[math.random(1, 100)])
    end)    
    wait(2)
until game.JobId ~= currentJobId
