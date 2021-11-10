return function(array, target)
  local leftIdx = 1
  local rightIdx = #array

  while leftIdx <= rightIdx do
    local midIdx = math.ceil(leftIdx + (rightIdx - leftIdx) / 2)
    local value = array[midIdx]

    if value < target then
      leftIdx = midIdx + 1
    elseif value > target then
      rightIdx = midIdx - 1
    else
      return midIdx
    end
  end

  return -1
end
