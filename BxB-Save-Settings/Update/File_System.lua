--// Check Load
repeat wait() until game:IsLoaded()

if not LPH_OBFUSCATED then 
    LPH_NO_VIRTUALIZE = function(...) return (...) end;
    LPH_JIT_MAX = function(...) return (...) end;
end
--// Check File [1]
if not isfolder("BxB_System") then
    makefolder("BxB_System")
end
--// Check File [2]
if not isfolder("BxB_System/"..game.Players.LocalPlayer.Name) then
    makefolder("BxB_System/"..game.Players.LocalPlayer.Name)
end 
--// Function Update Data Player
function updateTotalGem()
    pcall(function()
        local j
        local HS = game:GetService("HttpService")
        if writefile then
            d = HS:JSONEncode(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGui"):WaitForChild("TopHolder"):WaitForChild("Gems"):WaitForChild("Price").Text:gsub(",",""))
            writefile("BxB_System/"..game.Players.LocalPlayer.Name.."/TotalGems.json",d)
        end
    end)
end

--// Save File / SaveSetting
local SaveSetting = LPH_NO_VIRTUALIZE(function()
    local j
    local HS = game:GetService("HttpService")
    if writefile then
        d = HS:JSONEncode(_G.Settings)
        writefile("BxB_System/"..game.Players.LocalPlayer.Name.."/Settings.json",d)
        writefile("BxB_System/"..game.Players.LocalPlayer.Name.."/Whitelist.json",d)
    end
end)

--// _G.Function / getgenv().Function
function a()
_G.Settings = {
    MobSwordNickname = "",
    BossSwordNickname = "",
    ChestSwordNickname = "",
    Delay = 0,
    WebhookLink = "",
    AutoDungeon = false,
    JoinDelay = 0
}
SaveSetting()
end
--// Readfile
if readfile and isfile and isfile("BxB_System/"..game.Players.LocalPlayer.Name.."/Settings.json") then
    local HS = game:GetService("HttpService")
    _G.Settings = HS:JSONDecode(readfile("BxB_System/"..game.Players.LocalPlayer.Name.."/Settings.json"))
end
--//  Script
a()
