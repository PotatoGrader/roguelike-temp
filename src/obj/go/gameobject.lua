local class = _LOAD:loadLib("middleclass")

local GameObject = class('GameObject')

function GameObject:initialize(x , y , layer )
  self.x = x or 0
  self.y = y or 0
  self.z = layer or 1

  self.sizeX = _TILE_SIZE
  self.sizeY = _TILE_SIZE
  self.isMoving = false

  self.originX = self.x + self.sizeX / 2
  self.originY = self.y + self.sizeY / 2

end

-- Check Funcs
function GameObject:inBorder(x,y)
  local check = false
  if x > self.x and x < self.x + self.sizeX then
    if y > self.y and y < self.y + self.sizeY then
      check = true
    end
  end
  return check
end

-- Abstract Funcs
function GameObject:update(dt)
  self.originX = self.x + self.sizeX / 2
  self.originY = self.y + self.sizeY / 2
end

function GameObject:draw()
end

function GameObject:move()
end

-- Input Abstract Funcs

function GameObject:keypressed(key, scancode, isrepeat)
end

function GameObject:keyreleased(key)
end

function GameObject:textinput(text)
end

function GameObject:mousepressed(x,y,button,isTouch)
end

function GameObject:mousereleased(x,y,button,isTouch)
end

return GameObject
