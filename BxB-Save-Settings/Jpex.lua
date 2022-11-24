function loadcheck()
    if isfile("SaveSettingJPEX.json") then
        else
            writefile("SaveSettingJPEX.json",game:GetService("HttpService"):JSONEncode(_G.Save))
        return
    end
end
_G.Save = {
    ["AutoFarm"] = true,
    
}
function LoadSetting()
    if isfile("SaveSettingJPEX.json") then
            vb = game:GetService("HttpService"):JSONDecode(readfile("SaveSettingJPEX.json"))
            _G.Save = vb
        else
            loadcheck()
    end
end

function SaveSetting()
    if isfile("SaveSettingJPEX.json") then
            writefile("SaveSettingJPEX.json",game:GetService("HttpService"):JSONEncode(_G.Save))
        else
            loadcheck()
    end
end


loadcheck()
LoadSetting()

if _G.Save["AutoFarm"] then
    print("True")
else
    print("false")
end
wait(3)
function f()
    _G.Save["AutoFarm"] = true
    SaveSetting()
end
f()
