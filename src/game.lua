local class = _LOAD:loadLib("middleclass")
local GameState = _LOAD:loadClass("gamestate")

local Mob = _LOAD:loadClass("/obj/mob/mob")
local User = _LOAD:loadClass("/obj/user")

local Game = class('Game')

-- MAIN GAME CLASS

function Game:initialize()
  -- Loading all states
  self.buffered_gameState = _LOAD:loadState("loading")
  self.gameStates = _LOAD:loadGameStates()

  -- Set current state
  for i, v in pairs(self.gameStates) do
    if(i == 1) then
      self.current_gameState = v
      self.current_subGameStates = v.subStates
    end
  end

  user = User:new()
  mob = Mob:new(100, 100, 1, user)
  self.current_gameState:addGameObject(mob)
  self.current_gameState:setReady()

end

function Game:setState(target_State)
  for _,state in ipairs(self.gameStates) do
    if(state.title == target_State) then
      self.current_gameState:setReady(false)
      self.current_gameState = state
      -- TODO Load function for generate
      self.current_gameState:setReady(true)
    end
  end
end

-- UPDATE function
function Game:update(dt)

  if(self.current_gameState and self.current_gameState:isReady()) then
    self.current_gameState:update(dt)
  else
    self.buffered_gameState:update(dt)
  end
  if(self.current_subGameStates) then
    for _,v in ipairs(self.current_subGameStates) do
      v:update(dt)
    end
  end

end

-- DRAW function
function Game:draw()

  if(self.current_gameState and self.current_gameState:isReady()) then
    self.current_gameState:draw()
  else
    self.buffered_gameState:draw()
  end
  if(self.current_subGameStates) then
    for _,v in ipairs(self.current_subGameStates) do
      v:draw()
    end
  end

end

-- KEYBOARD

function Game:keypressed(key, scancode, isrepeat)
  if(self.current_gameState and self.current_gameState:isReady()) then
    self.current_gameState:keypressed(key, scancode, isrepeat)
  else
    self.buffered_gameState:keypressed(key, scancode, isrepeat)
  end
  if(self.current_subGameStates) then
    for _,v in ipairs(self.current_subGameStates) do
      v:keypressed(key, scancode, isrepeat)
    end
  end
end

function Game:keyreleased(key)
  if(self.current_gameState and self.current_gameState:isReady()) then
    self.current_gameState:keyreleased(key)
  else
    self.buffered_gameState:keyreleased(key)
  end
  if(self.current_subGameStates) then
    for _,v in ipairs(self.current_subGameStates) do
      v:keyreleased(key)
    end
  end
end

function Game:textinput(text)
  if(self.current_gameState and self.current_gameState:isReady()) then
    self.current_gameState:textinput(text)
  else
    self.buffered_gameState:textinput(text)
  end
  if(self.current_subGameStates) then
    for _,v in ipairs(self.current_subGameStates) do
      v:textinput(text)
    end
  end
end

return Game
