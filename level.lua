local level = {}

function level:isWalkable(x, y)
  if not x or not y then
    return false
  end
  if x < 1 or x > #level or y < 1 or y > #level[x] then
    return false
  end
  if level[x] and level[x][y] ~= 0 then
    return false
  end
  for _, player in ipairs(self.players) do
    if player.x == x and player.y == y then
      return false
    end
  end
  for _, box in ipairs(self.boxes) do
    if box.x == x and box.y == y then
      return false
    end
  end
  return true
end

function level:walk(key, x, y)
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

  for _, box in ipairs(self.boxes) do
    if box.x == new_x and box.y == new_y then
      box:move(key, new_x, new_y)
    end
  end

  if self:isWalkable(new_x, new_y) then
    return new_x, new_y
  else
    return x, y
  end
end

for x = 1, 16 do
  local row = {}
  table.insert(level, row)
  for y = 1, 16 do
    table.insert(row, 0)
  end
end

local players = require "player"

level.players = {
  players.soko:new({x = 1, y = 1, level = level}),
  players.snake:new({x = 2, y = 2, level = level}),
  players.ltank:new({x = 3, y = 3, level = level}),
  players.tank:new({x = 4, y = 4, level = level}),
  players.stank:new({x = 1, y = 2, level = level}),
}

level.boxes = {
  players.soko:new({x = 5, y = 5, c = {.7, .7, .7}, level = level}),
  players.soko:new({x = 6, y = 6, c = {.7, .7, .7}, level = level})
}

function level:draw()
  for x = 1, #self do
    for y = 1, #self[x] do
      local tile = self[x][y]
      if tile == 1 then --wall
        love.graphics.setColor(0, 0, 0)
      else
        love.graphics.setColor(.5, .5, 0)
      end
      love.graphics.rectangle("fill", x, y, 1, 1)
    end
  end
end

return level
