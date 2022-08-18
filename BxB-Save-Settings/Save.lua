getgenv().Setting = {} -- Setting
Check_Setting(ชื่อไฟล์) -- Checkว่า File มีอยู่ไหม
Get_Setting(ชื่อไฟล์) -- ดูว่า Setting มีอะไรบ้าง
Update_Setting(ชื่อไฟล์) -- Update Setting ใหม่
---- เเถม ----
getgenv()['MyName'] -- Getชื่อของตัวเอง
JsonEncode(table) -- แปลงค่าเป็น JSON
JsonDecode(JSON) -- แปลงจาก JSON เป็น Table
---- Ex. ----
getgenv().Setting = {
    ['Auto Farm'] = false,
    ['Fly'] = true
}
pcall(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/MAZIHUB191/MAZI-API/main/SaveSettingAPI'))() end)
local JSON = JsonEncode({abc='fff'})
JsonDecode(JSON)
Check_Setting(getgenv()['MyName'])
Get_Setting(getgenv()['MyName'])
Update_Setting(getgenv()['MyName'])

------------ main ---------------

BxB_Owned = true
getgenv().Setting.Test = true
getgenv().Setting = {
    ['Player_Info'] = "Player Name : "..getgenv()['MyName'].."  |  Player ID : "..getgenv()['MyId'].."  |  Game Name : "..getgenv()['GameName'].."  |  Game Id : "..getgenv()['GameId'].."CONFIG_SETTING -->>",
    ['Test'] = getgenv().Setting.Test,
    
}
pcall(function()loadstring(game:HttpGet('https://raw.githubusercontent.com/BxB-HUB/BxB_HUB_Premium/main/BxB_Save_Setting/Save_API.lua'))() end)
local JSON = JsonEncode({abc='fff'})
JsonDecode(JSON)
Update_Setting(getgenv()['MyName'].."_"..getgenv()['GameName'])
Get_Setting(getgenv()['MyName'].."_"..getgenv()['GameName'])
