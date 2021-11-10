return function(n)
  local phrases = {}

  if ((n >> 0) & 1) == 1 then table.insert(phrases, "wink") end
  if ((n >> 1) & 1) == 1 then table.insert(phrases, "double blink") end
  if ((n >> 2) & 1) == 1 then table.insert(phrases, "close your eyes") end
  if ((n >> 3) & 1) == 1 then table.insert(phrases, "jump") end
  if ((n >> 4) & 1) == 0 then
    return phrases
  end

  local reversed = {}
  for i = #phrases, 1, -1 do
    table.insert(reversed, phrases[i])
  end
  return reversed
end
