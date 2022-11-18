_G.Key = "BxB-xyz-FGDO-MIZG-Premium"

local CliendID = game:GetService("RbxAnalyticsService"):GetClientId()
setclipboard(CliendID)
local Hwid = {
    [1] = "FF0272E9-3286-4B88-AB02-C722A4B1618E",
    ["FF0272E9-3286-4B88-AB02-C722A4B1618E"] = 1,
    [2] = "HWID2",
    ["HWID2"] = 2,
}
local Key = {
    [1] = "BxB-xyz-FGDO-MIZG-Premium",
    [2] = "KEY2",
}
local KeyNumber = Hwid[CliendID]
if Hwid[KeyNumber] == CliendID then
    if Key[KeyNumber] == _G.Key then
        print("Script")
    else
        print("No Key")
function Randomkey(v)
    local Genkey = ""
    for i = 1,v do
        Genkey = Genkey ..string.char(math.random(65,90))
    end
    return Genkey
end
setclipboard("BxB-xyz-"..Randomkey(4).."-"..Randomkey(4).."-Premium")
end
    else
        print("No Hwid")
    setclipboard(CliendID)
    end
