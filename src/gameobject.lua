local class = _LOAD:loadLib("middleclass")

local GameObject = class('GameObject')

function GameObject:initialize(x , y , layer )
  self.x = x or _STEP_SIZE
  self.y = y or _STEP_SIZE
  self.z = layer or 1
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
