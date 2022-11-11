local OWNER = "https://raw.githubusercontent.com"
local DATA = "/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script"
local Games = {
    [2753915549] = "/Blox-Fruit/Main/Script/Main.lua",
    [4442272183] = "/Blox-Fruit/Main/Script/Main.lua",
    [7449423635] = "/Blox-Fruit/Main/Script/Main.lua",
    [292439477] = "/Phantom-Forces/Main/BxB-Hub-PF-V2.lua",
    [286090429] = "/Arsenal/Main/Arsenal.lua",
    [9648883891] = "/Festival-Tycoon/UI-Script/FTT.lua",
    [8304191830] = "/Anime-Adventures/AAT.lua",
    [9284097280] = "/Apartment-Tycoon/APTC.lua",
    [4490140733] = "/My-Restaurant/MR.lua",
    [8737602449] = "/PLS-Donate/PLSDONATE.lua",
    [3956818381] = "/Ninja-Legends/NL.lua",
    [6284583030] = "/Pet-Simulator-X/BxB-Meow/Example.lua"
}
--// LoadScript
local Supported = Games[game.PlaceId] or false
if Supported ~= false then
    loadstring(game:HttpGet(OWNER..""..DATA..""..Supported))()
end
