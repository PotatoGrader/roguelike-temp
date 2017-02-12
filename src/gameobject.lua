local class = _LOAD:loadLib("middleclass")

local GameObject = class('GameObject')

function GameObject:initialize(x,y, layer, holder)
  self.x = x
  self.y = y
  self.z = z
end

-- Abstract Funcs
function GameObject:update(dt)
end

function GameObject:draw()
end

function GameObject:keypressed(key, scancode, isrepeat)
end

function GameObject:keyreleased(key)
end

function GameObject:textinput(text)
end

return GameObject
