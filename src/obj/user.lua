local class = _LOAD:loadLib("middleclass")

local User = class('User')

User.static.counter = 0

function User:initialize()
  User.static.counter = User.static.counter + 1
  self.key = 'USR-' .. tostring(User.static.counter)
  self.nick = 'Name'
end

return User
