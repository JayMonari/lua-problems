local function word_count(s)
  local counter = {}

  for word in s:lower():gmatch "[%w']+" do
    if word:sub(1, 1) == "'" then
      word = word:sub(2, #word - 1)
    end

    if counter[word] == nil then
      counter[word] = 1
    else
      counter[word] = counter[word] + 1
    end
  end

  return counter
end

return {
  word_count = word_count,
}
