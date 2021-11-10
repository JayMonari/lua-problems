local color_values = {
  black =  0,
  brown =  1,
  red =  2,
  orange =  3,
  yellow =  4,
  green =  5,
  blue =  6,
  violet =  7,
  grey =  8,
  white =  9
}

local function decode(c1, c2, c3)
  local value = color_values[c1]
  if color_values[c2] ~= 0 then
    value = value * 10 + color_values[c2]
  else
    value = value * 10
  end

  value = value * 10^color_values[c3]
  if value >= 1000 then
    return value / 1000, 'kiloohms'
  else
    return value, 'ohms'
  end
end

return { decode = decode }
