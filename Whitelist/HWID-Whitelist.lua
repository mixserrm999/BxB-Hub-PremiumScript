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
