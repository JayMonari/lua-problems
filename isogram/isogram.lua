return function(s)
  local counter = {}
  for char in s:lower():gmatch '.' do
    if char == '-' or char == ' ' then goto continue end

    if counter[char] == nil then
      counter[char] = 1
    else
      return false
    end

    ::continue::
  end

  return true
end
