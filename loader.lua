local class = require "src/lib/middleclass"
local GameState = require "src/gamestate"

Loader = class('Loader')

function Loader:initialize()
  self.path = {}

  self.path.resources = "res/"
  self.path.gamestates = self.path.resources .. "gamestates/"

  self.path.source = "src/"
  self.path.lib = "src/lib/"
end

function Loader:loadLib(name)
  return require (self.path.lib .. name)
end

function Loader:loadClass(name)
  return require (self.path.source .. name)
end

-- TODO loadState

function Loader:loadState(name)

  local state = GameState:new()
  
  state.error = self.path.gamestates .. name .. ".state"
  if love.filesystem.exists(self.path.gamestates .. name .. ".state") then
    for v in love.filesystem.lines(self.path.gamestates .. name .. ".state") do
      if(v:find("TITLE")) then
        start_index, end_index = v:find("TITLE")
        state:setTitle(v:sub(end_index + 2))

      end
    end
  end
  return state
end

function Loader:saveState(name)
  love.filesystem.setIdentity(self.path.gamestates)
  if not love.filesystem.exists(name .. ".state") then
    love.filesystem.newFile(name .. ".state")
  end
  love.filesystem.write(name .. ".state", "----\n")
  love.filesystem.write(name .. ".state", "TITLE " .. name .. " \n")
  love.filesystem.write(name .. ".state", "----\n")
end

-- TODO loadGameStates
function Loader:loadGameStates()
end

return Loader
