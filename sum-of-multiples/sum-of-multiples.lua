return function(numbers)
  local sum_of_multiples = function(limit)
    local sum = 0

    for factor = 1, limit - 1 do
      for _, num in ipairs(numbers) do
        if factor % num == 0 then
          sum = sum + factor
          break
        end
      end
    end

    return sum
  end

  return { to = sum_of_multiples }
end
