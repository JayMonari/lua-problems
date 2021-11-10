local function aliquot_sum(n)
  local sum = 0
  local total = n

  for factor = 1, total - 1 do
    if n % factor == 0 then
      total = total - factor
      sum = sum + factor
    end
  end

  return sum
end

local function classify(n)
  local _aliquot_sum = aliquot_sum(n)

  if _aliquot_sum > n then
    return "abundant"
  elseif _aliquot_sum < n then
    return "deficient"
  end

  return "perfect"
end

return {
  aliquot_sum = aliquot_sum,
  classify = classify
}
