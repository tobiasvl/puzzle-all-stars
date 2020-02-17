function love.load()
  directions = require "directions"

  -- cargo
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

  level = require "level"
  level.map:removeLayer("Object Layer 1")

  love.keyboard.setKeyRepeat(true)

  love.graphics.setDefaultFilter("nearest", "nearest")
end

function love.resize(width, height)
end

function love.update(dt)
end

function love.keypressed(key)
  if directions:validDirection(key) then
    local try_again = {}
    for _, player in ipairs(level.map.layers["Sprites"].players) do
      if not player:move(key) then
        table.insert(try_again, player)
      end
    end
    for _, player in ipairs(try_again) do
      player:move(key)
    end
  end
end

function love.draw()
  level.map:draw()
end
