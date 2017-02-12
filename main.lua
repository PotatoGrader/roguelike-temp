local Loader = require "loader"
_LOAD = Loader:new() -- Load System

local Game = require "src/game"
_GAME = Game:new()

function love.load(arg)
end

function love.update(dt)
  _GAME:update(dt)
end

function love.draw()
  _GAME:draw()
end
