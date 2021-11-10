local function translate(word)
  local rule1 = { "a", "e", "i", "o", "u", "yt", "xr" }
  local rule2 = { "[^aeiou]qu", "thr", "sch" }
  local rule3 = { "ch", "qu", "th" }
  local ending = "ay"
  local function begins_with_any_of(patterns)
    for _, pattern in ipairs(patterns) do
      if word:lower():find("^" .. pattern) then return true end
    end
  end
  if begins_with_any_of(rule1) then
    return word .. ending
  elseif begins_with_any_of(rule2) then
    return word:sub(4) .. word:sub(1, 3) .. ending
  elseif begins_with_any_of(rule3) then
    return word:sub(3) .. word:sub(1, 2) .. ending
  else
    -- rule4
    return word:sub(2) .. word:sub(1, 1) .. ending
  end
end

return function(phrase)
  return phrase:gsub("%a+", translate)
end
