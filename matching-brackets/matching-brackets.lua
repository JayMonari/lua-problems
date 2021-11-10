local function validatePairs(s)
  local openPairs = {}
  local valid = true
  for pairPart in s:gmatch "[][{}()]" do

    if pairPart == '(' or pairPart == '[' or pairPart == '{' then
      table.insert(openPairs, pairPart)
    elseif pairPart == ')' then
      valid = table.remove(openPairs) == '('
    elseif pairPart == ']' then
      valid = table.remove(openPairs) == '['
    elseif pairPart == '}' then
      valid = table.remove(openPairs) == '{'
    else
      assert(false, "unexpected pair part: " .. pairPart)
    end

    if not valid then return false end
  end

  return #openPairs == 0
end

return {
  valid = validatePairs
}
