return function(s)
  local line = {}
  local lines = {}
  for i = 1, #s, 1 do
    local char = s:sub(i, i)
    if char == "\n" then
      table.insert(lines, table.concat(line, ''))
      line = {}
      goto cont
    end

    table.insert(line, char)
    if i ~= #s then
      table.insert(line, "\n")
    end
    ::cont::
  end
  table.insert(lines, table.concat(line, ''))

  return table.concat(lines, '')
end
