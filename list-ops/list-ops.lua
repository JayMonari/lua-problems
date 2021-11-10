local function reduce(xs, value, f)
  local sum = value or 0
  for _, v in ipairs(xs) do sum = f(v, sum) end
  return sum
end

local function map(xs, f)
  local mapped = {}
  for _, v in ipairs(xs) do table.insert(mapped, f(v)) end
  return mapped
end

local function filter(xs, pred)
  local filtered = {}
  for _, v in ipairs(xs) do
    if pred(v) then table.insert(filtered, v) end
  end
  return filtered
end

return { map = map, reduce = reduce, filter = filter }
