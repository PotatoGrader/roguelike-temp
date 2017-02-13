local class = _LOAD:loadLib("middleclass")
local GameObject = _LOAD:loadClass("gameobject")

local Controller = class('Controller', GameObject)

function Controller:initialize()
  GameObject:initialize()
end

-- Abstract func

function Controller:restart(objForControl) -- Reload object(s)
end


return Controller
