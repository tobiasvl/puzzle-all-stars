directions = {
  "left",
  "up",
  "right",
  "down",
}

function isWalkable(x, y)
  if not x or not y then
    return false
  end
  if x < 1 or x > #level or y < 1 or y > #level[x] then
    return false
  end
  if level[x] and level[x][y] ~= 0 then
    return false
  end
  for _, player in ipairs(level.players) do
    if player.x == x and player.y == y then
      return false
    end
  end
  return true
end

function move(key, x, y)
  local new_x, new_y
  if key == "left" then
    new_x, new_y = x - 1, y
  elseif key == "up" then
    new_x, new_y = x, y - 1
  elseif key == "right" then
    new_x, new_y = x + 1, y
  elseif key == "down" then
    new_x, new_y = x, y + 1
  end
  if isWalkable(new_x, new_y) then
    return new_x, new_y
  else
    return x, y
  end
end

function cw(dir)
  for i, v in ipairs(directions) do
    if dir == v then
      return directions[i % #directions + 1]
    end
  end
end

function ccw(dir)
  for i, v in ipairs(directions) do
    if dir == v then
      return directions[(i - 2) % #directions + 1]
    end
  end
end

function opposite(dir)
  for i, v in ipairs(directions) do
    if dir == v then
      return directions[(i + 1) % #directions + 1]
    end
  end
end




player = {
  direction = "up",
  new = function(self, o)
    self.__index = self
    return setmetatable(o or {}, self)
  end
}

soko = player:new({c = {1, 0, 0}})
snake = player:new({c = {0, 1, 0}})
ltank = player:new({c = {0, 1, 1}})
tank = player:new({c = {0.5, 0.5, 0.5}})

function soko:move(key)
  self.x, self.y = move(key, self.x, self.y)
end

function snake:move(key)
  if key ~= opposite(self.direction) then
    self.direction = key
    self.x, self.y = move(key, self.x, self.y)
  end
end

function ltank:move(key)
  if self.direction == key then
    self.x, self.y = move(key, self.x, self.y)
  end
  self.direction = key
end

function tank:move(key)
  if key == "up" then
    self.x, self.y = move(self.direction, self.x, self.y)
  elseif key == "down" then
    self.x, self.y = move(opposite(self.direction), self.x, self.y)
  elseif key == "left" then
    self.direction = ccw(self.direction)
  elseif key == "right" then
    self.direction = cw(self.direction)
  end
end

return {soko = soko, snake = snake, ltank = ltank, tank = tank}
