getgenv()['MyName'] = game.Players.LocalPlayer.Name
getgenv()['JsonEncode'] = function(msg)
    return game:GetService("HttpService"):JSONEncode(msg)
end
getgenv()['JsonDecode'] = function(msg)
    return game:GetService("HttpService"):JSONDecode(msg)
end
getgenv()['Check_Setting'] = function(Name)
    if not isfolder('BxB_Save_Settings') then
        makefolder('BxB_Save_Settings')
    end
    if not isfile('BxB_Save_Settings/'..Name..'_'..'Setting.json') then
        writefile('BxB_Save_Settings/'..Name..'_'..'Setting.json',JsonEncode(getgenv().Setting))
    end
end
getgenv()['Get_Setting'] = function(Name)
    if isfolder('BxB_Save_Settings') and isfile('BxB_Save_Settings/'..Name..'_'..'Setting.json') then
        getgenv().Setting = JsonDecode(readfile('BxB_Save_Settings/'..Name..'_'..'Setting.json'))
        return getgenv().Setting
    else
        Check_Setting(Name)
    end
end
getgenv()['Update_Setting'] = function(Name)
    if isfolder('BxB_Save_Settings') and isfile('BxB_Save_Settings/'..Name..'_'..'Setting.json') then
        writefile('BxB_Save_Settings/'..Name..'_'..'Setting.json',JsonEncode(getgenv().Setting))
    else
        Check_Setting(Name)
    end
end
