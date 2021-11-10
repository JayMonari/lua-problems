return function(amount, coins)
  local minChange, positions, maxSortCoins = {}, {}, {}

  for idx, coin in ipairs(coins) do
    positions[coin] = idx
    table.insert(maxSortCoins, coin)
  end
  table.sort(maxSortCoins, function(a, b)
    return a > b
  end)

  for _, coin in ipairs(maxSortCoins) do
    minChange[positions[coin]] = amount // coin
    amount = amount % coin
  end

  return amount == 0 and minChange or nil
end
