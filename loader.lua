local class = require "src/lib/middleclass"

Loader = class('Loader')

function Loader:initialize()
  self.path = {}
  self.path.resources = "res/"
  self.path.source = "src/"
  self.path.lib = "src/lib/"
end

function Loader:loadLib(name)
  return require (self.path.lib .. name)
end

return Loader
