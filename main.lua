local Loader = require "loader"
_LOAD = Loader:new() -- Load System

local Game = require "src/game"
_GAME = Game:new()

-- MAIN CALLBACKS

function love.load(arg)
end

function love.update(dt)
  _GAME:update(dt)
end

function love.draw()
  _GAME:draw()
end

-- WINDOW's CALLBACKS

function love.visible(visible)
end

function love.focus(focus)
end

-- MOUSE's CALLBACKS

function love.mousefocus(focus)
end

function love.mousemoved(x, y, dx, dy)
end

function love.wheelmoved(x, y)
end

function love.mousepressed(x, y, button, isTouch)
  _GAME:mousepressed(x, y, button, isTouch)
end

function love.mousereleased(x, y, button, isTouch)
  _GAME:mousereleased(x, y, button, isTouch)
end

-- KEYBOARD's CALLBACKS

function love.keypressed(key, scancode, isrepeat)
  _GAME:keypressed(key, scancode, isrepeat)
end

function love.keyreleased(key)
  _GAME:keyreleased(key)
end

function love.textinput(text)
  _GAME:textinput(text)
end
