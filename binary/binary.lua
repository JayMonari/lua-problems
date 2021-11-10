local function to_decimal(input)
  if input:find("[^10]") ~= nil then return 0 end

  local decimal = 0
  local exponent = #input - 1
  for digit in input:gmatch "." do
    decimal = decimal + tonumber(digit) * 2^exponent
    exponent = exponent - 1
  end

  return decimal
end

return {
  to_decimal = to_decimal
}
