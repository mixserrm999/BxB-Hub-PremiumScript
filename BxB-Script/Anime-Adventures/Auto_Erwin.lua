--[[Features:

Auto Using Erwin Special Skill (damage buff)
Checking Erwin’s stunned status if Erwin’s stunned,  waiting for Erwin’s wake up
Checking Erwin Owner
Renaming your erwins erwin1,erwin2
You Need just 2 erwin for loop you can place 3 but that script using 2 erwin buff
How To Use: Place Minimum 2 Erwin and Upgrade 3 times (unlock special skill) then execute script]]



repeat
task.wait(3)
until game:GetService("Players").LocalPlayer ~= nil

if not game:GetService("Players").LocalPlayer.Character then
    game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
    task.wait()
end
repeat
    task.wait(3)
until game.PlaceId == 8349889591

task.wait()

local erwinUnits = {}
local localPlayer = game:GetService("Players").LocalPlayer

repeat task.wait(5)
  for _, instance in next, workspace._UNITS:GetChildren() do
    if instance.Name ~= "erwin" then continue end
    if instance._stats.player.Value ~= localPlayer then continue end
    if table.find(erwinUnits, instance) then continue end
    table.insert(erwinUnits, instance)
  end
  task.wait()
until #erwinUnits >= 2
task.wait (1)
if #erwinUnits == 2 then
local notifSound = Instance.new("Sound",workspace)
notifSound.PlaybackSpeed = 1.5
notifSound.Volume = 20
notifSound.SoundId = "rbxassetid://5644086231"
notifSound.PlayOnRemove = true
notifSound:Destroy()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Script loaded enjoy!",
Text = "Discord:Kirito#8888 and v3rmillion: HuzurAtesi",
Icon = "rbxassetid://9688035375"; 
Duration = 5 
}) elseif #erwinUnits == 1 then
local notiffSound = Instance.new("Sound",workspace)
notiffSound.PlaybackSpeed = 1.5
notiffSound.Volume = 20
notiffSound.SoundId = "rbxassetid://560114574"
notiffSound.PlayOnRemove = true
notiffSound:Destroy()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Error!",
Text = "You Need A Put One More Erwin.", 
Icon = "rbxassetid://9927436121",
Button1 = "Okay.",
Button2 = "No Stfu!",
Duration = 30 
}) elseif #erwinUnits == 3 then
local notifSound = Instance.new("Sound",workspace)
notifSound.PlaybackSpeed = 1.5
notifSound.Volume = 20
notifSound.SoundId = "rbxassetid://5644086231"
notifSound.PlayOnRemove = true
notifSound:Destroy()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "Script loaded enjoy!",
Text = "3 Erwin Dedected",
Text2 = "script working but only using 2 erwin",
Text3 = "Discord:Kirito#8888 and v3rmillion: HuzurAtesi",
Icon = "rbxassetid://9688035375"; 
Duration = 5 
})  else 
local notiffSound = Instance.new("Sound",workspace)
notiffSound.PlaybackSpeed = 1.5
notiffSound.Volume = 20
notiffSound.SoundId = "rbxassetid://560114574"
notiffSound.PlayOnRemove = true
notiffSound:Destroy()
game:GetService("StarterGui"):SetCore("SendNotification",{
Title = "No Erwin Dedected",
Text = "You Need A Place Min 2 Erwin.", 
Icon = "rbxassetid://9927436121",
Button1 = "Okay.",
Button2 = "No Stfu!",
Duration = 30 
})
end
function square(a)
local remote = game:GetService("ReplicatedStorage").endpoints.client_to_server.use_active_attack --erwin special skill remote
if #erwinUnits == 2 then
    while true do
        repeat task.wait() until erwinUnits[1]._stats.unit_stunned.Value == 0
        remote:InvokeServer(erwinUnits[1])
        wait(20)
        repeat task.wait() until erwinUnits[2]._stats.unit_stunned.Value == 0
        remote:InvokeServer(erwinUnits[2])
        wait(20)
    end
elseif #erwinUnits == 3 then
    repeat task.wait()
        table.remove(erwinUnits, 1)
    until #erwinUnits == 2 
    while true do
        repeat task.wait() until erwinUnits[1]._stats.unit_stunned.Value == 0
        remote:InvokeServer(erwinUnits[1])
        task.wait(20)
        repeat task.wait() until erwinUnits[2]._stats.unit_stunned.Value == 0
        remote:InvokeServer(erwinUnits[2])
        task.wait(20)
    end
end
end
local status, retval = pcall(square,10);
print ("Status: ", status)        -- will print "true" because no errors were thrown 
print ("Return Value: ", retval)  -- will print "100"
