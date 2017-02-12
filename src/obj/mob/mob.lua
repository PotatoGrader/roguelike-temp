local class = _LOAD:loadLib("middleclass")
local GameObject = _LOAD:loadClass("gameobject")

local Mob = class('Mob', GameObject)

function Mob:initialize(x, y, layer, holder)
  GameObject:initialize(x, y, layer)
  self.holder = holder  -- For User
end

function Mob:directInput(dt)
  if not(self.isTalking) then
    if(love.keyboard.isDown('w' or 'up')) then
      self.y = self.y - (32 * dt)
    end
    if(love.keyboard.isDown('s' or 'down')) then
      self.y = self.y + (32 * dt)
    end
    if(love.keyboard.isDown('a' or 'left')) then
      self.x = self.x - (32 * dt)
    end
    if(love.keyboard.isDown('d' or 'right')) then
      self.x = self.x + (32 * dt)
    end
  end
end

function Mob:update(dt)
  if(self.holder) then
    self:directInput(dt)
  end
end

function Mob:draw()
  love.graphics.setColor(120, 120, 0, 255)
  love.graphics.rectangle("fill", self.x, self.y, 32, 32)
  love.graphics.setColor(0, 0, 0, 0)
end

return Mob
