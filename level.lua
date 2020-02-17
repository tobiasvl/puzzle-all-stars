local sti = require "Simple-Tiled-Implementation.sti"

local level = {}

function level:load(filename)
  self.filename = filename
  self.map = sti(filename)

  function self.map:isWalkable(x, y)
    for _, layer in ipairs(self.layers) do
      if layer.name ~= "Sprites" then
        local tx, ty = self:convertPixelToTile(x, y)
        -- floor tile coordinates to get whole tiles
        -- add 1 to get lua indexing
        tx, ty = math.floor(tx) + 1, math.floor(ty) + 1
        if not (tx >= 1 and tx <= layer.width and ty >= 1 and ty <= layer.height) then
          return false
        elseif self:getTileProperties(layer.name, tx, ty).collide then
          return false
        end
      end
    end

    for _, player in ipairs(self.layers["Sprites"].players) do
      if player.x == x and player.y == y then
        return false
      end
    end
    for _, box in ipairs(self.layers["Sprites"].boxes) do
      if box.x == x and box.y == y then
        return false
      end
    end
    return true
  end

  local players = require "player"

  local layer = self.map:addCustomLayer("Sprites")

  layer.players = {}
  layer.boxes = {}
  for k, object in pairs(self.map.objects) do
    object.y = object.y - 32 -- https://github.com/bjorn/tiled/issues/386
    if object.name == "box" then
      object.c = {.7, .7, .7}
      table.insert(layer.boxes, players.box:new(object))
    else
      table.insert(layer.players, players[object.name]:new(object))
    end
  end

  function layer:draw()
    for _, elements in ipairs({self.players, self.boxes}) do
      for _, player in ipairs(elements) do
        if player.spr then
          if player.c then
            love.graphics.setColor(unpack(player.c))
          else
            love.graphics.setColor(1, 1, 1)
          end
          local height = player.spr:getHeight() / 2
          local width = player.spr:getWidth() / 2
          local size = 0.125
          love.graphics.draw(player.spr,
            player.x + (width * size),
            player.y + (height * size),
            directions:dirToRad(player.direction),
            size, size, height, width)
        else
          love.graphics.setColor(unpack(player.c))
          love.graphics.rectangle("fill", player.x, player.y, 32, 32)
        end
      end
    end
  end

  level.map:removeLayer("Object Layer 1")
end

function level:reload()
  self:load(self.filename)
end

return level
