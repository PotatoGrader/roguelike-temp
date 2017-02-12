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

-- TODO loadState | saveState

function Loader:loadState(name)
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

-- TODO loadGameStates
function Loader:loadGameStates()
  gameStates = {}
  for _,v in ipairs(love.filesystem.getDirectoryItems(self.path.gamestates)) do
    table.insert(gameStates, self:loadState(v))
  end
  return gameStates
end

return Loader
