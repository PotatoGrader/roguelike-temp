local class = require "middleclass"

User = class('User')

function User:initialize()
  self.key = 'USR-000-000'
  self.nick = 'Name'
end

function User:update(dt)

end
