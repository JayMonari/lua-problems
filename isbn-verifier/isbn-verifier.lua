local function valid(isbn)
  local cleanISBN = isbn:gsub("[^%dX]", '')
  local hasCheck = cleanISBN:find 'X'
  local isInvalidCheckCharacter = hasCheck ~= nil and hasCheck ~= #cleanISBN
  if isInvalidCheckCharacter then
    return false
  elseif #cleanISBN ~= 10 then
    return false
  end

  local sum = 0
  local idx = 10
  for digit in cleanISBN:gmatch '.' do
    if digit == 'X' then digit = "10" end

    sum = sum + (tonumber(digit) * idx)
    idx = idx - 1
  end

  return sum % 11 == 0
end

return {
  valid = valid
}
