_G.Key = "B-O-O-M#4134-OWNER-Private" --// คีย์ใช้เลือกได้แค่ 1 คีย์

local CliendID = game:GetService("RbxAnalyticsService"):GetClientId()
--setclipboard(CliendID)
local Hwid = { --// save hwids ทั้งหมด (ห้ามซ้ำกัน)
    [0] = "FF0272E9-3286-4B88-AB02-C722A4B1618E",
    ["FF0272E9-3286-4B88-AB02-C722A4B1618E"] = 0,
    [1] = "FF0272E9-3286-4B88-AB02-C722A4B1618EF",
    ["FF0272E9-3286-4B88-AB02-C722A4B1618EF"] = 1,
    [2] = "FF0272E9-3286-4B88-AB02-C722A4B1618",
    ["FF0272E9-3286-4B88-AB02-C722A4B1618"] = 2,
}
local Key = { --// save คีย์ทั้งหมด (ห้ามซ้ำกัน)
    [0] = "B-O-O-M#4134-OWNER-Private",
    [1] = "BxB-xyz-FGDO-MIZG-Premium",
    [2] = "BxB-xyz-BBSH-AHEJ-Premium",
}
local KeyNumber = Hwid[CliendID]
if Hwid[KeyNumber] == CliendID then
    if Key[KeyNumber] == _G.Key then --// ทำเมื่อ check ถูก
        print("Script")
    else --// ทำเมื่อ check key ผิด
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
    else --// ทำเมื่อ check hwid ผิด
        print("No Hwid")
    setclipboard(CliendID)
    end
