assert((syn or (getexecutorname and getexecutorname() == "ScriptWare") or fluxus or KRNL_LOADED), "UNSUPPORTED EXPLOIT")

local req = (syn and syn.request) or request

loadstring(syn.request({
    ["Url"] = "https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Discord/Normal/Anti-Discord-Inv.lua";
    ["Method"] = "GET";
}).Body)()
