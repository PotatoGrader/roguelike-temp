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

function GameState:addGameObject(gameObject)
  table.insert(self.gameobjects, gameObject)
end

function GameState:update(dt)
  for _,v in ipairs(self.controllers) do
    v:update(dt)
  end
  for _,v in ipairs(self.shaders) do
    v:update(dt)
  end
  for _,v in ipairs(self.guiobjects) do
    v:update(dt)
  end
  for _,v in ipairs(self.gameobjects) do
    v:update(dt)
  end
  for _,v in ipairs(self.tiles) do
    v:update(dt)
  end
end

function GameState:draw()
  love.graphics.print(self.title)
  for _,v in ipairs(self.controllers) do
    v:draw()
  end
  for _,v in ipairs(self.shaders) do
    v:draw()
  end
  for _,v in ipairs(self.guiobjects) do
    v:draw()
  end
  for _,v in ipairs(self.gameobjects) do
    v:draw()
  end
  for _,v in ipairs(self.tiles) do
    v:draw()
  end
end

return GameState
