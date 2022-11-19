local func = loadstring(game:HttpGet("https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/OBF/BxB_Pro_OBF/LIB/Obfuscator.lua"))()
local obf = func(source, customVar, watermark)
setclipboard(obf)
return obf
