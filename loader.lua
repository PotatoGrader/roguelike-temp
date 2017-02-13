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
  self.path.modificators = self.path.source .. "obj/mod/"
  self.path.mobs = self.path.source .. "obj/mob/"
  self.path.gameobjects = self.path.source .. "obj/go/"
  self.path.controllers = self.path.source .. "obj/controller/"

end

--[[
    Require lib
    Example: _LOAD:loadLib("middleclass")
--]]
function Loader:loadLib(name)
  return require (self.path.lib .. name)
end

function Loader:loadConst()
  return require "const"
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
    Requier mob
    Example: _LOAD:loadMob("human")
--]]
function Loader:loadMob(name)
  return require(self.path.mobs .. name)
end

--[[
    Requier game object
    Example: _LOAD:loadGO("item")
--]]
function Loader:loadGO(name)
  return require(self.path.gameobjects .. name)
end

--[[
    Requier controller
    Example: _LOAD:loadMod("hasorgans")
--]]
function Loader:loadController(name)
  local path = self.path.controllers
  if(name)then
    path = path .. name
  else
    path = path .. "controller"
  end
  return require(path)
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
  local iter_num = 0;
  -- START LOADING
  if love.filesystem.exists(self.path.gamestates .. name) then
    for v in love.filesystem.lines(self.path.gamestates .. name) do
      -- LOAD TITLE
      if(v:find("TITLE")) then
        local start_index, end_index = v:find("TITLE")
        state:setTitle(v:sub(end_index + 4))
      end
      -- LOAD CONTROLLERS

      if(v:find("CONTROLLERS")) then
        local start_index, end_index = v:find("CONTROLLERS")
        iter_num = tonumber((v:sub(end_index + 4)))
      elseif(iter_num ~= 0) then
        local argsIndex = v:find("%s")
        --TODO Load controllers
        iter_num = iter_num - 1
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
