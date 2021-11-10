return function(s)
  local reversedStr = {}
  local rightIdx = #s
  for char in s:gmatch "." do
    reversedStr[rightIdx] = char
    rightIdx = rightIdx - 1
  end

  return table.concat(reversedStr, '')
end
