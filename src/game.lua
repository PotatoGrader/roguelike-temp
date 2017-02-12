local class = _LOAD:loadLib("middleclass")
local GameState = _LOAD:loadClass("gamestate")

local Mob = _LOAD:loadClass("obj/mob/mob")
local User = _LOAD:loadClass("obj/user")

local Game = class('Game')

-- MAIN GAME CLASS

function Game:initialize()
  self.gameStates = _LOAD:loadGameStates()

  --[[for i, v in pairs(self.gameStates) do
    if(i == 1) then
      self.current_gameState = v
      self.current_subGameStates = v.subStates
    end
  end--]]
  self.current_gameState = GameState:new()
  local user = User:new()
  local mob = Mob:new(32, 32, 1, user)
  self.current_gameState:addGameObject(mob)
end

function Game:setState(target_State)

end

-- UPDATE function
function Game:update(dt)

  if(self.current_gameState) then
    self.current_gameState:update(dt)
  end
  if(self.current_subGameStates) then
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
  if(self.current_subGameStates) then
    for _,v in ipairs(self.current_subGameStates) do
      v:draw()
    end
  end

end

return Game
