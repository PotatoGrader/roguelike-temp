local class = _LOAD:loadLib("middleclass")
local GameState = _LOAD:loadGState()

local Testroom = class('Testroom', GameState)

local Mob = _LOAD:loadMob("mob")
local User = _LOAD:loadClass("obj/user")
local Turner = _LOAD:loadController("turner")

function Testroom:initialize()
  GameState.initialize(self, "Testroom")

  local user = User:new()

  local turner = Turner:new(self.gameobjects)
  self:addController(turner)

  local mob1 = Mob:new(256,128,1,user)
  self:addGameObject(mob1)
  self:setReady()

end

return Testroom
