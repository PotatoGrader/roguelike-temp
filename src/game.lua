local class = _LOAD:loadLib("middleclass")
local state = _LOAD:loadClass("gamestate")

local Game = class('Game')

-- MAIN GAME CLASS

function Game:initialize(start_GameState)
  self.current_gameState = _LOAD:loadState(start_GameState)
  self.current_subGameStates = {}
  self.gameStates = {}
end

-- UPDATE function
function Game:update(dt)

  if(self.current_gameState) then
    self.current_gameState:update(dt)
  end
  if(#self.current_subGameStates ~= 0) then
    for _,v in ipairs(self.current_subGameStates) do
      v:update(dt)
    end
  end

end

-- DRAW function

function Game:draw()

  if(self.current_gameState) then
    self.current_gameState:draw()
  end
  if(#self.current_subGameStates ~= 0) then
    for _,v in ipairs(self.current_subGameStates) do
      v:draw()
    end
  end

end

return Game
