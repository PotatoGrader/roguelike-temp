local class = _LOAD:loadLib("middleclass")

local User = class('User')

function User:initialize()
  self.key = 'USR-1'
  self.nick = 'Name'
end

return User
