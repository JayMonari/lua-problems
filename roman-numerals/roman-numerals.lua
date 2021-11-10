local numerals = {
  { roman = "M", decimal =  1000 },
  { roman = "CM", decimal = 900 },
  { roman = "D", decimal =  500 },
  { roman = "CD", decimal = 400 },
  { roman = "C", decimal =  100 },
  { roman = "XC", decimal = 90 },
  { roman = "L", decimal =  50 },
  { roman = "XL", decimal = 40 },
  { roman = "X", decimal =  10 },
  { roman = "IX", decimal = 9 },
  { roman = "V", decimal =  5 },
  { roman = "IV", decimal = 4 },
  { roman = "I", decimal =  1 },
}

local function to_roman(number)
  local romanNumeral = ''

  for _, pair in ipairs(numerals) do
    while number >= pair.decimal do
      romanNumeral = romanNumeral .. pair.roman
      number = number - pair.decimal
    end
  end

  return romanNumeral
end

return {
  to_roman = to_roman
}
