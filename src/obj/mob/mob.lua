local class = _LOAD:loadLib("middleclass")
local GameObject = _LOAD:loadGObj()
local const = _LOAD:loadConst()

local Mob = class('Mob', GameObject)

function Mob:initialize(x, y, layer, holder)
  GameObject.initialize(self, x, y, layer)
  self.holder = holder  -- For User
  self.dir = 0
  self.isMoving = false
end

function Mob:directInput(dt)
    if(love.keyboard.isDown('w')) then
      self.dir = 1
    elseif(love.keyboard.isDown('s')) then
      self.dir = 4
    elseif(love.keyboard.isDown('a')) then
      self.dir = 2
    elseif(love.keyboard.isDown('d')) then
      self.dir = 3
    elseif(love.keyboard.isDown('f')) then
      self.dir = 5
    else
      self.dir = 0
    end
end

-- UPDATE FUNC

function Mob:turn() -- for Turner
  if(self.dir == 1) then
    self.y = self.y - _STEP_SIZE
  elseif(self.dir == 4) then
    self.y = self.y + _STEP_SIZE
  elseif(self.dir == 2) then
    self.x = self.x - _STEP_SIZE
  elseif(self.dir == 3) then
    self.x = self.x + _STEP_SIZE
  end
end

function Mob:update(dt)
  if(self.holder) then
    self:directInput(dt)
  end
  if(isMoving) then

  end
end

-- DRAW FUNC

function Mob:draw()
  love.graphics.setColor(self.x, 120, 0, 255)
  love.graphics.rectangle("fill", self.x, self.y, 32, 32)
  love.graphics.print(self.dir, self.x + 32, self.y)
  love.graphics.setColor(255, 255, 255, 255)
end

return Mob
