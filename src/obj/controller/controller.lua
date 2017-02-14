local class = _LOAD:loadLib("middleclass")
local GameObject = _LOAD:loadGObj()

local Controller = class('Controller', GameObject)

function Controller:initialize()
  GameObject.initialize(self)
end

-- Abstract func

function Controller:restart(objForControl) -- Reload object(s)
end


return Controller
