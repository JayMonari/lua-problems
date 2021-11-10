return function(...)
  local set = table.pack(...)
  local function is_empty()
    return #set == 0
  end

  local function contains(val)
    print(table.unpack(val))
    for _, v in pairs(set) do
      io.write(string.format("Value: %d, and input %s", v, val))
      if v == val then return true end
    end
    return false
  end

  return { is_empty = is_empty, contains = contains }
end
