local class = require "src/lib/middleclass"
local GameState = require "src/gamestate"

local Loader = class('Loader')

--[[
 Loader initialization
--]]

function Loader:initialize()
  self.path = {}

  --[[
   Paths to game-resources
  --]]
  self.path.resources = "res/"
  self.path.gamestates = self.path.resources .. "gamestates/"

  --[[
   Paths to source code
  --]]
  self.path.source = "src/"
  self.path.lib = "src/lib/"
  self.path.modificators = "src/obj/mod"
end

--[[
    Require lib
    Example: _LOAD:loadLib("middleclass")
--]]
function Loader:loadLib(name)
  return require (self.path.lib .. name)
end

--[[
    Require class
    Example: _LOAD:loadClass("gamestate")
--]]
function Loader:loadClass(name)
  return require (self.path.source .. name)
end
--[[
    Requier modificator
    Example: _LOAD:loadMod("hasorgans")
--]]
function Loader:loadMod(name)
  return require(self.path.modificators .. name)
end

--[[
    Returning a loaded game state
    Example: _LOAD:loadState("testroom")
--]]
function Loader:loadState(name)

  -- String-to-file protect
  if not (name) then
    name = "New"
  end
  if not (name:find(".state")) then
    name = name .. ".state"
  end

  local state = GameState:new()
  if love.filesystem.exists(self.path.gamestates .. name) then
    for v in love.filesystem.lines(self.path.gamestates .. name) do
      if(v:find("TITLE")) then
        start_index, end_index = v:find("TITLE")
        state:setTitle(v:sub(end_index + 4))
      end
    end
  end
  return state
end

--[[
    initialization for all Game States
--]]
function Loader:loadGameStates()
  local gameStates = {}
  for _,v in ipairs(love.filesystem.getDirectoryItems(self.path.gamestates)) do
    table.insert(gameStates, self:loadState(v))
  end
  return gameStates
end

return Loader
