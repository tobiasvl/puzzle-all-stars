local player = {
  direction = "up",
  new = function(self, o)
    self.__index = self
    return setmetatable(o or {}, self)
  end
}

function player:walk(key, x, y)
  local new_x, new_y
  if key == "left" then
    new_x, new_y = x - 32, y
  elseif key == "up" then
    new_x, new_y = x, y - 32
  elseif key == "right" then
    new_x, new_y = x + 32, y
  elseif key == "down" then
    new_x, new_y = x, y + 32
  end

  if self.can_push then
    for _, box in ipairs(level.map.layers["Sprites"].boxes) do
      if box.x == new_x and box.y == new_y then
        box:move(key, new_x, new_y)
      end
    end
  end

  if level.map:isWalkable(new_x, new_y) then
    return true, new_x, new_y
  else
    return false, x, y
  end
end

local box = player:new({spr = love.graphics.newImage("assets/crate_42.png"), can_push = false})
local soko = player:new({spr_sheet = {
  love.graphics.newImage("assets/player_17.png"),
  love.graphics.newImage("assets/player_05.png"),
  love.graphics.newImage("assets/player_20.png"),
  love.graphics.newImage("assets/player_08.png"),
}, can_push = true})
local snake = player:new({spr = love.graphics.newImage("assets/snake.png"), can_push = true})
local ltank = player:new({spr = love.graphics.newImage("assets/ltank256.png"), can_push = true})
local tank = player:new({spr = love.graphics.newImage("assets/tank.png"), can_push = true})
local stank = player:new({c = {0.5, 0.5, 0.5}, spr = love.graphics.newImage("assets/tank.png"), can_push = true})

-- a player's moved function should return true if it moved or was stopped by its own innate movement restrictions
-- otherwise, it should return false if blocked externally (by a wall or another player)
-- probably not very intuitive but it's only used to retry moving in a second pass

function soko:move(key)
  local moved
  moved, self.x, self.y = self:walk(key, self.x, self.y)
  self.direction = key
  return moved
end

function box:move(key)
  local moved
  moved, self.x, self.y = self:walk(key, self.x, self.y)
  return moved
end

function snake:move(key)
  if key ~= directions:opposite(self.direction) then
    local moved
    moved, self.x, self.y = self:walk(key, self.x, self.y)
    if moved then
      self.direction = key
    end
    return moved
  else
    return true
  end
end

function ltank:move(key)
  local moved = false
  if self.direction == key then
    moved, self.x, self.y = self:walk(key, self.x, self.y)
  else
    moved = true
  end
  self.direction = key
  return moved
end

function tank:move(key)
  local moved = false
  if key == "up" then
    moved, self.x, self.y = self:walk(self.direction, self.x, self.y)
  elseif key == "down" then
    moved, self.x, self.y = self:walk(directions:opposite(self.direction), self.x, self.y)
  elseif key == "left" then
    self.direction = directions:ccw(self.direction)
    moved = true
  elseif key == "right" then
    self.direction = directions:cw(self.direction)
    moved = true
  end
  return moved
end

function stank:move(key)
  if key == self.direction or key == directions:opposite(self.direction) then
    local moved
    moved, self.x, self.y = self:walk(key, self.x, self.y)
    return moved
  else
    self.direction = key
    return true
  end
end

return {box = box, soko = soko, snake = snake, ltank = ltank, tank = tank, stank = stank}
