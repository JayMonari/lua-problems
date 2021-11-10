local function valid(ccNumber)
  if #ccNumber == 1 then return false end
  if ccNumber:find('%a') ~= nil then return false end

  local sum = 0
  ccNumber = ccNumber:gsub(' ', ''):reverse()

  for i = 1, #ccNumber do
    local digit = tonumber(ccNumber:sub(i, i))

    if i % 2 == 0 then
      digit = digit * 2
      if digit > 9 then digit = digit - 9 end
    end

    sum = sum + digit
  end

  return sum % 10 == 0
end

return {
  valid = valid
}
