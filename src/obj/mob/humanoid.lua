local class = _LOAD:loadLib('middleclass')
local Mob = _LOAD:loadMob()

local Humanoid = class('Humanoid', Mob)

function Humanoid(x,y,layer,user)
  Mob.initialize(x,y,layer,user)

end

return Humanoid
