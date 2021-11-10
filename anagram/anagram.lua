local Anagram = {}

function Anagram:new(word)
  self.sorted = self:sort(word)
  return self
end

function Anagram:match(words)
  local matches = {}

  for _, word in pairs(words) do
    local sorted = self:sort(word)
    if self.sorted == sorted then
      table.insert(matches, word)
    end
  end

  return matches
end

function Anagram:sort(tosort)
  local lower = tosort:lower()

  local _sorted = {}
  for c in lower:gmatch "." do
    table.insert(_sorted, c)
  end

  table.sort(_sorted, function (a, b)
    return a < b
  end)

  return table.concat(_sorted, '')
end

return Anagram
