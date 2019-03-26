local player = {
  direction = "up",
  new = function(self, o)
    self.__index = self
    return setmetatable(o or {}, self)
  end
}

local soko = player:new({c = {1, 0, 0}})
local snake = player:new({spr = love.graphics.newImage("assets/snake.png"), direction = "down"})
local ltank = player:new({spr = love.graphics.newImage("assets/ltank256.png")})
local tank = player:new({spr = love.graphics.newImage("assets/tank.png")})
local stank = player:new({c = {0.5, 0.5, 0.5}, spr = love.graphics.newImage("assets/tank.png")})

function soko:move(key)
  self.x, self.y = self.level:walk(key, self.x, self.y)
  self.direction = key
end

function snake:move(key)
  if key ~= directions:opposite(self.direction) then
    self.x, self.y = self.level:walk(key, self.x, self.y)
    self.direction = key
  end
end

function ltank:move(key)
  if self.direction == key then
    self.x, self.y = self.level:walk(key, self.x, self.y)
  end
  self.direction = key
end

function tank:move(key)
  if key == "up" then
    self.x, self.y = self.level:walk(self.direction, self.x, self.y)
  elseif key == "down" then
    self.x, self.y = self.level:walk(directions:opposite(self.direction), self.x, self.y)
  elseif key == "left" then
    self.direction = directions:ccw(self.direction)
  elseif key == "right" then
    self.direction = directions:cw(self.direction)
  end
end

function stank:move(key)
  if key == self.direction or key == directions:opposite(self.direction) then
    self.x, self.y = self.level:walk(key, self.x, self.y)
  else
    self.direction = key
  end
end

return {soko = soko, snake = snake, ltank = ltank, tank = tank, stank = stank}
