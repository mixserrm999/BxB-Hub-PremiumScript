shared.LoaderTitle = 'BxB.xyz | Premium'
shared.LoaderKeyFrames = {
   [1] = {1, 30}, -- [Time (s), Percentage]
   [2] = {3, 100}
}
loadstring(game:HttpGet'https://raw.githubusercontent.com/BxB-HUB/BxB-Hub-PremiumScript/main/Loading/ld.library.lua')()

local Metadata = {
	LoaderData = {
		Name = (shared.LoaderTitle or 'A Loader'),
		Colors = shared.LoaderColors or {
			Main = Color3.fromRGB(24, 24, 24),
			Topic = Color3.fromRGB(255, 255, 255),
			Title = Color3.fromRGB(255, 255, 255),
			LoaderBackground = Color3.fromRGB(30, 30, 30),
			LoaderSplash = Color3.fromRGB(255, 255, 255)
		}
	},
	Keyframes = shared.LoaderKeyFrames or {
		[1] = {1, 10}, -- [Time (s), Percentage]
		[2] = {2, 30},
		[3] = {3, 60},
		[4] = {2, 100}
	}
}

print("SCS")
