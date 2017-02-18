local class = require "src/lib/middleclass"

local Map = class('Map')

function Map:initialize(width, height)
  self.width  = width
  self.height = height
  self.tilesize = 32
  self.mapdata = {}
  -- Sti.new('maps/map1.lua')
  self:reset()
end

function Map:reset()
-- generate map?
  local width, height = self.width, self.height
  for i=1,height do
    self.mapdata[i] = {}
    for j=1,width do
      local tile = {id = 0}
      self.mapdata[i][j] = tile
    end
  end


  -- TEMPORARY
  for i=1,height do
    self.mapdata[i][1].id = 1
    self.mapdata[i][width].id = 1
  end
  for i=1,width do
    self.mapdata[1][i].id = 1
    self.mapdata[height][i].id = 1
  end


end


function Map:update(dt)

end

function Map:draw()
  love.graphics.setLineWidth(3)
  local width, height = self.width, self.height
  local tilesize = self.tilesize
  for i=1,height do
    for j=1,width do
      if self.mapdata[i][j].id == 1 then
        love.graphics.setColor(255, 255, 255, 100)
        love.graphics.rectangle('fill', (j-1)*tilesize, (i-1)*tilesize, tilesize, tilesize)
        love.graphics.setColor(180, 180, 180, 255)
        love.graphics.rectangle('line', (j-1)*tilesize, (i-1)*tilesize, tilesize, tilesize)
      elseif self.mapdata[i][j].id == 0 then
        love.graphics.setColor(40, 40, 40, 100)
        love.graphics.rectangle('fill', (j-1)*tilesize, (i-1)*tilesize, tilesize, tilesize)
        love.graphics.setColor(40, 40, 40, 255)
        love.graphics.rectangle('line', (j-1)*tilesize, (i-1)*tilesize, tilesize, tilesize)
      end
    end
  end

end



return Map
