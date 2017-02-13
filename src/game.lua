local class = _LOAD:loadLib("middleclass")
local GameState = _LOAD:loadClass("gamestate")

local Game = class('Game')

-- MAIN GAME CLASS

function Game:initialize()
  -- Loading all states
  self.current_gameState = _LOAD:loadState("testroom")
  self.current_subGameStates = self.current_gameState.subStates
  self.buffered_gameState = _LOAD:loadState("loading")
  self.gameStates = _LOAD:loadGameStates()
  
  self.current_gameState:setReady()

end

function Game:setState(target_State)
  for _,state in ipairs(self.gameStates) do
    if(state.title == target_State) then
      self.current_gameState:setReady(false)
      self.current_gameState = state
      -- TODO Load function for generate
      self.current_gameState:setReady()
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
