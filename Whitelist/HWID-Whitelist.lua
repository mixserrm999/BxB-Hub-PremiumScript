_G.Key = "1A8A0350"
local Hwid = {
    
   ["1A8A0350"] = "1A8A0350-E8C0-4582-BD7F-2ACA1DFCA4DB"

}
local ClientId = game:GetService("RbxAnalyticsService"):GetClientId()
local Hwide = string.split((ClientId),'-')
local Key = Hwide[1]
if _G.Key == Key then
if Hwid[_G.Key] == game:GetService("RbxAnalyticsService"):GetClientId() then
print("script")
else
   print("Not Have Hwid")
setclipboard("Key:"..(Key).."  |  "..(ClientId))
end
   else
        print("Not Have Key")
setclipboard("Key:"..(Key).."  |  "..(ClientId))
end

--// UPDATE 15/10/22

_G.WHITELIST = "ZED_Orian" 


print("[1] Check Key...")
--// Local Data Key + Hwid
local Hwid = {
   ["ZED_Orian"] = "FF0272E9-3286-4B88-AB02-C722A4B1618E",
   ["ADD"] = "ADD"
   --["KEY"] = true,
--loadstring(game:HttpGetAsync("SCRIPT", true))();
}

--// END Data Key + Hwid
print("[2] Check Hwid...")
--// Local Whitelist
local Player = game.Players.LocalPlayer.Name
local ClientId = game:GetService("RbxAnalyticsService"):GetClientId()
local Hwide = string.split((ClientId),'-')
local Name = Player--Hwide[1]
local keywhitelist = game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/Key_Whitelist.lua", true)
print("[3] Check Whitelist...")

--// Check Key [1/2]
if _G.WHITELIST == Name then
    --// Check HIWD [2/2]
if Hwid[_G.WHITELIST] == game:GetService("RbxAnalyticsService"):GetClientId() then

print("Access..! | Script Loading..." )
--// Script


-- End Script
else
   warn("Not Have Whitelist [ Hwid Exploit ]")
 --setclipboard("Key: "..(Name).." Hwid "..(ClientId))
end

    --// END HIWD [2/2]
else
    warn("[ * ] Not Have Whitelist [ Player Name ]")
--setclipboard("Key: "..(Name).." Hwid "..(ClientId))
    
end

--// END KEY [1/2]
