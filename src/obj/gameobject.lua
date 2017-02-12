class = _LOAD:loadLib("middleclass")

GameObject = class('GameObject')

function GameObject:initialize(x,y)
  self.holder = nil  -- For User
  self.x = x
  self.y = y
  self.z = z
end

-- Abstract Funcs

function GameObject:update(dt)
end

function GameObject:draw()
end

return GameObject
