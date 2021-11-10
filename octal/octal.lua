return function(s)
  local revVal = s:reverse()
  local to_decimal = function()
    if revVal:match "[a-z89]" ~= nil then return 0 end

    local decimalNumber = 0
    for n = 1, #revVal do
      local octChar = revVal:sub(n, n)
      decimalNumber = decimalNumber + tonumber(octChar) * (8^(n - 1))
    end

    return decimalNumber
  end

  return { to_decimal = to_decimal }
end
