function love.load()
  --editgrid = require "Editgrid.editgrid"
  --Camera = require "hump.camera"

  directions = require "directions"

  -- cargo
  -- editgrid
  -- hump.camera or gamera
  -- tiled? sti vs cartographer
  -- state switcher: roomy?
  -- input: baton? boipushy? tactile?
  -- classic? hump.class? middleclass?
  -- tweening: flux, hump.timer, knife.timer, tick, tween.lua
  -- lume: clamp, round, sign, lerp, etc etc
  -- ui

  debug = true

  if debug then
    io.stdout:setvbuf("no")
  end

  --camera = Camera(player.x, player.y)

  level = require "level"

  love.keyboard.setKeyRepeat(true)

  love.graphics.setDefaultFilter("nearest", "nearest")
end

function love.resize(width, height)
end

function love.update(dt)
end

function love.keypressed(key)
  if directions:validDirection(key) then
    for _, player in ipairs(level.players) do
      player:move(key)
    end
  end
end

function love.draw()
  love.graphics.scale(32, 32)
  --editgrid.draw(camera, visuals)

  level:draw()

  for _, player in ipairs(level.players) do
    if player.spr then
      if player.c then
        love.graphics.setColor(unpack(player.c))
      else
        love.graphics.setColor(1, 1, 1)
      end
      local height = player.spr:getHeight() / 2
      local width = player.spr:getWidth() / 2
      local size = 0.004
      love.graphics.draw(player.spr,
        player.x + height * size,
        player.y + width * size,
        directions:dirToRad(player.direction),
        size, size, height, width)
    else
      love.graphics.setColor(unpack(player.c))
      love.graphics.rectangle("fill", player.x, player.y, 1, 1)
    end
  end

  for _, box in ipairs(level.boxes) do
    if box.spr then
      love.graphics.setColor(1, 1, 1)
      love.graphics.draw(box.spr,
        box.x + (box.spr:getWidth()/2) * 0.004,
        box.y + (box.spr:getHeight()/2) * 0.004,
        dirToRad(box.direction),
        0.004, 0.004, box.spr:getWidth()/2, box.spr:getHeight()/2)
    else
      love.graphics.setColor(unpack(box.c))
      love.graphics.rectangle("fill", box.x, box.y, 1, 1)
    end
  end
end
