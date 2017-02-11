class = _LOAD:loadLib("middleclass")
Stateful = _LOAD:loadLib("stateful")

local Game = class('Game')
Game:include(Stateful)

function Game:initialize()

end

function Game:update(dt)
end

function Game:draw()
  love.graphics.rectangle("line", 100, 100, 32, 32)
end

return Game
