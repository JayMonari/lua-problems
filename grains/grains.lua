local grains = {}

function grains.square(n)
  return 2^(n - 1)
end

function grains.total()
  local sum = 0
  for n = 1, 64 do
    sum = sum + grains.square(n)
  end
  return sum
end

return grains
