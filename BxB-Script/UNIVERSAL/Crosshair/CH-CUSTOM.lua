
getgenv().CrosshairSettings = {
    Color = Color3.fromRGB(255,0,0),
    Opacity = 1, -- 0 = Transparent, 1 = Opaque
    Length = 2, -- Length of each line
    Thickness = 2, -- Thickness of each line
    Offset = 0, -- Offset from the middle point
    Dot = true, -- not recommended
    FollowCursor = false, -- Crosshair follows the cursor
    HideMouseIcon = true, -- Hides the mouse icon
    HideGameCrosshair = true, -- Hides the current game's crosshair (if its supported)
} -- v1.0.0
loadstring(game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/BxB-Script/UNIVERSAL/Crosshair/Custom-load.lua", true))()
