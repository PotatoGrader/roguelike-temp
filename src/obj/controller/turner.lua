local class = _LOAD:loadLib("middleclass")
local Controller = _LOAD:loadController()
--[[
  Turner:
    Make all mobs as one-turned

    DIR:
    - 1 -
    2 0 3
    - 4 -
    USE 5 for WAITING
    USE 6 for ANYDIR
    
    ISMOVING: if all mobs make a choice then make a turn, else wait
--]]

local Turner = class('Turner', Controller)

function Turner:initialize(target_gameObjects)
  Controller.initialize(self)
  self._holderObj = target_gameObjects
  self.isReadyToTurn = true
end

function Turner:restart(target_gameObjects)
  self._holderObj = target_gameObjects
end

-- TURN FUNC

function Turner:_turnEnd()
  if (self._holderObj) then
    for _,v in ipairs(self._holderObj) do
      v.isMoving = false
    end
  end
end

function Turner:_turnStart()
  if (self._holderObj) then
    for _,v in ipairs(self._holderObj) do
      v.isMoving = true
      v:move()
    end
  end
end

function Turner:_turnCheck()
  if (self._holderObj) then
    self.isReadyToTurn = true
    for _,v in ipairs(self._holderObj) do
      if(v.dir == 0) then self.isReadyToTurn = false end
    end
  end
end
-- UPDATE FUNC

function Turner:update(dt)
  self:_turnEnd()
  -- check for choice
  self:_turnCheck()

  if(self.isReadyToTurn) then
    self:_turnStart()
  end
end

return Turner
