local class = _LOAD:loadLib("middleclass")
local GameObject = _LOAD:loadGObj()
local const = _LOAD:loadConst()

local Mob = class('Mob', GameObject)

function Mob:initialize(x, y, layer, holder)
  GameObject.initialize(self, x, y, layer)
  self.holder = holder  -- For User
  self.dir = 0

  self.isMoving = false
  self.isMouseDrag = false
  self.jumpPowerX = 0
  self.jumpPowerY = 0
end

Mob.static.maxPower = 48

function Mob:move()
  if(self.dir == 6) then
    if(self.jumpPowerX ~= 0) then
      self.x = self.x + self.jumpPowerX
      self.jumpPowerX = 0
    end
    if(self.jumpPowerY ~= 0) then
      self.y = self.y + self.jumpPowerY
      self.jumpPowerY = 0
    end
    self.dir = 0
  end
end

-- UPDATE FUNC

function Mob:update(dt)
  GameObject.update(self, dt)

  if(self.holder) and (self.holder.key) then
    if(self.dir == 0) and (self.isMouseDrag) then

      local distance_X =  self.originX -
        love.mouse.getX()
      if(math.abs(distance_X) < Mob.static.maxPower) then
        self.jumpPowerX = distance_X
      end

      local distance_Y = self.originY -
        love.mouse.getY()
      if(math.abs(distance_Y) < Mob.static.maxPower) then
        self.jumpPowerY = distance_Y
      end

    end
  end
end

function Mob:mousepressed(x,y,button,isTouch)
  if( self:inBorder(x,y) ) and ( button == 1 ) then
    self.isMouseDrag = true
  end
end

function Mob:mousereleased (x,y,button,isTouch)
  if(self.holder) and (self.holder.key) then
    if( self.dir == 0 ) and ( self.jumpPowerX ~= 0 ) or ( self.jumpPowerY ~= 0 ) and (self.isMouseDrag) then
      self.dir = 6
    end
  end
  self.isMouseDrag = false
end

-- DRAW FUNC

function Mob:draw()
  love.graphics.setColor(self.x, self.y, 0, 255)
  love.graphics.rectangle("fill", self.x, self.y, self.sizeX, self.sizeY)
  love.graphics.setColor(255, 255, 255, 255)
  if(self.isMouseDrag) then love.graphics.line( self.originX + self.jumpPowerX,  self.originY + self.jumpPowerY, self.originX, self.originY,
self.originX - self.jumpPowerX, self.originY - self.jumpPowerY) end

end

return Mob
