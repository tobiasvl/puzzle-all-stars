function love.load()
  editgrid = require "Editgrid.editgrid"
  Camera = require "hump.camera"

  players = require "player"

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

  level = load_level()

  love.keyboard.setKeyRepeat(true)
end

function love.resize(width, height)
end

function love.update(dt)
end

function love.keypressed(key)
  function validDirection(key)
    for _, v in ipairs(directions) do
      if v == key then
        return true
      end
    end
    return false
  end

  if validDirection(key) then
    for _, player in ipairs(level.players) do
      player:move(key)
    end
  end
end

function love.draw()
  love.graphics.scale(5,5)
  --editgrid.draw(camera, visuals)

  for x = 1, #level do
    for y = 1, #level[x] do
      local tile = level[x][y]
      if tile == 1 then --wall
        love.graphics.setColor(0, 0, 0)
      else
        love.graphics.setColor(1, 1, 1)
      end
      love.graphics.rectangle("fill", x*10, y*10, 10, 10)
    end
  end

  for _, player in ipairs(level.players) do
    love.graphics.setColor(unpack(player.c))
    love.graphics.rectangle("fill", player.x*10, player.y*10, 10, 10)
  end
end

function load_level()
  local level = {}
  for x = 1, 10 do
    local row = {}
    table.insert(level, row)
    for y = 1, 10 do
      table.insert(row, 0)
    end
  end

  level.players = {
    players.soko:new({x = 1, y = 1}),
    players.snake:new({x = 2, y = 2}),
    players.ltank:new({x = 3, y = 3}),
    players.tank:new({x = 4, y = 4}),
  }

  return level
end
