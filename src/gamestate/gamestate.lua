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

  self._isReady = false
end

-- SETTINGS

function GameState:setTitle(title)
  self.title = title
end

function GameState:isReady()
  return self._isReady
end

function GameState:setReady(state)
  self._isReady = state or true
end

-- controllers

function GameState:addController(controller)
  table.insert(self.controllers, controller)
end

-- GAME OBJECTS FUNC

function GameState:addGameObject(gameObject)
  table.insert(self.gameobjects, gameObject)
end

function GameState:getGameObjects()
  return self.gameobjects
end

-- UPDATE FUNC

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

-- DRAW FUNC

function GameState:draw()
  for _,v in ipairs(self.tiles) do
    v:draw()
  end
  for _,v in ipairs(self.gameobjects) do
    v:draw()
  end
  for _,v in ipairs(self.shaders) do
    v:draw()
  end
  for _,v in ipairs(self.guiobjects) do
    v:draw()
  end
  for _,v in ipairs(self.controllers) do
    v:draw()
  end
end

-- KEYBOARD

function GameState:keypressed(key, scancode, isrepeat)
  for _,v in ipairs(self.guiobjects) do
    v:keypressed(key, scancode, isrepeat)
  end
  for _,v in ipairs(self.gameobjects) do
    if(v.holder) then
      v:keypressed(key, scancode, isrepeat)
    end
  end
end

function GameState:keyreleased(key)
  for _,v in ipairs(self.guiobjects) do
    v:keyreleased(key)
  end
  for _,v in ipairs(self.gameobjects) do
    if(v.holder) then
      v:keyreleased(key)
    end
  end
end

function GameState:textinput(text)
  for _,v in ipairs(self.guiobjects) do
    v:textinput(text)
  end
  for _,v in ipairs(self.gameobjects) do
    if(v.holder) then
      v:textinput(text)
    end
  end
end

return GameState