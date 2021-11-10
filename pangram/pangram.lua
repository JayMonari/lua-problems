return function(s)
  local alphabet = {}
  local letterCount = 0

  for letter in s:lower():gsub("[^a-z]", ''):gmatch '.' do
    if alphabet[letter] == nil then
      alphabet[letter] = 0
      letterCount = letterCount + 1
    end
  end

  return letterCount == 26
end
