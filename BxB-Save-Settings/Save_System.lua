--[[
if not isfolder("BxB_Save_System/GAME NAME/TITLE") then
	makefolder("BxB_Save_System/GAME NAME/TITLE")
end
if not isfile("BxB_Save_System/GAME NAME/TITLE/config.json") then
    writefile("BxB_Save_System/GAME NAME/TITLE/config.json","")
end
]]

--// Check Load
repeat wait() until game:IsLoaded()

if not LPH_OBFUSCATED then 
    LPH_NO_VIRTUALIZE = function(...) return (...) end;
    LPH_JIT_MAX = function(...) return (...) end;
end
--// Check File [1]
if not isfolder("BxB_Save_System") then
    makefolder("BxB_Save_System")
end
--// Check File [2]
if not isfolder("BxB_Save_System/"..game.Players.LocalPlayer.Name) then
    makefolder("BxB_Save_System/"..game.Players.LocalPlayer.Name.."/Settings")
    makefolder("BxB_Save_System/"..game.Players.LocalPlayer.Name.."/Whitelist")
end 
--// Function Update Data Player
function HWID()
    pcall(function()
        local j
        local HS = game:GetService("HttpService")
        if writefile then
            h_w = game:GetService("RbxAnalyticsService"):GetClientId()
            p_n = game.Players.LocalPlayer.Name
            writefile("BxB_Save_System/"..game.Players.LocalPlayer.Name.."/Whitelist/Name.json",""..p_n)
            writefile("BxB_Save_System/"..game.Players.LocalPlayer.Name.."/Whitelist/Hwid.json",""..h_w)
        end
    end)
end

--// Save File / SaveSetting
local SaveSetting = LPH_NO_VIRTUALIZE(function()
    local j
    local HS = game:GetService("HttpService")
    if writefile then
        d = HS:JSONEncode(_G.Settings)
        writefile("BxB_Save_System/"..game.Players.LocalPlayer.Name.."/Settings/Settings.json",d)
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
if readfile and isfile and isfile("BxB_Save_System/"..game.Players.LocalPlayer.Name.."/Settings/Settings.json") then
    local HS = game:GetService("HttpService")
    _G.Settings = HS:JSONDecode(readfile("BxB_Save_System/"..game.Players.LocalPlayer.Name.."/Settings/Settings.json"))
end
--//  Script
HWID()
a()
