local class = require "src/lib/middleclass"
local GameState = require "src/gamestate/gamestate"

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

  --[[
   Paths to source code
  --]]
  self.path.source = "src/"
  self.path.lib = "src/lib/"

  self.path.gamestates = self.path.source .. "gamestate/"

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
    Example: _LOAD:loadClass("game")
--]]
function Loader:loadClass(name)
  return require (self.path.source .. name)
end

--[[
    Require gamestate, if name = nil using default gamestate
    Example: _LOAD:loadClass("gamestate")
--]]

function Loader:loadGState (name)
  local path = self.path.gamestates
  if(name)then
    path = path .. name
  else
    path = path .. "gamestate"
  end
  return require(path)
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
  local path = self.path.mobs
  if(name)then
    path = path .. name
  else
    path = path .. "mob"
  end
  return require(path)
end

--[[
    Requier game object
    Example: _LOAD:loadGO("item")
--]]
function Loader:loadGObj(name)
  local path = self.path.gameobjects
  if(name)then
    path = path .. name
  else
    path = path .. "gameobject"
  end
  return require(path)
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

return Loader
