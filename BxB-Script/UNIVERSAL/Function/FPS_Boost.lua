if not game.IsLoaded then
	game.IsLoaded:Wait()
end

local lighting = game:GetService('Lighting')
local terrain = workspace.Terrain

local checkCount = 0
local changeCount = 0
local disableCount = 0
local deleteCount = 0

---------------------------------------------
-- TERRAIN
terrain.WaterReflectance = 0
terrain.WaterTransparency = 0
terrain.WaterWaveSize = 0
terrain.WaterWaveSpeed = 0

-- LIGHTING
lighting.GlobalShadows = false
lighting.FogEnd = 9e9
lighting.FogStart = 9e9

-- RENDERING QUALITY & GENERAL QUALITY (View Distance, ETC.)
settings().Rendering.QualityLevel = 'Level01'

-- REMOVE ALL DECALS & TEXTURES, SET ALL PART MATERIALS TO *PLASTIC* & DISABLE REFLECTANCE. DISABLE AND/OR DELETE ALL TYPES OF PARTICLE, TRAIL, FIRE, SPOTLIGHT & SMOKE.
for _,v in pairs(game:GetDescendants()) do
	checkCount = checkCount +1
	if v:IsA('Part')
		or v:IsA('MeshPart')
		or v:IsA('Union')
		or v:IsA('CornerWedgePart')
		or v:IsA('TrussPart')
	then
		v.Material = 'Plastic'
		v.Reflectance = 0
		changeCount = changeCount +1
	elseif v:IsA('Decal')
		or v:IsA('Texture')
	then
		v.Transparency = 1
		v:Destroy()
		changeCount = changeCount +1
		disableCount = disableCount +1
		deleteCount = deleteCount +1
	elseif v:IsA('ParticleEmitter')
		or v:IsA('Trail')
	then
		v.Lifetime = NumberRange.new(0)
		changeCount = changeCount +1
		disableCount = disableCount +1
	elseif v:IsA('Explosion')
	then
		v.BlastPressure = 1
		v.BlastRadius = 1
		changeCount = changeCount +1
	elseif v:IsA('Fire')
		or v:IsA('SpotLight')
		or v:IsA('Smoke')
	then
		v.Enabled = false
		changeCount = changeCount +1
		disableCount = disableCount +1
	end
end

-- REMOVE ALL LIGHTING EFFECTS
for _,v in pairs(lighting:GetDescendants()) do
	checkCount = checkCount +1
	if v:IsA('BlurEffect')
		or v:IsA('SunRaysEffect')
		or v:IsA('ColorCorrectionEffect')
		or v:IsA('BloomEffect')
		or v:IsA('DepthOfFieldEffect')
	then
		v.Enabled = false
		changeCount = changeCount +1
		disableCount = disableCount +1
	end
end

print('\n\n\n\n\n~~ FPS-BOOST ~~\nItems Checked: '..checkCount..'\nItems Changed: '..changeCount..'\nItems Disabled: '..disableCount..'\nItems Deleted: '..deleteCount..'\n~~~~~~~~~~~~~~~~\n\n\n\n\n')
