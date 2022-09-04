--region modules
local camera, particle
local gameLogic, hud, smallAward

for _, module in next, getloadedmodules() do
   if module.Name == "camera" then
       camera = require(module)
   elseif module.Name == "particle" then
       particle = require(module)
   end
end
for _, object in next, getgc(true) do
   if type(object) == "table" then
       if rawget(object, "gammo") ~= nil then
           gameLogic = object
       end
       if rawget(object, "getplayerhealth") ~= nil then
           hud = object
       end
   elseif type(object) == "function" then
       local name = debug.info(object, "n")
       if name == "smallaward" then
           smallAward = object
       end
   end
end
--endregion
--region calculation
local function calculateDamage(gunData, origin, hitPart, hitPosition)
   local range0, damage0 = gunData.range0, gunData.damage0
   local range1, damage1 = gunData.range1, gunData.damage1

   local distance = (origin - hitPosition).Magnitude
   local baseDamage = distance < range0 and damage0 or (distance < range1 and (damage1 - damage0) / (range1 - range0) * (distance - range0) + damage0 or damage1)
   local correctDamage = hitPart.Name == "Head" and baseDamage * gunData.multhead or (hitPart.Name == "Torso" and baseDamage * gunData.multtorso or baseDamage)

   return correctDamage, distance
end
--endregion
--region particle hook
setreadonly(particle, false)

local particleNew = particle.new
particle.new = function(particleData)
   if particleData.onplayerhit then
       local onPlayerHit = particleData.onplayerhit
       local bulletHit = false
       particleData.onplayerhit = function(self, player, hitPart, hitPosition)
           if not bulletHit then
               if gameLogic.currentgun then
                   local correctDamage, distance = calculateDamage(gameLogic.currentgun.data, self.origin, hitPart, hitPosition)
                   task.defer(smallAward, ("Hit %s in the %s for %s at a distance of %s studs."):format(player.Name, hitPart.Name:lower(), math.floor(correctDamage), math.floor(distance)), math.max(math.ceil(hud:getplayerhealth(player) - correctDamage), 0))

                   bulletHit = true
               end
           end


           return onPlayerHit(self, player, hitPart, hitPosition)
       end
   end

   return particleNew(particleData)
end

setreadonly(particle, true)
--endregion
