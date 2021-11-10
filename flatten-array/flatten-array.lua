local function flatten(input)
  local flattened = {}

  local function sift(nested)
    for _, val in ipairs(nested) do
      if type(val) == "table" then
        sift(val)
      else
        table.insert(flattened, val)
      end
    end
  end

  sift(input)

  return flattened
end

return flatten
