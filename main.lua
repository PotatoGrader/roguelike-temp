local Loader = require "loader"
_LOAD = Loader:new() -- Load System

local Game = require "src/game"
game = Game:new()

function love.load(arg)

end

function love.update(dt)
  game.update(dt)
end

function love.draw()
  game.draw()
end
