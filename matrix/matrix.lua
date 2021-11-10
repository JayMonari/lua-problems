return function(s)
  local matrix = {}
  for rows in s:gmatch "[%d ]+" do

    local row = {}
    for n in rows:gmatch "%d+" do
      table.insert(row, tonumber(n))
    end

    table.insert(matrix, row)
  end

  local function row(idx)
    return matrix[idx]
  end

  local function column(idx)
    local col = {}

    for i = 1, #matrix do
      local currRow = row(i)
      table.insert(col, currRow[idx])
    end

    return col
  end

  return { row = row, column = column }
end
