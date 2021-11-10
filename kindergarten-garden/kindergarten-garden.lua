local seeds = {
  R = "radishes",
  G = "grass",
  C = "clover",
  V = "violets",
}

local kids = {
  "alice",
  "bob",
  "charlie",
  "david",
  "eve",
  "fred",
  "ginny",
  "harriet",
  "ileana",
  "joseph",
  "kincaid",
  "larry",
}

local function find_plots(row1, row2)
  return coroutine.wrap(function()
    for i = 1, #row1, 2 do
      local patch = row1:sub(i, i+1) .. row2:sub(i, i+1)
      local plants = {}

      for p in patch:gmatch '.' do
        plants[#plants+1] = seeds[p:upper()] or "NOT FOUND"
      end

      coroutine.yield(plants)
    end
  end)
end

local function parse(diagram)
  local split_idx = diagram:find('\n')
  assert(split_idx and split_idx == 1 + #diagram // 2, "Not two rows of plants")

  local garden = {}
  local kid_idx = 1
  for row in find_plots(diagram:sub(1, split_idx-1), diagram:sub(split_idx+1)) do
    print(row)
    garden[kids[kid_idx]] = row
    kid_idx = kid_idx + 1
  end

  return garden
end

local Garden = function(diagram)
  return setmetatable(parse(diagram), {
      __index = function(table, key)
        local keyl = key:lower()
        for k, v in pairs(table) do
          if k == keyl then return v end
        end
        return {}
      end,
    })
end

return Garden
