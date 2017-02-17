local class = _LOAD:loadLib("middleclass")
local GameState = _LOAD:loadGState()
local Testroom = _LOAD:loadGState("testroom")

local Game = class('Game')

-- MAIN GAME CLASS

function Game:initialize()
  -- Loading all states
  local state = Testroom:new()
  self.current_gameState = state
  self.current_subGameStates = self.current_gameState.subStates
  self.buffered_gameState = nil --_LOAD:loadState("loading")
  self.gameStates = {} -- _LOAD:loadGameStates()

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
  elseif (self.buffered_gameState) then
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
  elseif (self.buffered_gameState) then
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
  elseif (self.buffered_gameState) then
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
  elseif (self.buffered_gameState) then
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
  elseif (self.buffered_gameState) then
    self.buffered_gameState:textinput(text)
  end
  if(self.current_subGameStates) then
    for _,v in ipairs(self.current_subGameStates) do
      v:textinput(text)
    end
  end
end

-- MOUSE FUNC
function Game:mousepressed(x, y, button, isTouch)
  if(self.current_gameState and self.current_gameState:isReady()) then
    self.current_gameState:mousepressed(x, y, button, isTouch)
  elseif (self.buffered_gameState) then
    self.buffered_gameState:mousepressed(x, y, button, isTouch)
  end
  if(self.current_subGameStates) then
    for _,v in ipairs(self.current_subGameStates) do
      v:mousepressed(x, y, button, isTouch)
    end
  end
end

function Game:mousereleased(x, y, button, isTouch)
  if(self.current_gameState and self.current_gameState:isReady()) then
    self.current_gameState:mousereleased(x, y, button, isTouch)
  elseif (self.buffered_gameState) then
    self.buffered_gameState:mousereleased(x, y, button, isTouch)
  end
  if(self.current_subGameStates) then
    for _,v in ipairs(self.current_subGameStates) do
      v:mousereleased(x, y, button, isTouch)
    end
  end
end

return Game
