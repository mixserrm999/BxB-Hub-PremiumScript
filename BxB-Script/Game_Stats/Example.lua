local F = "https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Game_Stats/FPS_Counter.lua"
local P = "https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Game_Stats/Ping_Counter.lua"
local C = "https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Game_Stats/CPU_Counter.lua"
local G = "https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/Game_Stats/GPU_Counter.lua"

loadstring(game:HttpGet(F, true))()
loadstring(game:HttpGet(P, true))()
loadstring(game:HttpGet(C, true))()
loadstring(game:HttpGet(G, true))()
