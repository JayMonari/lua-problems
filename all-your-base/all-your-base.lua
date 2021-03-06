local all_your_base = {}

local function to_decimal(digits, base)
  local decimal = 0
  for i, digit in ipairs(digits) do
    assert(digit >= 0, 'negative digits are not allowed')
    assert(digit < base, 'digit out of range')
    decimal = decimal + digit * (base ^ (#digits - i))
  end
  return math.floor(decimal)
end

local function from_decimal(decimal, base)
  local digits = {}
  while decimal > 0 do
    table.insert(digits, 1, (decimal % base))
    decimal = decimal // base
  end
  return #digits > 0 and digits or { 0 }
end

all_your_base.convert = function(from_digits, from_base)
  return {
    to = function(to_base)
      assert(from_base > 1, 'invalid input base')
      assert(to_base > 1, 'invalid output base')
      return from_decimal(to_decimal(from_digits, from_base), to_base)
    end
  }
end

return all_your_base
