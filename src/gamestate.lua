local class = require "src/lib/middleclass"

local GameState = class('GameState')

function GameState:initialize(title)
  self.title = title or "New"
  self.subStates = {}

  self.tiles = {}
  self.gameobjects = {}
  self.guiobjects = {}
  self.controllers = {}
  self.shaders = {}
end

function GameState:setTitle(title)
  self.title = title
end

function GameState:update(dt)

end

function GameState:draw()
  love.graphics.print(self.title)
end

return GameState
