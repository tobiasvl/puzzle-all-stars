local directions = {
  "right",
  "down",
  "left",
  "up",
}

function directions:validDirection(key)
  for _, v in ipairs(directions) do
    if v == key then
      return true
    end
  end
  return false
end

function directions:cw(dir)
  for i, v in ipairs(self) do
    if dir == v then
      return self[i % #self + 1]
    end
  end
end

function directions:ccw(dir)
  for i, v in ipairs(self) do
    if dir == v then
      return self[(i - (#self/2)) % #self + 1]
    end
  end
end

function directions:opposite(dir)
  for i, v in ipairs(self) do
    if dir == v then
      return self[(i + (#self/2) - 1) % #self + 1]
    end
  end
end

function directions:dirToRad(dir)
  for i, d in ipairs(self) do
    if d == dir then
      return math.rad(i * (360 / #self))
    end
  end
end

return directions
