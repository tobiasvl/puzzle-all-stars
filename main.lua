--[[level delt i to eller flere, gå hver sin vei, parallelt univers
gi kasser til hverandre, conveyor belt
spillere blokkerer hverandre
soko og snake beveger seg nesten likt, men snake kan sette seg fast]]

local menu = {}
local play = {}
local win_state = {}

function love.load()
  level = require "level"
  directions = require "directions"
  util = require "util"
  Gamestate = require "hump.gamestate"

  levels = {
    "konami",
  }

  level_number = 1

  -- cargo
  -- tiled? sti vs cartographer
  -- state switcher: roomy?
  -- input: baton? boipushy? tactile?
  -- classic? hump.class? middleclass?
  -- tweening: flux, hump.timer, knife.timer, tick, tween.lua
  -- lume: clamp, round, sign, lerp, etc etc
  -- ui

  debug = false
  if debug then
    io.stdout:setvbuf("no")
  end

  Gamestate.registerEvents()
  Gamestate.switch(menu)

  love.keyboard.setKeyRepeat(true)

  love.graphics.setDefaultFilter("nearest", "nearest")
end

function menu:enter()
  level:load("menu")
  undo_stack = util.stack:new()
end

function menu:update(dt)
end

function menu:keypressed(key)
  if key == "return" then
    Gamestate.switch(play)
  else
    play:keypressed(key)
  end
end

function play:enter()
  level:load(levels[level_number])
  undo_stack = util.stack:new()
end

function play:update(dt)
  local won = true
  for _, box in ipairs(level.map.layers["Sprites"].boxes) do
    local tx, ty = level.map:convertPixelToTile(box.x, box.y)
    -- floor tile coordinates to get whole tiles
    -- add 1 to get lua indexing
    tx, ty = math.floor(tx) + 1, math.floor(ty) + 1
    if level.map.layers["Ground"].data[ty][tx].id ~= 5 then
      won = false
    end
  end
  if won then
    level_number = level_number + 1
    if level_number > #levels then
      Gamestate.switch(win_state)
    else
      Gamestate.switch(play)
    end
  end
end

function play:keypressed(key)
  local wasd = {}
  wasd.w = "up"
  wasd.a = "left"
  wasd.s = "down"
  wasd.d = "right"

  for k, v in pairs(wasd) do
    if key == k then
      key = v
    end
  end

  if directions:validDirection(key) then
    -- store current state in undo stack
    undo_stack:push(util.deep_copy(level.map.layers))

    local try_again = {}
    for _, player in ipairs(level.map.layers["Sprites"].players) do
      if not player:move(key) then
        table.insert(try_again, player)
      end
    end

    -- do another pass for previously blocked players
    -- very inelegant... FIXME
    for _, player in ipairs(try_again) do
      player:move(key)
    end
  elseif key == "r" then
    level:reload()
  elseif (key == "u" or key == "backspace") and #undo_stack > 0 then
    -- FIXME seemingly old maps don't get garbage collected?
    level.map.layers = undo_stack:pop()
  end
end

function win_state:draw()
  love.graphics.print("Congratulations!\n\nI'm making actual levels right now but they'll be added post-jam because of time zones.\n\nSorry.", 10, 10)
end

function love.draw()
  local layer = level.map.layers[1]
  local width, height = layer.width * 32, layer.height * 32
  level.map:draw((math.floor(love.graphics.getWidth() / 2) - (width / 2)), (math.floor(love.graphics.getHeight() / 2) - (height / 2)))
end
