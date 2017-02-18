local class = require "src/lib/middleclass"

local Map = class('Map')

function Map:initialize(width, height)
  self.width  = width
  self.height = height
  self.tilesize = 32
  self.layers = {}
  self.tiledata = {}
  -- Sti.new('maps/map1.lua')
  self:reset()
end

function Map:reset()
-- TODO implement importing tiledata

local tile = {}
tile.id = 0
tile.image = love.graphics.newImage( "res/img/floor.png" )
self.tiledata[0] = tile
local tile = {}
tile.id = 1
tile.image = love.graphics.newImage( "res/img/wall.png" )
self.tiledata[1] = tile


self.layers.mapdata = {}
  local width, height = self.width, self.height
  for i=1,height do
    self.layers.mapdata[i] = {}
    for j=1,width do
      self.layers.mapdata[i][j] = self.tiledata[0]
    end
  end

  -- TEMPORARY
  for i=1,height do
    self.layers.mapdata[i][1] = self.tiledata[1]
    self.layers.mapdata[i][width] = self.tiledata[1]
  end
  for i=1,width do
    self.layers.mapdata[1][i] = self.tiledata[1]
    self.layers.mapdata[height][i] = self.tiledata[1]
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
        love.graphics.draw( self.layers.mapdata[i][j].image, (j-1)*tilesize, (i-1)*tilesize)
    end
  end

end



return Map
