local triangle = {}

local function violation(a, b, c)
  local abSum = a + b
  local bcSum = b + c
  local acSum = a + c
  if abSum < c or bcSum < a or acSum < b then
    return false
  else
    return true
  end
end

function triangle.kind(a, b, c)
  assert(a > 0 and b > 0 and c > 0 and violation(a, b, c), "Input Error")

  if a == b and b == c then
    return "equilateral"
  elseif a == b or b == c or a == c then
    return "isosceles"
  end

  return "scalene"
end

return triangle
