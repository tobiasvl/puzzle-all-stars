util = {}

-- https://gist.github.com/tylerneylon/81333721109155b2d244
function deep_copy(obj, seen)
  -- Handle non-tables and previously-seen tables.
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end

  -- New table; mark it as seen an copy recursively.
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[deep_copy(k, s)] = deep_copy(v, s) end
  return res
end

util.deep_copy = deep_copy

local stack = {}

function stack:new()
  self.__index = self
  return setmetatable({}, self)
end

function stack:pop()
  if #self ~= 0 then
    return table.remove(self)
  end
end

function stack:push(element)
  table.insert(self, element)
end

util.stack = stack

return util